;;; setup-packages.el --- install listed packages automatically.
;;; Commentary:
;;; Code:
(message "[bk:setup-packages.el is loading...]")
(require 'cl)

;; check if all packages are installed
(defun bk:packages-installed()
  (loop for p in package-selected-packages
        when (not (package-installed-p p))
        do (return nil)
        finally (return t)))

;; if not all packages are installed,
;; check one by one and install the missing ones.
(unless (bk:packages-installed) ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" "done.")
  (dolist (p package-selected-packages) ; install the missing packages
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'setup-packages)
;;; setup-packages.el ends here
