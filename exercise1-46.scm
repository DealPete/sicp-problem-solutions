(define (fixed-point f first-guess)
  (define tolerance 0.00001)
  (define (close-enough? x)
    (< (abs (- x (f x))) tolerance))
  ((iterative-improve close-enough? f) first-guess))

(define (sqrt x)
  (define (improve guess)
    (average guess (/ x guess)))
  
  (define (average x y)
    (/ (+ x y) 2))
  
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))

  ((iterative-improve good-enough? improve) 1.0))

(define (iterative-improve good-enough? improve)
  (define (go guess)
	(if (good-enough? guess)
	  guess
	  (go (improve guess))))
  go)

