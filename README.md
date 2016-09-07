# ghost

## Connect to DC/OS

```
dcos config set core.dcos_url http://dcos-master/
dcos auth login
```

## Install Marathon-LB

```
dcos package install marathon-lb
```

## Deploy MySQL with Local Persistent Volume

```
dcos marathon app add mysql-local.json
```

## Deploy Ghost WebApp

Edit the file `ghost.json` and change the variables `GHOST_URL` and `HAPROXY_0_VHOST` to the domain you want to serve the blog. The DNS record for this domain has to point to the IP of your Public Agent.

```
"env": {
  "GHOST_URL": "http://ghost.jrx.de",
},
"labels": {
 "HAPROXY_0_VHOST": "ghost.jrx.de",
},
```

Deploy Ghost.

```
dcos marathon app add ghost.json
```

## Scale Ghost WebApp

```
dcos marathon app update /ghost/blog instances=10
```

## Update Ghost WebApp

```
dcos marathon app update /ghost/blog < update_version.json
```

## Debug Task

```
dcos task
dcos task blog
dcos task log blog
dcos task log blog --follow
dcos task log blog stderr
dcos task ls blog
```

## Connect to Master

```
dcos node ssh --master-proxy --leader
```

## Connect to Slave

```
dcos node
dcos node ssh --master-proxy --mesos-id=<ID>
```
