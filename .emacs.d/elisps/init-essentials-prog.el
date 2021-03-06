;;; init-essentials-prog.el -- common programming
;;; Commentary:

;;; Code:

;; [built-in] prog-mode
(use-package prog-mode
  :hook (prog-mode . prettify-symbols-mode))

;; yasnippet
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :hook (after-init . yas-global-mode))

;; company
(use-package company
  :ensure t
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

;; fly-check
(use-package flycheck
  :ensure t
  :hook (after-init . global-flycheck-mode)
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
                  c/c++-cppcheck)))

;; flycheck-popup-tip
(use-package flycheck-popup-tip
  :ensure t
  :after (flycheck)
  :hook (flycheck-mode . flycheck-popup-tip-mode))

;; magit
(use-package magit
  :ensure t
  :bind (("C-c s" . magit-status))
  :init
  (setq magit-completing-read-function 'ivy-completing-read)
  :config
  (set-face-attribute 'magit-diff-file-heading nil
                      :inverse-video t
                      :weight 'extra-bold))

;; diff-hl-mode
(use-package diff-hl
  :ensure t
  :hook ((after-init         . global-diff-hl-mode)
         (dired-mode         . diff-hl-dired-mode)
         (magit-post-refresh . diff-hl-magit-post-refresh)))

;; clean-aindent-mode
(use-package clean-aindent-mode
  :ensure t
  :hook (prog-mode))

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

;; zeal docset
(use-package zeal-at-point
  :ensure t
  :bind (("C-c z" . zeal-at-point))
  :config
  (add-to-list 'zeal-at-point-mode-alist
               '(c++-mode . ("cpp" "qt5" "gl4"))))

(provide 'init-essentials-prog)
;;; init-essentials-prog ends here
