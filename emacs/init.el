;;; init.el --- emacs initialization                 -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Byungkuk Choi

;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:

;; Emacs initialization (using straight.el)

;;; Code:
;;; Check 'early-init.el'
(defconst bk:local-directory
  (concat user-emacs-directory
          (convert-standard-filename ".local/"))
  "Directory for temporary files.")

(defconst bk:elisps-directory
  (concat user-emacs-directory
          (convert-standard-filename "elisps/"))
  "Directory for custom elisps.")

(defconst bk:elisps-hydras-directory
  (concat bk:elisps-directory
          (convert-standard-filename "hydras/"))
  "Directory for custom hydras.")

;; default packages and their extensions
(eval-and-compile
  (add-to-list 'load-path bk:elisps-directory)
  (add-to-list 'load-path bk:elisps-hydras-directory))

(require 'init-package-management)

(require 'init-builtins)
(require 'init-builtins-dired)
(require 'init-essentials)
(require 'init-essentials-project)
(require 'init-essentials-ui)
(require 'init-languages)
(require 'init-languages-lisp)
(require 'init-languages-cpp)
(require 'init-languages-python)
(require 'init-keybindings)

;;; report init.el load time
(let ((elapsed (float-time
                (time-subtract (current-time) bk:emacs-start-time))))
  (message "Loading %s...done (%.3fs) [init.el]" load-file-name elapsed))

;;; finalize init.el and report total load time
(add-hook 'after-init-hook
          `(lambda ()
             (setq gc-cons-threshold 16777216)
             (let ((elapsed (float-time
                             (time-subtract
                              (current-time)
                              bk:emacs-start-time))))
               (message "Loading %s...done (%.3fs) [after-init]"
                        ,load-file-name elapsed))) t)
;;; init.el ends here
