;;; init-languages-cpp.el --- setup for cpp mode
;;; Commentary:

;;; Code:
(use-builtin cc-mode
  :mode ("\\.h\\'" . c++-mode))

(use-package modern-cpp-font-lock
  :hook (c++-mode . modern-c++-font-lock-mode))

(use-package google-c-style
  :straight (:type git :host github :repo "google/styleguide" :branch "gh-pages")
  :hook ((c-mode-common . google-set-c-style)
         (c-mode-common . google-make-newline-indent)))

;; (use-package clang-format
;;   :after (cc-mode)
;;   :hook (before-save . (lambda()
;;                          (when (or (eq major-mode 'c-mode)
;;                                    (eq major-mode 'c++-mode)
;;                                    (eq major-mode 'glsl-mode))
;;                            (clang-format-buffer)))))

(use-package ccls
  :hook ((c-mode-common . (lambda()
                            (progn
                              (require 'ccls)
                              (condition-case nil
                                  (lsp)
                                (user-error nil))
                              (setq-local company-idle-delay 0.3)
                              (setq-local company-dabbrev-code-everywhere t))))
         (before-save . (lambda()
                          (when (or (eq major-mode 'c-mode)
                                    (eq major-mode 'c++-mode)
                                    (eq major-mode 'glsl-mode))
                            (lsp-format-buffer)))))
  :init
  (setq ccls-args '("--log-file=/home/bk/.cache/ccls/ccls.log")
        ccls-initialization-options '(:index
                                      (:comments 2)
                                      :completion
                                      (:detailedLabel t))))


(use-package cmake-mode
  :hook (cmake-mode . (lambda()
                        (progn
                          (setq-local company-idle-delay              nil)
                          (setq-local company-dabbrev-code-everywhere t)
                          (setq-local company-backends '(company-cmake
                                                         company-capf
                                                         company-files))))))

;; (use-package cmake-font-lock
;;   :hook (cmake-mode . (lambda()
;;                         (progn
;;                           (cmake-font-lock-activate)
;;                           (font-lock-refresh-defaults)))))
(use-package cmake-font-lock
  :hook (cmake-mode . font-lock-refresh-defaults))

;; glsl
(use-package glsl-mode)

(provide 'init-languages-cpp)
;;; init-languages-cpp.el ends here
