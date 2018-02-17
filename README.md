# Rocket.Chat-IRC-Network
Docker image providing an IRC Network for Rocket.Chat federation development.


## Running IRC Network

``` shellscript
docker run --name irc -p 6667:6667 -p 7000:7000 irc-network
```

### Server Information

host: "127.0.0.1"

port = 7000

password = "password"

name = "services.irc.local"