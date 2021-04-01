(ql:quickload '(:cl-who :hunchentoot :parenscript))

(defpackage :web-from-org
  (:use :cl :cl-who :hunchentoot :parenscript))

(in-package :web-from-org)

;; Servidor web
(defvar web-server (make-instance 'easy-acceptor :port 8080))

;; Se necesitan el certificado, la calve privada y la contraseña ssl
;; (defvar ssl-web-server (make-instance 'easy-ssl-acceptor :port 443))

(defun start-server (web-server)
  (when (not (started-p web-server))
    (start web-server)))

(defun stop-server (web-server)
  (when (started-p web-server)
    (stop web-server)))

;; Servir ficheros estaticos
(push (create-folder-dispatcher-and-handler
       "/public_html/" (merge-pathnames "public_html/" *default-pathname-defaults*))
      *dispatch-table*)

;; Cambiar la carpeta en la que se monta el servidor
(setf (acceptor-document-root web-server)
      #p"public_html/")

;;; Scripts front-end
;; Generar archivo javascript
(defmacro gen-js-file (url-file ps-func)
  `(with-open-file (f ,url-file :direction :output :if-exists :supersede)
     (format f ,ps-func)))

;; Servir archivo javascript
(defmacro serve-js-file (url-file ps-func)
  `(define-easy-handler (example :uri ,url-file) ()
     (setf (content-type*) "text/javascript")
     ,ps-func))

;; alerta hello world
(defun greeting-callback ()
  (ps (alert "Hello World!")))

(defun index-js ()
  (ps (chain
       ($ document)
       (ready (lambda ()
                (chain
                 ($ ".scroll-up-btn")
                 (click (lambda ()
                          (chain
                           ($ "html")
                           (animate (create :scroll-top 0)))
                          NULL)))
                NULL)))))

;; jquery test
(defmacro get-by (tag)
  `(ps (chain ($ ,tag))))

;; (get-by "#mydiv")

(defun run-app ()
  (start-server web-server)
  (serve-js-file "/scripts/index.js" (index-js)))

(defun gen-scripts()
  (gen-js-file "org/scripts/index.js" (index-js)))
(gen-scripts)
