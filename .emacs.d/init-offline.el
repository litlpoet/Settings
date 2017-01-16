;;; init-offline.el --- emacs offline initialization script          -*- lexical-binding: t; -*-

;;; Commentary:
;; Copyright (C) 2015  bk
;; Author: bk <bk@T530>
;; Keywords: Lisp

;;; Code:
;; Turn off mouse interface early in startup to avoid momentary display
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

;; Package archives
(require 'package)
(setq package-archives '(("bkelpa" . "~/.emacs.d/bk-elpa")))
(package-initialize)

;; Custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile (require 'use-package))
(require 'diminish)
(require 'bind-key)
(setq use-package-verbose t)

(use-package bk-general
  :load-path "bk-elisp/"
  :config
  (bk/install-packages)
  (bk/load-init-org)
  (when window-system
    (bk/report-emacs-boot-time)))

;; (provide 'init-offline)
;;; init-offline.el ends here
