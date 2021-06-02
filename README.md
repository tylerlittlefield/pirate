# pirate

[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

A personal platform for R programming.

![](images/pirate.jpeg)

> _"Sea Of Thieves" by [@lacerenza_design](https://www.instagram.com/lacerenza_design)_

## What

This is a platform for R programmers, powered by traefik and docker, and designed to work on a Raspberry Pi cluster. It is **not** ready for any sort of production use, but it can be used as a template to develop a similar or improved platform (PR's welcome!).

Primary motivation is to load balance `shiny` applications with `traefik` to support concurrent usage. Some other things have been added simply because it's fun to self host (e.g. cran mirror) or could be useful for shiny applications (e.g. plumber api).

## Usage

Instructions are provided in each folder, start with `traefik` and then deploy any of the other services you're interested in.

Note that this platform uses [bind mounts](https://docs.docker.com/storage/bind-mounts/) to communicate files from the host and container, so keep in mind that paths are involved in some of the services. It's not "plug and play" and will require some work, mainly creating a couple directories and assigning them to the service.

## Features

* Support concurrent shiny sessions with traefik load balancer
* Develop at `rstudio.example.com` and deploy at `apps.example.com/appname`
* Collect server load metrics at `prometheus.example.com`
* Visualize server load metrics at `grafana.example.com`
* Alert excessive server load with `alertmanager.example.com`
* Deploy a postgres database at `db.example.com`
* Deploy a homepage at `example.com`
* Deploy a blog at `blog.example.com`
* Deploy a plumber api at `api.example.com`
* Host a CRAN mirror at `cran.example.com`

As a demonstration, here are a couple of these features in action, deployed from my Raspberry Pi cluster:

* https://api.tylerlittlefield.com/__docs__/
* https://cran.tylerlittlefield.com
* https://tylerlittlefield.com
* https://blog.tylerlittlefield.com
* https://apps.tylerlittlefield.com/hello

## Acknowledgements

* [`tiangolo/dockerswarm.rocks`](https://github.com/tiangolo/dockerswarm.rocks) makes up most of this project. Many of the `.yml` files are nearly identical but with minor changes to work on ARM CPUs.
* [`stefanprodan/swarmprom`](https://github.com/stefanprodan/swarmprom) makes up most of the monitoring stack with minor change to work on ARM CPUs.
* [@lacerenza_design](https://www.instagram.com/lacerenza_design) for the README artwork.
