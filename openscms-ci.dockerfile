# Copyright (c) 2025 LG Electronics, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# SPDX-License-Identifier: Apache-2.0

# This image is used for all CI jobs. It may load a lot of stuff. but not having
# to rebuild it for every job in a pipeline saves a lot of time.

FROM ubuntu:24.04

# Install all basic tools - not build dependencies. We do them last to maximize layer cacheing
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qy && \
    DEBIAN_FRONTEND=noninteractive apt-get -qy install \
    build-essential \
    clang-format-18 \
    cppcheck \
    wget \
    git \
    gzip \
    pipx \
    python3 \
    curl \
    cmake \
    valgrind

# Install anything we might need to compile successfully
RUN DEBIAN_FRONTEND=noninteractive apt-get -qy install \
    libzip-dev \
    libssl-dev \
    libcurl4-openssl-dev

# Cleanup the apt cache. If you need to install anything else, you will need to re-run apt update
RUN rm -rf /var/lib/apt/lists





