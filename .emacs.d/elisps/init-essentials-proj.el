;;; init-essentials-proj.el -- project configs
;;; Commentary:

;;; Code:
;; projectile
(use-package projectile
  :ensure t
  :commands (projectile-mode)
  :init
  (add-hook 'after-init-hook 'projectile-mode)
  :config
  (setq projectile-completion-system 'ivy)
  (setq projectile-find-dir-includes-top-level t)
  (setq projectile-mode-line
        '(:eval (format " Prj[%s]" (projectile-project-name))))
  ;; (setq projectile-switch-project-action
  ;;       '(lambda()
  ;;          (progn
  ;;            (projectile-dired))))
  (setq projectile-cache-file
        (expand-file-name "projectile.cache" bk:temp-directory))
  (setq projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" bk:temp-directory))
  (setq projectile-other-file-alist
        '(("cpp" "h" "hpp" "ipp")
          ("ipp" "h" "hpp" "cpp")
          ("hpp" "h" "ipp" "cpp")
          ("cxx" "h" "hxx" "ixx")
          ("ixx" "h" "hxx" "cxx")
          ("hxx" "h" "ixx" "cxx")
          ("c" "h")
          ("m" "h")
          ("mm" "h")
          ("h" "c" "cc" "cpp" "ipp" "hpp" "cxx" "ixx" "hxx" "m" "mm")
          ("cc" "h" "hh")
          ("hh" "cc" "cpp")
          ("vert" "frag")
          ("frag" "vert")
          (nil "lock" "gpg")
          ("lock" "")
          ("gpg" ""))))

(use-package counsel-projectile
  :ensure t
  :after projectile
  :commands (counsel-projectile-mode)
  :init
  (counsel-projectile-mode))

(provide 'init-essentials-proj)
;;; init-essentials-proj.el ends here
