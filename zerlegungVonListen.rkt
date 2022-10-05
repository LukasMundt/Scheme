#lang racket

; Zerlegung von Listen -------------------------------------------------------------
; - car liefert den Kopf der Liste, also das erste Element
; - cdr liefert den Körper der Liste, also die Liste aller Elemente außer dem ersten

(car (cons 'x 'xs)) ; --> 'x
(cdr (cons 'x 'xs)) ; --> 'xs
;(car '()) ; --> Fehler
;(cdr '()) ; --> Fehler
(cons (car '(erstens zweitens)) (cdr '(erstens zweitens))) ; --> '(erstens zweitens)
(caar '((erstens zweitens) drittens)) ; = (car (car '((erstens zweitens) drittens)))
;(cdadaadr xs) = (cdr (car (cdr (car (car (cdr xs))))))