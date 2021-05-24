;; init.el updated 3/29/21
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay nil)
 '(custom-enabled-themes (quote (nnn)))
 '(custom-safe-themes
   (quote
    ("8ada4702edcd736805dd77fb96039ddbfac54c280bb55b3a2a2ccb05c821fc93" default)))
 '(display-line-numbers (quote relative))
 '(frame-brackground-mode (quote dark))
 '(gnutls-algorithm-priority "normal:-vers-tls1.3")
 '(org-agenda-files (quote ("~/i/orgs/todos.org" "~/i/orgs/deadline.org")))
 '(org-agenda-start-on-weekday 0)
 '(package-selected-packages
   (quote
    (multiple-cursors ag diminish ccls projectile lsp-java vterm latex-preview-pane auctex tide delight flycheck selectrum-prescient selectrum crux which-key magit w3m elfeed company-lsp company company-mode lsp-mode exwm use-package)))
 '(python-indent-offset 4)
 '(selectrum-fix-minibuffer-height t)
 '(selectrum-highlight-candidates-function (quote selectrum-prescient--highlight))
 '(selectrum-mode t)
 '(selectrum-num-candidates-displayed 5)
 '(selectrum-preprocess-candidates-function (quote selectrum-prescient--preprocess))
 '(selectrum-prescient-mode t)
 '(selectrum-refine-candidates-function (quote prescient-filter)))
 ;; ???????????????

(eval-when-compile (require 'use-package))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#1c1c1c" :foreground "#f8f8f8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 135 :width normal :family "DejaVu Sans Mono"))))
 '(mode-line-buffer-id ((t (:background "#282828" :foreground "aquamarine" :weight bold))))
 '(org-document-title ((t (:foreground "#dfaf8f" :weight bold))))
 '(org-level-1 ((t (:inherit outline-1)))))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install use-package))
(eval-when-compile
  (require 'use-package))

(setq
 inhibit-startup-screen t
 initial-scratch-message nil
 ring-bell-function 'ignore
 scroll-conservatively 100)

(setq-default show-trailing-whitespace 't
              indicate-empty-lines 't
              indent-tabs-mode nil)

(blink-cursor-mode 0)
(global-set-key (kbd "C-c o") 'org-agenda)
(global-set-key (kbd "C-c c") (lambda () (interactive) (recompile) (other-window 1)))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "M-c"))
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; no wrap
(set-default 'truncate-lines t)
;; fringe on left
(fringe-mode '(10 . 0))

;; scroll
(autoload 'View-scroll-half-page-forward "view") (autoload 'View-scroll-half-page-backward "view")
(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)

(set-face-attribute 'default nil :font "DejaVu Sans Mono-14")
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(column-number-mode)
(load-theme 'nnn)

(fset 'yes-or-no-p 'y-or-n-p)

(setq display-time-day-and-date t)

(delete-selection-mode t)
(use-package diminish
  :ensure t)
(diminish 'eldoc-mode)

(use-package whitespace
  :ensure nil
  :hook (before-save . whitespace-cleanup))

(setq-default tab-width 4
              c-basic-offset 4)

(add-to-list 'load-path "~/.emacs.d/other/")
(global-set-key (kbd "C-x 2")
                (lambda () (interactive) (split-window-below) (other-window 1)))
(global-set-key (kbd "C-x 3") (lambda () (interactive) (split-window-horizontally) (other-window 1)))

(use-package lsp-mode
  :ensure t
  :bind-keymap ("C-c a" . lsp-command-map)
  :hook (
         (c-mode . lsp)
         (c++-mode . lsp)
         (js-mode . lsp)
         (jsx-mode . lsp)
         )
  :commands lsp
  :config
  (add-hook 'java-mode-hook #'lsp)
  (setq lsp-headerline-breadcrumb-enable nil ;; disable header breadcrumb
        lsp-modeline-diagnostics-enable nil
        lsp-signature-render-documentation nil ;; turn off documentation in minibuffer
        lsp-ui-doc-enable nil
        lsp-ui-doc-show-with-mouse nil
        lsp-ui-sideline-show-diagnostics nil
        lsp-enable-symbol-highlighting nil
        lsp-clients-clangd-args '("--header-insertion=never")
        lsp-enable-indentation nil
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-sideline-show-hover nil)
  )

(use-package selectrum
  :ensure t
  :config
  (selectrum-mode +1))

(use-package selectrum-prescient
  :ensure t
  :config
  (selectrum-prescient-mode +1))

(use-package projectile
  :ensure t
  :diminish
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-x p") projectile-command-map)
  (setq projectile-project-search-path '("~/code/")))

(use-package flycheck
  :ensure t
  :hook
  (prog-mode . flycheck-mode))

(use-package magit
  :ensure t
  :defer t)

(use-package company
  :delight
  :ensure t
  :hook
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (global-set-key (kbd "M-c") 'company-complete))

(use-package which-key
  :delight
  :ensure t
  :config
  (which-key-mode))

(use-package crux
  :ensure t
  :config
  (global-set-key (kbd "M-o") #'crux-other-window-or-switch-buffer)
  (global-set-key (kbd "C-c n") #'crux-cleanup-buffer-or-region))

(use-package multiple-cursors
  :ensure t
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

;; (use-package vterm
;;   :ensure t
;;   :config (setq vterm-kill-buffer-on-exit t)
;;           (set-face-attribute 'vterm-color-black nil :foreground "#073642" :background "#002b36")
;;           (set-face-attribute 'vterm-color-red nil :foreground "#dc322f" :background "#cb4b16")
;;           (set-face-attribute 'vterm-color-green nil :foreground "#859900" :background "#586e75")
;;           (set-face-attribute 'vterm-color-yellow nil :foreground "#b58900" :background "#657b83")
;;           (set-face-attribute 'vterm-color-blue nil :foreground "#268bd2" :background "#839496")
;;           (set-face-attribute 'vterm-color-magenta nil :foreground "#d33682" :background "#6c71c4")
;;           (set-face-attribute 'vterm-color-cyan nil :foreground "#2aa198" :background "#93a1a1")
;;           (set-face-attribute 'vterm-color-white nil :foreground "#eee8d5" :background "#fdf6e3"))

(add-hook 'vterm-mode-hook
          (lambda ()
            (display-line-numbers-mode -1)))
;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-enable)
;; (setq exwm-workspace-number 4)
;; (setq exwm-input-global-keys
;;       `(
;;         ;; Bind "s-r" to exit char-mode and fullscreen mode.
;;         ([?\s-r] . exwm-reset)
;;         ;; Bind "s-w" to switch workspace interactively.
;;         ([?\s-w] . exwm-workspace-switch)
;;         ;; Bind "s-0" to "s-9" to switch to a workspace by its index.
;;         ,@(mapcar (lambda (i)
;;                     `(,(kbd (format "s-%d" i)) .
;;                       (lambda ()
;;                         (interactive)
;;                         (exwm-workspace-switch-create ,i))))
;;                   (number-sequence 0 9))
;;         ;; Bind "s-&" to launch applications ('M-&' also works if the output
;;         ;; buffer does not bother you).
;;         ([?\s-&] . (lambda (command)
;;              (interactive (list (read-shell-command "$ ")))
;;              (start-process-shell-command command nil command)))
;;         ;; Bind "s-<f2>" to "slock", a simple X display locker.
;;         ([s-f2] . (lambda ()
;;             (interactive)
;;             (start-process "" nil "/usr/bin/slock")))))
