(in-package :cl-user)
(defpackage toolbox
  (:nicknames :omc)
  (:use :cl :toolbox.utils)
  (:import-from :toolbox.fileworks
                :mkdir
                :ls
   :run-through
   :create-with)
  (:export :ls
           :create-with))

(in-package :toolbox)

