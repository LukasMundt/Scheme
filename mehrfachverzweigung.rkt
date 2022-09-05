#lang racket

(define
  (plus a b)
  (cond
    ((not(number? a)) (error "a:" a "ist keine Zahl"))
    ((not(number? b)) (error "b:" b "ist keine Zahl"))
    (else
     (+ a b)
     )
    )
  )

(plus 1 3) ;--> 4
(plus 1 'hund) ;--> error: b ist keine Zahl
(plus 'hund 1) ;--> error: a ist keine Zahl
(plus 'hund 'katze) ;--> error: a ist keine Zahl (Abarbeitung in Reihung wird deutlich)
