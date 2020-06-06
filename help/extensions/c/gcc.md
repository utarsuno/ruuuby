
### GCC flags

https://gcc.gnu.org/onlinedocs/gcc/Invoking-GCC.html#Invoking-GCC

---

| gcc-flag case | result |
| ---: | :--- |
| `-fpic` vs `-fPIC` | `-fPIC` for `x86-64` |

---

`fix later w/ a build-process w/ Docker and such`

```
# faggressive-loop-optimizations
# fira-loop-pressure
# fearly-inlining
# fvariable-expansion-in-unroller

# "The compiler failed to generate an executable file. (RuntimeError) You have to install development tools first."
#$CFLAGS << ' -Wformat-overflow'
#$CFLAGS << ' -Wformat-truncation'
#$LDFLAGS << ' --gc-sections'
```

### GCC Build

 * https://www.gnu.org/software/gcc/mirrors.html


### misc

 * https://stackoverflow.com/questions/9450394/how-to-install-gcc-piece-by-piece-with-gmp-mpfr-mpc-elf-without-shared-libra

```
find /usr /opt -name "mpfr.h"

```
