(defpackage #:gasmile
  (:use #:cl
        #:hunchentoot
        #:hunchentools
        #:gasmile.layout))


(in-package #:gasmile)

(defvar *app* nil)

(define-easy-handler (root :uri "/") ()
  (with-main-layout))

(defun start-web-server (&optional (port 8080))
  (when *app*
    (stop *app* :soft t))
  (setf *app* (make-instance 'easy-acceptor :port port))
  (start *app*))

