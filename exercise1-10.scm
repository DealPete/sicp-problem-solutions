(define (fib3 n)
  (if (< n 3)
	  n
	  (+ (fib3 (- n 1))
	 	 (* 2 (fib3 (- n 2)))
	 	 (* 3 (fib3 (- n 3))))))

(define (fib3i n)
	(fib3-iter 2 1 0 n))

(define (fib3-iter a b c count)
  (if (= count 0)
	c
	(fib3-iter (+ a (* b 2) (* c 3))
			   a
			   b
			   (- count 1))))
