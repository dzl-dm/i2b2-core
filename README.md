# I2B2
Dockerization of the software provided by Harvard University: https://www.i2b2.org/

## Deployment (Fully dockerized)
> __NOTE:__ I2B2 do provide their own docker images for the i2b2 system. You can find the images and example compose files under these links:  
https://hub.docker.com/u/i2b2/#!  
https://github.com/i2b2/i2b2-docker  

We aim to improve the flexibility and make it even easier to get up and running with i2b2.

To get started with our deployment, we recommend cloning this repo, making any desired changes and running the docker compose command. An example could look like this:
```sh
git clone https://github.com/dzl-dm/i2b2-core.git
cd i2b2-core/docker
cp .env{.example,}
cp docker-compose.yml{.example,}
cp secrets/i2b2-secrets{.example,}
docker compose up -d
```
After a couple of minutes (while the application starts), i2b2 will be available at: http://localhost/webclient

## Deployment (postgres not dockerized)
It is generally recommended not to dockerize a database in a production environment. It gives additional risk of data corruption. So we also provide a process to initialise a local postgres database.

### Initialise the i2b2 database
The database must contain the i2b2 structure and usually some data to provide a project making the software ready to use. For postgres, we have provided these steps as a script (to be run as root - or with su priviledge to the postgres user):
```sh
cd postgres
./load-i2b2-structure.sh <MY DATA CHOICE>
```
Where \<MY DATA CHOICE\> should be replaced with one of the following:
1. no_project
1. demo_empty_project

### Deploy the application with docker
Then we deploy only the application (web and wildfly components) via docker:
```sh
git clone https://github.com/dzl-dm/i2b2-core.git
cd i2b2-core/docker
cp .env{.example-localdb,}
cp docker-compose.yml{.example-localdb,}
cp secrets/i2b2-secrets{.example,}
docker compose up -d
```
After a couple of minutes (while the application starts), i2b2 will be available at: http://localhost/webclient

#### Docker's host IP address
> NOTE: You might need to make a change to the `.env` file.
It is possible that your docker installation is using a different IP address then what we have provided as the default for the host system. In this case, you must edit the `docker_host_ip` variable in the `.env` file. It should be changed to the output of this command (run on the linux host):
```sh
ip a | grep -A3 docker
```
If you experience problems, you should remove this variable for a Windows or Mac system and let docker use its internal resolution of the `host.docker.internal` variable.

## Common adjustments
Ok, so it works. But with a default demo user its not secure and not quite ready to use. This section outlines how to make some common changes to prepare the system for production use.

### Change the admin user password
There is an admin user (i2b2) which has also a default password (demouser) - its important to change this!
1. Login via the web interface and change the password (it doesn't matter if you login to a project or the Administration interface for this)

### Change the demo user password
1. Login via the web interface and change the password
Alternatively, you could remove the demo user
1. Login via the web interface as an admin user (such as the default "i2b2" user)
1. Under the "Manage Users" tree, select the user and then the delete button

### Change the service user password
There is a service user (AGG_SERVICE_ACCOUNT) which has also a default password (demouser) - its important to change this!
1. Login via the web interface and change the password
2. Run the following SQL against your database (substitute _${newpassword}_ for the actual password)
```sql
update i2b2hive.hive_cell_params set value='${newpassword}' where param_name_cd='edu.harvard.i2b2.crc.pm.serviceaccount.password';
```
> __How to?__ Login to the docker database container with: ``` docker exec -it i2b2.database bash```
3. Restart wildfly
```sh
docker compose restart i2b2-wildfly
```
### Remove default login credentials
Change the environment variable and redeploy the web-container:
```ini
show_demo_login=My New Data Warehouse
```
```sh
docker compose up -d i2b2-web
```

### Change the displayed i2b2 Host name
Change the environment variable and redeploy the web-container:
```ini
ORGANISATION_NAME=My New Data Warehouse
```
```sh
docker compose up -d i2b2-web
```

### Change the displayed project name
There are multiple references to the project id, so it is safer to leave this as the default demo project, however we can easily change the displayed name in the administration interface
1. Under "Manage Projects", select the project and change the "Project Name" field in the form, then "Save Updates"
> _NOTE:_ It is not recommended to change "Project Id" or "Project Path" as they require additional, complementary, changes. You risk making the project inaccessible.
