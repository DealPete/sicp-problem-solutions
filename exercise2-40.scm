(define accumulate fold-right)

(define nil '())

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
  (flatmap (lambda (i)
			 (map (lambda (j) (list i j))
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

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum-pairs n)
  (map make-pair-sum
	   (filter prime-sum? (unique-pairs n))))
