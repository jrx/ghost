FROM ghost:0.9.0
COPY ./config.js /usr/src/ghost/config.js
COPY ./setup-env.sh /usr/src/ghost/setup-env.sh
RUN npm install ghost-s3-compat
RUN mkdir content/storage
RUN cp -r node_modules/ghost-s3-compat content/storage/ghost-s3
CMD /bin/sh /usr/src/ghost/setup-env.sh && npm start
