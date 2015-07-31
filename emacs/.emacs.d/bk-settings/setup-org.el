;;; setup-org --- customize org mode
;;; Commentary:
;;; Code:

(require 'org)
(setq org-log-done t)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(provide 'setup-org)

;;; setup-org.el ends here
