;;; init-common.el ---  a common part of the init process  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Byungkuk Choi

;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:

;;; Code:

(when window-system
  (menu-bar-mode   -1)
  (tool-bar-mode   -1)
  (scroll-bar-mode -1)
  (tooltip-mode    -1))

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
(use-package custom
  :defer t
  :init
  (setq custom-safe-themes t)
  (setq custom-file
        (expand-file-name "custom.el" user-emacs-directory))
  (load custom-file))

;; main theme
;; (use-package material-theme
;;   :ensure t
;;   :defer t
;;   :init (load-theme 'material t))
(use-package base16-theme
  :ensure t
  :defer t
  :init
  (load-theme 'base16-default-dark t)
  (set-face-background 'fringe          nil)
  (set-face-background 'vertical-border nil)
  (set-face-foreground 'vertical-border (face-background 'modeline-inactive)))


;; (for dev) macrostep
(use-package macrostep
  :ensure t
  :bind ("C-c e m" . macrostep-expand))

(use-package init-defaults            :load-path "elisp-bk/")
(use-package impl-autoinsert          :load-path "elisp-bk/")
(use-package init-essentials-common   :load-path "elisp-bk/")
(use-package init-essentials-navi     :load-path "elisp-bk/")
(use-package init-essentials-proj     :load-path "elisp-bk/")
(use-package init-essentials-prog     :load-path "elisp-bk/")
(use-package init-essentials-prog-cpp :load-path "elisp-bk/")
(use-package init-essentials-prog-py  :load-path "elisp-bk/")

;; initialize specialized packages

(provide 'init-common)
;;; init-common.el ends here
