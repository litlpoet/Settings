;;; init-essentials-project.el --- project configurations  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; project configurations

;;; Code:
(use-package projectile
  :init
  (setq projectile-cache-file
        (expand-file-name "projectile.cache" bk:local-directory)
        projectile-known-projects-file
        (expand-file-name "projectile-bookmarks.eld" bk:local-directory))
  (projectile-mode)
  :config
  (setq projectile-completion-system           'ivy
        projectile-switch-project-action       #'projectile-dired
        projectile-find-dir-includes-top-level t
        projectile-mode-line-prefix            " Prj"
        projectile-sort-order                  'recently-active
        projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".ccls")
                projectile-project-root-files-top-down-recurring)
        projectile-globally-ignored-directories
        (append projectile-globally-ignored-directories
                (list ".ccls-cache" "build")))
  (when (executable-find "fd")
    (setq projectile-git-command "fd . --type f -0 -H -E .git"
          projectile-generic-command projectile-git-command))
  (projectile-register-project-type 'cmake
                                    '("CMakeLists.txt")
                                    :compilation-dir "build"
                                    :configure "cmake %s"
                                    :compile "cmake --build . -- -j8"
                                    :test "ctest"))

(use-package counsel-projectile
  :after  projectile
  :init
  (counsel-projectile-mode)
  :config
  (counsel-projectile-modify-action
   'counsel-projectile-switch-project-action
   '((add ("r" counsel-projectile-switch-project-by-name "open project root dir") 1))))

(provide 'init-essentials-project)
;;; init-essentials-project.el ends here
