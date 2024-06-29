;;; html-global-content.el --- configración para exportar en html

;;; Commentary:
;;; Contiene bloques de código globales para añadir a las expotaciones de archivos org

;;; Code:
;; pequeños componentes
(defconst jp/up-btn-html "<div class=\"scroll-up-btn\"><i class=\"fa-solid fa-chevron-up\"></i></div>")

;; enlaces de estilos css
(defconst jp/simple-css-link "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")
(defconst jp/TODO-css-link "<link rel=\"stylesheet\" href=\"https://perju.github.io/web-from-org/css/org-todo.css\" />")
(defconst jp/TODO-css-link "<link rel=\"stylesheet\" href=\"./css/styles.css\" />")

;; scripts
(defconst jp/index-js "<script src=\"./js/index.js\"></script>")
(defconst jp/jquery "<script src=\"https://code.jquery.com/jquery-3.7.1.min.js\" integrity=\"sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=\" crossorigin=\"anonymous\"></script>")

;; preambulo para añadir al principio del documento
(defconst jp/preamble "<div id=\"navbar\"><ul>
<li><a href=\"/index.html\">Inicio</a></li>
<li><a href=\"./Otra-pagina.html\">Otra pàgina</a></li>
</ul><hr></div>")

;; fontawesome
(defconst jp/font-awesome-css "<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css\" />")
(defconst jp/font-awesome-js "<script src=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.js\"></script>")

;; todos los estilos y scripts para la cabecera del documento
(defconst jp/html-head (concat jp/simple-css-link "\n"
                            jp/TODO-css-link "\n"
                            jp/jquery "\n"
                            jp/index-js "\n"
                            jp/font-awesome-css "\n"
                            jp/font-awesome-js))

;; postambulo, el pie de pagina
(defconst jp/html-postamble "<div class=\"scroll-up-btn\"><u></u></div>")

(provide 'html-global-content)
;;; html-global-content.el ends here
