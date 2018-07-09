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
  (load custom-file t t))

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

;; (use-package solaire-mode
;;   :ensure t
;;   :commands (turn-on-solaire-mode solaire-mode solaire-mode-in-minibuffer)
;;   :init
;;   (add-hook 'minibuffer-setup-hook        #'solaire-mode-in-minibuffer))

;; (for dev) macrostep
(use-package macrostep
  :ensure t
  :bind ("C-c e m" . macrostep-expand))

;; personal implementations
;; (use-package impl-autoinsert          :load-path "elisps/")

;; default packages and their extensions
(use-package init-defaults            :load-path "elisps/")
(use-package init-defaults-org        :load-path "elisps/")

;; essential packages
(use-package init-essentials                 :load-path "elisps/")
(use-package init-essentials-prog            :load-path "elisps/")
(use-package init-essentials-prog-cpp        :load-path "elisps/")
;; (use-package init-essentials-prog-cpp-rtags :load-path "elisps/")
(use-package init-essentials-prog-cpp-cquery :load-path "elisps/")
(use-package init-essentials-prog-py         :load-path "elisps/")
(use-package init-essentials-prog-others     :load-path "elisps/")
(use-package init-essentials-hydra           :load-path "elisps/")
(use-package init-os                         :load-path "elisps/")

;; initialize specialized packages

;; ;; (start) dash-board
;; (use-package dashboard
;;   :ensure   t
;;   :commands (dashboard-setup-startup-hook)
;;   :init
;;   (setq dashboard-startup-banner 'nil
;;         dashboard-items          '((projects  . 10)
;;                                    (recents   . 10)))
;;   (dashboard-setup-startup-hook))

(provide 'init-common)
;;; init-common.el ends here
