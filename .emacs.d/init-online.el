;;; init-online.el -- bk's emacs starting point
;;; Commentary:
;; Emacs init.el online version (getting package from web)

;;; Code:
;; change default appearance as soon as possible

;; invoke packages
(require 'package)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/")
 t)  ;; last 't' puts 'melpa' at the end of the list
(package-initialize)

(load
 (expand-file-name "init-common.el" user-emacs-directory))
;;; (provide 'init)
;;; init-online.el ends here

