;;; init-essentials-prog.el -- common programming
;;; Commentary:

;;; Code:

;; lsp / lsp-ui
(use-package lsp-mode
  :straight t
  :commands (lsp))

(use-package lsp-ui
  :straight t
  ;; :hook (lsp-mode . lsp-ui-mode)
  :commands (lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-delay 1
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-show-flycheck nil
        lsp-ui-sideline-show-symbol nil
        ;; lsp-ui-flycheck-live-reporting nil
        )
  (set-face-attribute 'lsp-face-highlight-read nil
                      :weight     'bold
                      :underline  "green"
                      :foreground nil
                      :background nil)
  (set-face-attribute 'lsp-face-highlight-textual nil
                      :weight     'bold
                      :underline  "white"
                      :foreground nil
                      :background nil)
  (set-face-attribute 'lsp-face-highlight-write nil
                      :weight     'bold
                      :underline  "red"
                      :foreground nil
                      :background nil))

;; yasnippet
(use-package yasnippet
  :straight t
  :diminish yas-minor-mode
  :hook (after-init . yas-global-mode))

(use-package yasnippet-snippets
  :straight t
  :after (yasnippet))

;; company
(use-package company
  :straight t
  :bind ("M-i" . company-complete)
  :hook (after-init . global-company-mode)
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
          org-mode
          cmake-mode
          c-mode
          c++-mode
          python-mode)))

;; company lsp
(use-package company-lsp
  :straight t
  :after (company)
  :commands (company-lsp)
  :config
  (setq company-lsp-cache-candidates nil))

;; fly-check
(use-package flycheck
  :straight t
  :hook (after-init . global-flycheck-mode)
  :config
  (setq flycheck-global-modes
        '(emacs-lisp-mode
          python-mode
          c-mode
          c++-mode
          python-mode))
  (setq flycheck-check-syntax-automatically
        '(save mode-enabled ;; idle-change
               )
        ;; flycheck-idle-change-delay 1.0
        )
  (setq-default flycheck-disabled-checkers
                '(c/c++-clang
                  c/c++-gcc
                  c/c++-cppcheck)))

;; flycheck-popup-tip
(use-package flycheck-popup-tip
  :straight t
  :after (flycheck)
  :hook (flycheck-mode . flycheck-popup-tip-mode))

;; magit
(use-package magit
  :straight t
  :bind (("C-c s" . magit-status))
  :init
  (setq magit-completing-read-function 'ivy-completing-read)
  :config
  (set-face-attribute 'magit-diff-file-heading nil
                      :inverse-video t
                      :weight 'extra-bold))

;; diff-hl-mode
(use-package diff-hl
  :straight t
  :hook ((after-init         . global-diff-hl-mode)
         (dired-mode         . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

;; clean-aindent-mode
(use-package clean-aindent-mode
  :straight t
  :hook (prog-mode))

;; zeal docset
(use-package zeal-at-point
  :straight t
  :bind (("C-c z" . zeal-at-point))
  :config
  (add-to-list 'zeal-at-point-mode-alist
               '(c++-mode . ("cpp" "qt5" "gl4"))))

;; personal implementation
(use-package impl-autoinsert
  :after (autoinsert))

;; writeroom mode
;; (use-package writeroom-mode
;;   :ensure t
;;   :hook (after-init . global-writeroom-mode)
;;   :init
;;   (setq writeroom-major-modes
;;         '(text-mode prog-mode cmake-mode dashboard-mode Man-mode))
;;   (setq writeroom-width                   100
;;         writeroom-maximize-window         nil
;;         writeroom-extra-line-spacing      5
;;         writeroom-bottom-divider-width    0
;;         writeroom-mode-line               t
;;         writeroom-fringes-outside-margins nil)
;;   :config
;;   (setq writeroom-global-effects
;;         (delq 'writeroom-set-fullscreen writeroom-global-effects)))

(provide 'init-essentials-prog)
;;; init-essentials-prog ends here
