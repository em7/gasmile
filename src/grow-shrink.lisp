(defpackage #:gasmile.grow-shrink
  (:use #:cl
        #:spinneret
        #:parenscript)
  (:export #:with-main-layout))

(in-package #:gasmile.grow-shrink)

(defmacro on-shrinked (selector)
  "Creates an event listener for elements selectable by CSS `selector` (string).
   The event listener sets `display: none;` and removes the listener."
  (let ((fn-name (read-from-string (concatenate 'string "on_shrinked_" (string (gensym))))))
    `(ps (defun ,fn-name ()
           (let ((elms (chain document (query-selector-all ,selector))))
             (chain elms (for-each
                          (lambda (e)
                            (chain e (remove-event-listener "animationend" ,fn-name))
                            (setf (@ e style display) "none")))))))))


(defmacro on-unshrinked (selector)
  "Creates an event listener for elements selectable by CSS `selector` (string).
   The event listener sets `display: block;` and removes the listener."
  (let ((fn-name (read-from-string (concatenate 'string "on_unshrinked_" (string (gensym))))))
    `(ps (defun ,fn-name ()
           (let ((elms (chain document (query-selector-all ,selector))))
             (chain elms (for-each
                          (lambda (e)
                            (chain e (remove-event-listener "animationend" ,fn-name))
                            (setf (@ e style display) "block")))))))))



;; TODO
;; document.addEventListener("DOMContentLoaded", function() {
;;     var animatingElement = document.querySelector('.shrink-animate'); // Adjust the selector to your element

;;     animatingElement.addEventListener('animationend', onAnimationEnd);
;; });
