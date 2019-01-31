;;; init-builtins-dired.el --- built-in dired configurations  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; Built-in Dired configurations

;;; Code:
;; dired
(use-builtin dired
  :init
  (if (or (eq system-type 'darwin)
          (eq system-type 'windows-nt))
      (setq dired-listing-switches "-lha"
            dired-use-ls-dired     nil)
    (setq dired-listing-switches
          "-lha --group-directories-first"))
  (setq dired-dwim-target                         t
        dired-recursive-copies                    'always
        dired-recursive-deletes                   'always
        dired-hide-details-hide-symlink-targets   nil
        dired-hide-details-hide-information-lines t))

;; dired-x
(use-builtin dired-x  ; must be required for a certain keymap (i.e. C-x C-j)
  :after (dired)
  :demand t
  :init
  (setq-default
   dired-omit-mode  t
   dired-omit-files "^\\.$\\|^\\.[^\\.].+$"))

;; (dired) direx
(use-package direx
  :init
  (setq direx:closed-icon "▸"
        direx:open-icon   "▾"))

(provide 'init-builtins-dired)
;;; init-builtins-dired.el ends here
