#lang racket

(define liste '(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z))

(define (pos-symbol symbol liste)
  (cond
    [(null? liste) #f] ; Wenn die Liste leer ist wird false zurückgegben
    [(equal? symbol (car liste)) 0] ; Wenn der gesuchte Buchstabe/ das
    ; gesuchte Symbol gefunden wurde wird 0 zurückgegeben.
    [else (+ 1 (pos-symbol symbol (cdr liste)))] ;andernfalls ruft sich die
    ; Funktion selbst wieder auf. Für jede durchgegangene Stelle wird am Ende
    ; 1 addiert.
    ))

(define (symbol-pos index liste)
  (cond
    [(null? liste) #f]
    [(equal? index 0) (car liste)]
    [else (symbol-pos (- index 1) (cdr liste))]))

(define (fkt schluessel liste symbol)
  (symbol-pos (modulo (+ schluessel (pos-symbol symbol liste)) (length liste)) liste))
; (fkt 2 liste 'A)
; (modulo 2 2)

(define (caesar schluessel liste text)
  (cond
    ; ((null? text) "")
    [(= (string-length text) 1)
     (string-append (symbol->string
                     (fkt schluessel liste (string->symbol (string-upcase (substring text 0 1))))))]
    ; ((equal? (substring text 1 1) " ") (string-append "" (caesar schluessel liste (substring text 1))))
    [else
     (string-append
      (symbol->string (fkt schluessel liste (string->symbol (string-upcase (substring text 0 1)))))
      (caesar schluessel liste (substring text 1)))]))
; (fkt 2 liste (string->symbol (string-upcase (substring "H" 1 1))))
; (substring "Ha" 0 1)

(caesar 0 liste "Hallo")
; (symbol-pos 25 liste)
; (pos-symbol 'Z liste)
