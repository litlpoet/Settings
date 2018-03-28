;;; init-essentials-prog-cpp.el --- setup for cpp mode
;;; Commentary:

;;; Code:
;; (use-package cc-mode
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode)))

(use-package cc-mode
  :mode ("\\.h\\'" . c++-mode))

;; modern c++ font-lock
(use-package modern-cpp-font-lock
  :ensure t)

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

;; cmake-font-lock
(use-package cmake-font-lock
  :ensure t
  :hook ((cmake-mode . cmake-font-lock-activate)
         (cmake-mode . (lambda()
                         (progn
                           (setq-local company-idle-delay              nil)
                           (setq-local company-dabbrev-code-everywhere t)
                           (setq-local company-backends '(company-cmake
                                                          company-capf
                                                          company-files)))))))

;; rtags
(use-package rtags
  :ensure t
  :after (cc-mode)
  :init
  (setq
   rtags-autostart-diagnostics               t
   rtags-other-window-window-size-percentage 50
   rtags-jump-to-first-match                 nil
   rtags-use-filename-completion             nil
   rtags-display-result-backend              'ivy)
  :config
  (rtags-enable-standard-keybindings c-mode-base-map))

(use-package ivy-rtags
  :ensure t
  :after  (rtags))

(use-package company-rtags
  :ensure t
  :if (not bk:use-irony)
  :after (rtags)
  :hook (c-mode-common . (lambda()
                           (progn
                             (setq-local company-idle-delay nil)
                             (setq-local company-dabbrev-code-everywhere t)
                             (setq-local company-backends ('company-rtags)))))
  :init
  (setq rtags-completions-enabled               t
        company-rtags-begin-after-member-access nil))

;; irony-mode
(use-package irony
  :ensure t
  :if     bk:use-irony
  :commands (irony-mode
             irony-cdb-autosetup-compile-options
             irony-install-server)
  :hook ((irony-mode . (lambda()
                         (progn
                           (define-key irony-mode-map
                             [remap completion-at-point] 'counsel-irony)
                           (define-key irony-mode-map
                             [remap comlete-symbol] 'counsel-irony)
                           (irony-cdb-autosetup-compile-options))))
         (c++mode . irony-mode)
         (c-mode . (lambda()
                     (unless (derived-mode-p 'glsl-mode)
                       (irony-mode))))))

(use-package company-irony
  :ensure t
  :after (irony)
  :commands (company-irony)
  :hook (irony-mode . (lambda() (progn
                              (setq-local company-idle-delay              0.3)
                              (setq-local company-dabbrev-code-everywhere t)
                              (setq-local company-backends
                                          '((company-irony company-yasnippet)
                                            company-capf company-files
                                            (company-dabbrev-code company-keywords)
                                            company-dabbrev))))))

(use-package flycheck-irony
  :ensure t
  :after (irony)
  :commands (flycheck-irony-setup
             flycheck-select-checker)
  :hook (irony-mode . (lambda() (flycheck-select-checker 'irony)))
  :init
  (flycheck-irony-setup))

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
