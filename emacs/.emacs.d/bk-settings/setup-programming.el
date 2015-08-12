;;; package --- Summary
;;; Commentary:
;;; Code:

(message "[bk:setup-programming.el is loading...]")
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

;; cmake
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
(add-hook 'cmake-mode-hook 'cmake-font-lock-activate)

;; cpputils-cmake
;; (require 'cpputils-cmake)
;; (add-hook 'c-mode-common-hook
;;           (lambda()
;;             (if (derived-mode-p 'c-mode 'c++-mode)
;;                 (cppcm-reload-all))))

(provide 'setup-programming)
;;; setup-programming.el ends here
