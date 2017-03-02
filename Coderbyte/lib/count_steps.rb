# Suppose you want climb a staircase of N steps, and on each step you can take either 1 or 2 steps. How many distinct ways are there to climb the staircase?

def count_steps(n)
    return n if n <= 2
    count_steps(n - 2) + count_steps(n - 1)
end