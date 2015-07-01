BuildFlavour = perf
GhcLibWays = v

SRC_HC_OPTS     = -O -H64m
GhcStage1HcOpts = -O -fasm
GhcStage2HcOpts = -O2 -fasm
GhcHcOpts       = -Rghc-timing
GhcLibHcOpts    = -O2
GhcLibWays     += p
GhcLibWays += dyn

NoFibWays =
STRIP_CMD = :


