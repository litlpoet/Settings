;;; init-languages-python.el --- Summary;
;;; Commentary:

;;; Code:

;; (use-package virtualenvwrapper
;;   :commands (venv-initialize-interactive-shells)
;;   :hook (after-init . (lambda()
;;                         (progn
;;                           (venv-initialize-interactive-shells))))
;;   :init
;;   (setq venv-location "/home/bk/dev/pyvenvs/"))

(use-package lsp-python
  :commands (lsp-python-enable)         ; not in the lsp-python autoloads
  :hook (python-mode
         . (lambda()
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

(provide 'init-languages-python)
;;; init-languages-python.el ends here

