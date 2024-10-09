(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
  (straight-use-package 'use-package)
  (setq straight-use-package-by-default t)

(use-package undo-tree)
(global-undo-tree-mode)

(use-package goto-chg)
  (use-package evil
    :init (evil-mode +1)
    :config
    (eval-when-compile (require 'evil))
    (setq evil-auto-indent t
	  evil-ex-complete-emacs-commands t
	  evil-undo-system 'undo-tree
	  evil-undo-function 'undo-tree-undo
	  evil-redo-function 'undo-tree-redo
	  evil-magic 'very-magic
	  evil-search-module 'evil-search
	  evil-shift-width 2
	  evil-toggle-key "C-M-z"
	  evil-want-C-w-delete nil
	  evil-want-C-w-in-emacs-state nil
	  evil-want-fine-undo t
	  evil-normal-state-cursor '(box "white")
	  evil-operator-state-cursor '(box "white")
	  evil-replace-state-cursor '(box "white")
	  evil-insert-state-cursor `(box "white")
	  evil-emacs-state-cursor `(box "white"))(use-package evil))
  (setq scroll-margin 8
	scroll-conservatively 101)

(use-package catppuccin-theme)
(load-theme 'catppuccin :no-confirm)
(display-line-numbers-mode)
(setq display-line-numbers 'relative)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(use-package toc-org)
(add-hook 'org-mode-hook 'toc-org-mode)

      ;; enable in markdown, too
     ;; (add-hook 'markdown-mode-hook 'toc-org-mode)
     ;;(define-key markdown-mode-map (kbd "\C-c\C-o") 'toc-org-markdown-follow-thing-at-point)

(use-package doom-modeline
:init (doom-modeline-mode 1))
(use-package nyan-mode)
(nyan-mode 1)

(use-package tree-sitter)
(use-package tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
(setq org-src-fontify-natively t)

(use-package org-bullets)
(add-hook 'org-mode-hook
(lambda ()
(org-bullets-mode 1)
(org-indent-mode 1)
(visual-line-mode 1)
))
