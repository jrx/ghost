#!/bin/sh
# Configure Environment Variables

config_dest="/usr/src/ghost/config.js"

# Escape variables
GHOST_URL=$(printf '%s\n' "$GHOST_URL" | sed 's,[\/&],\\&,g;s/$/\\/')
GHOST_URL=${GHOST_URL%?}

MYSQL_HOST=$(printf '%s\n' "$MYSQL_HOST" | sed 's,[\/&],\\&,g;s/$/\\/')
MYSQL_HOST=${MYSQL_HOST%?}

MYSQL_DATABASE=$(printf '%s\n' "$MYSQL_DATABASE" | sed 's,[\/&],\\&,g;s/$/\\/')
MYSQL_DATABASE=${MYSQL_DATABASE%?}

MYSQL_USER=$(printf '%s\n' "$MYSQL_USER" | sed 's,[\/&],\\&,g;s/$/\\/')
MYSQL_USER=${MYSQL_USER%?}

MYSQL_PASSWORD=$(printf '%s\n' "$MYSQL_PASSWORD" | sed 's,[\/&],\\&,g;s/$/\\/')
MYSQL_PASSWORD=${MYSQL_PASSWORD%?}

# Search and Replace
sed -i s/GHOST_URL/$GHOST_URL/g $config_dest
sed -i s/MYSQL_HOST/$MYSQL_HOST/g $config_dest
sed -i s/MYSQL_DATABASE/$MYSQL_DATABASE/g $config_dest
sed -i s/MYSQL_USER/$MYSQL_USER/g $config_dest
sed -i s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g $config_dest

echo "config.js adjusted"
