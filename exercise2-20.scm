(define (same-parity x . xs)
  (define (parity xs)
	(if (null? xs)
	  '()
	   (let ((y (car xs))
		     (ys (cdr xs)))
		  (if (= (remainder y 2) (remainder x 2))
			  (cons y (parity ys))
			  (parity ys)))))
  (cons x (parity xs)))