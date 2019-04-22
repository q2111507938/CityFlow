import matplotlib.pyplot as plt
import re
import numpy as np

pattern = re.compile(r'(\d+, \d+)')

def delete_chars(s, chars):
    for c in chars:
        s = s.replace(c, ' ')
    return s

n = int(input()) + 1
segs = []
for _ in range(n):
    s = input()
    if s == "":
        break
    s = delete_chars(s, "(),")
    nums = [float(a) for a in s.split()]
    x = [nums[i] for i in range(0, len(nums), 2)]
    y = [nums[i] for i in range(1, len(nums), 2)]
    segs.append((x,y))
for i in range(n-1):
    x, y = segs[i]
    plt.plot(x, y)
px, py = segs[n-1]
plt.scatter(px, py)

plt.show()
