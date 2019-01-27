;;; init-essentials.el -- common packages
;;; Commentary:

;;; Code:

;; (dired) direx
(use-package direx
  :straight t
  :bind ("C-c C-j" . direx-project:jump-to-project-root)
  :config
  (setq direx:closed-icon "▸"
        direx:open-icon   "▾"))

;; (edit) iedit
(use-package iedit
  :straight t
  :bind (("C-;" . iedit-mode)
         ("C-:" . iedit-mode-toggle-on-function))
  :config (set-face-inverse-video 'iedit-occurrence t))

;; (edit) expand-region
(use-package expand-region
  :straight t
  :bind   ("M-2" . er/expand-region))

;; (edit) duplicate-thing
(use-package duplicate-thing
  :straight t
  :bind   ("M-c" . duplicate-thing))

;; (edit) multiple-cursors
(use-package multiple-cursors
  :straight t
  :init
  (setq mc/list-file (expand-file-name
                      (convert-standard-filename "mc-list.el")
                      bk:local-directory))
  :bind (("M-4" . mc/mark-next-like-this)
         ("M-3" . mc/mark-previous-like-this)
         ("M-$" . mc/skip-to-next-like-this)
         ("M-#" . mc/skip-to-previous-like-this)))

;; (edit) hungry-delete
(use-package hungry-delete
  :straight   t
  :diminish hungry-delete-mode
  :hook ((emacs-lisp-mode lisp-interaction-mode) . hungry-delete-mode))

;; (edit) aggresive-indent
(use-package aggressive-indent
  :straight t
  :diminish aggressive-indent-mode
  :hook (emacs-lisp-mode . aggressive-indent-mode))

;;; (edit) macrostep
(use-package macrostep
  :straight t
  :bind ("C-c e m" . macrostep-expand))

;; (edit) smartparens
(use-package smartparens
  :straight t
  :diminish smartparens-mode
  :bind (:map
         smartparens-mode-map
         ("C-M-w"         . sp-copy-sexp)
         ("M-<delete>"    . sp-unwrap-sexp)
         ("M-<backspace>" . sp-backward-unwrap-sexp)
         ("M-D"           . sp-splice-sexp)
         ("M-F"           . sp-forward-symbol)
         ("M-B"           . sp-backward-symbol))
  :hook ((after-init . show-smartparens-global-mode)
         (after-init . smartparens-global-mode)
         (after-init . (lambda() (require 'smartparens-config))))
  :config
  (sp-with-modes '(c-mode c++-mode)
    (sp-local-pair "{" nil
                   :post-handlers '(("||\n[i]" "RET"))))
  (sp-local-pair 'c++-mode "/*" "*/"
                 :post-handlers '((" | " "SPC")
                                  ("* ||\n[i]" "RET")))
  (set-face-attribute 'show-paren-match nil
                      :weight     'extra-bold
                      :underline  "yellow"
                      :foreground "gold"
                      :background nil))

;; (edit) undo-tree
(use-package undo-tree
  :straight t
  :diminish undo-tree-mode
  :hook (after-init . global-undo-tree-mode)
  :bind ("C-?" . undo-tree-redo))

;; (display) volatile-highlights
(use-package volatile-highlights
  :straight t
  :diminish volatile-highlights-mode
  :hook (after-init . volatile-highlights-mode)
  :config
  (set-face-attribute 'vhl/default-face nil
                      :underline "light slate gray"))

;; (display) rainbow-delimiters
(use-package rainbow-delimiters
  :straight t
  :hook (prog-mode . rainbow-delimiters-mode))

;; (display) pretty page-break-lines
(use-package page-break-lines
  :straight t
  :diminish page-break-lines-mode
  :hook (after-init . global-page-break-lines-mode)
  :config
  (add-to-list 'page-break-lines-modes 'text-mode))

;; (display) beacon
(use-package beacon
  :straight t
  :diminish beacon-mode
  :hook (after-init . beacon-mode))

;; (display) shackle
(use-package shackle
  :straight t
  :hook (after-init . shackle-mode)
  :init
  (setq
   shackle-rules
   '((direx:direx-mode
      :other t :align left  :size 0.25 :select t :inhibit-window-quit nil)
     (compilation-mode
      :other t :align below :size 0.30 :select t :inhibit-window-quit nil)
     ("*system-packages*"
      :other t :align below :size 0.30 :select t :inhibit-window-quit nil)
     ("*Help*"
      :other t :align below :size 0.30 :select t :inhibit-window-quit nil))))

;; (navi) ivy / swiper / counsel
(use-package ivy
  :straight t
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :bind ("C-c C-r" . ivy-resume)
  :init
  (setq ivy-use-virtual-buffers t
        ivy-count-format        "(%d/%d) "))

;; ivy-xref
(use-package ivy-xref
  :straight t
  :after (ivy)
  :init
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

;; (navi) ivy-hydra
(use-package ivy-hydra
  :straight t
  :after (ivy hydra))

;; (navi) ivy / swiper / counsel
(use-package counsel
  :straight t
  :diminish counsel-mode
  :bind (("C-r"     . counsel-grep-or-swiper)
         ("C-s"     . counsel-grep-or-swiper)
         ("C-c g"   . counsel-git)
         ("C-c j"   . counsel-git-grep)
         ("C-c k"   . counsel-ag)
         ("C-c l"   . counsel-locate)
         ;; ("M-x"     . counsel-M-x)
         ;; ("M-y"     . counsel-yank-pop)
         ;; ("C-x C-f" . counsel-find-file) ;; not working after loading purpose
         ;; ("C-h v"   . counsel-describe-variable)
         ;; ("C-h f"   . counsel-describe-function)
         )
  :hook (after-init . (lambda() (counsel-mode t))))

;; (navi) ace-window
(use-package ace-window
  :straight t
  :bind (("C-x o" . ace-window)
         ("C-x 1" . ace-delete-window))
  :config
  (set-face-attribute
   'aw-leading-char-face nil :foreground "deep sky blue" :weight 'bold :height 2.0)
  (setq aw-keys '(?a ?s ?d ?f ?j ?k ?l)))

;; (navi) which-key
(use-package which-key
  :straight t
  :diminish
  :hook (after-init . which-key-mode))

;; (navi) hydra
(use-package hydra
  :straight t
  :defer t
  :init
  (defhydra hydra-zoom (global-map "<f2>")
    "zoom"
    ("+" text-scale-increase "in")
    ("-" text-scale-decrease "out")
    ("0" text-scale-adjust   "reset")))

(use-package hydra-dired
  :straight nil
  :after (hydra dired)
  :bind (:map dired-mode-map
              ("." . hydra-dired/body)))

(use-package hydra-ibuffer
  :straight nil
  :after (hydra ibuffer)
  :bind (:map ibuffer-mode-map
              ("." . hydra-ibuffer/body)))

(use-package hydra-window
  :straight nil
  :after (hydra)
  :bind ("C-c w" . hydra-window/body))

;; (project) projectile
(use-package projectile
  :straight t
  :hook (after-init . projectile-mode)
  ;; :bind-keymap
  ;; ("C-c p" . projectile-command-map)
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
  :straight t
  :after  projectile
  ;; :bind-keymap
  ;; ("C-c p" . counsel-projectile-map)
  :commands (counsel-projectile-mode)
  :init
  (counsel-projectile-mode)
  :config
  (counsel-projectile-modify-action
   'counsel-projectile-switch-project-action
   '((add ("r" counsel-projectile-switch-project-by-name "open project root dir") 1))))

;; ;; (viz) highlight-indent-guides
;; (use-package highlight-indent-guides
;;   :ensure t
;;   :commands (highlight-indent-guides-mode)
;;   :init
;;   (add-hook 'prog-mode-hook #'highlight-indent-guides-mode)
;;   :config
;;   (setq highlight-indent-guides-method 'column))

;; ;; (viz) anzu
;; (use-package anzu
;;   :ensure t
;;   :commands (global-anzu-mode)
;;   :diminish anzu-mode
;;   :init
;;   (add-hook 'after-init-hook '(lambda() (global-anzu-mode +1))))

;; ;; (window) purpose
;; (use-package window-purpose
;;   :ensure t
;;   :hook (after-init . purpose-mode))

;; ;; (window) window-purpose-x
;; (use-package window-purpose-x
;;   :after (window-purpose)
;;   :bind ("C-c q" . purpose-x-popwin-close-windows)
;;   :commands (purpose-x-popwin-setup)
;;   :init
;;   (purpose-x-popwin-setup))

;; ;; (window) ivy-purpose
;; (use-package ivy-purpose
;;   :ensure t
;;   :after (ivy window-purpose)
;;   :commands (ivy-purpose-setup)
;;   :init
;;   (ivy-purpose-setup)
;;   :config
;;   (defalias 'counsel-find-file-without-purpose
;;     (without-purpose-command #'counsel-find-file))
;;   (bind-key "C-x C-f" #'counsel-find-file-without-purpose         purpose-mode-map)
;;   (bind-key "C-x b"   #'ivy-purpose-switch-buffer-without-purpose purpose-mode-map))

;; (navi) sublimity
;; (use-package sublimity
;;   :ensure t
;;   :commands (sublimity-mode)
;;   :init
;;   (use-package sublimity-map
;;     :init
;;     (setq sublimity-map-size        20
;;           sublimity-map-fraction    0.3
;;           sublimity-map-text-scale -7))
;;   (add-hook 'prog-mode-hook
;;             '(lambda()
;;                (sublimity-mode 1))))

(provide 'init-essentials)
;;; init-essentials.el ends here
