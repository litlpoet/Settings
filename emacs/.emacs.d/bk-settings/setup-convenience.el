(provide 'setup-convenience)

;; start company (complete anything) instead of auto-complete
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; highlight current line
(global-hl-line-mode)

;; line number visualization only in programming mode
(add-hook 'prog-mode-hook 'linum-mode)

;; useless whitespace is highlighted in programming mode
(add-hook 'prog-mode-hook
	  (lambda()
	    (interactive)
	    (setq show-trailing-whitespace 1)))
