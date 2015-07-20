;;; setup-projectile.el --- projectile package setup
;;; Commentary:
;;; Code:

;; projectile
(require 'projectile)
(projectile-global-mode)
;; (when (eq system-type 'windows-nt)
;;   (setq projectile-indexing-method 'alien))
(setq projectile-indexing-method 'alien)
;; (setq projectile-enable-caching nil)

(require 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(provide 'setup-projectile)

;;; setup-projectile.el ends here
