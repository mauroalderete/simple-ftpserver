# SimpleFTP Server <!-- omit in toc -->

***Simple FTP server for Docker using vsftpd***

<div align="center">

&nbsp;

[![License: MIT](https://img.shields.io/badge/License-Private-yellow.svg)](./LICENSE)
[![Contributor covenant: 2.1](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](./CODE_OF_CONDUCT.md)
[![Semantic Versioning: 2.0.0](https://img.shields.io/badge/Semantic--Versioning-2.0.0-a05f79?logo=semantic-release&logoColor=f97ff0)](https://semver.org/)

[![Labeling](https://github.com/mauroalderete/simple-ftpserver/actions/workflows/labeling.yml/badge.svg)](https://github.com/mauroalderete/simple-ftpserver/actions/workflows/labeling.yml)
[![Tests](https://github.com/mauroalderete/simple-ftpserver/actions/workflows/tests.yml/badge.svg)](https://github.com/mauroalderete/simple-ftpserver/actions/workflows/tests.yml)
[![CodeQL](https://github.com/mauroalderete/simple-ftpserver/actions/workflows/codeql-analysis.yml/badge.svg)](https://github.com/mauroalderete/simple-ftpserver/actions/workflows/codeql-analysis.yml)
[![Liberation](https://github.com/mauroalderete/simple-ftpserver/actions/workflows/liberation.yml/badge.svg)](https://github.com/mauroalderete/simple-ftpserver/actions/workflows/liberation.yml)
[![Deploy Release](https://github.com/mauroalderete/simple-ftpserver/actions/workflows/deploy-release.yml/badge.svg)](https://github.com/mauroalderete/simple-ftpserver/actions/workflows/deploy-release.yml)
[![Project Automation](https://github.com/mauroalderete/simple-ftpserver/actions/workflows/project-automation.yml/badge.svg)](https://github.com/mauroalderete/simple-ftpserver/actions/workflows/project-automation.yml)

[Bug Report](./issues/new?assignees=&labels=bug%2Clifecycle%2Fneeds-triage&projects=mauroalderete%2F20&template=1-bug-report.yml&title=...+is+broken)
⭕
[Feature Request](./issues/new?assignees=&labels=enhancement%2Clifecycle%2Fneeds-triage&projects=mauroalderete%2F20&template=2-feature-request.yml&title=As+a+%5Btype+of+user%5D%2C+I+want+%5Ba+goal%5D+so+that+%5Bbenefit%5D)
⭕
[Help Wanted](./issues/new?assignees=&labels=help+wanted%2Clifecycle%2Fneeds-triage&projects=mauroalderete%2F20&template=3-help-wanted.yml&title=I+need+help+with...)

</div>

## Table of Contents <!-- omit in toc -->

- [Description](#description)
- [Build](#build)
- [Running the service](#running-the-service)
- [Configuration](#configuration)
- [Starting the service](#starting-the-service)

## Description

This service provides an FTP server based on vsftpd running on Alpine Linux. It allows you to transfer files in the traditional way using the FTP protocol, making it ideal for integration with legacy systems or tools that require this type of access.

The server automatically creates an FTP user with the credentials you specify in the environment file. The user is confined to their home directory via chroot, meaning they cannot navigate outside their assigned folder. Everything you upload or download will be available in the project's `data` folder, which is directly mapped as the FTP user's home directory.

## Build

```bash
docker build -t simple-ftpserver .
```

## Running the service

```bash
docker compose up --build -d
```

## Configuration

Copy `env.example` to `.env` and adjust the username and password as needed. By default, it comes configured with the user `guest` and password `1234560`, but you should change them to something more secure if the service will be exposed.

The server uses port 21 for commands and a range of passive ports (21100-21110) for data transfers. The network configuration is optimized to work inside Docker, but you may need to adjust the `vsftpd.conf` file if you expose it publicly or use NAT.

## Starting the service

Run `docker compose up --build -d` from this directory. The first time, it will build the custom image with vsftpd and the initialization script. Once running, you can connect with any FTP client using the configured credentials.
