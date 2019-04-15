#!/bin/bash

OAIETCDIR="/local/repository/etc"

cd /opt/oai/openair-cn/scripts

# HSS
# Kill off running function.
./run_hss -k >/dev/null 2>&1
sleep 1

# Startup function.
screen -c $OAIETCDIR/hss.screenrc -L -S hss -d -m -h 10000 /bin/bash -c "./run_hss"

# MME
# Kill off running function.
./run_mme -k >/dev/null 2>&1
sleep 1

# Startup function.
screen -c $OAIETCDIR/mme.screenrc -L -S mme -d -m -h 10000 /bin/bash -c "./run_mme"

# SPGW
# Kill off running function.
./run_spgw -k >/dev/null 2>&1
sleep 1

# Startup function.
screen -c $OAIETCDIR/spgw.screenrc -L -S spgw -d -m -h 10000 /bin/bash -c "./run_spgw"

# Do some cleanup.
screen -wipe >/dev/null 2>&1

exit 0
