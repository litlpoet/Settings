;;; init-essentials-proj.el -- project configs
;;; Commentary:

;;; Code:
;; projectile
(use-package projectile
  :ensure t
  :commands (projectile-mode)
  :init
  (setq projectile-completion-system 'ivy)
  (setq projectile-mode-line
        '(:eval (format " Prj[%s]" (projectile-project-name))))
  (setq projectile-switch-project-action
        '(lambda()
           (progn
             (projectile-dired)
             ;; (neotree-dir (projectile-project-root))
             )))
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
          ("gpg" "")))
  (add-hook 'after-init-hook 'projectile-mode)
  :config
  (use-package counsel-projectile
    :ensure t
    :commands (counsel-projectile-on)
    :init
    (counsel-projectile-on))
  )

(provide 'init-essentials-proj)
;;; init-essentials-proj.el ends here
