FROM ghost:0.10.0
COPY ./config.js /usr/src/ghost/config.js
COPY ./setup-env.sh /usr/src/ghost/setup-env.sh
CMD /bin/sh /usr/src/ghost/setup-env.sh && npm start
