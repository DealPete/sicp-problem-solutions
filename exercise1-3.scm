(define (square x)
  (* x x))

(define (min x y z)
  (cond ((and (< x y) (< x z)) x)
        ((< y z) y)
        (else z)))

(define (sum-squares x y z)
  (+ (square x) (square y) (square z)))

(define (sum-max-squares x y z)
  (- (sum-squares x y z) 
	 (square (min x y z))))
