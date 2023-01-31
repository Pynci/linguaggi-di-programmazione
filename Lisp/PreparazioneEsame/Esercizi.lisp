
(defun pos-min (lista)
  (if (= (length lista) 1)
      0
      (if (<= (first lista) (minimo (rest lista)))
          (pos-min (rest lista))
          (1+ (pos-min (rest lista))))))
(defun minimo (lista)
  (cond ((= (length lista) 1) (first lista))
        (T
          (let ((valore-min (minimo (rest lista))))
            (if (<= (first lista) valore-min)
                (first lista)
                valore-min)))))

(defun foldRight (operazione lista)
  (if (null (rest lista))
      (first lista)
      (funcall operazione (first lista) (foldRight operazione (rest lista)))))

(defun inverti (lista)
  (cond ((null lista) NIL)
        ((atom lista) lista)
        (T (append (inverti (rest lista)) (list (first lista))))))