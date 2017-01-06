(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (next p)
  (if (= p 2)
	3
	(+ p 2)))

(define (search-for-primes a b)
  (cond ((>= a b) 0)
        ((= (remainder a 2) 0) (search-for-primes (+ a 1) b))
		(else (timed-prime-test a)
			  (search-for-primes (+ a 1) b))))
