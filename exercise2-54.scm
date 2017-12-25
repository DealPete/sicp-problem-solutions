(define (equ? a b)
  (cond ((and (not (pair? a)) (not (pair? b))) (eq? a b))
		(else (and (equ? (car a) (car b)) (equ? (cdr a) (cdr b))))))
