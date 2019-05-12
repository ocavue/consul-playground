# Consul Playground

> Try a Consul cluster on your laptop

Make sure that you have docker-compose and docker installed on your computer.

How to use:

```
$ cd consul-playground
$ make build
```

On another terminal:

```
$ sudo docker exec -it vm0 bash
```

You can repalce vm0 with vm1, vm2 or vm3 to enter different containers.