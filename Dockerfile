FROM ubuntu:18.04

RUN apt-get update -qq \
    && apt-get install -qqy \
        g++ unzip zip curl openjdk-11-jdk git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -o /tmp/bazel-installer.sh \
        https://github.com/bazelbuild/bazel/releases/download/3.1.0/bazel-3.1.0-installer-linux-x86_64.sh && \
    chmod +x /tmp/bazel-installer.sh && \
    /tmp/bazel-installer.sh
