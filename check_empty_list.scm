; 引数として渡されたリストが空リストかどうか調べる
; 以下はすべてtrueが返ってくる

(null? ())
(null? (quote ())) ; (quote ())は空リストの表し方のひとつ
(null? '())
