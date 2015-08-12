;;; auto-package-install.el --- install listed packages automatically.
;;; Commentary:
;;; Code:
(require 'cl)

(defvar bk:required-packages
  '(clang-format
    clean-aindent-mode
    cmake-font-lock
    cmake-mode
    color-theme-sanityinc-tomorrow
    company
    company-c-headers
    company-irony
    cpputils-cmake
    dired+
    duplicate-thing
    expand-region
    flycheck
    flycheck-google-cpplint
    flycheck-irony
    golden-ratio
    google-c-style
    helm
    helm-projectile
    ibuffer-vc
    iedit
    irony
    magit
    multiple-cursors
    pkg-info
    projectile
    recentf-ext
    smart-mode-line
    smartparens
    sr-speedbar
    stickyfunc-enhance
    undo-tree
    volatile-highlights
    yasnippet)
  "bk's list of packages to ensure are installed at launch.")

;; check if all packages are installed
(defun bk:packages-installed()
  (loop for p in bk:required-packages
        when (not (package-installed-p p))
        do (return nil)
        finally (return t)))

;; if not all packages are installed, check one by one and install the missing ones.
(unless (bk:packages-installed)
                                        ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" "done.")
                                        ; install the missing packages
  (dolist (p bk:required-packages)
    (when (not (package-installed-p p))
      (package-install p)))
  )
;; (provide 'auto-package-install)
;;; auto-package-install.el ends here
