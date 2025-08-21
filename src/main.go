package main

import (
	"fmt"
	"net/http"
)

// swift and go are similar in syntax
func calculate() {
	fmt.Println("Calculating")
	var start = 27
	var i = start
	var max = 1
	var path = 1

	//time_start = DispatchTime.now()
	for x := 0; x < 100000000; x++ {
		i = start
		path = 1
		max = 1
		for y := 0; y < 100000; y++ {
			if i%2 == 0 {
				i = i / 2
			} else {
				i += 2*i + 1
			}
			if i > max {
				max = i
			}
			path += 1
			if i < 2 {
				y = 100000
			}
		}
	}
	//let time_end = DispatchTime.now()
	//let time_nano = Double(time_end.uptimeNanoseconds - time_start.uptimeNanoseconds) / 1_000_000_000
	fmt.Println("max: (max) ns: (time_nano)", max)
}

func handler(w http.ResponseWriter, r *http.Request) {
	//fmt.Fprintf(w, "Hello, World from Go!\n")
}

func main() {
	fmt.Println("server started")
	calculate()
	//http.HandleFunc("/", handler)
	//log.Fatal(http.ListenAndServe(":8080", nil))
}
