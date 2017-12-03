;;; init-common.el ---  a common part of the init process  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Byungkuk Choi

;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:

;;; Code:

(defconst bk:temp-directory
  (concat user-emacs-directory
          (convert-standard-filename "temp/"))
  "Directory for temporary files.")

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
(use-package diminish :ensure t)
(use-package bind-key :ensure t)

;; custom
(use-package custom
  :defer t
  :init
  (setq custom-safe-themes t)
  (setq custom-file
        (expand-file-name "custom.el" user-emacs-directory))
  (load custom-file))

;; main themes
(use-package material-theme
  :ensure t
  :defer  t)

(use-package base16-theme
  :ensure t
  :defer  t
  ;; :init
  ;; (load-theme 'base16-default-dark t)
  ;; :config
  ;; (set-face-background 'fringe          nil)
  ;; (set-face-background 'vertical-border nil)
  ;; (set-face-foreground 'vertical-border (face-background 'modeline-inactive))
  )

(use-package doom-themes
  :ensure t
  :defer  t
  :init
  (setq doom-themes-enable-bold   t
        doom-themes-enable-italic t)
  (load-theme 'doom-tomorrow-night t)
  :config
  (doom-themes-org-config))


;; (for dev) macrostep
(use-package macrostep
  :ensure t
  :bind ("C-c e m" . macrostep-expand))

;; personal implementations
;; (use-package impl-autoinsert          :load-path "elisp-bk/")

;; default packages and their extensions
(use-package init-defaults            :load-path "elisp-bk/")
(use-package init-defaults-dired      :load-path "elisp-bk/")
(use-package init-defaults-org        :load-path "elisp-bk/")

;; essential packages
(use-package init-essentials-common   :load-path "elisp-bk/")
(use-package init-essentials-navi     :load-path "elisp-bk/")
(use-package init-essentials-proj     :load-path "elisp-bk/")
(use-package init-essentials-prog     :load-path "elisp-bk/")
(use-package init-essentials-prog-cpp :load-path "elisp-bk/")
(use-package init-essentials-prog-py  :load-path "elisp-bk/")

;; initialize specialized packages

;; (start) dash-board
(use-package dashboard
  :ensure t
  :defer  t
  :init
  (setq dashboard-startup-banner 'logo
        dashboard-items          '((bookmarks . 10)
                                   (projects  . 10)
                                   (recents   . 10)))
  (dashboard-setup-startup-hook))

(provide 'init-common)
;;; init-common.el ends here
