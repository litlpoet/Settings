;;; init-os.el --- os integration                    -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Byungkuk Choi

;; Author: Byungkuk Choi <bk@i7-G6>
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

;; operating system integration

;;; Code:

;; ARCH linux
(when (string-match-p "ARCH" operating-system-release)
  (progn
    (use-package system-packages
      :ensure t
      :commands (system-packages-update)
      :init
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

(use-package symon
  :ensure t
  :hook (after-init . symon-mode)
  :init
  (setq symon-delay 10))


(provide 'init-os)
;;; init-os.el ends here
