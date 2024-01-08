#!/bin/bash

cargo build --target aarch64-linux-android;
cargo build --target armv7-linux-androideabi;
cargo build --target i686-linux-android;
cargo build --target x86_64-linux-android;
