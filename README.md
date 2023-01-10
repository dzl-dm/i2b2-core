# I2B2
Dockerization of the software provided by Harvard University: https://www.i2b2.org/

## Deployment (Fully dockerized)
> __NOTE:__ I2B2 do provide their own docker images for the i2b2 system. You can find the images and example compose files under these links:  
https://hub.docker.com/u/i2b2/#  
https://github.com/i2b2/i2b2-docker  

We aim to improve the flexibility and make it even easier to get up and running with i2b2.

To get started with our deployment, we recommend cloning this repo, making any desired changes and running the docker compose command. An example could look like this:
```sh
git clone https://github.com/dzl-dm/i2b2-core.git
cd i2b2-core/docker
cp .env.example .env
cp docker-compose.yml.example docker-compose.yml
cp secrets/i2b2-secrets.example secrets/i2b2-secrets
docker compose up -d
```
After a couple of minutes (while the application starts), i2b2 will be available at: http://localhost/webclient
> NOTE: Attempting to login while the application is still starting will likely result in the error _"The PM Cell is down or the address in the properties file is incorrect."_ That is normal, please wait. You may tail the wildfly logs to see when the application is ready: `docker logs --tail 30 -f i2b2.wildfly`

### Demo data
We have an option to choose the level if i2b2 data which the system is initialized with. This ranges from very minimal with no existing project, a demo project which doesn't have any data (so is ready to be filled with your own data) and a full demo project which lets you test the system without setting up any data yourself. This must be chosen before the first deployment by setting the variable `i2b2_initial_data_level` in the `.env` file. The options are:
1. no_project
1. demo_empty_project
1. demo_full_project

> NOTE: If you would like to change it after the first deployment, you can do so by deleting the docker volume holding the database. This will lose all data! You will first need to stop the container, then remove the volume. The commands will be similar to: ```docker compose down && docker volume rm docker_i2b2-db ```

## Deployment (postgres not dockerized)
It is generally recommended not to dockerize a database in a production environment. It gives additional risk of data corruption. So we also provide a process to initialise a local postgres database.

### Initialise the i2b2 database
The database must contain the i2b2 structure and usually some data to provide a project making the software ready to use. For postgres, we have provided these steps as a script (to be run as root - or with su priviledge to the postgres user):
```sh
git clone https://github.com/dzl-dm/i2b2-core.git
cd i2b2-core/postgres
./load-i2b2-structure.sh <MY DATA CHOICE>
```
Where \<MY DATA CHOICE\> should be replaced with one of the following:
1. no_project
1. demo_empty_project

The option of full demo data is not available for the non-dockerized database.

### Ensure docker has access to postgres
The i2b2 containers will try to use the host database, however by default they will likely be blocked. Here are the settings which should be changed for postgres (eg under /etc/postgresql/12/main/):
Add to postgres.conf:
```conf
## Allow docker access
listen_addresses = 'localhost, 172.17.0.1'
```
Add to pg_hba.conf:
```conf
host    all             all             172.16.0.0/12            scram-sha-256
## OR (depending on password hashing in use!):
host    all             all             172.16.0.0/12            md5
```
Restart postgres (dependant on system!):
```sh
service postgtesql restart
```

### Deploy the application with docker
Then we deploy only the application (web and wildfly components) via docker:
```sh
cd ../docker
cp .env{.example-localdb,}
cp docker-compose.yml{.example-localdb,}
cp secrets/i2b2-secrets{.example,}
docker compose up -d
```
After a couple of minutes (while the application starts), i2b2 will be available at: http://localhost/webclient
> NOTE: Attempting to login while the application is still starting will likely result in the error _"The PM Cell is down or the address in the properties file is incorrect."_ That is normal, please wait. You may tail the wildfly logs to see when the application is ready: `docker logs --tail 30 -f i2b2.wildfly`

