(define (deep-reverse ls)
  (cond ((null? ls) '())
		((not (pair? ls)) ls)
		(else (append (deep-reverse (cdr ls)) (list (deep-reverse (car ls)))))))
