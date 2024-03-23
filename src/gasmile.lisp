(defpackage #:gasmile
  (:use #:cl
        #:hunchentoot
        #:hunchentools
        #:gasmile.layout)
  (:export #:start-web-server
           #:stop-web-server))


(in-package #:gasmile)

(defvar *app* nil)

(define-easy-handler (root :uri "/") ()
  (with-main-layout))

(defun stop-web-server ()
  (when *app*
    (stop *app* :soft t)))

(defun start-web-server (&optional (port 8080))
  (stop-web-server)
  (setf *app* (make-instance 'easy-acceptor :port port))
  (start *app*))

