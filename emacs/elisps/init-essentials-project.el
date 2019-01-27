;;; init-essentials-project.el --- project configurations  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; project configurations

;;; Code:
;; (project) projectile
(use-package projectile
  :hook (after-init . projectile-mode)
  :init
  (setq projectile-cache-file
        (expand-file-name "projectile.cache" bk:local-directory))
  (setq projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" bk:local-directory))
  :config
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-completion-system           'ivy
        projectile-switch-project-action       #'projectile-dired
        projectile-find-dir-includes-top-level t)
  (setq projectile-mode-line-prefix " Prj")
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".ccls")
                projectile-project-root-files-top-down-recurring))
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
  (projectile-register-project-type 'cmake
                                    '("CMakeLists.txt")
                                    :compilation-dir "build"
                                    :configure "cmake %s"
                                    :compile "cmake --build . -- -j8"
                                    :test "ctest")
  )

;; (project) counsel-projectile
(use-package counsel-projectile
  :after  projectile
  :commands (counsel-projectile-mode)
  :init
  (counsel-projectile-mode)
  :config
  (counsel-projectile-modify-action
   'counsel-projectile-switch-project-action
   '((add ("r" counsel-projectile-switch-project-by-name "open project root dir") 1))))

(provide 'init-essentials-project)
;;; init-essentials-project.el ends here
