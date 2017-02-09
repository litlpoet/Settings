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

;; rtags
(use-package rtags
  :load-path "/usr/local/share/emacs/site-lisp/rtags/"
  :commands rtags-enable-standard-keybindings
  :init
  (setq
   rtags-other-window-window-size-percentage 50
   rtags-jump-to-first-match                 nil
   rtags-use-filename-completion             nil)
  (rtags-enable-standard-keybindings c-mode-base-map)
  (use-package company-rtags :defer t
    :init
    (setq
     rtags-autostart-diagnostics t
     rtags-completions-enabled   t)
    (defun company-rtags-hook()
      ;; put company-rtags to company-backends
      ;; We want a slight delay completions from company.
      (set (make-local-variable 'company-idle-delay) 0.1)
      ;; Also, dabbrev in comments and strings is nice.
      (set (make-local-variable 'company-dabbrev-code-everywhere) t)
      ;; Add our own backend and remove a bunch of backends that
      ;; interfere in C/C++ mode.
      (set
       (make-local-variable 'company-backends)
       (cons 'company-rtags
             (delq 'company-bbdb
                   (delq 'company-nxml
                         (delq 'company-css
                               (mapcar #'identity company-backends)))))))
    (add-hook 'c-mode-common-hook 'company-rtags-hook)))

(provide 'init-essentials-prog-cpp)
