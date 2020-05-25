# CGO Performance Test
TL;DR: Go calls C++ in 73 ns, C++ calls Go in 5.7 us on MacBook Pro (2.6GHz, Turbo Boost 4.30 GHz).

```
cgo-performance-test % make
docker build -t cgo-peformance-test .
Sending build context to Docker daemon  69.63kB
...
Successfully tagged cgo-peformance-test:latest
docker run --rm -it --volume=/Users/imos/git/cgo-performance-test:/repo -w /repo \
		--volume=/tmp/cgo-peformance-test/.cache:/root/.cache \
		cgo-peformance-test bash -c " \
			bazel run -c opt //:main && \
			cat /proc/cpuinfo"
Starting local Bazel server and connecting to it...
INFO: Analyzed target //:main (35 packages loaded, 6788 targets configured).
INFO: Found 1 target...
INFO: Deleting stale sandbox base /root/.cache/bazel/_bazel_root/6530f9eb448d96e7552a3c3a29b6cd2b/sandbox
Target //:main up-to-date:
  bazel-bin/main
INFO: Elapsed time: 100.940s, Critical Path: 71.42s
INFO: 2 processes: 2 processwrapper-sandbox.
INFO: Build completed successfully, 3 total actions
INFO: Build completed successfully, 3 total actions
C++ to Go:
    0.000005798 seconds / call
Go to C++:
    0.000000073 seconds / call
processor	: 0
vendor_id	: GenuineIntel
cpu family	: 6
model		: 158
model name	: Intel(R) Core(TM) i7-8850H CPU @ 2.60GHz
stepping	: 10
cpu MHz		: 2600.000
cache size	: 9216 KB
physical id	: 0
siblings	: 1
core id		: 0
cpu cores	: 1
apicid		: 0
initial apicid	: 0
fpu		: yes
fpu_exception	: yes
cpuid level	: 22
wp		: yes
flags		: fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss ht pbe syscall nx pdpe1gb lm constant_tsc rep_good nopl xtopology nonstop_tsc cpuid tsc_known_freq pni pclmulqdq dtes64 ds_cpl ssse3 sdbg fma cx16 xtpr pcid sse4_1 sse4_2 movbe popcnt aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch pti fsgsbase bmi1 hle avx2 bmi2 erms rtm xsaveopt arat
bugs		: cpu_meltdown spectre_v1 spectre_v2 spec_store_bypass l1tf mds swapgs
bogomips	: 5184.00
clflush size	: 64
cache_alignment	: 64
address sizes	: 39 bits physical, 48 bits virtual
power management:
```
