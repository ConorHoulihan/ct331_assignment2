#lang racket

(provide ins_beg)
(provide ins_end)
(provide cout_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_deep)

;A
(define (ins_beg el iList)
  (append (list el) iList)
  )

;B
(define (ins_end el iList)
  (append  iList (list el))
  )

;C
(define (cout_top_level iList)
  (length iList)
  )

;D
(define (count_instances el iList)
  (c_instances el iList 0)
  )

(define (c_instances el iList total)
  (cond ((null? iList)total)
  
  [(equal? el (car iList)) (c_instances el (cdr iList) (+ 1 total))]
  [else (c_instances el (cdr iList) total)]
  ))

;E
(define (count_instances_tr el iList)
  (cond ((null? iList)0)
    [(equal? el (car iList)) (+ 1 (count_instances_tr el (cdr iList)))]
    [else (count_instances_tr el(cdr iList)) ]
  ))

;F
(define (count_instances_deep el iList)
  (c_instances_deep el iList 0)
  )

(define (c_instances_deep el iList total)
   (cond [(empty? iList) total]; 
    
    [(list? (car iList))(c_instances_deep el (cdr iList) (c_instances el (car iList) total))]
    [(equal? el(car iList)) (c_instances_deep el (cdr iList) (+ 1 total))]
    [else (c_instances_deep el(cdr iList) total) ]
  ))



(ins_beg 'a '(b c d)) ;A1
(ins_beg '(a b) '(b c d)) ;A2
(ins_end 'a '(b c d)) ;B1
(ins_end '(a b) '(b c d)) ;B2
(cout_top_level '(1 2 3 4 (6 7 8))) ;C
(count_instances 3 '(1 2 3 3 3)) ;D
(count_instances_tr 2 '(1 2 2 3 4)) ;E
(count_instances_deep 4 '(1 2 4 (4 4 4 5)) ) ;F