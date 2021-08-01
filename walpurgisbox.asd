(defsystem "walpurgisbox"
  :version "0.1.0"
  :author "Walpurgisnatch"
  :license "MIT"
  :depends-on ("cl-ppcre")
  :components ((:module "src"
                :serial t
                :components
                ((:file "utils")
                 (:file "fileworks")
                 (:file "main"))))
  :description "Collection of terminal tools")
