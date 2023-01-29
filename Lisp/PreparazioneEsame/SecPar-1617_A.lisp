(defun quadrato (x)
    (* x x))

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
            (cons (filtra (first lista) :key key) (filtra (rest lista) :key key)))))

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

(defun f-lambda (x y)
    ((lambda (b a)
        (+ (* a (quadrato x))
           (* y b)
           (* a b)))
    (* 2 y)
    (* x (+ 1 y))))

(defun f-let (x y)
    (let ((b (* 2 y))
          (a (* x (+ 1 y))))
        (+ (* a (quadrato x))
           (* y b)
           (* a b))))

(defun splice-in-at (e n list)
    (cond ((zerop n) (cons e list))
          ((null list) (list e))
          (T (cons (first list)
                   (splice-in-at e (- n 1) (rest list))))))

(defun reverse-lista (lista)
    (if (null lista)
        NIL
        (append (reverse-lista (rest lista)) (list (first lista)))))

