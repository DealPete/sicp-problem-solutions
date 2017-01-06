(define (last-pair ls)
  (if (null? (cdr ls))
	(car ls)
	(last-pair (cdr ls))))
