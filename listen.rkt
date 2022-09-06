#lang racket

(define
 (erstes liste)
 (car liste) ;Das erste Element der Liste wird zurückgegeben.
 )
(erstes '(1 2 3 4))

(define
 (rest liste)
 (cdr liste) ;Alle Elemente nach dem 1. Element werden in einer Liste zurückgegeben.
 )
(rest '(1 2 3 4))

(define
 (zweites liste)
  ;Durch die Schachtelung wird zunächst eine Liste von allen
  ;Elementen nach dem ersten erzeugt, aus dieser Liste wird das erste Element zurückgegeben.
 (car (cdr liste))
 )
(zweites '(1 2 3 4))

(define
 (zweitesKurz liste)
  ;Durch die Schachtelung wird zunächst eine Liste von allen
  ;Elementen nach dem ersten erzeugt, aus dieser Liste wird das erste Element zurückgegeben.
 (car (cdr liste))
 )
(zweitesKurz '(1 2 3 4))

(define
 (drittes liste)
 (car (cdr (cdr liste))) ;Funktionsweise wie in der Funktion zweites
 )
(drittes '(1 2 3 4))

; Kurzschreibweise
(define
 (drittesKurz liste)
 (car (cddr liste)) ;Funktionsweise wie in der Funktion drittes, Kurzschreibweise wurde genutzt
 )
(drittesKurz '(1 2 3 4))

(define
 (viertesKurz liste)
 (car (cdddr liste)) ;Funktionsweise wie in der Funktion drittes, Kurzschreibweise wurde genutzt
 )
(viertesKurz '(1 2 3 4))

(define
  (gibVier)
(cadadr '((1 2) (3 4) (5 6 7)))
  ; Abarbeitung von hinten
  ; (cdr '((1 2) (3 4) (5 6 7))) --> '((3 4) (5 6 7))
  ; (car '((3 4) (5 6 7))) --> '(3 4)
  ; (cdr '(3 4)) --> '(4)
  ; (car '(4) --> 4
  )
(gibVier)