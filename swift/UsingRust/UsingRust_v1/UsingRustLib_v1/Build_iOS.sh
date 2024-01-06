#!/bin/bash

LIB_IOS_X86_64=target/x86_64-apple-ios/debug/libUsingRustLib_v1.a;
LIB_IOS_ARM_64=target/aarch64-apple-ios/debug/libUsingRustLib_v1.a;
LIB_IOS_FAT=target/libUsingRustLib_v1.a;
LIB_HEADER=target/UsingRust_v1.h;

cargo build --target aarch64-apple-ios;
lipo -info $LIB_IOS_ARM_64;

cargo build --target x86_64-apple-ios;
lipo -info $LIB_IOS_X86_64;

lipo -create $LIB_IOS_X86_64 $LIB_IOS_ARM_64 -output $LIB_IOS_FAT;
lipo -info $LIB_IOS_FAT;

cbindgen -l C -o $LIB_HEADER;