import math
import os
import random
import re
import sys

# Complete the flatlandSpaceStations function below.
def flatlandSpaceStations(n: int, c: list) -> int:
    # 1. Sort the array of space stations, for easier calculations
    c.sort()

    # 2. Initialize the max distance and account for the exception of having the highest distance at the end
    max_distance = 0

    # Distance to the first station from the first city
    max_distance = max(max_distance, c[0])

    # Distance to last station from the last city
    max_distance = max(max_distance, (n - 1) - c[-1])

    # 3. Now check for distances within the "middle cities"
    for i in range(1, len(c)):
        # Add the floor as the cities in between will be equidistant
        distance = math.floor( (c[i] - c[i - 1]) / 2)
        max_distance = max(max_distance, distance)

    return max_distance

if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    nm = input().split()

    n = int(nm[0])

    m = int(nm[1])

    c = list(map(int, input().rstrip().split()))

    result = flatlandSpaceStations(n, c)

    fptr.write(str(result) + '\n')

    fptr.close()
