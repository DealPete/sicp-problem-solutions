(define (cont-frac n d k)
  (define (go total k)
	(if (= k 1)
	  (/ (n 1) total)
	  (go (+ (d (- k 1)) (/ (n k) total)) (- k 1))))
  (go (d k) k))

(define (cont-frac-recur n d k)
  (define (newd l)
	(if (= l (- k 1))
	  (+ (d l) (/ (n (+ l 1)) (d (+ l 1))))
	  (d l)))
  (if (= k 1)
	(/ (n 1) (d 1))
	(cont-frac-recur n newd (- k 1))))

(define (e-d i)
  (if (= (remainder i 3) 2)
	(/ (* 2 (+ i 1)) 3.0)
	1.0))

(define (euler k)
  (+ 2 (cont-frac (lambda (i) 1.0) e-d k)))
