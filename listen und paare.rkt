#lang racket

;Konstruktion von Listen

'(1 2 3)
;--> '(1 2 3)


(list 1 'Bus (* 2 21) '(1 2)) ; --> '(1 Bus 42 (1 2))


(length '(12 62 3 42)) ;--> 4


(null? '(1 3)) ;--> #f

(null? '()) ;--> #t

(append '(1 2) '(3 4) '(5 6)) ; --> '(1 2 3 4 5 6) Größe der beiden übergebenen Listen hat keine Obergrenze

(define xs '(1 2 3 a 4))
;member ist ein Prädikat
(member 5 xs) ;--> #f da 5 nicht in der Liste xs enthalten ist wird die Funktion zu false ausgewertet
(member 'a xs) ;--> '(a 4)
(if (member 'a xs) 'a '()) ; --> a
(member '(1 2) '(1 2 3))
(member '(1 2) '(1 (1 2) 3)) ; --> '((1 2) 3)

(if (member 'b xs) xs (append xs (list 'b))) ; --> '(1 2 3 a 4 b)
; wenn das Element b in der Liste xs vorliegt, dann wird die Liste xs zurückgegeben. Ansonsten wird ihr das Element b hinzugefügt und die Liste dann
; mit dem Element b zurückgegeben


;"cons" fügt am Anfang einer Liste ein Element ein
(cons 1 '()) ;--> '(1)
(cons 1 (cons 1 '())) ; --> '(1 1)


;Paare ------------------------------------------------------------------------------------------
(cons 'x 'y) ; --> '(x . y) !!! Der Punkt ist hier ein *Infixoperator*.
(pair? '(x . y)) ; --> #t

(pair? '(1 2 3 4))

(pair? (cons '(1 2) 'a)) ; --> #t
(list? (cons '(1 2) 'a)) ; --> #f

(pair? (cons 'a '(1 2))) ; --> #t
(list? (cons 'a '(1 2))) ; --> #t
; Jede Liste ist ein Paar, aber nicht jedes Paar ist eine Liste.