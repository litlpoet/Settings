;;; init-essentials-prog-cpp.el --- setup for cpp mode
;;; Commentary:

;;; Code:
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
  :init
  (defun bk:company-cmake-hook()
    ;; put company-cmake to the beginning of company-backends
    (set (make-local-variable 'company-idle-delay) 0.1)
    ;; Also, dabbrev in comments and strings is nice.
    (set (make-local-variable 'company-dabbrev-code-everywhere) t)
    ;; remove a bunch of backends that interfere in cmake mode.
    (set
     (make-local-variable 'company-backends)
     (cons 'company-cmake
           (delq 'company-nxml
                 (mapcar #'identity company-backends))))
    )
  (add-hook 'cmake-mode-hook 'cmake-font-lock-activate)
  (add-hook 'cmake-mode-hook 'bk:company-cmake-hook))

;; rtags
(use-package rtags
  :load-path "/usr/local/share/emacs/site-lisp/rtags/"
  :commands (rtags-enable-standard-keybindings)
  :init
  (setq
   rtags-autostart-diagnostics               t
   rtags-other-window-window-size-percentage 50
   rtags-jump-to-first-match                 nil
   rtags-use-filename-completion             nil)
  (rtags-enable-standard-keybindings c-mode-base-map)
  ;; (use-package company-rtags :defer t
  ;;   :init
  ;;   (setq rtags-completions-enabled   t)
  ;;   (defun bk:company-rtags-hook()
  ;;     ;; put company-rtags to the beginning of company-backends
  ;;     (set (make-local-variable 'company-idle-delay) 0.1)
  ;;     ;; dabbrev in comments and strings
  ;;     (set (make-local-variable 'company-dabbrev-code-everywhere) t)
  ;;     ;; remove a bunch of backends that interfere in C/C++ mode.
  ;;     (set
  ;;      (make-local-variable 'company-backends)
  ;;      (cons 'company-rtags
  ;;            (delq 'company-nxml
  ;;                  (mapcar #'identity company-backends)))))
  ;;   (add-hook 'c-mode-common-hook 'bk:company-rtags-hook))
  )

;; irony-mode
(use-package irony :ensure t
  :commands (irony-mode irony-completion-at-point-async)
  :init
  (defun bk:irony-mode-hook()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (add-hook 'irony-mode-hook 'bk:irony-mode-hook)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook
            '(lambda()
               (unless (derived-mode-p 'glsl-mode) (irony-mode))))
  :config
  (use-package company-irony :ensure t
    :commands (company-irony)
    :init
    (defun bk:company-irony-hook()
      (set (make-local-variable 'company-idle-delay) 0.3)
      (set (make-local-variable 'company-dabbrev-code-everywhere) t)
      ;; remove a bunch of backends that interfere in C/C++ mode.
      (set
       (make-local-variable 'company-backends)
       (cons 'company-irony
             (delq 'company-nxml
                   (mapcar #'identity company-backends)))))
    (add-hook 'c-mode-common-hook 'bk:company-irony-hook))
  (use-package flycheck-irony :ensure t
    :defer t
    :init
    (add-to-list 'flycheck-checkers 'irony)))

;; cmake-ide
(use-package cmake-ide :ensure t
  :commands (cmake-ide-setup)
  :init (cmake-ide-setup))

(provide 'init-essentials-prog-cpp)
;;; init-essentials-prog-cpp.el ends here
