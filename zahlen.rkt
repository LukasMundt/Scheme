#lang racket

(define
 (alle-ohne filter? liste) ;Durch diese Funktion werden alle dem Filter entsprechenden Werte der Liste entfernt.
 (cond
 ((null? liste) liste) ;Wenn die übergebene Liste null also leer ist wird diese leere Liste zurückgegeben.
 ((filter? (car liste)) ;Ansonsten wird das erste Element der übergebenen Liste mit dem in den Parametern übergebenen filter überprüft, wenn
  ; diese Prüfung #t zum Ergebnis hat, dann ruft sich die Funktion selbst mit einer um das erste Element reduzierte Liste und dem Filter auf.
 (alle-ohne filter? (cdr liste)))
 (else
 (cons (car liste) (alle-ohne filter? (cdr liste)))))) ; Treffen die obigen Bedingungen nicht zu, dann wird das erste Element der Liste mit
; der durch die eigene Funktion zurückgegebenen Liste kombiniert. Die eigene funktion ruft sich hier mit dem in dem in den Parametern übergebenen
; Filter auf und mit der um das erste Element der Liste reduzierten Liste.

(alle-ohne even? '(654 4 345 36 -16 43 413 543 54 35 32 632 632 -1111))
; --> '(345 43 413 543 35 -1111)

(define (keine-zahl? par) (not (number? par))) ;Es wird der Ausdruck keine-zahl? definiert, um unten in den Parametern nicht (not (number? par)) zu schreiben
(define (nicht-ganzzahlig? par) (not (integer? par)))
(define (nicht-positiv? par) (not (positive? par)))
(alle-ohne even?
 (alle-ohne nicht-positiv?
            (alle-ohne nicht-ganzzahlig?
                       (alle-ohne keine-zahl? '(hund 2 -1 33 2.4 katze 9)))))
; --> '(33 9)


(exact? 3.5) ; --> #f
(inexact? 3.5) ; --> #t
(exact? 7) ; --> #t
(inexact? 7) ; --> #f
(exact? (/ 7 2)) ; --> #t Achtung!!!
(inexact? (exact->inexact (/ 7 2))) ; --> #t