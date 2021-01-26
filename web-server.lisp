(ql:quickload '(:cl-who :hunchentoot :parenscript))

(defpackage :web-from-org
  (:use :cl :cl-who :hunchentoot :parenscript))

(in-package :web-from-org)

;; Servidor web
(defvar web-server (make-instance 'easy-acceptor :port 8080))

(defun start-server (web-server)
  (when (not (started-p web-server)
             (start web-server))))

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
