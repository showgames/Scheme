(define multirember
  (lambda (a lat)
    (cond
     ((null? lat) (quote ()))
     (else
      (cond
       ((eq? (car lat) a)
	(multirember a (cdr lat)))
       (else
	(cons (car lat)
	      (multirember a (cdr lat)))))))))


(define multiinsertR
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     (else
      (cond
       ((eq? (car lat) old)
	(cons (car lat)
	      (cons new
		    (multiinsertR new old
				  (cdr lat)))))
       (else (cons (car lat)
		   (multiinsertR new old
				 (cdr lat)))))))))

(define multiinsertL
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     (else
      (cond
       ((eq? (car lat) old)
	(cons new
	      (cons old
		    (multiinsertL new old
				  (cdr lat)))))
       (else (cons (car lat)
		   (multiinsertL new old
				 (cdr lat)))))))))

(define multisubst
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     (else
      (cond
       ((eq? (car lat) old)
	(cons new
	      (multisubst new old
			  (cdr lat))))
       (else (cons (car lat)
		   (multisubst new old
			       (cdr lat)))))))))
