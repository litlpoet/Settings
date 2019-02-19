;;; init-languages-rust.el --- language rust config  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; Rust language configuration

;;; Code:
(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode))

(provide 'init-languages-rust)
;;; init-languages-rust.el ends here
