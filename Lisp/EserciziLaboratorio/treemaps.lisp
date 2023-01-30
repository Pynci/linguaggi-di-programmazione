;;;; -*- Mode: Lisp -*-

;;; treemaps.lisp


; attenzione all'apostrofo ('node è un simbolo)
(defun new-node (key value left right)
  (list 'node key value left right))

; eq controlla che un oggetto sia identico ad un simbolo
; controllo che n sia una lista e poi controllo che sia effettivamente un nodo
(defun is-node (node)
  (and 
   (listp node)
   (eq 'node (first node))))

(defun node-l (node)
  (and
   (is-node node)
   (fourth node)))

(defun node-r (node)
  (and
   (is-node node)
   (fifth node)))

; null è la funzione che controlla se l'argomento è nil
(defun node-leaf-p (node)
  (and (is-node node)
       (null (node-l node))
       (null (node-r node))))

(defun node-k (node)
  (and
   (is-node node)
   (second node)))

(defun node-v (node)
  (and
   (is-node node)
   (third node)))

; inserisci un nuovo nodo con chiave key e valore value come figlio del nodo node
; (ricrea un nuovo nodo con i valori di node e mettici come un nuovo nodo con chiave key e valore value)

;;;; RECUPERA QUI ALTRIMENTI IMPAZZISCI SIUUUUUM



(defun node-search (k n)
  (cond ((null n) nil)
        ((= k (node-key n)) n)
        ((< k (node-key n))
         (node-search k (node-l n)))
        ((> k (node-key n))
         (node-search k (node-r n)))
        (t 
         (error "ERROR: qualcosa si è suicidato"))
        ))
   

;;; end of file --- treemaps.lisp