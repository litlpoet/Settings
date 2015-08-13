;;; setup-convenience.el --- covenience package setup
;;; Commentary:
;;; Code:

;; update any changes made on file to the current buffer
(message "[bk:setup-convenience.el is loading...]")

;; avy and ace-window
(global-set-key (kbd "C-c j") 'avy-goto-word-or-subword-1)
(global-set-key (kbd "M-p") 'ace-window)

;; show ibuffer in another window
(require 'ibuffer)
(setq ibuffer-use-other-window t)

;; expand (selection) region
(require 'expand-region)
(global-set-key (kbd "M-m") 'er/expand-region)

(provide 'setup-convenience)
;;; setup-convenience.el ends here
