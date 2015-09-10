;;; package --- Summary
;;; Commentary:
;;; Code:

(message "[bk:setup-programming.el is loading...]")
;; line number visualization only in programming mode
(add-hook 'prog-mode-hook 'linum-mode)

;; useless whitespace is highlighted in programming mode
(add-hook
 'prog-mode-hook
 (lambda()
   (interactive)
   (setq-local show-trailing-whitespace 1)
   (setq-local whitespace-style '(face tabs trailing lines-tail))
   (setq-local whitespace-line-column  80)
   (whitespace-mode 1)))

;; make .h file to cpp mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; google-c-style-guide
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; clang-format
(require 'clang-format)
(defun bk:clang-format-setting()
  (define-key c-mode-base-map (kbd "C-S-f") 'clang-format-buffer)
  (setq-local clang-format-style "Google"))

(add-hook 'c-mode-hook 'bk:clang-format-setting)
(add-hook 'c++-mode-hook 'bk:clang-format-setting)

;; semantic related
;; (semantic-mode 1)
;; (add-to-list 'semantic-default-submodes
;;              'global-semantic-stickyfunc-mode)
;; (require 'stickyfunc-enhance)

;; speed bar option
(require 'speedbar)
(setq speedbar-show-unknown-files t)

(provide 'setup-programming)
;;; setup-programming.el ends here
