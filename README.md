<!--
Copyright (c) 2025 LG Electronics, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

SPDX-License-Identifier: Apache-2.0
-->

<!-- omit from toc -->
# oscms-ci-docker

This repository provides docker images which ire primarily used for CI purposes in the other code repositories of the Open SCMS project. They can also be used for local development (to avoid installing all the build dependencies on your host system), and potentially as a `VS Code` development containers.

* `oscms-ci-docker` is used for all of the C and C++ based repositories.
* `oscms-server-ci-docker` is used for the Rust OpenSCMS repository. This is missing tools such as `valgrind` and `cppcheck`

<!-- omit from toc -->
## Table of Contents

* [Building an image and using it locally](#building-an-image-and-using-it-locally)
* [Pulling the images from GitHub](#pulling-the-images-from-github)
* [Contributing](#contributing)
* [License](#license)

## Building an image and using it locally

Clone the repository and build the image

```bash
git clone git@github.com:OpenSCMS/oscms-ci-docker.git
cd oscms-ci-docker
docker build -t oscms-ci-docker . -f openscms-ci.dockerfile
docker build -t oscms-server-ci-docker . -f openscms-server-ci.dockerfile
```

Now change to the directory where you cloned the code repositories and run the container. Either

```bash
docker run -ti --rm --volume $PWD:/WORK --user $(id -u):$(id -g) \
       oscms-ci-docker
```

or

```bash
docker run -ti --rm --volume $PWD:/WORK --user $(id -u):$(id -g) \
       oscms-server-ci-docker
```

This will place you in a `bash` shell within the container, with your cloned source available at `/WORK`. Your user inside the container will have the same group and user id as on your host, so any changes you make will have the correct permissions.

## Pulling the images from GitHub

The images are published on `ghcr.io` as a public images. Simply pull them as follows

```bash
docker pull ghcr.io/openscms/oscms-ci-docker:latest
docker pull ghcr.io/openscms/oscms-server-ci-docker:latest
```

You can then run it as shown below.

```bash
docker run -ti --rm --volume $PWD:/WORK --user $(id -u):$(id -g) \
       ghcr.io/openscms/oscms-ci-docker:latest
```

```bash
docker run -ti --rm --volume $PWD:/WORK --user $(id -u):$(id -g) \
       ghcr.io/openscms/oscms-server-ci-docker:latest
```

## Contributing

Contributions are welcome. Please see the [CONTRIBUTING file](https://github.com/OpenSCMS/.github/blob/main/CONTRIBUTING.md) for details, including the Code of Conduct and C Style Guide.

## License

This project is licensed under the Apache-2.0 License. See the [LICENSE file](./LICENSE) for details.
