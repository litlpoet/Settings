;;; init-online.el -- bk's emacs starting point
;;; Commentary:
;; Emacs init.el online version (getting package from web)

;;; Code:

;; invoke packages
(require 'package)
(setq package-archives '(("elpabk" . "~/.emacs.d/elpabk")))
(package-initialize)


(load
 (expand-file-name "init-common.el" user-emacs-directory))
;;; (provide 'init)
;;; init-online.el ends here

