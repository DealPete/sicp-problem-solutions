(define (product term a next b)
  (if (> a b)
	1
	(* (term a)
	   (product term (next a) next b))))

(define (product-iter term a next b)
  (define (product-iter a result)
	(if (> a b)
	  result
	  (product-iter (next a) (* result (term a)))))
  (product-iter a 1))

(define (fact n)
  (define (inc n) (+ n 1))
  (define (identity n) n)
  (product identity 1 inc n))

(define (wallis-pi n)
  (define (inc n) (+ n 2))
  (define (term n)
	(/ (* (- n 1) (+ n 1))
	   (* n n)))
  (* 4.0 (product-iter term 3 inc n)))
