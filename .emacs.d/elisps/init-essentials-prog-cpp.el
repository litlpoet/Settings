;;; init-essentials-prog-cpp.el --- setup for cpp mode
;;; Commentary:

;;; Code:
(use-package cc-mode
  :mode ("\\.h\\'" . c++-mode))

;; modern c++ font-lock
(use-package modern-cpp-font-lock
  :ensure t
  :hook (c++-mode . modern-c++-font-lock-mode))

;; google-c-style
(use-package google-c-style
  :ensure t
  :hook ((c-mode-common . google-set-c-style)
         (c-mode-common . google-make-newline-indent)))

;; clang-format
(use-package clang-format
  :ensure t
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
  :ensure t
  :defer t
  :hook (cmake-mode . (lambda()
                        (progn
                          (setq-local company-idle-delay              nil)
                          (setq-local company-dabbrev-code-everywhere t)
                          (setq-local company-backends '(company-cmake
                                                         company-capf
                                                         company-files))))))

;; cmake-font-lock
(use-package cmake-font-lock
  :ensure t
  :commands (cmake-font-lock-activate)
  :hook (cmake-mode . (lambda() (progn
                              (cmake-font-lock-activate)
                              (font-lock-refresh-defaults)))))

;; (use-package function-args
;;   :ensure t
;;   :hook (after-init . fa-config-default))

;; (use-package flycheck-google-cpplint
;;   :ensure t
;;   :config
;;   (flycheck-add-next-checker
;;    'irony '(warning . c/c++-googlelint)))
;;   )

;; cmake-ide
;; (use-package cmake-ide :ensure t
;;   :commands (cmake-ide-setup)
;;   :init (cmake-ide-setup))

(provide 'init-essentials-prog-cpp)
;;; init-essentials-prog-cpp.el ends here
