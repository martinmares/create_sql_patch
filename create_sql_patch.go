// Timestamp
//   |_ date:     22.08.2018
//   |_ time:     09:22:26
//   |_ microsec: 871688
// Create file name: 20180822092226871688__test.sql

package main

import (
	"fmt"
	"os"
	"time"

	"github.com/fatih/color"
)

func makeTimestamp() int64 {
	return time.Now().UnixNano() / int64(time.Millisecond)
}

func printGreen(s string) {
	color.Set(color.FgGreen)
	fmt.Printf(s)
	color.Unset()
}

func main() {
	t := time.Now()

	if len(os.Args) > 1 {
		suffix := os.Args[1]

		// fmt.Printf("Year: %d\n", t.Year())
		// fmt.Printf("Month: %.2d\n", t.Month())
		// fmt.Printf("Day: %.2d\n", t.Day())
		// fmt.Printf("Hour: %.2d\n", t.Hour())
		// fmt.Printf("Minute: %.2d\n", t.Minute())
		// fmt.Printf("Second: %.2d\n", t.Second())
		// fmt.Printf("Nanosecond: %.6d\n", t.Nanosecond()/1000)
		fileName := fmt.Sprintf("%d%.2d%.2d%.2d%.2d%.2d%.6d__%v.sql", t.Year(), t.Month(), t.Day(), t.Hour(), t.Minute(), t.Second(), t.Nanosecond()/1000, suffix)
		_, _ = os.Create(fileName)

		fmt.Printf("Patch file created: ")
		color.Set(color.FgYellow)
		fmt.Printf("%v\n", fileName)
		color.Unset()
		fmt.Printf("Date: ")
		printGreen(fmt.Sprintf("%d.%d.%d", t.Day(), t.Month(), t.Year()))
		fmt.Printf("; time: ")
		printGreen(fmt.Sprintf("%d:%d:%d", t.Hour(), t.Minute(), t.Second()))
		fmt.Printf("; msec: ")
		printGreen(fmt.Sprintf("%d\n", t.Nanosecond()/1000))
	}

}
