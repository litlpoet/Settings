;;; init.el --- emacs initialization script          -*- lexical-binding: t; -*-

;;; Commentary:
;; Copyright (C) 2015  bk
;; Author: bk <bk@T530>
;; Keywords: lisp

;;; Code:
;; Turn off mouse interface early in startup to avoid momentary display
(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

;; Package archives
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("org" . "http://orgmode.org/elpa/") t)
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

;; (provide 'init)
;;; init.el ends here
