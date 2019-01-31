;;; init-languages-lisp.el --- language lisp         -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; language Lisp packages.

;;; Code:
(use-package hungry-delete
  :hook ((emacs-lisp-mode lisp-interaction-mode) . hungry-delete-mode)
  :blackout t)

(use-package aggressive-indent
  :hook ((emacs-lisp-mode lisp-interaction-mode). aggressive-indent-mode)
  :blackout t)

(use-package macrostep)

(provide 'init-languages-lisp)
;;; init-languages-lisp.el ends here
