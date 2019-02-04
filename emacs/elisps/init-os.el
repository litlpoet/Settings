;;; init-os.el --- os integration                    -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Byungkuk Choi
;; Author: Byungkuk Choi <bk@i7-G6>
;; Keywords: lisp

;;; Commentary:
;; operating system integration

;;; Code:
;; ARCH linux
(when (string-match-p "ARCH" operating-system-release)
  (progn
    (use-package system-packages
      :commands (system-packages-update)
      :config
      (add-to-list 'system-packages-supported-package-managers
                   '(pacaur .
                            ((default-sudo . nil)
                             (install . "pacaur -S")
                             (search . "pacaur -Ss")
                             (uninstall . "pacaur -Rs")
                             (update . "pacaur -Syu")
                             (clean-cache . "pacaur -Sc")
                             (log . "cat /var/log/pacman.log")
                             (get-info . "pacaur -Qi")
                             (get-info-remote . "pacaur -Si")
                             (list-files-provided-by . "pacaur -Ql")
                             (verify-all-packages . "pacaur -Qkk")
                             (verify-all-dependencies . "pacaur -Dk")
                             (remove-orphaned . "pacaur -Rns $(pacman -Qtdq)")
                             (list-installed-packages . "pacaur -Qe")
                             (list-installed-packages-all . "pacaur -Q")
                             (list-dependencies-of . "pacaur -Qi")
                             (noconfirm . "--noconfirm"))))
      (setq system-packages-use-sudo        nil
            system-packages-package-manager 'pacaur))))

;; (use-package symon
;;   :ensure t
;;   :hook (after-init . symon-mode)
;;   :init
;;   (setq symon-delay 10))

(provide 'init-os)
;;; init-os.el ends here
