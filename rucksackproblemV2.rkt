#lang racket

(define (voll? kapazitaet container)
(cond ((= kapazitaet (apply + container)) #t)
(else #f)))

(define (zu-voll? kapazitaet container)
(cond ((< kapazitaet (apply + container)) #t)
(else #f)))

; (define (fkt stuecke kapazitaet container)
; (cond
; ((zu-voll? kapazitaet (cons (car stuecke) container)) (rest (rest container)))
; (else (rest container)))
; )

(define (fuelle stuecke kapazitaet container)
(cond
((voll? kapazitaet container) container)
((null? stuecke) #f)
((zu-voll? kapazitaet container) #f)
((fuelle (rest stuecke) kapazitaet (cons (first stuecke) container)))
(else (fuelle (rest stuecke) kapazitaet container))
))

(define stuecke '(30 30 30 20 20 20 20))
; (cadr stuecke)

(fuelle stuecke 100 '())