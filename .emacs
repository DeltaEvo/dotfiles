(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)
(setq inhibit-startup-screen t)

(require 'package)
(add-to-list 'package-archives
						 '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))
(eval-when-compile
	(require 'use-package))
(setq use-package-always-ensure t)

(use-package spacemacs-theme
	:defer t
	:init
	(custom-set-variables '(spacemacs-theme-comment-bg nil))
	(load-theme 'spacemacs-dark t))

(cl-defun on-frame-open (&optional (frame (selected-frame)))
	"If the FRAME created in terminal don't load background color."
	(unless (display-graphic-p frame)
		(set-face-background 'default "unspecified-bg" frame)))

(add-hook 'after-make-frame-functions 'on-frame-open)
(add-hook 'window-setup-hook 'on-frame-open)

(use-package spaceline
	:init
	(require 'spaceline-config)
	(spaceline-spacemacs-theme))

(use-package undo-tree)

(use-package evil
	:init
	(setq evil-want-C-u-scroll t)
	:config
	(evil-mode 1))

(use-package evil-numbers
	:bind (:map evil-normal-state-map 
				 ("C-x" . 'evil-numbers/inc-at-pt)
				 ("C-a" . 'evil-numbers/dec-at-pt)))

(use-package xclip
	:config
	(xclip-mode 1))

(use-package linum-relative
	:init
	(setq linum-relative-current-symbol "")
	:config
	(linum-mode)
	(linum-relative-global-mode))

(use-package elcord
	:init
	(elcord-mode))

(use-package company
	:config
	(add-hook 'after-init-hook 'global-company-mode))

(use-package yasnippet
	:init
	(yas-global-mode 1))

(use-package flycheck)

(use-package lsp-mode
	:after (flycheck)
	(require 'lsp-flycheck)
	(add-to-list 'flycheck-checkers 'lsp))

(use-package lsp-ui
	:init
	(add-hook 'lsp-mode-hook 'lsp-ui-mode)
	(require 'lsp-ui-sideline))

(use-package company-lsp
	:requires (lsp-mode)
	:after (company)
	:init
	(push 'company-lsp company-backends))

(use-package rust-mode
	:config
	(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode)))

(use-package lsp-rust
	:after (lsp-mode)
	:init
	(setq lsp-rust-rls-command '("rustup" "run" "nightly" "rls"))
	(add-hook 'rust-mode-hook #'lsp-rust-enable)
	(add-hook 'rust-mode-hook #'flycheck-mode))

(use-package vue-mode)

(use-package lsp-vue
	:after (lsp-mode vue-mode)
	:init
	(add-hook 'vue-mode-hook #'lsp-vue-mmm-enable))

(use-package cquery
	:after (lsp-mode)
	:config
	(setq cquery-executable "/home/david/workspace/cpp/cquery/build/release/bin/cquery")
	:init
	(add-hook 'c-mode-hook #'lsp-cquery-enable))

(font-lock-add-keywords
 'c-mode
 '(("\\<\\(\\sw+\\) ?(" 1 'font-lock-function-name-face)))

(use-package treemacs
	:config
	(progn
		(use-package treemacs-evil
			:demand t)))

(setq-default tab-width 2)

(use-package nix-mode)

(require 'whitespace)
(setq whitespace-style '(trailing tabs tab-mark))
(global-whitespace-mode 1)

; Remove toolbar and menubar
(menu-bar-mode -1)
(tool-bar-mode -1)

; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)
