(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))
  
(define (midpoint p1 p2)
  (make-point (/ (+ (x-point p1) (x-point p2)) 2.0)
			  (/ (+ (y-point p1) (y-point p2)) 2.0)))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))
