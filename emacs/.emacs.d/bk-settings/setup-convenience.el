;;; setup-convenience.el --- covenience package setup
;;; Commentary:
;;; Code:

;; start company (complete anything) instead of auto-complete
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; update any changes made on file to the current buffer
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

;; projectile
(require 'projectile)
(projectile-global-mode)
(when (eq system-type 'windows-nt)
  (setq projectile-indexing-method 'alien))

(setq projectile-completion-system 'helm)
(helm-projectile-on)

(provide 'setup-convenience)
;;; setup-convenience.el ends here
