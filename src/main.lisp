(in-package :cl-user)
(defpackage toolbox
  (:nicknames :pls)
  (:use :cl :toolbox.utils)
  (:import-from :toolbox.fileworks
                :mkdir
                :ls
                :run-through
                :create-with)
  (:import-from :cl-ppcre
                :regex-replace)
  (:export :ls
   :create-with
   :truncate-name))

(in-package :toolbox)

(defun shell (&rest args)
  (uiop:run-program args :output t))

(defun truncate-name (&rest args)
  (destructuring-bind (dir sub)
      (if (cdr args)
          (list (car args)
                (cadr args))
          (list nil (car args)))
    (loop for f in (ls dir)
          with name do
            (setf name (namestring f))
          when (search sub name) do
            (shell "mv" name (regex-replace sub name "")))))

