;;; init-languages-cpp.el --- setup for cpp mode
;;; Commentary:

;;; Code:
(use-builtin cc-mode
  :mode ("\\.h\\'" . c++-mode))

;; modern c++ font-lock
(use-package modern-cpp-font-lock
  :hook (c++-mode . modern-c++-font-lock-mode)
  :blackout t)

;; google-c-style
(use-package google-c-style
  :straight (:type git :host github :repo "google/styleguide" :branch "gh-pages")
  :hook ((c-mode-common . google-set-c-style)
         (c-mode-common . google-make-newline-indent)))

;; clang-format
(use-package clang-format
  :after (cc-mode)
  :bind (:map c-mode-base-map
              ("C-c C-f" . clang-format-buffer))
  :hook (before-save . (lambda()
                         (when (or (eq major-mode 'c-mode)
                                   (eq major-mode 'c++-mode)
                                   (eq major-mode 'glsl-mode))
                           (clang-format-buffer)))))

;; cmake-mode
(use-package cmake-mode
  :hook (cmake-mode . (lambda()
                        (progn
                          (setq-local company-idle-delay              nil)
                          (setq-local company-dabbrev-code-everywhere t)
                          (setq-local company-backends '(company-cmake
                                                         company-capf
                                                         company-files))))))

;; cmake-font-lock
(use-package cmake-font-lock
  :commands (cmake-font-lock-activate)
  :hook
  (cmake-mode . (lambda() (progn
                        (cmake-font-lock-activate)
                        (font-lock-refresh-defaults)))))

;; ccls
(use-package ccls
  :hook (c-mode-common . (lambda()
                           (progn
                             (condition-case nil
                                 (lsp)
                               (user-error nil))
                             (setq-local company-idle-delay 0.3)
                             (setq-local company-dabbrev-code-everywhere t)
                             (setq-local company-backends
                                         '(company-lsp
                                           ;; (company-lsp company-yasnippet)
                                           company-capf company-files)))))
  :init
  (setq ccls-extra-args '("--log-file=/home/bk/.cache/ccls/ccls.log")
        ccls-extra-init-params '(:index (:comments 2) :completion (:detailedLabel t))))

(use-package glsl-mode)

(provide 'init-languages-cpp)
;;; init-languages-cpp.el ends here
