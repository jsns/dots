;; init.el updated 3/29/21
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)


(eval-when-compile
  (require 'use-package))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("8ada4702edcd736805dd77fb96039ddbfac54c280bb55b3a2a2ccb05c821fc93" "267f38b8dde5e0d3f6d68d5734a08a47a215fbaced9924d29822fe054584378d" "ca71d8935bad63aa7c2ffbade76efa6b217f57e307ab1ae0411f50657b3f70f5" "c5688ceefb12ee784eff0647ad226a27fab9480bd28b0745484f95ae61b1fb42" "62c305147f2531cbb4e05919cb6892bc010608babf31ac8c51755f88938de96f" "71dedb3dc7a96a24cbf1f4c5b5bdd150c5152de39d171241dabbbbb78e90e733" "054022d0bfa6d03e4d720eae2d3326b0ab96d2ffbdeeb636987a612d688f2fb5" "e2acf9a7a4e0269d323d0ccd3048438f557a37069be6f728cf4e02c05d4370cd" "c09bd4d8fba373dd93139202ccae4e3d22fc6fd393b35ab5687f30df039f70ba" "926833f5a621f413cd1d16bf13eb12799d55befdfa09da1c204493dbcf8310e8" "466285b23840b0aadd81642e2150a69ff9a8840b3814fb5ed36368e3130e5951" "a7eb4c7ee00a34a73c2c50b2d672322f4d28a47ed48a6670e85831a0fdf61b59" "96f88745456879d4a9ac5d58d7222bd76e3b0fed1017ef35ac3dd68ace8e5c87" "77aac96c78dfe6a2b27a17eb4078888cb88cbcfe256d40a3393fcd02df8b40df" "d9da2edf9dc51e42f625247163341929e4232ea81ccb7cd05e68df2430eedb99" "656610d0a72ced6fd9d0e83b923cb2b9d89eed5124bead9d07241be1982b0bc3" "9bda8759289b23a68f976ee6a1d532e0856726b1e458121bcb492994c0c2bf71" "1a2945e0cd753eda5e26ece6cfa31b28504c5067a7bb72aed5c6eea1ea65078f" "56656f6895720bf565ff9100386d359eee5a07ffc67b6fe7d11b3383c6aaed0e" "f7de654755edec57f74aa71a63141180889a77f154b200169e6d8c08a01a6138" "33a295566d910f16236a0b3921e1aa69d84a3abb6fc6040bf10c6925fb06156b" "fc8529d28c61fe9c51d682a7bf8bdf60a9c5fa37b6855c612cb93ccca00c47cc" "2a3eaaff42b57dae275adac75cf3cf30f428853bf202aa94224e57d77ba9589d" "f91dcffd4e233d11e153f15ce76840f9e0b3da64b3879437c4c7c7500df73684" "0a3a5df9a4e3081245999a60fa22df665bd23249428cba0930481205e8aef774" "447ba7d045cdbb004c32c4d0b87eb735de16f97eb3be3e1965dba2e3d18c6277" "44059b8ca5f6312aa1baa570f7517fd52365035b1a76ef8ffe5fc58861d40d49" "5d71af29ce93db8baf9d5b842b3b07d05318e9b80c4f4df8149a3b3d7c2e9b19" "bc71d6e28faa3235a0e48a720e91addf79f6882988461efd435b07e1aae06500" "cb259801245d4415a3c26577127e9b28a485408974fcf4595c14d32423b11ba0" "533d6afb5b72f3de254703bec6fbe52e9c1931a7e95f869e05116f24237a21c5" "d198ddd17a8372687432b43208b0c66cd8d8bea9486c50ff9a0cdccf440b584f" "236a292cef3d903d0f19f822dd373990463c0358197df47be2928152a3b0fc1d" "86fd54909352cd398a1603a74243858ee3f252a63e4eac436f22b38b1501c051" "7d84e063ef1aa429d9725569c57f4a7d00485747d202dab994f660f071270d67" "f25366de0ab8678a6dafe46b47adc1aaccaa726f1cdc9e916b3a131da33d4f26" "c2965e0afd9beeb25718dbb6605b69c04229f2e237debfcd4879ed5e81d53ad4" "532a85b472fe3fe4b5791f8d06727066b2678f404a63fb0d51c6360d88f8781e" "a412e5754d3ae78c34e83a7f5ea81127c1e31d5d2a7a25b1b04b7be735d380d9" "7feeed063855b06836e0262f77f5c6d3f415159a98a9676d549bfeb6c49637c4" "c1fb68aa00235766461c7e31ecfc759aa2dd905899ae6d95097061faeb72f9ee" "77bd459212c0176bdf63c1904c4ba20fce015f730f0343776a1a14432de80990" "7575474658c34b905bcec30a725653b2138c2f2d3deef0587e3abfae08c5b276" "5d59bd44c5a875566348fa44ee01c98c1d72369dc531c1c5458b0864841f887c" "21388667ce5ee0b375e6282f0d6c6b61588da6604d343bbb19389e6a54d3d00d" "c7f364aeea0458b6368815558cbf1f54bbdcc1dde8a14b5260eb82b76c0ffc7b" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "b5e75f219d41e6e3516560ac493d808b621a99847d6128ce8e6c74b1495ce875" "5f824cddac6d892099a91c3f612fcf1b09bb6c322923d779216ab2094375c5ee" "8f567db503a0d27202804f2ee51b4cd409eab5c4374f57640317b8fcbbd3e466" "e7ba99d0f4c93b9c5ca0a3f795c155fa29361927cadb99cfce301caf96055dfd" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "e6df46d5085fde0ad56a46ef69ebb388193080cc9819e2d6024c9c6e27388ba9" "be9645aaa8c11f76a10bcf36aaf83f54f4587ced1b9b679b55639c87404e2499" "1623aa627fecd5877246f48199b8e2856647c99c6acdab506173f9bb8b0a41ac" "7a994c16aa550678846e82edc8c9d6a7d39cc6564baaaacc305a3fdc0bd8725f" "d5a878172795c45441efcd84b20a14f553e7e96366a163f742b95d65a3f55d71" "aded61687237d1dff6325edb492bde536f40b048eab7246c61d5c6643c696b7f" "4cf9ed30ea575fb0ca3cff6ef34b1b87192965245776afa9e9e20c17d115f3fb" "b89ae2d35d2e18e4286c8be8aaecb41022c1a306070f64a66fd114310ade88aa" default))
 '(display-line-numbers 'relative)
 '(org-agenda-files nil)
 '(package-selected-packages
   '(diminish helm platformio-mode ccls projectile grayscale-theme hybrid-reverse-theme hemisu-theme darkburn-theme naysayer-theme sublime-themes waher-theme modus-operandi-theme modus-vivendi-theme modus-themes lsp-java gruber-darker-theme vterm latex-preview-pane auctex nlinum-relative undo-fu molokai-theme twilight-theme tide delight flycheck lsp-ui nlinum linum-relative org-bullets selectrum-prescient selectrum crux which-key doom-themes zoom evil-magit magit-evil magit w3m elfeed autopair company-lsp company company-mode lsp-mode chess exwm evil use-package))
 '(python-indent-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(mode-line-buffer-id ((t (:background "#282828" :foreground "aquamarine" :weight bold))))
 '(org-document-title ((t (:foreground "#dfaf8f" :weight bold))))
 '(org-level-1 ((t (:inherit outline-1)))))

(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install use-package))

