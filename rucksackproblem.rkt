#lang racket
; (Wert Größe Name)
(define ausgangsliste '((7 2 Diamant) (11 3 Ring) (16 4 Muenze) (24 5 Kompass) (32 7 Vase) (36 8 Krone) (43 9 Waage)))


(define (gibWert element)
(car element)
)

(define (gibGroesse element)
(cadr element)
)

(define (gibSummeVonListe liste [summe 0])
(cond
((empty? liste) summe)
(else
(gibSummeVonListe (cdr liste) (+ (gibGroesse (car liste)) summe))
)
)
)

(define (passtElement? element maxGroesse)
(<= (gibGroesse element) maxGroesse)
)

(define (wennPasstDannElement element maxGroesse [liste '()])
(cond
((passtElement? element maxGroesse) (wennPasstDannElement element (- maxGroesse (gibGroesse element)) (append liste (list element))))
(else liste)
)
)

(define (fuelleListe kistengroesse elementenliste [liste '()])
    (cond
    ; ((< (gibSummeVonListe liste) kistengroesse) (fuelleListe kistengroesse (liste)))
    ((< (length liste) kistengroesse) (fuelleListe kistengroesse elementenliste (append liste (list (wennPasstDannElement (car elementenliste) (length liste))))))
    ((= (- (length liste) 1) kistengroesse) (fuelleListe kistengroesse (cdr elementenliste) elementenliste))
    (else liste)
    )
)
(fuelleListe 7 ausgangsliste)










; (wennPasstDannElement '(7 2 Diamant) 1)