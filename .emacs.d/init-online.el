;;; init-online.el -- bk's emacs starting point
;;; Commentary:
;; Emacs init.el online version (getting package from web)

;;; Code:
;; change default appearance as soon as possible
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

;; invoke packages
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/")
	     t)  ;; last 't' puts 'melpa' at the end of the list
(package-initialize)

;; use package setup
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package)
  (setq use-package-verbose t))
(require 'diminish)
(require 'bind-key)

;; custom
(use-package custom :defer t
  :init
  (setq custom-safe-themes t)
  (setq custom-file
        (expand-file-name "custom.el" user-emacs-directory))
  (load custom-file))

;; main theme
(use-package material-theme :ensure t :defer t
  :init (load-theme 'material t))

;; (for dev) macrostep
(use-package macrostep :ensure t
  :bind ("C-c e m" . macrostep-expand))

;; load constant variables
(use-package init-constants :load-path "elisp-bk/")

;; initialize default (built-in) packages
(use-package init-defaults :load-path "elisp-bk/")

;; initialize essential (external) packages
(use-package init-essentials-common   :load-path "elisp-bk/")
(use-package init-essentials-navi     :load-path "elisp-bk/")
(use-package init-essentials-proj     :load-path "elisp-bk/")
(use-package init-essentials-prog     :load-path "elisp-bk/")
(use-package init-essentials-prog-cpp :load-path "elisp-bk/")
(use-package init-essentials-prog-py  :load-path "elisp-bk/")

;; initialize specialized packages

;;; (provide 'init)
;;; init-online.el ends here

