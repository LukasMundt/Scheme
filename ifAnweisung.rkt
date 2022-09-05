#lang racket

(define
  (kleinerer a b)
  (if
   (< a b)
   a
   (b)
   )
  )

(kleinerer 17 23)
