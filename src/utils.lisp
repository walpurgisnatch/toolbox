(in-package :cl-user)
(defpackage toolbox.utils
  (:use :cl))

(in-package :toolbox.utils)

(defun replace-substr (string old new)
  (let ((tmp nil)
        (counter 0))
    (with-output-to-string (output)
      (loop for c across string do
        (push c tmp)
        (incf counter)
        (when (char/= c (nth counter old))
          (if (string/= tmp old)
              (progn (format output "~{~a~}" tmp)))
          (setf tmp nil)
          (setf counter 0)))))))
