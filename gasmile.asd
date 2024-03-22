(asdf:defsystem #:gasmile
  :description "Describe gasmile here"
  :author "em7 <mm007.emko@gmail.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :depends-on (#:hunchentoot #:hunchentools #:spinneret)
  :in-order-to ((test-op (test-op :gasmile/tests)))
  :components ((:module "src"
                :components ((:file "layout")
                             (:file "gasmile" :depends-on  ("layout"))))))

(asdf:defsystem #:gasmile/tests
  :author "em7 <mm007.emko@gmail.com>"
  :depends-on (#:gasmile #:fiveam)
  :components ((:module "tests"
                :components ((:file "gasmile-tests"))))
  :perform (test-op (op c)
                    (uiop:symbol-call :fiveam :run!
                                      (uiop:find-symbol* :gasmile
                                                         :gasmile/tests/gasmile-tests))))
