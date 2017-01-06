(define (reverse ls)
  (if (null? (cdr ls))
	(list (car ls))
	(append (reverse (cdr ls)) (list (car ls)))))
