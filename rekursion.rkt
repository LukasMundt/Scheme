#lang racket

; Rekursion
(define
 (ungerade-bis wert) ;Name der Funktion ist ungenau, sie fügt lediglich den Anfangswert und ab da jede zweite Zahl abwärts einer Liste hinzu.
  ; Die Untergrenze ist erreicht, wenn der Parameter wert unter 1 sinkt, dann ruft sich die Funktion nicht selbst wieder auf, es wird lediglich eine
  ; leere Liste zurückgegeben.
 (cond
 ((< wert 1) '())
 (else
 (cons wert (ungerade-bis (- wert 2))))))

(ungerade-bis 13) ; --> '(13 11 9 7 5 3 1)
(ungerade-bis 14) ; --> '(14 12 10 8 6 4 2)
; Soll die Liste umgedreht werden muss lediglich die Funktion (reverse '(13 11 9 7 5 3 1)) --> '(1 3 5 7 9 11 13) mit der
; entsprechenden Liste aufgerufen werden

; ----------------------
; Endrekursion
(define
 (ungerade wert liste)
 (if
 (< wert 1)
 liste ; Liste wird zurückgegeben, wenn der Parameter wert unter 1 liegt.
 (ungerade (- wert 2) (cons wert liste)))) ; Wenn der Parameter wert nicht unter 1 liegt ruft die Funktion sich selbst mit dem um 2 reduzierten
; wert auf. Außerdem wird in den Parametern die liste übergeben, welcher der aktuelle wert hinzugefügt wird.
(ungerade 13 '()) ; --> '(1 3 5 7 9 11 13)
(ungerade 14 '()) ; --> '((2 4 6 8 10 12 14)