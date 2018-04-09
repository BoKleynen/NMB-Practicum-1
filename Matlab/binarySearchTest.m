% x is an int
assert(binarySearch(3, [1, 2, 3, 4, 5, 6]) == 3)
assert(binarySearch(3, [0, 1, 2, 3, 4, 5]) == 4)
assert(binarySearch(3, [1, 2, 3, 4, 5]) == 3)
assert(binarySearch(3, [0, 1, 2, 3, 4]) == 4)

% x is a double
assert(binarySearch(3.5, [1, 2, 3, 4, 5, 6]) == 3)
assert(binarySearch(3.5, [0, 1, 2, 3, 4, 5]) == 4)
assert(binarySearch(3.5, [1, 2, 3, 4, 5]) == 3)
assert(binarySearch(3.5, [0, 1, 2, 3, 4]) == 4)
