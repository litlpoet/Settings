;;; init-languages-base.el -- common programming
;;; Commentary:

;;; Code:
(use-package clean-aindent-mode :hook (prog-mode))

(use-package lsp-mode
  :init
  (setq lsp-session-file (expand-file-name "lsp-session" bk:local-directory)
        lsp-prefer-flymake nil))

(use-package lsp-ui
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

(use-package yasnippet
  :hook ((prog-mode text-mode) . yas-minor-mode-on)
  :init (setq yas-verbosity 2))

(use-package yasnippet-snippets :after (yasnippet))

(use-package company
  :hook ((prog-mode text-mode) . company-mode)
  :init
  (setq company-backends
        '(company-capf
          company-files
          (company-dabbrev-code company-keywords)
          company-dabbrev)))

(use-package company-lsp
  :after (company)
  :config
  (setq company-lsp-cache-candidates nil))

(use-package flycheck
  :hook (prog-mode . flycheck-mode)
  :config
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (setq-default flycheck-disabled-checkers
                '(c/c++-clang
                  c/c++-gcc
                  c/c++-cppcheck)))

(use-package flycheck-popup-tip
  :after (flycheck)
  :hook (flycheck-mode . flycheck-popup-tip-mode))

(use-package magit
  :init (setq magit-completing-read-function 'ivy-completing-read)
  :config
  (set-face-attribute 'magit-diff-file-heading nil
                      :inverse-video t
                      :weight 'extra-bold))

(use-package zeal-at-point
  :config
  (add-to-list 'zeal-at-point-mode-alist
               '(c++-mode . ("cpp" "qt5" "gl4"))))

(provide 'init-languages-base)
;;; init-languages-base.el ends here
