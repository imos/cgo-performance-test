#include <chrono>
#include <functional>
#include <string>

#include <stdio.h>

#include "lib_go.h"

void RepeatExampleGoFunction(int n) {
    for (int i = 0; i < n; i++) {
        ExampleGoFunction();
    }
}

void Benchmark(const std::string& name, const std::function<void(int)>& f) {
    printf("%s:\n", name.c_str());
    auto measure = [f](int n) {
        auto start_time = std::chrono::system_clock::now();
        f(n);
        return static_cast<double>(
            std::chrono::duration_cast<std::chrono::nanoseconds>(
                std::chrono::system_clock::now() - start_time).count()) * 1e-9;
    };
    // Find n that takes 100 ms.
    double duration_per_call = measure(1);
    for (int i = 0; i < 10; i++) {
        int n = int(0.1 / duration_per_call) + 1;
        double duration_of_n = measure(n);
        duration_per_call = duration_of_n / n;
        if (duration_of_n > 0.05) {
            break;
        }
    }
    int n = int(1 / duration_per_call) + 1;
    double duration_of_n = measure(n);
    duration_per_call = duration_of_n / n;
    printf("    %.09f seconds / call\n", duration_per_call);
}

int main() {
    Benchmark("C++ to Go", RepeatExampleGoFunction);
    Benchmark("Go to C++", RepeatExampleCppFunction);
}
