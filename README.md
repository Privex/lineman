
lineman
=======

JSON RPC 2.0 WebSocket <> HTTP bridge


Usage
-----

```sh

git clone https://github.com/Privex/lineman.git
cd lineman

# Tell Git to ignore any changes to the production config, avoiding the issue of Git
# constantly alerting you that the file has changed.
git update-index --assume-unchanged config/production.toml

# Adjust production.toml to point to the RPC node you want to use
# By default it's set to https://hived.privex.io
nano config/production.toml

# Build the Docker container
docker build -t lineman .

# Run Lineman in Docker - you should expose the default Lineman port 8080 to 127.0.0.1 (localhost) or 0.0.0.0 (bind to all IPv4's)
# In the below example, runs the lineman image as the container named 'lineman', with automatic restart on error,
# and exposes lineman to the internet on port 8090
docker run -p 0.0.0.0:8090:8080 --restart unless-stopped --name lineman -itd lineman


# Test lineman from a Hive / Steem cli_wallet

cli_wallet -s "ws://127.0.0.1:8090"

# (if using someguy123's hive-docker)
./run.sh remote_wallet ws://your.server.external.ip.or.hostname

```


