# I2B2
Dockerization of the software provided by Harvard University: https://www.i2b2.org/

## Deployment
This simple, naieve deployment should work if the images are flexible enough. It is always possible to overcome inflexibility by mapping/mounting config files and directories, but this is defeating the purpose of dockers isolation and deployment unit philosophies. Environmental variations should be configured in the `.env` file, then the system should work.
