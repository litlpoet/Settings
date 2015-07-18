;;; setup-flycheck.el --- flycheck package setup
;;; Commentary:
;;; Code:

;; flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-irony)
     (add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
  )

;; flycheck-google-cpplint
(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     (flycheck-add-next-checker 'irony
                                '(t . c/c++-googlelint)))
  )

(provide 'setup-flycheck)
;;; setup-flycheck.el ends here
