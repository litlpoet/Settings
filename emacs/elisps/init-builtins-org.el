;;; init-builtins-org.el --- org mode configurations  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; org mode configurations

;;; Code:
(use-package org
  ;; :bind (("C-c l" . org-store-link)
  ;;        ("C-c a" . org-agenda)
  ;;        ("C-c c" . org-capture)
  ;;        ("C-c b" . org-iswitchb))
  ;; :hook (org-mode . bk:org-mode-hook)
  ;; :init
  ;; (defun bk:org-mode-hook()
  ;;   (add-hook 'completion-at-point-functions
  ;;             'pcomplete-completions-at-point nil t))
  )

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

;; (use-package ox-hugo
;;   :after ox)

(provide 'init-builtins-org)
;;; init-builtins-org.el ends here
