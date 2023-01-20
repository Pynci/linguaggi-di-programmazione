;;; -*- Mode: Lisp -*-

;;; fact.lisp

(defun fact (x)
 (if (zerop x)
     1
   (* x (fact (- x 1)))))

(defun fact-acc (x acc)
  (if (zerop x)
      acc
    (fact-acc (- x 1) (* x acc))))

;;; end of file -- fact.lisp