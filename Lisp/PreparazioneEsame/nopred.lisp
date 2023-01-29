(defun nopred (predicato lista)
  (cond
    ((null (first lista))
      (nopred predicato (rest lista)))
    ((atom (first lista))
      (if (funcall predicato (first lista))
          (nopred predicato (rest lista))
          (first lista)))
    (T
      (cons (nopred predicato (first lista)) (nopred predicato (rest lista))))))

;;; DA SISTEMARE