# space-media-vod

English | [简体中文](./README_cn.md)

## Project Introduction

space-media-vod on demand service, relies on ao-space/nginx-vod-module (forked from kaltura/nginx-vod-module).

## Module Design Introduction

A docker image building project for video on demand service that is suitable for AO.space, relies on ao-space/nginx-vod-module. For standalone usage, refer to ao-space/nginx-vod-module. For combined usage with AoSpace, refer to ao-space/space-gateway video on demand related API.

## Build

```shell
docker build -t space-media-vod:latest .
```

## Run

### Standalone

```shell
docker run -p 3001:3001 space-media-vod:latest
```

### Combined with other services in AO.space

Refer to [build-and-deploy](https://github.com/ao-space/ao.space/blob/dev/docs/build-and-deploy.md).

## Notes

## Contribution Guidelines

Contributions to this project are very welcome. Here are some guidelines and suggestions to help you get involved in the project.

[Contribution Guidelines](https://github.com/ao-space/ao.space/blob/dev/docs/en/contribution-guidelines.md)

## Contact us

- Email: <developer@ao.space>
- [Official Website](https://ao.space)
- [Discussion group](https://slack.ao.space)

## Thanks for your contribution

Finally, thank you for your contribution to this project. We welcome contributions in all forms, including but not limited to code contributions, issue reports, feature requests, documentation writing, etc. We believe that with your help, this project will become more perfect and stronger.
