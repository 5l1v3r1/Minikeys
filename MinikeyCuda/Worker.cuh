#include <stdint.h>
#include <cuda.h>
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include "lib/hash/sha256.cu"
#include "lib/Math.cuh"

__global__ void kernelMinikeys(unsigned int* buffResult, bool* buffCollectorWork, int* const __restrict__ buffStart, const int threadNumberOfChecks);

__global__ void resultCollector(unsigned int* buffResult, unsigned int* buffCombinedResult, const uint64_t threadsInBlockNumberOfChecks);

__device__ void addBase58(int count, int* key);
__device__ void calculateSha256(int* key, beu32* d_hash);
__device__ bool checkSha256(int* key, beu32* d_hash);
cudaError_t loadAlphabet(unsigned int* _alphabet);