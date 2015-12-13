(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define expt
  (lambda (n m)
    (cond
     ((eq? m 0) 1)
     (else
      (* n (expt n (- m 1)))))))

(define value
  (lambda (nexp)
    (cond
     ((atom? nexp) nexp)
     ((eq? (car (cdr nexp)) (quote +))
      (+ (value (car nexp))
	 (value (car (cdr (cdr nexp))))))
     ((eq? (car (cdr nexp)) (quote *))
      (* (value (car nexp))
	 (value (car (cdr (cdr nexp))))))
     (else
      (expt (value (car nexp))
	    (value (car (cdr (cdr nexp)))))))))
