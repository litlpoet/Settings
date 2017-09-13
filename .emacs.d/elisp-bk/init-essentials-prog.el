;;; init-essentials-prog.el -- common programming
;;; Commentary:

;;; Code:

;; yasnippet
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :commands (yas-global-mode)
  :init
  (add-hook 'after-init-hook
            '(lambda()
               (yas-global-mode 1))))

;; company
(use-package company
  :ensure t
  :bind ("M-i" . company-complete)
  :init
  (setq company-backends
        '(company-nxml
          company-capf
          company-files
          (company-dabbrev-code company-keywords)
          company-dabbrev))
  (setq company-global-modes
        '(lisp-interaction-mode
          emacs-lisp-mode
          cmake-mode
          c-mode
          c++-mode))
  (add-hook 'after-init-hook 'global-company-mode))

;; fly-check
(use-package flycheck
  :ensure t
  :commands (global-flycheck-mode)
  :init
  (setq flycheck-global-modes
        '(emacs-lisp-mode
          python-mode
          c-mode
          c++-mode))
  (setq flycheck-check-syntax-automatically
        '(mode-enabled save))
  (add-hook 'after-init-hook #'global-flycheck-mode)
  :config
  (setq-default flycheck-disabled-checkers
                '(c/c++-clang
                  c/c++-gcc
                  c/c++-cppcheck))
  (use-package flycheck-pos-tip
    :ensure t
    :init
    (with-eval-after-load 'flycheck
      (flycheck-pos-tip-mode))
    :config
    (setq flycheck-pos-tip-timeout 20)))

;; magit
(use-package magit
  :ensure t
  :bind (("C-c s" . magit-status))
  :init (setq vc-handled-backends nil)
  :config
  (set-face-attribute 'magit-diff-file-heading nil
                      :inverse-video t
                      :weight 'extra-bold))

;; git-gutter-fringe
(use-package git-gutter-fringe
  :ensure t
  :commands (global-git-gutter-mode)
  :init
  (setq git-gutter:lighter nil)
  (global-git-gutter-mode t))

;; clean-aindent-mode
(use-package clean-aindent-mode
  :ensure t
  :commands (clean-aindent-mode)
  :init
  (add-hook 'prog-mode-hook 'clean-aindent-mode))

(provide 'init-essentials-prog)
;;; init-essentials-prog ends here
