;;; init-essentials-prog-py.el --- Summary;
;;; Commentary:

;;; Code:
(use-package elpy
  :ensure t
  :hook (after-init . elpy-enable)
  :config
  (setq elpy-modules
        (delq 'elpy-module-flymake elpy-modules)))

(provide 'init-essentials-prog-py)
;;; init-essentials-prog-py.el ends here
