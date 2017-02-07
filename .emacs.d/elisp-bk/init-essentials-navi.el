;; (navi) helm
(use-package helm :defer t :ensure t
  :init
  (use-package helm-config
    :demand t
    :bind (("C-c h"   . helm-command-prefix)
           ("C-x b"   . helm-mini)
           ("C-x f"   . helm-multi-files)
           ("C-x C-f" . helm-find-files)
           ("M-x"     . helm-M-x)
           ("M-y"     . helm-show-kill-ring)
           :map helm-map
           ("<tab>" . helm-execute-persistent-action)
           ("C-i"   . helm-execute-persistent-action)
           ("C-z"   . helm-select-action))
    :config
    (use-package helm-mode
      :diminish helm-mode
      :init
      (helm-mode 1))
    (helm-autoresize-mode t)
    (setq
     helm-split-window-in-side-p           t
     helm-move-to-line-cycle-in-source     t
     helm-ff-search-library-in-sexp        t
     helm-scroll-amount                    1
     helm-ff-file-name-history-use-recentf t
     helm-M-x-fuzzy-match                  t
     helm-buffers-fuzzy-matching           t
     helm-recentf-fuzzy-match              t)))

;; (navi) helm-descbinds
(use-package helm-descbinds :ensure t
  :bind ("C-h b" . helm-descbinds)
  :init (fset 'describe-bindings 'helm-descbinds))

;; (navi) helm-ls-git
(use-package helm-ls-git :ensure t
  :bind ("C-x C-d" . helm-browse-project))

;; (navi) ace-window
(use-package ace-window :ensure t
  :bind ("C-x o" . ace-window))

;; (navi) avy
(use-package avy :ensure t
  :bind ("C-c j" . avy-goto-word-or-subword-1))

;; (navi) which-key
(use-package which-key :ensure t
  :diminish which-key-mode
  :config (which-key-mode))

(provide 'init-essentials-navi)
