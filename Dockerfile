FROM cm2network/steamcmd

RUN ./steamcmd.sh +force_install_dir /home/steam/server +login anonymous +app_update 740 +quit && rm /home/steam/server/bin/libgcc_s.so.1

RUN curl -s 'https://mms.alliedmods.net/mmsdrop/1.12/mmsource-1.12.0-git1219-linux.tar.gz' | tar zxf - --exclude addons/metamod_x64.vdf -C /home/steam/server/csgo/
RUN curl -s 'https://sm.alliedmods.net/smdrop/1.12/sourcemod-1.12.0-git7220-linux.tar.gz' | tar zxf - --exclude addons/sourcemod/bin/x64/ -C /home/steam/server/csgo/
WORKDIR /home/steam/server

ENTRYPOINT ["/home/steam/server/srcds_run","-game","csgo","-console","-usercon","-tickrate","128","-strictportbind","-tvdisable","+tv_enable","0","+sv_hibernate_when_empty","1","+sv_lan","1","-maxplayers_override","32"]
