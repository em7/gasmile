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
    (progn (stop *app* :soft t)
           (setf *app* nil))))

(defun start-web-server (&optional
                           (port 8080)
                           (document-root (uiop:merge-pathnames* #p "../static")))
  (stop-web-server)
  (setf *app* (make-instance 'easy-acceptor
                             :port port
                             :document-root document-root))
  (start *app*))

