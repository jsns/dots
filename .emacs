;;; init.el --- Initialization file for Emacs
;;; Commentary: Emacs Startup File --- initialization for Emacs

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
    ("4eedf4278160baa4f2f369b8c166847f4487f77fae2b84de9b956f47add5a000" "27b91eb7fd16994de60be9d391198164dd54bb83af99bae32f8a301266ced18d" "8ada4702edcd736805dd77fb96039ddbfac54c280bb55b3a2a2ccb05c821fc93" default)))
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

(setq inhibit-startup-screen t
      initial-scratch-message nil
      ring-bell-function 'ignore
      scroll-conservatively 100
      display-time-day-and-date t)

(setq-default show-trailing-whitespace 't
              indicate-empty-lines 't
              indent-tabs-mode nil
              tab-width 4
              c-basic-offset 4)

(blink-cursor-mode 0)
(global-set-key (kbd "C-c o") 'org-agenda)
(global-set-key (kbd "C-c c") (lambda () (interactive) (recompile) (other-window 1)))
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "M-c"))
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(set-default 'truncate-lines t)
(fringe-mode '(10 . 0))

(set-face-attribute 'default nil :font "Monospace-14")
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(column-number-mode)
(load-theme 'nnn)

(fset 'yes-or-no-p 'y-or-n-p)

(delete-selection-mode t)

(global-set-key (kbd "C-x 2") (lambda () (interactive) (split-window-below) (other-window 1)))
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
  (setq lsp-headerline-breadcrumb-enable nil
        lsp-modeline-diagnostics-enable nil
        lsp-signature-render-documentation nil ;; turn off documentation in minibuffer
        lsp-ui-doc-enable nil
        lsp-ui-doc-show-with-mouse nil
        lsp-ui-sideline-show-diagnostics nil
        lsp-enable-symbol-highlighting nil
        lsp-clients-clangd-args '("--header-insertion=never")
        lsp-enable-indentation nil
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-sideline-show-hover nil))

(use-package selectrum :ensure t :config (selectrum-mode +1))
(use-package selectrum-prescient :ensure t :config (selectrum-prescient-mode +1))
(use-package magit :ensure t :defer t)
(use-package whitespace :ensure nil :hook (before-save . whitespace-cleanup))

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

(use-package company
  :delight
  :ensure t
  :hook
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (global-set-key (kbd "M-c") 'company-complete)
  (setq company-format-margin-function nil))

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
