; 「Scheme手習い」での lat? の定義
(define lat?
 (lambda (l)
  (cond
   ((null? l) #t)
   ((atom? (car l)) (lat? (cdr l)))
   (else #f))))
   
