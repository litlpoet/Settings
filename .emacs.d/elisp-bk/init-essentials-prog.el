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
  (add-hook 'after-init-hook 'global-company-mode)
  :config
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
          c++-mode
          python-mode)))

;; fly-check
(use-package flycheck
  :ensure t
  :commands (global-flycheck-mode)
  :init
  (add-hook 'after-init-hook #'global-flycheck-mode)
  :config
  (setq flycheck-global-modes
        '(emacs-lisp-mode
          python-mode
          c-mode
          c++-mode
          python-mode))
  (setq flycheck-check-syntax-automatically
        '(mode-enabled save))
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
  :init
  (setq vc-handled-backends            nil
        magit-completing-read-function 'ivy-completing-read)
  :config
  (set-face-attribute 'magit-diff-file-heading nil
                      :inverse-video t
                      :weight 'extra-bold))

;; git-gutter
;; (use-package git-gutter
;;   :ensure t
;;   :commands (global-git-gutter-mode)
;;   :init
;;   (add-hook 'after-init-hook
;;             '(lambda()
;;                (global-git-gutter-mode t)))
;;   :config
;;   (setq-default git-gutter:lighter      nil
;;                 git-gutter:window-width 2))

;; clean-aindent-mode
(use-package clean-aindent-mode
  :ensure t
  :commands (clean-aindent-mode)
  :init
  (add-hook 'prog-mode-hook 'clean-aindent-mode))

(use-package writeroom-mode
  :ensure t
  :commands (global-writeroom-mode)
  :init
  (add-hook 'after-init-hook #'global-writeroom-mode)
  :config
  (setq writeroom-major-modes
        '(text-mode prog-mode cmake-mode))
  (setq writeroom-width                100
        writeroom-maximize-window      nil
        writeroom-extra-line-spacing   5
        writeroom-bottom-divider-width 0))

(provide 'init-essentials-prog)
;;; init-essentials-prog ends here
