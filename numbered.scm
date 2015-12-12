(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define expt
  (lambda (n m)
    (cond
     ((eq? m 0) 1)
     (else
      (* n (expt n (- m 1)))))))


(define numbered?
  (lambda (aexp)
    (cond
     ((atom? aexp) (number? aexp))
     ((eq? (car (cdr aexp)) (quote +))
      (and (numbered? (car aexp))
	   (numbered? (car (cdr (cdr aexp))))))
     ((eq? (car (cdr aexp)) (quote *))
      (and (numbered? (car aexp))
	   (numbered? (car (cdr (cdr aexp))))))
     ((eq? (car (cdr aexp)) (quote expt))
      (and (numbered? (cra aexp))
	   (numbered? (car (cdr (cdr aexp)))))))))

(define numbered?
  (lambda (aexp)
    (cond
     ((atom? aexp) (number? aexp))
     (else
      (and (numbered? (car aexp))
	   (numbered? (car (cdr (cdr aexp)))))))))
