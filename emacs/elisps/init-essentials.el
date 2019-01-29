;;; init-essentials.el -- common packages
;;; Commentary:

;;; Code:
;; (edit) iedit
(use-package iedit
  :bind (("C-;" . iedit-mode)
         ("C-:" . iedit-mode-toggle-on-function))
  :config (set-face-inverse-video 'iedit-occurrence t))

;; (edit) expand-region
(use-package expand-region
  :bind   ("M-2" . er/expand-region))

;; (edit) duplicate-thing
(use-package duplicate-thing
  :bind   ("M-c" . duplicate-thing))

;; (edit) multiple-cursors
(use-package multiple-cursors
  :init
  (setq mc/list-file (expand-file-name
                      (convert-standard-filename "mc-lists.el")
                      bk:local-directory))
  :bind (("M-4" . mc/mark-next-like-this)
         ("M-3" . mc/mark-previous-like-this)
         ("M-$" . mc/skip-to-next-like-this)
         ("M-#" . mc/skip-to-previous-like-this)))

;; (edit) hungry-delete
(use-package hungry-delete
  :hook ((emacs-lisp-mode lisp-interaction-mode) . hungry-delete-mode)
  :blackout t)

;; (edit) aggresive-indent
(use-package aggressive-indent
  :hook (emacs-lisp-mode . aggressive-indent-mode)
  :blackout t)

;;; (edit) macrostep
(use-package macrostep
  :bind ("C-c e m" . macrostep-expand))

;; (edit) smartparens
(use-package smartparens
  :bind (:map
         smartparens-mode-map
         ("C-M-w"         . sp-copy-sexp)
         ("M-<delete>"    . sp-unwrap-sexp)
         ("M-<backspace>" . sp-backward-unwrap-sexp)
         ("M-D"           . sp-splice-sexp)
         ("M-F"           . sp-forward-symbol)
         ("M-B"           . sp-backward-symbol))
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

;; (edit) undo-tree
(use-package undo-tree
  :hook (after-init . global-undo-tree-mode)
  :bind ("C-?" . undo-tree-redo)
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

;; (navi) ivy / swiper / counsel
(use-package ivy
  :hook (after-init . ivy-mode)
  :bind ("C-c C-r" . ivy-resume)
  :init
  (setq ivy-use-virtual-buffers t
        ivy-count-format        "(%d/%d) ")
  :blackout t)

;; ivy-xref
(use-package ivy-xref
  :demand t
  :after (ivy)
  :init
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

;; (navi) ivy-hydra
(use-package ivy-hydra
  :demand t
  :after (ivy hydra))

;; (navi) ivy / swiper / counsel
(use-package counsel
  :bind (("C-r"     . counsel-grep-or-swiper)
         ("C-s"     . counsel-grep-or-swiper)
         ("C-c g"   . counsel-git)
         ("C-c j"   . counsel-git-grep)
         ("C-c k"   . counsel-ag)
         ("C-c l"   . counsel-locate)
         ;; ("M-x"     . counsel-M-x)
         ;; ("M-y"     . counsel-yank-pop)
         ;; ("C-x C-f" . counsel-find-file) ;; not working after loading purpose
         ;; ("C-h v"   . counsel-describe-variable)
         ;; ("C-h f"   . counsel-describe-function)
         )
  :hook (after-init . (lambda() (counsel-mode t)))
  :blackout t)

;; (navi) ace-window
(use-package ace-window
  :bind (("C-x o" . ace-window)
         ("C-x 1" . ace-delete-window))
  :config
  (set-face-attribute
   'aw-leading-char-face nil :foreground "deep sky blue" :weight 'bold :height 2.0)
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l)))

(provide 'init-essentials)
;;; init-essentials.el ends here
