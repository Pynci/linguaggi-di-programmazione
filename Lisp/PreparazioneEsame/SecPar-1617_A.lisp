(defun variance (lista &key key)
    (if (null lista)
        0
        (let ((media-valori (media (filtra lista :key key))))
            (media (varianze lista media-valori)))))

;; filtra la lista in ingresso secondo il predicato key
(defun filtra (lista &key key)
    (cond ((null lista) NIL)
          ((atom lista)
            (if (funcall key lista)
                lista
                NIL))
          (T
            (cons (filter (first lista) :key key) (filter (rest lista) :key key)))))

;; effettua la somma degli elementi della lista (senza considerare i NIL)
(defun somma-elementi (lista acc)
    (cond ((null lista) acc)
          ((null (first lista)) (somma-elementi (rest lista) acc))
          (T
            (somma-elementi (rest lista) (+ acc (first lista))))))

;; conta gli elementi della lista (senza considerare i NIL)
(defun conta-elementi (lista acc)
    (cond ((null lista) acc)
          ((null (first lista)) (conta-elementi (rest lista) acc))
          (T
            (conta-elementi (rest lista) (+ acc 1)))))

;; calcola la media di una lista
(defun media (lista)
    (if (null lista)
        0
        (/ (somma-elementi lista 0) (conta-elementi lista 0))))

;; calcola la varianza degli elementi di una lista
(defun varianze (lista media)
    (mapcar (lambda (elemento)
        (quadrato (- elemento media))) lista))

