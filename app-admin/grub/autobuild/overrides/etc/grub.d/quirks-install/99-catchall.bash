#!/bin/bash
# 99-catchall: Catchall script for handling generic installations

match_arch amd64 && match_efi_64 && match_writable_efivars && install_efi x86_64-efi
match_arch amd64 && match_efi_64 && install_efi_removable x86_64-efi
match_arch amd64 && match_efi_32 && match_writable_efivars && install_efi i386-efi
match_arch amd64 && match_efi_32 && install_efi_removable i386-efi
match_arch amd64 && ! match_efi && matched && install_pc

match_arch arm64 && match_writable_efivars && install_efi_extra_removable arm64-efi
match_arch arm64 && install_efi_removable arm64-efi

match_arch loongarch64 && match_writable_efivars && install_efi_extra_removable loongarch64-efi
match_arch loongarch64 && install_efi_removable loongarch64-efi

match_arch loongson3 && install_efi_removable mips64el-efi

match_arch ppc64el && install_ppc_ieee1275

match_arch riscv64 && match_writable_efivars && install_efi_extra_removable riscv64-efi
match_arch riscv64 && match_efi && install_efi_removable riscv64-efi
