;;; init-hydra.el --- hydra intialization            -*- lexical-binding: t; -*-

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

;; hydra initialization

;;; Code:

(use-package hydra
  :ensure t)

(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("+" text-scale-increase "in")
  ("-" text-scale-decrease "out")
  ("0" text-scale-adjust   "reset"))

(use-package hydra-dired
  :load-path "elisps/hydras"
  :after (hydra dired)
  :bind (:map dired-mode-map
              ("." . hydra-dired/body)))

(use-package hydra-ibuffer
  :load-path "elisps/hydras"
  :after (hydra ibuffer)
  :bind (:map ibuffer-mode-map
              ("." . hydra-ibuffer/body)))

(use-package hydra-window
  :load-path "elisps/hydras"
  :after (hydra)
  :bind ("C-c w" . hydra-window/body))

(provide 'init-essentials-hydra)
;;; init-essentials-hydra.el ends here
