;;; bk-general.el --- general elisp                  -*- lexical-binding: t; -*-

;; Copyright (C) 2015  Byungkuk

;; Author: Byungkuk <bk@Core2Quad>
;; Keywords: lisp

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:
(defconst bk/emacs-start-time (current-time)
  "Emacs start time.")

(defconst bk/backup-directory
  (expand-file-name "tmp" user-emacs-directory)
  "The temporary directory.")

(defconst bk/auto-insert-directory
  (file-name-as-directory
   (expand-file-name "bk-inserts" user-emacs-directory))
  "The auto insert snippet directory.")

(defvar bk/init-org-message-depth 3
  "Depth of init.org headers to message at start-up.")

(defvar bk/installed_packages
  '(
    ace-window
    atom-one-dark-theme
    auctex
    avy
    cdlatex
    clang-format
    clean-aindent-mode
    cmake-font-lock
    cmake-ide
    cmake-mode
    color-theme-sanityinc-tomorrow
    company
    company-auctex
    company-c-headers
    company-irony
    company-irony-c-headers
    company-math
    dired+
    duplicate-thing
    elpy
    expand-region
    flycheck
    flycheck-google-cpplint
    flycheck-irony
    git-gutter-fringe
    gitignore-mode
    glsl-mode
    ;; god-mode
    google-c-style
    helm
    helm-ag
    helm-projectile
    hungry-delete
    ibuffer-vc
    iedit
    irony
    latex-pretty-symbols
    latex-preview-pane
    macrostep
    magit
    malinka
    markdown-mode
    material-theme
    multiple-cursors
    org
    paradox
    persp-projectile
    perspective
    projectile
    rainbow-delimiters
    recentf-ext
    rtags
    smart-mode-line
    smartparens
    sublime-themes
    undo-tree
    use-package
    volatile-highlights
    web-mode
    which-key
    yasnippet
    )
  "A list of packages to ensure are installed at lanuch.")

(require 'cl)

(defun bk/packages-installed ()
  "Check if packages are all installed."
  (loop for p in bk/installed_packages
        when (not (package-installed-p p))
        do (return nil)
        finally (return t)))

(defun bk/install-packages ()
  "Install packages in 'bk/installed_packages'."
  (unless (bk/packages-installed)
    (message "%s" "Emacs is now refreshing its package database...")
    (package-refresh-contents)
    (dolist (p bk/installed_packages)
      (when (not (package-installed-p p))
        (package-install p)))))

(defun bk/font-exists-p (font)
  "Check if FONT exists."
  (if (null (x-list-fonts font)) nil t))

(defun bk/load-init-org ()
  "Load init.org file."
  (with-temp-buffer
    (insert-file-contents
     (expand-file-name "init.org" user-emacs-directory))
    (goto-char (point-min))
    (search-forward "\n* init.el")
    (while (not (eobp))
      (forward-line 1)
      (cond
       ;; Report Headers
       ((looking-at
         (format "\\*\\{2,%s\\} +.*$"
                 bk/init-org-message-depth))
        (message "%s" (match-string 0)))
       ;; Evaluate Code Blocks
       ((looking-at "^#\\+BEGIN_SRC +emacs-lisp *$")
        (let ((l (match-end 0)))
          (search-forward "\n#+END_SRC")
          (eval-region l (match-beginning 0))))
       ;; Finish on the next level-1 header
       ((looking-at "^\\* ")
        (goto-char (point-max)))))))

(defun bk/report-emacs-boot-time ()
  "Report Emacs boot time."
  (let
      ((elapsed
        (float-time (time-subtract (current-time) bk/emacs-start-time))))
    (message "Loading %s...done (%.3fs)" load-file-name elapsed))
  (add-hook 'after-init-hook
            `(lambda ()
               (let ((elapsed
                      (float-time
                       (time-subtract (current-time) bk/emacs-start-time))))
                 (message "Loading %s...done (%.3fs) [after-init]"
                          ,load-file-name elapsed))) t))

(provide 'bk-general)
;;; bk-general.el ends here
