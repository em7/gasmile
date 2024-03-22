(defpackage #:gasmile/tests/gasmile-tests
  (:use #:cl
        #:gasmile
        #:fiveam)
  (:export #:run!
           #:all-tests))

(in-package #:gasmile/tests/gasmile-tests)

(def-suite* gasmile :description "Root suite for GASMILE.")

(test hello-world
  (format t "Hello World")
  (is (= 1 2)))
