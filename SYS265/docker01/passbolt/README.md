# Docker-project

Example install of passbolt using docker-compose

## Download

`git clone https://github.com/keeperazra/docker-project.git`

This uses a lightly customized [docker-compose.yml](https://github.com/keeperazra/docker-project/blob/master/docker-compose.yml) to install two docker instances, one as a database backend, and the other as the web server for passbolt.

## Passbolt

Passbolt is a password managing service that uses two components. The first is a webserver that you can either use an existing one, or host your own. The other component is an extension for your browser that allows you to access and use your stored passwords without needing to go back to your passbolt website every time you want to access anything..

The web interface allows you to easily view all of the passwords you have saved, as well as edit them all. This can be done using the plugin, but does require clicking through a few more menus. The plugin is best for saving new passwords, as well as then inputing those passwords when you return to that site.

## Setup

* CD to the directory you downloaded the docker-project, and make whatever changes you want to the docker-compose.yml
    * Recommend uncommenting `APP_FULL_BASE_URL`, and setting this value to the fully qualified domain name of your docker host, but this is optional
* Run `docker-compose up`. I recommend running this first without `-d` in order to check for any errors easily. Later you will want to run it as `docker-compose up -d` to set the docker images to run in the background.
* Visit your docker host in a web browser (for our case, this is `http://docker01-alex.alex.local`), be sure to use the fully qualified domain name, as without the FQDN, the setup **will fail**.
* Run:
```sh
docker exec passbolt_passbolt_1 su -m -c "/var/www/passbolt/bin/cake \
    passbolt register_user \
    -u <your@email.com> \
    -f <firstname> \
    -l <lastname> \
    -r admin" -s /bin/sh www-data
```
* The command should output a weblink, use this weblink in your browser to complete the passbolt setup.
