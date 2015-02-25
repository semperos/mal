(defpackage :mal
  (:use :common-lisp))

(defun read* (&optional (stream *standard-input*))
  (read-line stream))

(defun eval* (ast &optional (env '()))
  ast)

(defun print* (x)
  (print x))

(defun rep ()
  (loop
    (print 'mal>)
    (finish-output)
    (let ((evaluated (eval* (read*))))
      (if (equal (string-downcase evaluated)
                 "quit")
          (return)
          (print* evaluated)))))
