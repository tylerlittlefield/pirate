# pirate

[![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)

A personal platform for R programming.

![](images/pirate.jpeg)

> _"Sea Of Thieves" by [@lacerenza_design](https://www.instagram.com/lacerenza_design)_

## What

This is a platform for R programmers, powered by traefik and docker, and designed to work on a Raspberry Pi cluster. It is **not** ready for any sort of production use, but it can be used as a template to develop a similar or improved platform (PR's welcome!).

Primary motivation is to load balance `shiny` applications with `traefik` to support concurrent usage. Some other things have been added simply because it's fun to self host (e.g. cran mirror) or could be useful for shiny applications (e.g. plumber api).

## Acknowledgements

* [`tiangolo/dockerswarm.rocks`](https://github.com/tiangolo/dockerswarm.rocks) makes up most of this project. Many of the `.yml` files are nearly identical but with minor changes to work on ARM CPUs.
* [`stefanprodan/swarmprom`](https://github.com/stefanprodan/swarmprom) makes up most of the monitoring stack with minor change to work on ARM CPUs.
* [@lacerenza_design](https://www.instagram.com/lacerenza_design) for the README artwork.
