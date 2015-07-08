;; start company (complete anythin) instead of auto-complete
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; start yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; cmake settings
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeList\\.txt\\'" . cmake-mode))
	      '(("\\.cmake\\'" . cmake-mode))
	      auto-mode-alist)
      )
