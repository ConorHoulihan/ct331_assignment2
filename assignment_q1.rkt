#lang racket
;i
(cons 1 2)
;ii
(cons 1 '(2 3))
;iii
(cons "String" '(0 (1 2 3)))
;iv
(list "String" 0 '(1 2 3))
;iv
(append '("String") '(0) '((1 2 3)))