#### Docker's host IP address
> NOTE: You might need to make a change to the `.env` file.
It is possible that your docker installation is using a different IP address than what we have provided as the default for the host system. In this case, you must edit the `docker_host_ip` variable in the `.env` file. It should be changed to the output of this command (run on the linux host):
```sh
ip a | grep -A3 docker
```
If you experience problems, you should remove this variable for a Windows or Mac system and let docker use its internal resolution of the `host.docker.internal` variable.

## Common adjustments
Ok, so it works. But with default users its not secure and not quite ready to use. This section outlines how to make some common changes to prepare the system for production use.

### Change the admin user password
There is an admin user (i2b2) which has a default password (demouser) - its important to change this!
1. Login via the web interface and change the password (it doesn't matter if you login to a project or the Administration interface for this).

### Change the service user password
There is a service user (AGG_SERVICE_ACCOUNT) which has also a default password (demouser) - its important to change this!
1. Login via the web interface and change the password.
2. Use these commands to connect to the dockerized i2b2 database on postgres.
```sh
docker exec -it i2b2.database bash
su postgres
psql i2b2
```
3. Run the following SQL against your database (substitute _${newpassword}_ for the actual password).
```sql
update i2b2hive.hive_cell_params set value='${newpassword}' where param_name_cd='edu.harvard.i2b2.crc.pm.serviceaccount.password';
```
4. Restart wildfly - after exiting from the database container 
```sh
docker compose restart i2b2-wildfly
```

### Change the demo user password
If you have chosen to include the demo project (with or without data), there is a demo user (demo) which has also a default password (demouser)
1. Login via the web interface and change the password.  

Alternatively, you could remove the demo user in the admin interface.
1. Login via the web interface as an admin user (such as the default "i2b2" user).
1. Under the "Manage Users" tree, select the user and then the delete button.

### Additional default users
Please ensure you check which users are available by default and remove or change passwords as appropriate. This is dependant on inclusion of the demo project and could change with future releases of i2b2. To check users:
1. Login as an admin user (eg i2b2) and choose the `Administrator` project
1. Choose `Manage Users` on the left menu
1. Select the user you wish to change/remove
1. Delete or set user password and save

### Show/Remove default login credentials
Change the environment variable and redeploy the web-container (to remove):
```ini
show_demo_login=false
```
or to show:
```ini
show_demo_login=true
```
```sh
docker compose up -d i2b2-web
```
> __NOTE:__ This does not remove the demo user itself, only the pre-filled login details

### Change the displayed i2b2 Host name
Change the environment variable and redeploy the web-container:
```ini
i2b2_host_display_name=My New Data Warehouse
```
```sh
docker compose up -d i2b2-web
```

### Change the displayed project name
There are multiple references to the project id, so it is safer to leave this as the default demo project, however we can easily change the displayed name in the administration interface.
1. Under "Manage Projects", select the project and change the "Project Name" field in the form, then "Save Updates".
> _NOTE:_ It is not recommended to change "Project Id" or "Project Path" as they require additional, complementary, changes. You risk making the project inaccessible.

### Enable SAML logins
Since version 1.7.13, i2b2 has included some support for SAML authentication allowing deployment in a Single-Sign-On (SSO) infrastructure. It is not possible to integrate this completely into the docker images, there are some steps which must be completed manually or by infrastructure management systems. I2b2's own documentation for SAML is [here](https://community.i2b2.org/wiki/pages/viewpage.action?pageId=55706050)

#### Pre-requisites  
* An identity provider (IDP), such as [KeyCloak](https://www.keycloak.org/) (We will use some examples related to KeyCloak, so terminology may reflect this, but another provider can be used instead)
* An HTTPS proxy for i2b2 (We also provide this possibility under our [docker compositions](https://github.com/dzl-dm/dwh-compositions) repository)

Now we can configure i2b2 as the Service Provider (SP)

#### Retrieve data from the IDP  
* Place the following 3 files in a sub-directory (named external-config) where your `docker-compose.yml` file is:
    * i2b2-idp-metadata.xml (See: https://<IDP_HOSTNAME>/realms/<MY_REALM>/protocol/saml/descriptor)
    * i2b2-sso-t1-cert.pem
    * i2b2-sso-t1-key.pem

The certificate and key can be found in the "Client details" (for the client which you have setup for i2b2) area under the "Keys" tab. Here you can export and choose your format (eg PCKS12). Then the cert and key must be extracted and presented in "pem" format.

These files are mounted by the docker container based on the directives in `docker-compose.yml`. You must adjust this if you would like to deploy differently.

#### Add users to i2b2  
I2b2 must have the user setup in its admin interface in order to give it permissions such as access to the project data. After logging in as an admin (eg local user "ib22"), you can use the interface to add a user. The requirements to make the user work via SAML are:
* Match the username with the IDP
* Add the parameter: "authentication_method"="SAML"

The password field is irrelevant, once the above parameter is set, the user will not be able to login locally, however the interface requires a password to be set

The user must also be added to a project in order to see any data. This can also be done via the interface in the same way as local users.

#### Adjust the database configuration  
There is a change in the configuration stored in the database. Whether a new deployment or upgrading an existing deployment, you must ensure these settings are correct.

Connect to your i2b2 server, then login to the database container (if running the database in docker):
```sh
docker exec -it i2b2.database bash
```

Get an SQL console as the postgres user:
```sh
su - postgres
psql i2b2
```

View the settings
```sql
SELECT * FROM i2b2pm.pm_cell_data;
```

Change the settings
```sql
-- Due to the use of AJP with saml, this should be localhost, not the wildfly container/hostname
UPDATE i2b2pm.pm_cell_data SET url = 'http://127.0.0.1/i2b2/services/QueryToolService/' WHERE cell_id  = 'CRC';
UPDATE i2b2pm.pm_cell_data SET url = 'http://127.0.0.1/i2b2/services/FRService/' WHERE cell_id  = 'FRC';
UPDATE i2b2pm.pm_cell_data SET url = 'http://127.0.0.1/i2b2/services/OntologyService/' WHERE cell_id  = 'ONT';
UPDATE i2b2pm.pm_cell_data SET url = 'http://127.0.0.1/i2b2/services/WorkplaceService/' WHERE cell_id  = 'WORK';
UPDATE i2b2pm.pm_cell_data SET url = 'http://127.0.0.1/i2b2/services/IMService/' WHERE cell_id  = 'IM';
```

## Troubleshooting
As with most software and systems, things can go wrong, or at least appear to. Here we outline some errors and problems which we have encountered.

### Tools
What can you do to see what's going wrong? Here are a few useful tools
<<<<<<< HEAD
=======

>>>>>>> 4604f25 (Changes to support SAML SSO)
#### Docker logs
For each component, you can view and follow the logs:
```sh
docker logs --tail 30 -f i2b2.web
docker logs --tail 30 -f i2b2.wildfly
docker logs --tail 30 -f i2b2.database
```

#### Postgres logs
If you're running postgres on the host, usually you can view the logs with:
```sh
tail -f /var/logs/postgres/main.log
```

### Increase wildfly logging
The wildfly application checks for an enviroment variable to increase its logging. We can pass that into docker via the `.env` file. To do this set the variable:
```ini
DEBUG_ENABLED=true
```

### Login failed
The following 2 errors can occur after an attempted login.
```block
The PM Cell is down or the address in the properties file is incorrect.
```
```block
An error has occurred in the Cell's AJAX library.
 Press F12 for more information
```
In both cases, this usually represents an issue in getting the right data from the database. It could simply be that the database isn't ready yet, or that there is a connection issue. It is also possible that the database does not contain the necessary data.

### Query failed
This often happens after changing the the password for the service user (AGG_SERVICE_ACCOUNT). If this is not fully completed and the wildfly container restarted, then the service user cannot correctly function. Check that you have followed each step.
