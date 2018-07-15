;;; init-essentials-prog-py.el --- Summary;
;;; Commentary:

;;; Code:
(use-package elpy
  :ensure t
  :hook ((after-init . elpy-enable)
         (elpy-mode . flycheck-mode))
  :config
  (setq elpy-rpc-backend "jedi")
  (setq elpy-modules
        (delq 'elpy-module-flymake elpy-modules))
  ;; (pyvenv-activate "~/dev/pyvenv/py3.6")
  )

(provide 'init-essentials-prog-py)
;;; init-essentials-prog-py.el ends here
