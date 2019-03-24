FROM ubuntu:latest

WORKDIR /source

RUN apt-get update && apt-get install -y \
    g++ \
    cmake \
    git \
    cppcheck \
    qt5-default \
    qtbase5-dev \
    lcov \
    clang-format-6.0 \
    clang-tidy-6.0 \
&& rm -rf /var/lib/apt/lists/*

