(define (cube-iter guess last-guess x)
  	(if (good-enough? guess last-guess)
	guess
	(cube-iter (improve guess x)
			   guess
			   x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess))
		(* 2 guess))
	 3))

(define (good-enough? guess last-guess)
  (< (abs (- guess last-guess)) (* 0.001 guess)))

(define (cbrt x)
  (cube-iter 1.0 0.0 x))
