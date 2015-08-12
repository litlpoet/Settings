;;; setup-convenience.el --- covenience package setup
;;; Commentary:
;;; Code:

;; update any changes made on file to the current buffer
(message "[bk:setup-convenience.el is loading...]")

;; show ibuffer in another window
(require 'ibuffer)
(setq ibuffer-use-other-window t)

;; expand (selection) region
(require 'expand-region)
(global-set-key (kbd "M-m") 'er/expand-region)

(provide 'setup-convenience)
;;; setup-convenience.el ends here
