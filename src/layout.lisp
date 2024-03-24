(defpackage #:gasmile.layout
  (:use #:cl
        #:spinneret
        #:parenscript)
  (:export #:with-main-layout))

(in-package #:gasmile.layout)

;; TODO make it a macro
(defun with-main-layout ()              ;(&body body)
  (spinneret:with-html-string
    (:doctype)
    (:html
     (:head
      (:meta :charset "utf-8")
      (:meta :name "viewport" :content "width=device-width, initial-scale=1")
      (:title "GAS MILES = GA SMILES")
                                        ;(:script :src "https://unpkg.com/htmx.org@1.9.11")
      (:link :href "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" :rel "stylesheet" :integrity"sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" :crossorigin "anonymous"))
     (:body
      :class "container-fluid text-bg-dark"
      (:main
       :class "d-flex flex-nowrap text-bg-dark"
       (:nav
        :class "d-flex flex-column flex-shrink-0 p-3 text-bg-dark"
        :style "width: 280px;"
        :id "sidebar"
        (:div
         :class "d-flex justify-content-between align-items-center"
         (:h1 "Hello World")
         ;; (:button
         ;;  :class "btn btn-light"
         ;;  :onclick (:raw (ps (toggle-sidebar)))
         ;;  (:i
         ;;   :class "bi bi-list"))
         ))
       

       (:article
        :class  "d-flex flex-column text-bg-light"
        (:p "Hello World from unfinished content")))
      (:script :src "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" :integrity "sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" :crossorigin "anonymous")

      (:script
       :type "text/javascript"
       (:raw (ps (defun toggle-sidebar ()
                   (let ((sidebar (chain document (get-element-by-id "sidebar"))))
                     (chain sidebar class-list (toggle "d-none")))))))))))


