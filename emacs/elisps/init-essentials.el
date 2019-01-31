;;; init-essentials.el -- common packages
;;; Commentary:

;;; Code:
(use-package iedit
  :config (set-face-inverse-video 'iedit-occurrence t))

(use-package expand-region)

(use-package duplicate-thing)

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
                      :background nil)
  :blackout t)

(use-package undo-tree
  :hook (after-init . global-undo-tree-mode)
  :blackout t)

;; (display) shackle
(use-package shackle
  :hook (after-init . shackle-mode)
  :init
  (setq
   shackle-rules
   '((direx:direx-mode
      :other t :align left  :size 0.25 :select t :inhibit-window-quit nil)
     (compilation-mode
      :other t :align below :size 0.30 :select t :inhibit-window-quit nil)
     ("*system-packages*"
      :other t :align below :size 0.30 :select t :inhibit-window-quit nil)
     ("*Help*"
      :other t :align below :size 0.30 :select t :inhibit-window-quit nil))))

(use-package ivy
  :hook (after-init . ivy-mode)
  :init
  (setq ivy-use-virtual-buffers t
        ivy-count-format        "(%d/%d) ")
  :blackout t)

(use-package ivy-xref
  :demand t
  :after (ivy)
  :init
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(use-package ivy-hydra
  :demand t
  :after (ivy hydra))

(use-package counsel
  :hook (after-init . (lambda() (counsel-mode t)))
  :blackout t)

(use-package ace-window
  :config
  (set-face-attribute
   'aw-leading-char-face nil :foreground "deep sky blue" :weight 'bold :height 2.0)
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l)))

(provide 'init-essentials)
;;; init-essentials.el ends here
