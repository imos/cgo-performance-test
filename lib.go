package main

/*
void ExampleCppFunction();
*/
import "C"

// RepeatExampleCppFunction calls ExampleCppFunc defined in C n times.
//export RepeatExampleCppFunction
func RepeatExampleCppFunction(n int) {
	for i := 0; i < n; i++ {
		C.ExampleCppFunction()
	}
}

// ExampleGoFunction is an empty function exposed to C.
//export ExampleGoFunction
func ExampleGoFunction() {}

func main() {}
