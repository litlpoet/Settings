;; google-c-style
(use-package google-c-style :ensure t
  :commands (google-set-c-style google-make-newline-indent)
  :init
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent))

;; clang-format
(use-package clang-format :ensure t
  :bind (:map c-mode-base-map
              ("C-c C-f" . clang-format-buffer))
  :init
  (defun bk:clang-format-before-save()
    (interactive)
    (when (or (eq major-mode 'c-mode)
              (eq major-mode 'c++-mode)
              (eq major-mode 'glsl-mode))
      (clang-format-buffer)))
  (add-hook 'before-save-hook 'bk:clang-format-before-save)
  :config
  (setq-default clang-format-style "Google"))

;; cmake-font-lock
(use-package cmake-font-lock :ensure t
  :commands (cmake-font-lock-activate)
  :init (add-hook 'cmake-mode-hook 'cmake-font-lock-activate))

(provide 'init-essentials-prog-cpp)
