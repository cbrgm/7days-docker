# 7 Days to Die Dedicated Server using Docker

## Description

You want to host your own dedicated 7 Days To Die Server? Best in a docker container? Then you've come to the right place!

This small side project of mine provides a `Dockerfile` that will always install and update to the latest `steamcmd` and [7 Days to Die][61e6a3c0] server files. The entire server runs inside a docker container and allows you to easily play with your friends or host a public server. The server can easily be updated and managed by using `make`.

  [61e6a3c0]: http://store.steampowered.com/app/251570/7_Days_to_Die/ "7days"

## Setting up the Server

Follow the steps to get startet!

#### Step 1: Clone the repository!

Clone this repository and its content using
```bash
git clone https://github.com/cbrgm/7days-docker
```

#### Step 2: Edit server settings!

Edit `serverconfig.xml` for server settings  and `adminconfig.xml` for user permissions. Please see [serverconfig.xml explanation][4852b90b] and [serveradmin.xml explanation][e42cc3cd] for further details.

  [4852b90b]: https://7daystodie.gamepedia.com/Server:_serverconfig.xml "server"
  [e42cc3cd]: https://7daystodie.com/forums/showthread.php?25069-Serveradmin-xml "admin"

#### Step 3: Build and image and run container!

Build a new image for your `7days-docker` using the following command within the project directory:
```bash
make build
```
This may take quite a while, depending on your bandwidth (5-15 min). The image will download all relevant server files automatically from Steam.

When everything is done, start your server using
```bash
make run
```

You can now connect to your server using **yourserver-ip/domain** and port **26900** (standard port) at the 7 Days To Die lobby browser. You can also connect to your webconfigpanel using **http://yourdomain-or-ip:18500**

## Administrating / Backup

#### Starting the server

To start the server use:
```bash
make start
```

#### Stopping the server

To stop the server use:
```bash
make stop
```

#### Create Backup of your serverfiles
this will copy a folder `Saves` to the current directory you are in. The Saves folder contains all world and playerdata.
```bash
make backup
```

## Feature Request and Contributing

You have suggestions for improvements or features you miss? You are welcome to express all your wishes here. Just create a new [Issue][e872f832] and it will be taken care of quickly!

[e872f832]: https://github.com/cbrgm/7days-docker/issues "7days issues"


## Motivation

This script was originally developed by [Christian Bargmann][b9824663]. I wanted to play 7 Days to Die together with my friends, this is about how I ended up :-)

  [b9824663]: http://cbrgm.de "blog"
