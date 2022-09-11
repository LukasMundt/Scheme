#lang racket

; 1. Aufgabe
(define
  (eins a b)
  (+ a b)
  )
(eins 1 4)


; 2. Aufgabe
(define
  (zwei liste)
  (if
   (null? liste) 0
  (+ (car liste) (zwei (cdr liste)))
  ))
(zwei '(1 4 3 6)) ; --> 14


; 3. Aufgabe
(/ (+ (* 1 4) (* 5 6)) (* (+ 3 4) (+ 5 6))) ;Aufgabe 3 --> 34/77


; Aufgabe: Zinsrechnung
(define
  (zinsen-berechnen summe zinssatz)
  (* summe (+ 1 (/ zinssatz 100)))
)

(zinsen-berechnen 2000 4) ; --> 2080

; Bogenmaß und Gradmaß
(define
  (degree-to-rad degree)
  (/ degree (/ 180 pi))
  )

(define
  (rad-to-degree rad)
  (* rad (/ 180 pi))
  )

; Aufgabe: Kilometer und Seemeilen
(define
  (seemeilen-zu-km seemeilen)
  (* seemeilen 1.852)
  )
(seemeilen-zu-km 2)

(define
  (km-zu-seemeilen km)
  (/ km 1.852)
  )

; Aufgabe: Himmelsrichtungen
(define
  (grad-zu-himmelsrichtung grad) ; Wenn man hier noch mit Modulo arbeitet kann man auch Werte über 360 umwandeln
  ; Aufwendige Schreibweise, man kann auch einfach den Bereich um Norden definieren und dann immer mit, wenn kleiner als ... hochgehen
  ; (cond [(or (>= g 348.75) (< g 11.25)) 'N) 
  ; ((< g 33.75) 'NNO)
  ; ((< g 56.25) ‚NO)
  ; ...
  (cond
    ((= grad 0) 'N)
    ((and (< grad 45) (> grad 0)) 'NNE)
    ((= grad 45) 'NE)
    ((and (< grad 90) (> grad 45)) 'ENE)
    ((= grad 90) 'E)
    ((and (< grad 135) (> grad 90)) 'ESE)
    ((= grad 135) 'SE)
    ((and (< grad 180) (> grad 135)) 'SSE)
    ((= grad 180) 'S)
    ((and (< grad 225) (> grad 180)) 'SSW)
    ((= grad 225) 'SW)
    ((and (< grad 270) (> grad 225)) 'WSW)
    ((= grad 270) 'W)
    ((and (< grad 315) (> grad 270)) 'WNW)
    ((= grad 315) 'NW)
    ((and (< grad 360) (> grad 315)) 'NNW)
    ((= grad 360) 'N)
    ) ;cond wird beendet
  )

(define
  (himmelsrichtung-zu-grad h)
  (cond
    ((equal? h 'N) 0)
    ((equal? h 'NNO) 22.5)
 ((equal? h 'NO) 45)
 ((equal? h 'ONO) 67.5)
 ((equal? h 'O) 90)
 ((equal? h 'OSO) 112.5)
 ((equal? h 'SO) 135)
 ((equal? h 'SSO) 157.5)
 ((equal? h 'S) 180)
 ((equal? h 'SSW) 202.5)
 ((equal? h 'SW) 225)
 ((equal? h 'WSW) 247.5)
 ((equal? h 'W) 270)
 ((equal? h 'WNW) 292.5)
 ((equal? h 'NW) 315)
 ((equal? h 'NNW) 337.5) ) )
