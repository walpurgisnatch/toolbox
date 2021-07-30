(in-package :cl-user)
(defpackage toolbox.fileworks
  (:use :cl)
  (:export :mkdir))

(in-package :toolbox.fileworks)


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

(defun mkdir (dir)
  (namestring (ensure-directories-exist
               (pathname-as-directory dir))))
