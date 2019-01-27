;;; init-essentials-prog-py.el --- Summary;
;;; Commentary:

;;; Code:

;; (use-package elpy
;;   :straight t
;;   :hook ((after-init . elpy-enable)
;;          (elpy-mode . flycheck-mode))
;;   :config
;;   (setq elpy-rpc-backend "jedi")
;;   (setq elpy-modules
;;         (delq 'elpy-module-flymake elpy-modules))
;;   ;; (pyvenv-activate "~/dev/pyvenv/py36")
;;   )

;; (use-package pyvenv
;;   :straight t
;;   :commands (pyvenv-activate))

(use-package virtualenvwrapper
  :straight t
  :commands (venv-initialize-interactive-shells)
  :hook (after-init . (lambda()
                        (progn
                          (venv-initialize-interactive-shells))))
  :init
  (setq venv-location "/home/bk/dev/pyvenvs/"))

(use-package lsp-python
  :straight t
  :commands (lsp-python-enable)
  :hook (python-mode . (lambda()
                         (progn
                           (condition-case nil
                               (lsp-python-enable)
                             (user-error nil))
                           (setq-local company-idle-delay 0.3)
                           (setq-local company-backends
                                       '((company-lsp company-yasnippet)
                                         company-capf company-files)))))
  :config
  (setq lsp-python-use-init-for-project-root t))

(provide 'init-essentials-prog-py)
;;; init-essentials-prog-py.el ends here
