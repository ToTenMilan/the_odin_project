def fib_rec(n)
  return 0 if n == 0
  return 1 if n < 3
  n = fib_rec(n-1) + fib_rec(n-2)
end
p fib_rec(0)
p fib_rec(1)
p fib_rec(2)
p fib_rec(3)
p fib_rec(4)
p fib_rec(5)
p fib_rec(6)
p fib_rec(7)