(in-package :cl-user)
(defpackage walpurgisbox
  (:nicknames :wpb)
  (:use :cl :walpurgisbox.utils)
  (:import-from :walpurgisbox.fileworks
                :mkdir
                :ls
                :run-through
                :create-with)
  (:import-from :walpurgisbox.utils
                :with-optional-dir)
  (:import-from :cl-ppcre
                :regex-replace)
  (:export :ls
   :create-with
           :truncate-name
           :rename-regex
           :subst-in
           :countl
           :countli))

(in-package :walpurgisbox)

(defun shell (&rest args)
  ;(format t "~&~{~a~^ ~}~%" args)
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

(defun countl (&rest files)
  (shell "cat" (format nil "~{~a~^ ~}" files) "| wc -l"))

(defun countli (&rest files)
  (shell "cat" (format nil "~{~a~^ ~}" files) "| sort -u | wc -l"))

