;;; setup-convenience.el --- covenience package setup
;;; Commentary:
;;; Code:

;; update any changes made on file to the current buffer
(message "[bk:setup-convenience.el is loading...]")
(global-auto-revert-mode)

;; highlight current line
(if (boundp 'global-hl-line-sticky-flag)
    (setq global-hl-line-sticky-flag t))
(global-hl-line-mode)

;; show ibuffer in another window
(require 'ibuffer)
(setq ibuffer-use-other-window t)

;; line number visualization only in programming mode
(add-hook 'prog-mode-hook 'linum-mode)

;; useless whitespace is highlighted in programming mode
(add-hook 'prog-mode-hook
	  (lambda()
	    (interactive)
	    (setq show-trailing-whitespace 1)))

;; expand (selection) region
(require 'expand-region)
(global-set-key (kbd "M-m") 'er/expand-region)

(provide 'setup-convenience)
;;; setup-convenience.el ends here
