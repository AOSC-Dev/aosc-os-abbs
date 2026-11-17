#!/bin/bash
# 99-catchall: Catchall script for handling generic installations

match_arch i486 && match_efi_32 && match_writable_efivars && install_efi i386-efi
match_arch i486 && match_efi_32 && install_efi_removable i386-efi
match_arch i486 && ! match_efi && matched && install_pc
