(defun per-due (x)
    (* 2 x))

(defun doppi-dispari (lista)
    (cond ((null lista) NIL)
          ((atom lista)
            (if (numberp lista)
                (if (oddp lista)
                    (per-due lista)
                    lista)
                lista))
          (T
            (append (list (doppi-dispari (first lista)))
                    (doppi-dispari (rest lista))))))

(defun mistery (f list)
    (cond ((null list) NIL)
          ((null (rest list)) (list (funcall f (first list))))
          (T (append (list (funcall f (first list)))
                     (list (second list))
                     (mistery f (rest (rest list)))))))

(defun somma-el (lista acc)
    (if (null lista)
        acc
        (somma-el (rest lista) (+ acc (first lista)))))

(defun inverti (lista)
    (cond ((null lista) NIL)
          ((atom lista) lista)
          (T (append (inverti (rest lista)) (list (inverti (first lista)))))))