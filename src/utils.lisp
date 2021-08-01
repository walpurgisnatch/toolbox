(in-package :cl-user)
(defpackage walpurgisbox.utils
  (:use :cl)
  (:export :with-optional-dir))

(in-package :walpurgisbox.utils)

(defmacro with-optional-dir (vars args &rest body)
  `(destructuring-bind ,vars
       (if (= (length ',vars) (length ,args))
           ,args
           (push nil ,args))
     (progn ,@body)))
