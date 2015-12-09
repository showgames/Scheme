(define atom?
  (lambda (x)
    (and (not (pair x)) (not (null? x)))))


(define occur*
  (lambda (a l)
    (cond
     ((null? l) 0)
     ((atom? (car l))
      (cond
       ((eq? (car l) a)
	(+ 1 (occur* a (cdr l))))
       (else
	(occur* a (cdr l)))))
     (else
      (+ (occur* a (car l))
	 (occur* a (cdr l)))))))


(define subst*
  (lambda (new old l)
    (cond
     ((null? l) (quote ()))
     ((atom? (car l))
      (cond
       ((eq? (car l) old)
	(cons new (subst* new old (cdr l))))
       (else
	(cons (car l)
	      (subst* new old (cdr l))))))
     (else (cons (subst* new old (car l))
		 (subst* new old (cdr l)))))))

