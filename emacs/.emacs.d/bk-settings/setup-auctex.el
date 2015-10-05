;;; setup-auctex.el --- AucTex setup                 -*- lexical-binding: t; -*-
;; Copyright (C) 2015  bk
;; Author: bk <bk@T530>
;; Keywords:

;;; Commentary:

;;; Code:
(message "[bk:setup-auctex.el is loading...]")

;; linum mode
(add-hook 'TeX-mode-hook 'linum-mode)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(setq TeX-PDF-mode t)
(setq TeX-source-correlate-mode t)
(when (eq system-type 'windows-nt)
  (setq
   TeX-view-program-list
   '(("Sumatra PDF"
      ("\"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe\" -reuse-instance"
       (mode-io-correlate " -forward-search %b %n ")
       " %o"))))
  (eval-after-load 'tex
    '(progn
       (assq-delete-all 'output-pdf TeX-view-program-selection)
       (add-to-list 'TeX-view-program-selection
                    '(output-pdf "Sumatra PDF")))))

(provide 'setup-auctex)
;;; setup-auctex.el ends here
