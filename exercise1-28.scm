(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
			 (let ((squarand (expmod base (/ exp 2) m)))
				(let ((sqr (remainder (square squarand) m)))
					 (if (and (= sqr 1) (not (or (= squarand 1) (= squarand (- m 1)))))
					   0
					   sqr))))
        (else (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

