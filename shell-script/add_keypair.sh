
#! /bin/sh
. /home/joshua/.euca/eucarc
euca-add-keypair $1 > $1.priv
chmod 600 $1.priv
