(define (accumulate combiner null-value term a next b)
  (if (> a b)
	null-value
	(combiner (term a)
			  (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (accumulate-iter a result)
	(if (> a b)
	  result
	  (accumulate-iter (next a) (combiner result (term a)))))
  (accumulate-iter a null-value))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (inc n) (+ n 1))
(define (identity n) n)

(define (fact n)
  (product identity 1 inc n))

(define (wallis-pi n)
  (define (inc n) (+ n 2))
  (define (term n)
	(/ (* (- n 1) (+ n 1))
	   (* n n)))
  (* 4.0 (accumulate-iter * 1 term 3 inc n)))

(define (sum a b)
  (accumulate + 0 identity a inc b))
  
