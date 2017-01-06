(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car n)
  (define (go n k)
	(if (= 0 (remainder n 2))
	  (go (/ n 2) (+ k 1))
	  k))
  (go n 0))

(define (cdr n)
  (define (go n k)
	(if (= 0 (remainder n 3))
	  (go (/ n 3) (+ k 1))
	  k))
  (go n 0))

