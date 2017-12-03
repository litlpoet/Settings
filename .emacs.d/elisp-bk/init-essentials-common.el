;;; init-essentials-common.el -- common packages
;;; Commentary:

;;; Code:
;; (edit) iedit
(use-package iedit
  :ensure t
  :bind (("C-;" . iedit-mode)
         ("C-:" . iedit-mode-toggle-on-function))
  :config (set-face-inverse-video 'iedit-occurrence t))

;; (edit) expand-region
(use-package expand-region
  :ensure t
  :bind   ("M-2" . er/expand-region))

;; (edit) duplicate-thing
(use-package duplicate-thing
  :ensure t
  :bind   ("M-c" . duplicate-thing))

;; (edit) multiple-cursors
(use-package multiple-cursors
  :ensure t
  :bind (("M-4" . mc/mark-next-like-this)
         ("M-3" . mc/mark-previous-like-this)
         ("M-$" . mc/skip-to-next-like-this)
         ("M-#" . mc/skip-to-previous-like-this)))

;; (edit) hungry-delete
(use-package hungry-delete
  :ensure   t
  :diminish hungry-delete-mode
  :commands (global-hungry-delete-mode)
  :init     (global-hungry-delete-mode))

;; (edit) aggresive-indent
(use-package aggressive-indent
  :ensure   t
  :diminish aggressive-indent-mode
  :commands (aggressive-indent-mode)
  :init
  (add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode))

;; (edit) smartparens
(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :bind (:map
         smartparens-mode-map
         ("C-M-w"         . sp-copy-sexp)
         ("M-<delete>"    . sp-unwrap-sexp)
         ("M-<backspace>" . sp-backward-unwrap-sexp)
         ("M-D"           . sp-splice-sexp)
         ("M-F"           . sp-forward-symbol)
         ("M-B"           . sp-backward-symbol))
  :init
  (require 'smartparens-config)
  (sp-with-modes '(c-mode c++-mode)
    (sp-local-pair "{" nil
                   :post-handlers '(("||\n[i]" "RET"))))
  (sp-local-pair 'c++-mode "/*" "*/"
                 :post-handlers '((" | " "SPC")
                                  ("* ||\n[i]" "RET")))
  (smartparens-global-mode t)
  (show-smartparens-global-mode t)
  :config
  (set-face-attribute 'show-paren-match nil
                      :weight     'extra-bold
                      :underline  "yellow"
                      :foreground "gold"
                      :background nil))

;; (edit) undo-tree
(use-package undo-tree
  :ensure t
  :diminish undo-tree-mode
  :commands (global-undo-tree-mode)
  :bind ("C-?" . undo-tree-redo)
  :init
  (add-hook 'after-init-hook '(lambda() (global-undo-tree-mode 1))))

;; (viz) volatile-highlights
(use-package volatile-highlights
  :ensure t
  :diminish volatile-highlights-mode
  :commands (volatile-highlights-mode)
  :init
  (add-hook 'after-init-hook '(lambda() (volatile-highlights-mode t)))
  :config
  (set-face-attribute 'vhl/default-face nil
                      :underline "light slate gray"))

;; ;; (viz) anzu
;; (use-package anzu
;;   :ensure t
;;   :commands (global-anzu-mode)
;;   :diminish anzu-mode
;;   :init
;;   (add-hook 'after-init-hook '(lambda() (global-anzu-mode +1))))

;; (viz) rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :commands (rainbow-delimiters-mode)
  :init
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; ;; (viz) highlight-indent-guides
;; (use-package highlight-indent-guides
;;   :ensure t
;;   :commands (highlight-indent-guides-mode)
;;   :init
;;   (add-hook 'prog-mode-hook #'highlight-indent-guides-mode)
;;   :config
;;   (setq highlight-indent-guides-method 'column))

(provide 'init-essentials-common)
;;; init-essentials-common.el ends here
