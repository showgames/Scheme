(define subst
  (lambda (new old lat)
    (cond
     ((null? lat) (quote ()))
     (else (cond
	    ((eq? (car lat) old)
	     (cons new (cdr lat)))
	    (else (cons (car lat)
			(subst new old
			       (cdr lat)))))))))


(define subst2
  (lambda (new o1 o2 lat)
    (cond
     ((null? lat) (quote ()))
     (else (cond
	    ((or (eq? (car lat) o1) (eq? (car lat) o2))
	     (cons new (cdr lat)))
	    (else (cons (car lat)
			(subst2 new o1 o2
				(cdr lat)))))))))

