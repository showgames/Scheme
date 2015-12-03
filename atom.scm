; 「Scheme手習い」でのatom?の定義
(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

