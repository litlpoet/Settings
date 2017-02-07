;;; setup-smartparens.el --- smartparens package setup
;;; Commentary:
;;; Code:

(message "[bk:setup-smartparens.el is loading...]")

(smartparens-global-mode t)
(require 'smartparens-config)
(show-smartparens-global-mode t)
;; (sp-with-modes '(c-mode c++-mode)
;;   (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET")))
;;   (sp-local-pair "/*" "*/" :post-handlers '((" | " "SPC")
;;                                             ("* ||\n[i]" "RET"))))

(provide 'setup-smartparens)
;;; setup-smartparens.el ends here
