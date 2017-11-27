;;; init-essentials-prog-cpp.el --- setup for cpp mode
;;; Commentary:

;;; Code:
(use-package cc-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))

;; modern c++ font-lock
(use-package modern-cpp-font-lock
  :ensure t)

;; google-c-style
(use-package google-c-style
  :ensure t
  :commands (google-set-c-style google-make-newline-indent)
  :init
  (add-hook 'c-mode-common-hook 'google-set-c-style)
  (add-hook 'c-mode-common-hook 'google-make-newline-indent))

;; clang-format
(use-package clang-format
  :ensure t
  :bind (:map c-mode-base-map
              ("C-c C-f" . clang-format-buffer))
  :init
  (defun bk:clang-format-before-save()
    (interactive)
    (when (or (eq major-mode 'c-mode)
              (eq major-mode 'c++-mode)
              (eq major-mode 'glsl-mode))
      (clang-format-buffer)))
  (add-hook 'before-save-hook 'bk:clang-format-before-save))

;; cmake-font-lock
(use-package cmake-font-lock
  :ensure t
  :commands (cmake-font-lock-activate)
  :init
  (defun bk:company-cmake-hook()
    ;; put company-cmake to the beginning of company-backends
    (setq-local company-idle-delay nil)
    ;; Also, dabbrev in comments and strings is nice.
    (setq-local company-dabbrev-code-everywhere t)
    ;; remove a bunch of backends that interfere in cmake mode.
    (setq-local company-backends '(company-cmake
                                   company-capf
                                   company-files)))
  (add-hook 'cmake-mode-hook 'cmake-font-lock-activate)
  (add-hook 'cmake-mode-hook 'bk:company-cmake-hook))

;; rtags
(use-package rtags
  :commands (rtags-enable-standard-keybindings)
  :init
  (setq
   rtags-autostart-diagnostics               t
   rtags-other-window-window-size-percentage 50
   rtags-jump-to-first-match                 nil
   rtags-use-filename-completion             nil
   rtags-display-result-backend              'ivy)
  (rtags-enable-standard-keybindings c-mode-base-map)
  (use-package company-rtags
    :ensure t
    :defer t
    :if (not bk:use-irony)
    :init
    (setq rtags-completions-enabled               t
          company-rtags-begin-after-member-access nil)
    (defun bk:company-rtags-hook()
      ;; put company-rtags to the beginning of company-backends
      (setq-local company-idle-delay nil)
      ;; dabbrev in comments and strings
      (setq-local company-dabbrev-code-everywhere t)
      ;; remove a bunch of backends that interfere in C/C++ mode.
      (setq-local company-backends '(company-rtags)))
    (add-hook 'c-mode-common-hook 'bk:company-rtags-hook)))

;; irony-mode
(use-package irony
  :ensure t
  :if bk:use-irony
  :commands (irony-mode
             irony-completion-at-point-async
             irony-install-server)
  :init
  (defun bk:irony-mode-hook()
    (define-key irony-mode-map
      [remap completion-at-point] 'counsel-irony)
    (define-key irony-mode-map
      [remap complete-symbol] 'counsel-irony)
    (irony-cdb-autosetup-compile-options))
  (add-hook 'irony-mode-hook 'bk:irony-mode-hook)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'c-mode-hook
            '(lambda()
               (unless (derived-mode-p 'glsl-mode) (irony-mode))))
  :config
  (use-package company-irony
    :ensure t
    :commands (company-irony)
    :init
    (defun bk:company-irony-hook()
      (setq-local company-idle-delay              0.3)
      (setq-local company-dabbrev-code-everywhere t)
      (setq-local company-backends
                  '((company-irony company-yasnippet)
                    company-capf company-files
                    (company-dabbrev-code company-keywords)
                    company-dabbrev)))
    (add-hook 'irony-mode-hook 'bk:company-irony-hook))
  (use-package flycheck-irony
    :ensure t
    :commands (flycheck-irony-setup)
    :init
    (flycheck-irony-setup)
    (add-hook 'irony-mode-hook
              '(lambda() (flycheck-select-checker 'irony)))
    ;; :config
    ;; (use-package flycheck-google-cpplint
    ;;   :ensure t
    ;;   :config
    ;;   (flycheck-add-next-checker
    ;;    'irony '(warning . c/c++-googlelint)))
    ;;   )
    ))

;; cmake-ide
;; (use-package cmake-ide :ensure t
;;   :commands (cmake-ide-setup)
;;   :init (cmake-ide-setup))

(provide 'init-essentials-prog-cpp)
;;; init-essentials-prog-cpp.el ends here
