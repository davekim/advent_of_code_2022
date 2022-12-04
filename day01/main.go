package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
)

func solvePartOne(path string) int {
	elves := parseInput(path)
	return elves[0]
}

func solvePartTwo(path string) int {
	elves := parseInput(path)
	return elves[0] + elves[1] + elves[2]
}

func parseInput(path string) []int {
	elves := make([]int, 0)
	calories := 0

	file, _ := os.Open(path)
	fscanner := bufio.NewScanner(file)
	for fscanner.Scan() {
		line := fscanner.Text()
		if len(line) == 0 {
			elves = append(elves, calories)
			calories = 0
		} else {
			snack, _ := strconv.Atoi(line)
			calories += snack
		}
	}
	sort.Sort(sort.Reverse(sort.IntSlice(elves)))
	return elves
}

func main() {
	fmt.Println("Part 1:", solvePartOne("day01/input.txt"))
	fmt.Println("Part 2:", solvePartTwo("day01/input.txt"))
}
