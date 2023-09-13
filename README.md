# Mojo-Docker

A generic dockerfile for the [mojo](https://www.modular.com/mojo) programming language

## Usage

Mojo requires you to authenticate before being able to download it, therefore to install this you have to build the docker container with your auth key provided:

```sh
docker buildx build -t mojo --build-arg MODULAR_AUTH=<your_key> .
```

You can get this key [here](https://developer.modular.com/download), it's the `MODULAR_AUTH` envvar in the "Install the Modular CLI" section and an argument to `modular auth` in the "Install Mojo" section.

Afterwards, you can either use `FROM: mojo` in your own dockerfiles or run it interactively with `docker run -ti mojo`.
