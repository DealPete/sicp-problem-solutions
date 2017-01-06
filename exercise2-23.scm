(define (for-each proc elements)
  (cond ((null? elements) 'nil)
		(else (proc (car elements))
			  (for-each proc (cdr elements)))))
