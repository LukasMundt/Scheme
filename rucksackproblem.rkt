#lang racket

; Diese Funktion gibt den Wert eines Elements zurück.
(define (gibWert element)
  (car element)
  )

; Diese Funktion gibt die Groesse eines Elements zurück.
(define (gibGroesse element)
  (cadr element)
  )

; Diese Funktion gibt die die Summe der Größe von allen Elementen in einer Liste/
; Kiste zurück.
(define (gibListengroesse liste [summe 0])
  (cond
    ((empty? liste) summe)
    (else
     (gibListengroesse (cdr liste) (+ (gibGroesse (car liste)) summe))
     )
    )
  )

; Diese Funktion gibt die die Summe des Werts von allen Elementen in einer
; Liste/ Kiste zurück.
(define (gibListenwert liste [summe 0])
  (cond
    ((empty? liste) summe)
    (else
     (gibListenwert (cdr liste) (+ (gibWert (car liste)) summe))
     )
    )
  )

; Dieses Prädikat gibt einen Wahrheitswert zurück, ob ein Element eine Größe hat, die
; gleich/ geringer als eine angegebene Größe ist.
(define (passtElement? element maxGroesse)
  (<= (gibGroesse element) maxGroesse)
  )

; Diese Funktion gibt ein Element zurück, wenn es gleich oder kleiner als die maximale
; Größe ist.
(define (wennPasstDannElement element maxGroesse [liste '()])
  (cond
    ((passtElement? element maxGroesse)
     (wennPasstDannElement element
                           (- maxGroesse (gibGroesse element))
                           (append liste (list element))
                           )
     )
    (else liste)
    )
  )

; Diese Funktion gibt eine Liste zurück mit Kisten, wobei die letzte Liste in der Liste
; die Größe der 'kistengroesse' hat. Alle Kisten werden zunächst mit dem kleinsten der
; Elemente in der Elementenliste befüllt.
(define (fuelleListe kistengroesse elementenliste [liste '()])
  (cond
    ((< (length liste) kistengroesse)
     (fuelleListe kistengroesse elementenliste
                  (append liste
                          (list (wennPasstDannElement (car elementenliste) (length liste))))
                  )
     )
    ((= (- (length liste) 1) kistengroesse)
     (fuelleListe kistengroesse (cdr elementenliste) elementenliste))
    (else liste)
    )
  )

; Diese Funktion überprüft, ob eine Kiste mit einem gegebenen Element ggf. wertvoller
; bei besserer oder gleicher Ausnutzung der Groesse sein kann. Ist das der Fall wird
; die optimierte Liste zurückgegeben, ansonsten die ursprüngliche Liste.
(define (optimiereKiste ausgangsliste element liste [maxlaenge 0] [result '()] )
  (cond
    ; Wenn keine bessere Option gefunden wurde und die Liste an Kisten leer ist
    ((and (empty? liste) (empty? result)) ausgangsliste)
    ; Wenn die Liste an Kisten leer ist, jedoch eine bessere Option gefunden wurde
    ; wird diese zurückgegeben
    ((empty? liste) result)
    ; Wenn eine bessere Option gefunden ist, ruft sich die Funktion selbst auf mit
    ; dieser als Parameter und sucht nach einer noch besseren Option
    (
     (and
      (and
       (< (gibListenwert ausgangsliste) (gibListenwert (append (car liste) (list element))))
       (< (gibListenwert result) (gibListenwert (append (car liste) (list element))))
       )
      (<= (gibListengroesse (append(car liste) (list element))) maxlaenge)
      )
     (optimiereKiste ausgangsliste
                     element
                     (cdr liste)
                     maxlaenge
                     (append (car liste) (list element))
                     ))
    ; Wenn die aktuelle Kiste in der Liste an Kisten die maximale Länge der zu optimierenden
    ; Kiste übersteigt wird die Rekursion abgebrochen. Das geschieht hier nicht direkt
    ; sondern durch einen Aufruf der eigenen Funktion mit einer leeren Liste von Kisten was
    ; zur Rückgabe eines Wertes führt.
    ((> (gibListengroesse (car liste)) maxlaenge)
     (optimiereKiste ausgangsliste element '() maxlaenge result))
    (else (optimiereKiste ausgangsliste element (cdr liste) maxlaenge result))
    )
  )

; Diese Funktion optimiert mit der 'optimiereKiste'-Funktion eine Optimierung jeder Kiste
; mit einem gegebenen Element durch, sofern dies möglich ist. Es wird eine optimierte Liste
; von Kisten zurückgegeben.
(define (optimiereKistenliste liste element [laenge 0] [result '()])
  (cond
    ((empty? liste) result)
    (else
     (optimiereKistenliste (cdr liste)
                           element
                           (+ laenge 1)
                           (append result
                                   (list (optimiereKiste (car liste)
                                                         element
                                                         (append result liste)
                                                         laenge))))
     )
    )
  )

; Diese Funktion führt die Optimierung der Kistenliste der Reihe nach mit allen in der
; Elementenliste gegebenen Elementen durch.
(define (optimiere elementenliste kistenliste)
  (cond
    ; Abbruchbedingung
    ((empty? elementenliste) kistenliste)
    (else
     (optimiere (cdr elementenliste) (optimiereKistenliste kistenliste (car elementenliste)))
     )
    )
  )

; Diese Funktion ist die Aufruffunktion. Es wird zunächst eine Kistenliste erzeugt, bei der
; die Kisten so gut wie möglich mit dem kleinsten Element in der Elementenliste gefüllt
; sind (fuelleListe-Funktion). Diese Liste wird dann der Reihe nach mit allen Elementen
; aus der Elementenliste optimiert bis die optimale Lösung erreicht ist.
(define (aufruffunktion kistengroesse elementenliste)
  (car (reverse (optimiere elementenliste (fuelleListe (+ kistengroesse 1) elementenliste))))
  )

; Format von Elementen in der folgenden Liste: (Wert Größe Name)
(define elementenliste '((7 2 Diamant) (11 3 Ring) (16 4 Muenze) (24 5 Kompass)
                                       (32 7 Vase) (36 8 Krone) (43 9 Waage)))

;(aufruffunktion 13 elementenliste)