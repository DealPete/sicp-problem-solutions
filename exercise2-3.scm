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

(define (make-rectA x1 y1 x2 y2)
  (cons (make-point x1 y1) (make-point x2 y2)))

(define (make-rectB x1 y1 x2 y2)
  (cons (midpoint (make-point x1 y1) (make-point x2 y2))
		(cons (abs (- x1 x2)) (abs (- y1 y2)))))

(define (rect-widthA rectangle)
  (abs (- (x-point (car rectangle)) (x-point (cdr rectangle)))))

(define (rect-heightA rectangle)
  (abs (- (y-point (car rectangle)) (y-point (cdr rectangle)))))

(define (rect-widthB rectangle)
  (car (cdr rectangle)))

(define (rect-heightB rectangle)
  (cdr (cdr rectangle)))

(define (rect-area rect-width rect-height rectangle)
  (* (rect-width rectangle) (rect-height rectangle)))

(define (rect-perimeter rect-width rect-height rectangle)
  (* 2 (+ (rect-width rectangle) (rect-height rectangle))))
