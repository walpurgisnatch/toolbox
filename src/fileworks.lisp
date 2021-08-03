(in-package :cl-user)
(defpackage walpurgisbox.fileworks
  (:use :cl)
  (:export :mkdir
           :ls
           :create-with
           :run-through))

(in-package :walpurgisbox.fileworks)


(defun run-through (dir fn &key dirs (test (constantly t)))
  (labels
      ((run (name)
         (cond
           ((directory-pathname-p name)
            (when (and dirs (funcall test name))
              (funcall fn name))
            (dolist (x (ls name)) (run x)))
           ((funcall test name) (funcall fn name)))))
    (run (pathname-as-directory dir))))

(defun directory-wildcard (dir)
  (make-pathname
   :name :wild
   :type :wild
   :defaults (pathname-as-directory dir)))

(defun component-present-p (value)
  (and value (not (eql value :unspecific))))

(defun directory-pathname-p  (p)
  (and
   (not (component-present-p (pathname-name p)))
   (not (component-present-p (pathname-type p)))
   p))

(defun pathname-as-directory (name)
  (let ((pathname (pathname name)))
    (when (wild-pathname-p pathname)
      (error "Can't reliably convert wild pathnames."))
    (if (not (directory-pathname-p name))
        (make-pathname
         :directory (append (or (pathname-directory pathname) (list :relative))
                            (list (file-namestring pathname)))
         :name      nil
         :type      nil
         :defaults pathname)
        pathname)))


(defun ls (&optional directory)
  (let ((dir (or directory ".")))
    (when (wild-pathname-p dir)
      (error "Wildcard not supported"))
    (directory (directory-wildcard dir))))

(defun mkdir (dir)
  (namestring (ensure-directories-exist
               (pathname-as-directory dir))))

(defun create-with (file data)
  (with-open-file (stream file :direction :output :if-exists :supersede :if-does-not-exist :create)
    (write-sequence data stream)))
