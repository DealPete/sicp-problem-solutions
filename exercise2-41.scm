(define accumulate fold-right)

(define nil '())

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-triples n)
  (flatmap (lambda (i)
			 (flatmap (lambda (j)
					(map (lambda (k) (list i j k))
						 (enumerate-interval 1 (- j 1))))
				  (enumerate-interval 1 (- i 1))))
		   (enumerate-interval 1 n)))

(define (prime? n)
	(define (smallest-divisor n)
	  (find-divisor n 2))
	(define (find-divisor n test-divisor)
	  (cond ((> (square test-divisor) n) n)
			((divides? test-divisor n) test-divisor)
			(else (find-divisor n (+ test-divisor 1)))))
	(define (divides? a b)
	  (= (remainder b a) 0))
  (= n (smallest-divisor n)))

(define (prime-sum? triple)
  (prime? (+ (car triple) (cadr triple) (caddr triple))))

(define (make-triple-sum triple)
  (list (car triple)
		(cadr triple)
		(caddr triple)
		(+ (car triple) (cadr triple) (caddr triple))))

(define (prime-sum-triples n)
  (map make-triple-sum
	   (filter prime-sum? (unique-triples n))))
