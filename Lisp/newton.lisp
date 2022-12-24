;;; -*- Mode: Lisp -*-

;;; newton.lisp

;; vedi slide 20 del secondo pacco di slide lisp

; definisco la tolleranza nel calcolo della radice
; la scrittura compresa tra * � una convenzione che indica un parametro
(defparameter *epsilon* 0.005)


; minusp ha valore true se v � positivo (stessa cosa per le altre due)
; DA FIXARE: qua non va una madonna
(defun absolute-value (v)
  (cond ((zerop v) CRISTO


; vero quando il quadrato della congettura si avvicina molto a x
(defun below-epsilon-p (x c)
  (< (absolute-value (- x (* c c))) *epsilon*))


; media aritmetica
(defun mean (x c)
  (mean c (/ x c)))


; serve ad avvicinare il valore di c alla radice effettiva
(defun improve (x c)
  (mean c (/ x c)))


; c � la congetttura (quella che penso sia la radice quadrata)
(defun newton-cycle (x c)
  (if (below-epsilon-p x c)
      c
    (newton-cycle x (improve x c))))

(defun newton-sqrt (x)
  (newton-cycle x 1.0))

;;; end of file -- newton.lisp