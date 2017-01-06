(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (begin
		  	(newline)
			(display next)
			(try next)))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000.0) (log x))) 2)

(fixed-point (lambda (x) (/ (+ x (/ (log 1000.0) (log x))) 2)) 2)
