(defpackage #:gasmile.grow-shrink
  (:use #:cl
        #:spinneret
        #:parenscript)
  (:export #:with-main-layout))

(in-package #:gasmile.grow-shrink)

(defmacro on-shrinked (fn-name selector)
  "Creates an event listener, a function of `fn-name` for
   elements selectable by CSS `selector` (string).
   The event listener sets `display: none;` and removes the listener."
  (let ((fnname (read-from-string fn-name)))
    `(ps (defun ,fnname ()
          (let ((elms (chain document (query-selector-all ,selector))))
            (chain elms (for-each
                         (lambda (e)
                           (chain e (remove-event-listener "animationend" ,fnname))
                           (setf (@ e style display) "none")))))))))


(defmacro on-unshrinked (fn-name selector)
  "Creates an event listener, a function of `fn-name` for
    elements selectable by CSS `selector` (string).
   The event listener sets `display: block;` and removes the listener."
  (let ((fnname (read-from-string fn-name)))
    `(ps (defun ,fnname ()
          (let ((elms (chain document (query-selector-all ,selector))))
            (chain elms (for-each
                         (lambda (e)
                           (chain e (remove-event-listener "animationend" ,fnname))
                           (setf (@ e style display) "block")))))))))

(defmacro add-shrinkable-to (shrinkable-class selector)
  "Generates javascript code for adding shrinkable CSS class (string)
   to elements selectable by CSS `selector` (string)
   and generates associated javascript functions."
  (let* ((on-shrinked-fname (concatenate 'string "on_shrinked_" (string (gensym))))
         (on-unshrinked-fname (format nil "on_unshrinked_~A" (gensym))))
    `(let ((on-shrinked-js (on-shrinked ,on-shrinked-fname ,selector))
           (on-unshrinked-js (on-unshrinked ,on-unshrinked-fname ,selector)))
q       

       (format nil "~{~A~%~%~}" (list on-shrinked-js
                                      on-unshrinked-js)))))

;; TODO
;; document.addEventListener("DOMContentLoaded", function() {
;;     var animatingElement = document.querySelector('.shrink-animate'); // Adjust the selector to your element

;;     animatingElement.addEventListener('animationend', onAnimationEnd);
;; });
