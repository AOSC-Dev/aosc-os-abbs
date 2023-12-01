// AOSC OS defined default flags

"mips64el-aosc-linux-gnuabi64":
{
    post-switches = [
        "-I/usr/include/d",
        "-mabi=n64",
        "-mcpu=mips64r2",
    ];
};

"riscv64-aosc-linux-gnu":
{
    post-switches = [
        "-I/usr/include/d",
        "-mabi=lp64d",
        "--float-abi=hard",
        "-mattr=+m,+a,+f,+d",
// when using LLD: "-Xcc=-Wl,-mllvm=-mattr=+f,+d",
    ];
}
