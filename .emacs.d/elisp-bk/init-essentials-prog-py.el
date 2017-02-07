;; elpy
(use-package elpy :ensure t
  :commands (elpy-enable)
  :init
  (elpy-enable)
  :config
  (setq elpy-modules
        (delq 'elpy-module-flymake elpy-modules)))

(provide 'init-essentials-prog-py)
