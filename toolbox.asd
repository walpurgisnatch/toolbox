(defsystem "toolbox"
  :version "0.1.0"
  :author "Walpurgisnatch"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "toolbox"))))
  :description ""
  :in-order-to ((test-op (test-op "toolbox/tests"))))
