(in-package :cl-user)
(defpackage toolbox
  (:nicknames :wpb)
  (:use :cl :toolbox.utils)
  (:import-from :toolbox.fileworks
                :mkdir
                :ls
                :run-through
                :create-with)
  (:import-from :toolbox.utils
                :with-optional-dir)
  (:import-from :cl-ppcre
                :regex-replace)
  (:export :ls
   :create-with
           :truncate-name
           :rename-regex
           :subst-in))

(in-package :toolbox)

(defun shell (&rest args)
  (format t "~&~{~a~^ ~}~%" args)
  (uiop:run-program (format nil "~{~a~^ ~}" args) :output t))

(defun truncate-name (&rest args)
  (with-optional-dir (dir sub) args 
    (loop for f in (ls dir)
          with name do
            (setf name (namestring f))
          when (search sub name) do
            (shell "mv" name (regex-replace sub name "")))))

(defun rename-regex (&rest args)
  (with-optional-dir (dir old new) args 
    (loop for f in (ls dir)
          with name do
            (setf name (namestring f))
          when (search old name) do
            (shell "mv" name (regex-replace old name new)))))


(defun subst-in (old new &rest files)
  (shell "sed" "-i" (format nil "'s/~a/~a/g' ~{~a~^ ~}" old new files)))



