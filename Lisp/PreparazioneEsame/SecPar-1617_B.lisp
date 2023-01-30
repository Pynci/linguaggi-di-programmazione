(defun average (lista &key key)
    (let* ((lista-fil (filtra lista :key key))
           (lunghezza (conta-elem lista-fil 0)))
        (if (eql lunghezza 0)
            0
            (/ (somma-elem lista-fil 0) lunghezza))))

(defun filtra (lista &key key)
    (cond ((null lista) NIL)
          ((atom lista)
            (if (funcall key lista)
                lista
                NIL))
          (T
            (append (list (filtra (first lista) :key key)) (filtra (rest lista) :key key)))))

(defun conta-elem (lista acc)
    (if (null lista)
        acc
        (if (null (first lista))
            (conta-elem (rest lista) acc)
            (conta-elem (rest lista) (+ acc 1)))))

(defun somma-elem (lista acc)
    (if (null lista)
        acc
        (if (null (first lista))
            (somma-elem (rest lista) acc)
            (somma-elem (rest lista) (+ (first lista) acc)))))

