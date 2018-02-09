(xmember '1 '(1))
(xmember '1 '( (1) 2 3))
(xmember '(1) '((1) 2 3))
(xmember nil nil)
(xmember nil '(nil))
(xmember nil '((nil)))
(xmember '(nil) '(1 2 3 (nil)))
(xmember '(nil) '(nil))


(flatten '(a (b c) d))
(flatten '((((a))))) 
(flatten '(a (b c) (d ((e)) f)))


(remove-duplicate '(a b c a d b))


(mix '(a b c) '(d e f))
;(a d b e c f)

(mix '(1 2 3) '(a))
;(1 a 2 3)

(mix '((a) (b c)) '(d e f g h)) 
;((a) d (b c) e f g h)

(mix '(1 2 3) nil)
;(1 2 3)

(mix '(1 2 3) '(nil))
;(1 nil 2 3)




(load "1394136.lisp")