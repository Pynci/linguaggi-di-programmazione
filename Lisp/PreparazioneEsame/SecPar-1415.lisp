(defun nopred (predicato lista)
  (cond ((null lista)
          NIL)
        ((atom lista)
          (if (funcall predicato lista)
              NIL
              lista))
        (T
          (append (list (nopred predicato (first lista))) (nopred predicato (rest lista))))))

(defun what (e n list)
  (cond ((zerop n) (cons e list))
        ((null list) (list e))
        (T (cons (car list) (what e (- n 1) (rest list))))))

(defun quadrato (x)
    (* x x))

(defun f-let (x y)
  (let* ((a (* (+ (* 2 x y)) 42))
        (b (+ 2 a)))
    (+ (* a (quadrato x))
       (+ b y)
       (* a b))))

(defun f-lambda (x y)
  ((lambda (a b)
      (+ (* a (quadrato x))
         (+ b y)
         (* a b)))
    (* (+ (* 2 x y)) 42)
    (+ 2 (* (+ (* 2 x y)) 42))))

(defun somma-elem (lista accumulatore)
  (if (null lista)
      accumulatore
      (somma-elem (rest lista) (+ (first lista) accumulatore))))

(defun appartiene (elemento lista)
  (cond ((null lista) NIL)
        ((eql (first lista) elemento) T)
        (T (appartiene elemento (rest lista)))))