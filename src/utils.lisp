(in-package :cl-user)
(defpackage toolbox.utils
  (:use :cl))

(in-package :toolbox.utils)

(defmacro with-optional-dir (vars args &rest body)
  `(destructuring-bind ,vars
       ',(if (= (length vars) (length args))
             args
             (push nil args))
     (progn ,@body)))
