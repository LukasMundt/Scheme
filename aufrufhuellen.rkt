#lang racket

; Aufrufhülle mit einer lokalen Funktion (define ...)
(define
 (ungerade wert)
 (define ; In der Funktion wird eine weitere Funktion definiert
 (ungerade-intern wert liste)
 (if
 (< wert 1)
 liste ;Wenn wert unter 1 liegt wird die Liste zurückgegeben
 (ungerade-intern (- wert 2) (cons wert liste)))) ; Ansonsten ruft sich die interne Funktion mit einem um 2 verringerten wert und eine um den wert
  ; ergänzte Liste selbst wieder auf
 (cond
 ((not (number? wert))
 (error "Parameter " wert " ist keine Zahl!")) ;number? prüft, ob wert eine Zahl ist, wenn z.B. ein String übergeben wird wird ein Fehler zurückgegeben.
 ((not (integer? wert))
 (error "Parameter " wert " ist keine ganze Zahl!")) ;integer? prüft, ob wert ein Integer also nach bestehen der vorigen Bedingung auch eine ganze Zahl
 ; ist, wenn nicht wird ein Fehler zurückgegeben
 ((not (positive? wert)) (error "Parameter " wert " ist zu klein!")) ;positive? prüft, ob wert positiv ist und gibt andernfalls einen Fehler zurück
 ((even? wert) (error "Parameter " wert " ist gerade!")) ;even? testet, ob wert gerade ist, wenn ja wird der Fehler zurückgegeben
 (else
 (ungerade-intern wert '()))))


; Aufrufhülle mit einem named let
(define
 (ungerade wert)
 (cond
 ((not (number? wert))
 (error "Parameter " wert " ist keine Zahl!")) ;number? prüft, ob wert eine Zahl ist, wenn z.B. ein String übergeben wird wird ein Fehler zurückgegeben.
 ((not (integer? wert))
 (error "Parameter " wert " ist keine ganze Zahl!")) ;integer? prüft, ob wert ein Integer also nach bestehen der vorigen Bedingung auch eine ganze Zahl ...
 ; ... ist, wenn nicht wird ein Fehler zurückgegeben
 ((not (positive? wert)) (error "Parameter " wert " ist zu klein!"))
 ((even? wert) (error "Parameter " wert " ist gerade!"))
 (else
 (let ungerade-intern
 ((wert wert)
 (liste '()))
 (if
 (< wert 1)
 liste
 (ungerade-intern (- wert 2) (cons wert liste)))))))