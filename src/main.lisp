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
  (:export :shell
           :ls
           :create-with
           :truncate-name
           :rename-regex
           :subst-in
           :count-lines
           :unique-lines))

(in-package :walpurgisbox)

(defun shell (&rest args)
  ;(format t "~{~a~^ ~}~%" args)
  (uiop:run-program (format nil "~{~a~^ ~}" args) :output t))

(defun truncate-name (args)
  (with-optional-dir (dir sub) args 
    (loop for f in (ls dir)
          with name do
            (setf name (namestring f))
          when (search sub name) do
            (shell "mv" name (regex-replace sub name "")))))

(defun rename-regex (args)
  (with-optional-dir (dir old new) args 
    (loop for f in (ls dir)
          with name do
            (setf name (namestring f))
          when (search old name) do
            (shell "mv" name (regex-replace old name new)))))


(defun subst-in (old new files)
  (shell "sed" "-i" (format nil "'s/~a/~a/g' ~{~a~^ ~}" old new files)))


(defun unique-lines (files)
  (shell "cat" (format nil "~{~a~^ ~}" files) "| sort -u | wc -l"))

(defun count-lines (args)
  (with-optional-dir (dir type) args
    (let ((arg (if (equal type "all")
                   (format nil "-type f")
                   (format nil "-name ~a" type))))
      (shell "find" dir arg (format nil "-exec cat {} + | wc -l")))))
