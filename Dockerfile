FROM cm2network/steamcmd

RUN ./steamcmd.sh +force_install_dir /home/steam/server +login anonymous +app_update 740 +quit && rm /home/steam/server/bin/libgcc_s.so.1

WORKDIR /home/steam/server

ENTRYPOINT ["/home/steam/server/srcds_run","-game","csgo","-console","-usercon","-tickrate","128","-strictportbind","-tvdisable","+tv_enable","0","+sv_hibernate_when_empty","1","+sv_lan","1","-maxplayers_override","32"]


COPY --chown=steam csgo/sound /home/steam/server/csgo/sound
COPY --chown=steam csgo/addons /home/steam/server/csgo/addons
COPY --chown=steam csgo/cfg /home/steam/server/csgo/cfg
COPY --chown=steam csgo/*.txt /home/steam/server/csgo/
