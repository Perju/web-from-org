;; Para acceder desde fuera con httpd-serve-directory
;;(setq httpd-host "0.0.0.0")

;; mis variables de configuración
(require 'html-global-content (expand-file-name "./html-global-content.el"))
;; Donde instalar los paquetes
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Inicializar el sistema de paquetes
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; instalar dependencias
(package-install 'htmlize)

;; Cargar el sistema de publicación
(require 'ox-publish)

;; Personaliza la salida HTML
(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head jp/html-head)

;; definir el proyecto a publicar
(setq org-publish-project-alist
      (list (list "mi-sitio-org"
         :recursive t
         :base-directory "../docs"
         :publishing-directory "../public_html"
         :publishing-function 'org-html-publish-to-html
         :exclude "README.org"
         :with-author nil
         :with-creator t
         :with-toc t
         :section-numbers nil
         :time-stamp-file nil
         :html-validation-link nil
         :html-head-include-scripts nil
         :html-head-include-default-style nil
         :html-head org-html-head
         :auto-preamble nil
         :html-preamble jp/preamble
         :html-postamble nil
         :html-postamble jp/html-postamble)

        (list "org-images"
         :base-directory "../docs/img"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "../public_html/img"
         :recursive t
         :publishing-function 'org-publish-attachment)

        (list "org-static"
         :base-directory "static"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "../public_html"
         :recursive t
         :publishing-function 'org-publish-attachment)))

;; (print org-publish-project-alist)
;; Publicar el sitio
(org-publish-project "mi-sitio-org" t)
(org-publish-project "org-images" t)
(org-publish-project "org-static" t)

(message "Build complete!")
