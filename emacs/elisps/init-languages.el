;;; init-languages.el -- common programming
;;; Commentary:

;;; Code:

;; lsp / lsp-ui
(use-package lsp-mode
  :commands (lsp)
  :init
  (setq lsp-session-file (expand-file-name "lsp-session" bk:local-directory)
        lsp-prefer-flymake nil))

(use-package lsp-ui
  :commands (lsp-ui-mode)
  :init
  (setq lsp-ui-sideline-delay            1
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-show-flycheck    nil
        lsp-ui-sideline-show-symbol      nil)
  :config
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
  :hook ((prog-mode text-mode) . yas-minor-mode-on)
  :init
  (setq yas-verbosity 2)
  :blackout yas-minor-mode)

(use-package yasnippet-snippets
  :after (yasnippet))

;; company
(use-package company
  :bind ("M-i" . company-complete)
  :hook ((prog-mode text-mode) . company-mode)
  :init
  (setq company-backends
        '(company-capf
          company-files
          (company-dabbrev-code company-keywords)
          company-dabbrev))
  :blackout t)

;; company lsp
(use-package company-lsp
  :after (company)
  :commands (company-lsp)
  :config
  (setq company-lsp-cache-candidates nil))

;; fly-check
(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically
        '(save
          mode-enabled
          ;; idle-change
          )
        ;; flycheck-idle-change-delay 1.0
        )
  (setq-default flycheck-disabled-checkers
                '(c/c++-clang
                  c/c++-gcc
                  c/c++-cppcheck)))

;; flycheck-popup-tip
(use-package flycheck-popup-tip
  :after (flycheck)
  :hook (flycheck-mode . flycheck-popup-tip-mode))

;; magit
(use-package magit
  :bind (("C-c s" . magit-status))
  :init
  (setq magit-completing-read-function 'ivy-completing-read)
  :config
  (set-face-attribute 'magit-diff-file-heading nil
                      :inverse-video t
                      :weight 'extra-bold))

;; clean-aindent-mode
(use-package clean-aindent-mode
  :hook (prog-mode))

;; zeal docset
(use-package zeal-at-point
  :bind (("C-c z" . zeal-at-point))
  :config
  (add-to-list 'zeal-at-point-mode-alist
               '(c++-mode . ("cpp" "qt5" "gl4"))))

;; personal implementation
(use-builtin impl-autoinsert
  :after (autoinsert))

(provide 'init-languages)
;;; init-languages ends here
