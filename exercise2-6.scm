(define zero
  (lambda (f) (lambda (x) x)))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (mul a b)
  (lambda (f) (lambda (x) ((a (b f)) x))))

(define (plus a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))
