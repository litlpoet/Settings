;;; init-essentials-navi.el -- navigations
;;; Commentary:

;;; Code:
;; (navi) ivy / swiper / counsel
(use-package ivy
  :ensure t
  :diminish ivy-mode
  :commands (ivy-mode)
  :bind ("C-c C-r" . ivy-resume)
  :init
  (setq ivy-use-virtual-buffers t
        ivy-count-format        "(%d/%d) ")
  (add-hook 'after-init-hook
            '(lambda() (ivy-mode 1))))

;; (navi) ivy / swiper / counsel
(use-package counsel
  :ensure t
  :bind (("C-r"     . counsel-grep-or-swiper)
         ("C-s"     . counsel-grep-or-swiper)
         ("M-x"     . counsel-M-x)
         ("C-x C-f" . counsel-find-file)
         ("C-c g"   . counsel-git)
         ("C-c j"   . counsel-git-grep)
         ("C-c k"   . counsel-ag)
         ("C-x l"   . counsel-locate)
         ("M-y"     . counsel-yank-pop)
         ("C-h v"   . counsel-describe-variable)
         ("C-h f"   . counsel-describe-function)))

;; (navi) ace-window
(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)
         ("C-x 1" . ace-delete-window)))

;; (navi) avy
;; (use-package avy
;;   :ensure t
;;   :bind ("C-c j" . avy-goto-word-or-subword-1))

;; (navi) which-key
(use-package which-key
  :ensure t
  :diminish which-key-mode
  :commands (which-key-mode)
  :init
  (add-hook 'after-init-hook
            '(lambda() (which-key-mode))))

;; (navi) sublimity
;; (use-package sublimity
;;   :ensure t
;;   :commands (sublimity-mode)
;;   :init
;;   (use-package sublimity-map
;;     :init
;;     (setq sublimity-map-size        20
;;           sublimity-map-fraction    0.3
;;           sublimity-map-text-scale -7))
;;   (add-hook 'prog-mode-hook
;;             '(lambda()
;;                (sublimity-mode 1))))

;; (use-package neotree
;;   :ensure t
;;   :bind ([f8] . neotree-toggle)
;;   :init
;;   (setq neo-theme             'ascii
;;         neo-window-width      30
;;         neo-smart-open        t
;;         neo-show-hidden-files t))

;; ;; (navi) helm
;; (use-package helm
;;   :ensure t
;;   :diminish helm-mode
;;   :bind (("C-c h"   . helm-command-prefix)
;;          ("C-x b"   . helm-mini)
;;          ("C-x f"   . helm-multi-files)
;;          ("C-x C-f" . helm-find-files)
;;          ("M-x"     . helm-M-x)
;;          ("M-y"     . helm-show-kill-ring)
;;          :map helm-map
;;          ("<tab>" . helm-execute-persistent-action)
;;          ("C-i"   . helm-execute-persistent-action)
;;          ("C-z"   . helm-select-action))
;;   :init
;;   (require 'helm-config)
;;   :config
;;   (helm-autoresize-mode t)
;;   (setq
;;    helm-split-window-in-side-p           t
;;    helm-split-window-default-side        'below
;;    helm-move-to-line-cycle-in-source     t
;;    helm-ff-search-library-in-sexp        t
;;    helm-scroll-amount                    1
;;    helm-ff-file-name-history-use-recentf t
;;    helm-M-x-fuzzy-match                  t
;;    helm-buffers-fuzzy-matching           t
;;    helm-recentf-fuzzy-match              t)
;;   (helm-mode 1))

;; ;; (navi) helm-descbinds
;; (use-package helm-descbinds
;;   :ensure t
;;   :bind ("C-h b" . helm-descbinds)
;;   :init (fset 'describe-bindings 'helm-descbinds))

;; ;; (navi) helm-ls-git
;; (use-package helm-ls-git
;;   :ensure t
;;   :bind ("C-x C-d" . helm-browse-project))

;; ;; (navi) helm-ag
;; (use-package helm-ag
;;   :ensure t
;;   :defer t
;;   :init
;;   (setq helm-ag-insert-at-point 'symbol))

;; ;; (navi) helm-swoop
;; (use-package helm-swoop
;;   :ensure t
;;   :bind
;;   ("C-c h C-s" . helm-swoop))

(provide 'init-essentials-navi)
;;; init-essentials-navi.el ends here
