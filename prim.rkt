#lang racket

(define
       
List.list '((H G F E D C B A)
 ((G H 5) (F H 6) (C H 8) (B H 3) (B G 5) (F G 8) (E F 10)
 (D E 3) (C E 4) (C D 6) (B C 10) (A B 10)(M G 11))))

; Ein Graph mit Knoten und Kanten wird definiert
 (define ausgangsgraph0 '(
    (Z S D B M G)
    ((S D 2)(D B 5)(D M 3)(M Z 2)(B Z 7)(M G 11))
 ))

(define
 (minimal-spanning-tree graph)
  (prim ; Funktion Prim wird aufgerufen
 (list (list (first (first graph))) '()) ; Bei dem Aufruf der Prim-Funktion wird der erste Knoten in der Knotenliste des Graphen als Startknoten in die Knotenliste des Teilbaums eingefügt.
 (fuege-alle-kanten-ein
 (alle-nachfolger (first (first graph)) (second graph))
 '())
 graph))

; Die Prim-Funktion wird hier definiert.
(define
 (prim teilbaum priows graph)
  (cond
 [(alle-enthalten? teilbaum graph) teilbaum] ; prüft, ob der Teilbaum bereits alle Knoten beinhaltet, gibt bei Wahrheit dieser Bedingung den Teilbaum zurück
 [(zyklus? (first priows) teilbaum) ;prüft, ob ein Kreis/Zyklus entsteht, wenn ja wird die Prim-Funktion aufgerufen ohne, dass der behandelte Pfad dem Teilbaum hinzugefügt wurde
 (prim teilbaum (rest priows) graph)] 
 [else ; Wenn die anderen Bedingungen nicht erfüllt sind wird hier die Prim-Funktion aufgerufen. Dem Teilbaum wird dabei der aktuell behandelte Graph hinzugefügt
 (prim
 (nimm-auf (first priows) teilbaum)
 (alle-nachfolger-in-priows teilbaum priows graph)
 graph)]))
 
 ; Diese Funktion gibt alle "Blätter"/Nachfahren eines Knoten zurück
 (define
 (alle-nachfolger ecke kanten)
 (cond
 [(null? kanten) '()] ; wenn die Liste der Kanten leer ist wird eine leere Liste zurückgegeben
 [(equal? ecke (first (first kanten)))
 (cons (first kanten) (alle-nachfolger ecke (rest kanten)))] ; wenn der erste Knoten der ersten Kante der Liste an Kanten der übergebene Knoten ist, wird diese Kante kombiniert mit dem Ergebnis des Aufrufs der eigenen Funktion mit allen Kanten ab der ersten Kante
 [(equal? ecke (second (first kanten)))
 (cons (first kanten) (alle-nachfolger ecke (rest kanten)))] ; wenn der zweite Knoten der ersten Kante der Liste an Kanten der übergebene Knoten ist, wird diese Kante kombiniert mit dem Ergebnis des Aufrufs der eigenen Funktion mit allen Kanten ab der ersten Kante
 [else
 (alle-nachfolger ecke (rest kanten))])) ; wenn in der erste Kante der übergebene Knoten nicht enthalten ist, also die obigen Bedingungen nicht erfüllt sind wird die Funktions selbst wieder aufgerufen mit allen Kanten nach der ersten Kante

;;; ===== fuege-eine-kante-ein =====
; benötigt ein Praedikat vor?
; Dieses Prädikat prüft, ob das Gewicht von der ersten Kante geringer ist als das der zweiten Kante.
(define
 (vor? kante-1 kante-2)
 (< (third kante-1) (third kante-2)))

; Sortiert eine Kante in die priows-Liste ein und gibt die entsprechende Liste zurück.
(define
 (fuege-eine-kante-ein eine-kante priows)
 (cond
 [(null? priows) (list eine-kante)] ; wenn die priows-Liste leer ist wird die übergebene Kante zurückgegeben
 [(vor? eine-kante (first priows)) ; wenn die erste Kante vor der ersten Kante der priows-Liste ist wird die Kante zu Beginn der priows-Liste eingefügt
 (cons eine-kante priows)]
 [else
 (cons
 (first priows)
 (fuege-eine-kante-ein eine-kante (rest priows)))]))
; wird verwendet von:

(define
 (fuege-alle-kanten-ein die-kanten priows)
 (cond
 [(null? die-kanten) priows]
 [else
 (fuege-alle-kanten-ein
 (rest die-kanten)
 (fuege-eine-kante-ein (first die-kanten) priows))]))

; Dieses Prädikat prüft, ob alle Knoten des Graphen im Teilbaum enthalten sind, indem die Länge der beiden Knotenlisten verglichen wird.
(define
 (alle-enthalten? teilbaum graph)
 (= (length (first teilbaum)) (length (first graph))))

; Dieses Prädikat prüft, ob ein Zyklus im Teilbaum durch die übergebene Kante entsteht. Es dürfen nicht beide Knoten der Kante bereits in der Knotenliste des Teilbaums bereits enthalten sein.
(define 
 (zyklus? kante teilbaum)
 (and
 (member (first kante) (first teilbaum))
 (member (second kante) (first teilbaum))))

; Fügt der Liste an Knoten den Knoten der Kante hinzu, der noch nicht im Teilbaum enthalten ist. Außerdem wird die Kante der Liste an Kanten hinzugefügt.
(define
 (nimm-auf kante teilbaum)
 (list
 (cons (freie-ecke kante teilbaum) (first teilbaum))
 (cons kante (second teilbaum))))

(define
 (alle-nachfolger-in-priows teilbaum priows graph)
 (fuege-alle-kanten-ein
 (alle-nachfolger
 (freie-ecke (first priows) teilbaum)
 (second graph))
 (rest priows)))

; Diese Funktion gibt von einer Kante, von der einer der beiden Knoten in der Knotenliste des Teilbaums enthalten ist den jeweils anderen zurück.
(define
 (freie-ecke kante teilbaum)
 (if
 (member (first kante) (first teilbaum))
 (second kante)
 (first kante)))

 (minimal-spanning-tree List.list)
 (minimal-spanning-tree ausgangsgraph0) ; --> '((G B Z M D S) ((M G 11) (D B 5) (M Z 2) (D M 3) (S D 2)))