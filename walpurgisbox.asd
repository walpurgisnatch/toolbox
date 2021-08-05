(defsystem "walpurgisbox"
  :version "0.5.0"
  :author "Walpurgisnatch"
  :license "MIT"
  :depends-on ("cl-ppcre"
               "quri")
  :components ((:module "src"
                :serial t
                :components
                ((:file "utils")
                 (:file "fileworks")
                 (:file "main"))))
  :description "Collection of terminal tools")
