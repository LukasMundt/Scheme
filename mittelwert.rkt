#lang racket

(define
(mittelwert a b)
(display "Mittelwert von ")
(display a)
(display " UND ")
(display b)
(display " ist :")
(/ (+ a b) 2) ;Die letzte Zeile einer Funktion wird durch die Funktion zurückgegeben.
)


(mittelwert 17 23)
