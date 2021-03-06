;;; setup-irony.el --- irony package setup
;;; Commentary:
;;; Code:

;; irony-mode
(message "[bk:setup-irony.el is loading...]")

(require 'irony)
(defun bk:irony-mode-hook()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async)
  (when (eq system-type 'windows-nt)
    (setq w32-pipe-read-delay 0))
  (eldoc-mode)
  (irony-eldoc))

(add-hook 'irony-mode-hook 'bk:irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook
          (lambda()
            (unless (derived-mode-p 'glsl-mode) (irony-mode))))
(setq irony-lighter " Irny")
;; (setq irony-additional-clang-options '("-std=c++11"))

(provide 'setup-irony)
;;; setup-irony.el ends here
