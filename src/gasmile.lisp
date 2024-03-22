(defpackage #:gasmile
  (:use #:cl
        #:gasmile.layout))


(in-package #:gasmile)

(defvar *app* (make-instance 'ningle:app))

(setf (ningle:route *app* "/")
      #'(lambda (params)
          (main-layout)))

(defun run-app ()
  (clack:clackup *app*))