(eval-when-compile
(require 'use-package))

;; (global-linum-mode 1)
(setq
inhibit-startup-screen t
initial-scratch-message nil
ring-bell-function 'ignore
scroll-conservatively 100)

;; Non-blinking cursor
(blink-cursor-mode 0)

;; set backups directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; no wrap
(set-default 'truncate-lines t)

;; fringe
(fringe-mode '(10 . 0))

;; scroll
(autoload 'View-scroll-half-page-forward "view") (autoload 'View-scroll-half-page-backward "view")
(global-set-key (kbd "C-v") 'View-scroll-half-page-forward)
(global-set-key (kbd "M-v") 'View-scroll-half-page-backward)

(set-face-attribute 'default nil :height 130)
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

(setq-default tab-width 4)
(setq-default c-basic-offset 4)

(add-to-list 'load-path "~/.emacs.d/other/")

(global-unset-key (kbd "C-x 2"))
(global-unset-key (kbd "C-x 3"))

(global-set-key (kbd "C-x 2")
(lambda () (interactive) (split-window-below) (other-window 1)))
(global-set-key (kbd "C-x 3")
(lambda () (interactive) (split-window-horizontally) (other-window 1)))

(use-package lsp-mode
  :ensure t
  :bind-keymap ("C-c a" . lsp-command-map)
  :hook (
  (c-mode . lsp)
  (js-mode . lsp)
  (jsx-mode . lsp)
  )
  :commands lsp
  :config
  (add-hook 'java-mode-hook #'lsp)
  (setq lsp-headerline-breadcrumb-enable nil) ;; disable header breadcrumb
  (setq lsp-modeline-diagnostics-enable nil)
  (setq lsp-signature-render-documentation nil) ;; turn off documentation in minibuffer
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-show-with-mouse nil)
  (setq lsp-ui-sideline-show-diagnostics nil)
  (setq lsp-enable-symbol-highlighting nil)

  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-show-hover nil)
  )
(use-package ccls
  :hook ((c-mode c++-mode objc-mode cuda-mode) .
		 (lambda () (require 'ccls) (lsp))))

(use-package selectrum
:ensure t
:config
(selectrum-mode +1))

(use-package projectile
:ensure t
:diminish
:config
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") projectile-command-map)
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
  (add-hook 'after-init-hook 'global-company-mode))

(use-package autopair
  :delight
  :ensure t
  :config
  (autopair-global-mode)
)

(use-package which-key
:delight
:ensure t
:config
(which-key-mode)
)

(use-package crux
:ensure t
:config
(global-set-key (kbd "M-o") #'crux-other-window-or-switch-buffer)
(global-set-key (kbd "C-c n") #'crux-cleanup-buffer-or-region)
)

(setq tramp-default-method "ssh")

(global-set-key (kbd "C-~") 'vterm)
