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

(define
  (kleinerer a b)
  (if
   (< a b)
   a
   (b)
   )
  )

(kleinerer 17 23)

(mittelwert 17 23)