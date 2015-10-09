;;; setup-projectile.el --- projectile package setup
;;; Commentary:
;;; Code:

;; projectile
(message "[bk:setup-projectile.el is loading...]")
(require 'projectile)
(projectile-global-mode)
;; (when (eq system-type 'windows-nt)
;;   (setq projectile-indexing-method 'alien))
(setq projectile-indexing-method 'alien)
(setq projectile-mode-line
      '(:eval (format " Prj[%s]" (projectile-project-name))))
;; (setq projectile-enable-caching nil)

(require 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-switch-project-action
      'projectile-dired)

(provide 'setup-projectile)

;;; setup-projectile.el ends here
