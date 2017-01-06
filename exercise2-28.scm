(define (fringe ls)
  (cond ((null? ls) '())
		((not (pair? ls)) (list ls))
		(else (append (fringe (car ls)) (fringe (cdr ls))))))

