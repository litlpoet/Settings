;; projectile
(use-package projectile :ensure t :defer t
  :commands (projectile-mode)
  :init
  (setq projectile-mode-line
        '(:eval (format " Prj[%s]" (projectile-project-name))))
  (setq projectile-switch-project-action 'projectile-dired)
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
  (projectile-mode)
  :config
  (use-package helm-projectile :ensure t :defer t
    :commands (helm-projectile-on)
    :init (helm-projectile-on)))

(provide 'init-essentials-proj)
