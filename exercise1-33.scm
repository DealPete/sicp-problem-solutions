(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (accumulate-filter pred combiner null-value term a next b)
  (cond ((> a b) null-value)
	((not (pred a)) (accumulate-filter pred combiner null-value term (next a) next b))
	(else (combiner (term a)
			  (accumulate-filter pred combiner null-value term (next a) next b)))))

(define (SSP a b)
  (define (inc n) (+ n 1))
  (define (term n) (* n n))
  (accumulate-filter prime? + 0 term a inc b))

(define (gcd a b)
  (if (= b 0)
	a
	(gcd b (remainder a b))))

(define (PPI n)
  (define (inc n) (+ n 1))
  (define (term n) n)
  (define (relatively-prime? k)
	(= 1 (gcd n k)))
  (accumulate-filter relatively-prime? * 1 term 2 inc (- n 1)))
