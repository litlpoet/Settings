;;; init-essentials-base.el -- common packages
;;; Commentary:

;;; Code:
(use-package duplicate-thing)

(use-package expand-region)

(use-package iedit :config (set-face-inverse-video 'iedit-occurrence t))

(use-package restart-emacs)

(use-package multiple-cursors
  :init
  (setq mc/list-file (expand-file-name
                      (convert-standard-filename "mc-lists.el")
                      bk:local-directory)))

(use-package smartparens
  :hook ((prog-mode . smartparens-mode)
         (prog-mode . show-smartparens-mode))
  :config
  (require 'smartparens-config)
  (sp-with-modes '(c-mode c++-mode)
    (sp-local-pair "{" nil
                   :post-handlers '(("||\n[i]" "RET"))))
  (sp-local-pair 'c++-mode "/*" "*/"
                 :post-handlers '((" | " "SPC")
                                  ("* ||\n[i]" "RET")))
  (set-face-attribute 'show-paren-match nil
                      :weight     'extra-bold
                      :underline  "yellow"
                      :foreground "gold"
                      :background nil))

(use-package undo-tree :init (global-undo-tree-mode))

(use-package amx
  ;; counsel-M-x will automatically handle amx to load
  :init
  (setq amx-save-file (expand-file-name
                       (convert-standard-filename "amx-items")
                       bk:local-directory)))

(use-package ivy
  :init
  (setq ivy-height                  15
        ivy-fixed-height-minibuffer t
        ivy-initial-inputs-alist    nil
        ivy-format-function         #'ivy-format-function-line
        ivy-use-virtual-buffers     t
        ivy-count-format            "(%d/%d) ")
  (ivy-mode))

(use-package ivy-xref
  :after (ivy)
  :demand t
  :init (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(use-package ivy-hydra
  :after (ivy hydra)
  :demand t)

(use-package counsel :init (counsel-mode t))

(provide 'init-essentials-base)
;;; init-essentials-base.el ends here
