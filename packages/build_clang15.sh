#! /bin/bash

source src_common.sh
source utils/src_init_package_manager.sh

trap '__abort' 0

wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key|sudo apt-key add -
sudo mv /etc/apt/trusted.gpg /etc/apt/trusted.gpg.d/llvm-snapshot.gpg

echo "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-15 main" | sudo tee /etc/apt/sources.list.d/llvm-15.list
echo "deb-src http://apt.llvm.org/jammy/ llvm-toolchain-jammy-15 main" >> /etc/apt/sources.list.d/llvm-15.list

# LLVM
${APT} ${INSTALL} libllvm-15-ocaml-dev libllvm15 llvm-15 llvm-15-dev llvm-15-doc llvm-15-examples llvm-15-runtime
# Clang and co
${APT} ${INSTALL} clang-15 clang-tools-15 clang-15-doc libclang-common-15-dev libclang-15-dev libclang1-15 clang-format-15 python3-clang-15 clangd-15 clang-tidy-15
# libfuzzer
${APT} ${INSTALL} libfuzzer-15-dev
# lldb
${APT} ${INSTALL} lldb-15
# lld (linker)
${APT} ${INSTALL} lld-15
# libc++
${APT} ${INSTALL} libc++-15-dev libc++abi-15-dev
# OpenMP
${APT} ${INSTALL} libomp-15-dev
# libclc
${APT} ${INSTALL} libclc-15-dev
# libunwind
${APT} ${INSTALL} libunwind-15-dev
# mlir
${APT} ${INSTALL} libmlir-15-dev mlir-15-tools

trap : 0
