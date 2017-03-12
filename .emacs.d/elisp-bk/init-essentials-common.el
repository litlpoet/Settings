;; (file) recentf-ext
(use-package recentf-ext :ensure t
  :init
  (setq recentf-max-saved-items 50
        recentf-save-file
        (expand-file-name "recentf" bk:temp-directory)))

;; (edit) iedit
(use-package iedit  :ensure t
  :bind ("C-;" . iedit-mode)
  :config (set-face-inverse-video 'iedit-occurrence t))

;; (edit) expand-region
(use-package expand-region :ensure t
  :bind ("M-2" . er/expand-region))

;; (edit) duplicate-thing
(use-package duplicate-thing :ensure t
  :bind ("M-c" . duplicate-thing))

;; (edit) multiple-cursors
(use-package multiple-cursors :ensure t
  :bind (("M-4" . mc/mark-next-like-this)
         ("M-3" . mc/mark-previous-like-this)
         ("M-$" . mc/skip-to-next-like-this)
         ("M-#" . mc/skip-to-previous-like-this)))

;; (edit) smartparens
(use-package smartparens :ensure t
  :diminish smartparens-mode
  :bind (:map smartparens-mode-map
              ("C-M-w" . sp-copy-sexp)
              ("M-<delete>" . sp-unwrap-sexp)
              ("M-<backspace>" . sp-backward-unwrap-sexp)
              ("M-D" . sp-splice-sexp )
              ("M-F" . sp-forward-symbol )
              ("M-B" . sp-backward-symbol))
  :init
  (require 'smartparens-config)
  (sp-with-modes '(c-mode c++-mode)
                 (sp-local-pair "{" nil :post-handlers '(("||\n[i]" "RET"))))
  (sp-local-pair 'c++-mode "/*" "*/"
                 :post-handlers '((" | " "SPC")
                                  ("* ||\n[i]" "RET")))
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  :config
  (set-face-attribute 'show-paren-match nil
                      :weight 'extra-bold
                      :underline "yellow"
                      :foreground "gold"
                      :background nil))

;; (viz) volatile-highlights
(use-package volatile-highlights :ensure t
  :diminish volatile-highlights-mode
  :config
  (set-face-attribute 'vhl/default-face nil
                      :underline "light slate gray")
  (volatile-highlights-mode t))

(use-package rainbow-delimiters :ensure t :defer t
  :init (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(provide 'init-essentials-common)