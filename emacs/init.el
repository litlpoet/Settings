;;; init.el --- emacs initialization                 -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Byungkuk Choi

;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:

;; Emacs initialization (using straight.el)

;;; Code:
;;; Check 'early-init.el'
(add-hook 'after-init-hook
          #'(lambda() (setq gc-cons-threshold 16777216)))

;;; temp diretory
(defconst bk:local-directory
  (concat user-emacs-directory
          (convert-standard-filename ".local/"))
  "Directory for temporary files.")

;;; eslips-directory
(defconst bk:elisps-directory
  (concat user-emacs-directory
          (convert-standard-filename "elisps/"))
  "Directory for custom elisps.")

(defconst bk:hydras-directory
  (concat bk:elisps-directory
          (convert-standard-filename "hydras/"))
  "Directory for custom hydras.")

;;; straight
(setq straight-check-for-modifications '(find-when-checking))
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; use-package
(straight-use-package 'use-package)
(use-package blackout :straight (:host github :repo "raxod502/blackout"))
(straight-use-package 'diminish)
(setq use-package-verbose nil)

;; default packages and their extensions
(eval-and-compile
  (add-to-list 'load-path bk:elisps-directory)
  (add-to-list 'load-path bk:hydras-directory))

(load (concat bk:elisps-directory "init-builtins") nil t)
(load (concat bk:elisps-directory "init-essentials") nil t)
(load (concat bk:elisps-directory "init-languages") nil t)
(load (concat bk:elisps-directory "init-languages-cpp") nil t)
(load (concat bk:elisps-directory "init-languages-python") nil t)
(load (concat bk:elisps-directory "init-keybindings") nil t)

;;; theme
(use-package doom-themes
  :straight t
  :defer t
  :init
  (setq doom-themes-enable-bold   t
        doom-themes-enable-italic t)
  (load-theme 'doom-tomorrow-night t)
  :config
  (doom-themes-org-config))

;;; report load time
(let ((elapsed (float-time
                (time-subtract (current-time) bk:emacs-start-time))))
  (message "Loading %s...done (%.3fs) [init.el]" load-file-name elapsed))
(add-hook 'after-init-hook
          `(lambda ()
             (let ((elapsed (float-time
                             (time-subtract
                              (current-time)
                              bk:emacs-start-time))))
               (message "Loading %s...done (%.3fs) [after-init]"
                        ,load-file-name elapsed))) t)
;;; init.el ends here
