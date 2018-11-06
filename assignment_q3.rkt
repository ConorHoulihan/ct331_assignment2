#lang racket

(define tree '(((() 2 ()) 4 (() 6 ())) 8 ((() 10 ()) 12 (() 14 ()))))
(define to_Sort '(7 3 9 11 15 1 5 13))

(define (left_sub node)
  (car node))

(define (right_sub node)
  (caddr node))

(define (val node)
  (cadr node))

;A
(define (sort_tree node)
 (begin(cond [(not (empty?(left_sub node))) (sort_tree (left_sub node))])
   (printf "~a " (val node))
   (cond [(not (empty?(right_sub node))) (sort_tree (right_sub node))])))

;B
(define (search el node)
(cond
  [(empty? node) #f]  [(equal? el (val node)) #t]
  [(< el (val node)) (search el (left_sub node))]
  [else (search el (right_sub node))]))

;C
(define (add_item el node)
  (higher_order_add_item el node <)
  )

;D
(define (add_list list node)
  (if (empty? list) node
      (add_list (cdr list) (add_item (car list) node))))

(define (higher_order_add_list list node left)
  (if (empty? list) node
      (higher_order_add_list (cdr list) (higher_order_add_item (car list) node left) left)))

;E
(define (tree_sort list)
  (sort_tree (add_list list '())))

(define (higher_order_tree_sort list orderFunc)
  (sort_tree (higher_order_add_list list '() orderFunc)))

;F
(define (higher_order_add_item item node left)
  (cond [(empty? node) (list '() item '())] [(equal? item (val node)) node]
        [(left item (val node)) (list (higher_order_add_item item (left_sub node) left) (val node) (right_sub node))]
        [else (list (left_sub node) (val node) (higher_order_add_item item (right_sub node) left))]))


(define (ascending_last_digit a b)
  (< (remainder a 13) (remainder b 13)))

(display "A:\n")
(sort_tree tree)

(display "\nB:\n")
(search 2 tree)
(search 1 tree)

(display "C:\n")
(add_item 16 tree)

(display "D:\n")
(add_list '(1 3 5 7 9) tree)

(display "E:\n")
(tree_sort to_Sort)

(display "\nF:\n")
(display "Ascending:\n")
(higher_order_tree_sort to_Sort <)

(display "\nDescending:\n")
(higher_order_tree_sort to_Sort >)

(display "\nAscending based on last digit(almost):\n")
(higher_order_tree_sort to_Sort ascending_last_digit)