;;; setup-flycheck.el --- flycheck package setup
;;; Commentary:
;;; Code:

;; flycheck
(message "[bk:setup-flycheck.el is loading...]")

(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-irony)
     (add-hook 'flycheck-mode-hook #'flycheck-irony-setup)
     (require 'flycheck-google-cpplint)
     (flycheck-add-next-checker
      'irony
      '(warning . c/c++-googlelint))))

(provide 'setup-flycheck)
;;; setup-flycheck.el ends here
