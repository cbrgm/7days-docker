FROM ubuntu:20.04

# Install dependencies
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -q -y wget lib32gcc1 telnet

# Create group and user for the server
ARG UID=999
ARG GID=999
RUN groupadd -g $GID steam && \
	useradd -m -u $UID -g steam steam

# Create workspace for server
WORKDIR /home/steam
USER steam

# Downloading Steam cmd
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN mkdir ./bin && tar -zxf steamcmd_linux.tar.gz -C ./bin

# Downloading 7Days Server
RUN mkdir -p /home/steam/server
WORKDIR /home/steam/server
RUN /home/steam/bin/steamcmd.sh \
	+force_install_dir /home/steam/server \
	+login anonymous \
	+app_update 294420 \
	+quit

# Copy serverconfig into dockercontainer
RUN mkdir -p /home/steam/.local/share/7DaysToDie/Saves
COPY --chown=steam serverconfig.xml /home/steam/server/serverconfig.xml
COPY --chown=steam serveradmin.xml /home/steam/.local/share/7DaysToDie/Saves/

EXPOSE 8080/tcp 8081/tcp
EXPOSE 26900-26902 26900-26902/udp

# Starting server on docker start
CMD export LD_LIBRARY_PATH=/home/steam/server && \
	/home/steam/server/7DaysToDieServer.x86_64 \
	-configfile=/home/steam/server/serverconfig.xml \
	-quit -batchmode -nographics -dedicated $@

