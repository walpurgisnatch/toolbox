(defsystem "toolbox"
  :version "0.1.0"
  :author "Walpurgisnatch"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :serial t
                :components
                ((:file "utils")
                (:file "main"))))
  :description "Collection of terminal tools")
