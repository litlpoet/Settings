;; company
(use-package company :ensure t
  :commands (global-company-mode)
  :diminish company-mode
  :init
  (setq company-global-modes
        '(lisp-interaction-mode
          emacs-lisp-mode
          c-mode c++-mode))
  (add-hook 'after-init-hook 'global-company-mode))

;; magit
(use-package magit :ensure t
  :bind (("C-c s" . magit-status))
  :init (setq vc-handled-backends nil)
  :config
  (set-face-attribute 'magit-diff-file-heading nil
                      :inverse-video t
                      :weight 'extra-bold))

;; git-gutter-fringe
(use-package git-gutter-fringe :ensure t
  :commands (global-git-gutter-mode)
  :init
  (setq git-gutter:lighter nil)
  (global-git-gutter-mode t))

(provide 'init-essentials-prog)
