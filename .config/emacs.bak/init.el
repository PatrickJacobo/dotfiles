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

(setq gc-cons-threshold #x40000000)
(setq read-process-output-max (* 1024 1024 4))
     (column-number-mode t)                                                    
(display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(use-package org-auto-tangle)
(add-hook 'org-mode-hook 'org-auto-tangle-mode)
(setq org-auto-tangle-default t)
(add-hook 'org-src-mode-hook 'prog-mode)
(global-set-key [escape] 'keyboard-escape-quit)

(use-package undo-tree)
(global-undo-tree-mode)

(use-package which-key)
(which-key-mode)

(use-package goto-chg)
(setq evil-want-keybinding nil)
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
(use-package evil-surround)
(global-evil-surround-mode 1)
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(use-package evil-org
:after org
:hook (org-mode . (lambda () evil-org-mode))
:config
(require 'evil-org-agenda)
(evil-org-agenda-set-keys))
(add-hook 'org-mode-hook #'evil-org-mode)
(electric-pair-mode 1)

(use-package nerd-icons)
(use-package dirvish
  :init
  (dirvish-override-dired-mode)
  :config
  (setq dirvish-mode-line-format
        '(:left (sort symlink) :right (omit yank index)))
  (setq dirvish-mode-line-height 10)
  (setq dirvish-attributes
        '(nerd-icons file-time file-size collapse subtree-state vc-state git-msg))
  (setq dirvish-subtree-state-style 'nerd)
  (setq delete-by-moving-to-trash t)
  (setq dirvish-path-separators (list
                                 (format "  %s " (nerd-icons-codicon "nf-cod-home"))
                                 (format "  %s " (nerd-icons-codicon "nf-cod-root_folder"))
                                 (format " %s " (nerd-icons-faicon "nf-fa-angle_right"))))
  (setq dired-listing-switches
        "-l --almost-all --human-readable --group-directories-first --no-group")
  (dirvish-peek-mode) ; Preview files in minibuffer
  (dirvish-side-follow-mode) ; similar to `treemacs-follow-mode'
)

(use-package catppuccin-theme)
(load-theme 'catppuccin :no-confirm)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(defcustom ek-use-nerd-fonts t
  "Configuration for using Nerd Fonts Symbols."
  :type 'boolean
  :group 'appearance)
(use-package rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

(use-package toc-org)
(add-hook 'org-mode-hook 'toc-org-mode)

      ;; enable in markdown, too
     ;; (add-hook 'markdown-mode-hook 'toc-org-mode)
     ;;(define-key markdown-mode-map (kbd "\C-c\C-o") 'toc-org-markdown-follow-thing-at-point)

(use-package doom-modeline
:init (doom-modeline-mode 1))
(use-package nyan-mode)
(nyan-mode 1)

(use-package org-bullets)
(add-hook 'org-mode-hook
(lambda ()
(org-bullets-mode 1)
(org-indent-mode 1)
(visual-line-mode 1)
))

(use-package beacon)
(beacon-mode 1)

(use-package dashboard
          :config
        (dashboard-setup-startup-hook))
      (setq initial-buffer-choice (lambda () (get-buffer-create dashboard-buffer-name)))
    (setq dashboard-banner-logo-title "Welcome to bloody Emacs")
    (setq dashboard-startup-banner '("/home/jacob/assets/emacs-logo-vim.png" "/home/jacob/assets/M-x_butterfly.png" "/home/jacob/assets/gnu_color.png"))
  (setq dashboard-display-icons-p t)     ; display icons on both GUI and terminal
  (setq dashboard-icon-type 'nerd-icons) ; use `nerd-icons' package
(add-to-list 'doom-modeline-mode-alist '(dashboard-mode))

(use-package tree-sitter)
(use-package tree-sitter-langs)
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
(setq org-src-fontify-natively t)

(use-package powerthesaurus)

(use-package pdf-tools)

(use-package yasnippet)
  (setq yas-snippet-dirs
'("~/.config/emacs/snippets"))
(yas-global-mode 1)
(use-package yasnippet-snippets)
(use-package doom-snippets
:after yasnippet
:straight (doom-snippets :type git :host github :repo "doomemacs/snippets" :files ("*.el" "*")))

(use-package all-the-icons)
  (use-package counsel
    :after ivy
    :diminish
    :config 
      (counsel-mode)
      (setq ivy-initial-inputs-alist nil)) ;; removes starting ^ regex in M-x

  (use-package ivy
    :bind
    ;; ivy-resume resumes the last Ivy-based completion.
    (("C-c C-r" . ivy-resume)
     ("C-x B" . ivy-switch-buffer-other-window))
    :diminish
    :custom
    (setq ivy-use-virtual-buffers t)
    (setq ivy-count-format "(%d/%d) ")
    (setq enable-recursive-minibuffers t)
    :config
    (ivy-mode))

  (use-package all-the-icons-ivy-rich
    :init (all-the-icons-ivy-rich-mode 1))

  (use-package ivy-rich
    :after ivy
    :init (ivy-rich-mode 1) ;; this gets us descriptions in M-x.
    :custom
    (ivy-virtual-abbreviate 'full
     ivy-rich-switch-buffer-align-virtual-buffer t
     ivy-rich-path-style 'abbrev)
    :config
    (ivy-set-display-transformer 'ivy-switch-buffer
                                 'ivy-rich-switch-buffer-transformer))

(use-package vterm)
  (setq shell-file-name "/usr/bin/zsh"
vterm-max-scrollback (* 50 1000))

(use-package vterm-toggle
  :after vterm
  :config
  (setq vterm-toggle-fullscreen-p nil)
  (setq vterm-toggle-scope 'project)
  (add-to-list 'display-buffer-alist
               '((lambda (buffer-or-name _)
                     (let ((buffer (get-buffer buffer-or-name)))
                       (with-current-buffer buffer
                         (or (equal major-mode 'vterm-mode)
                             (string-prefix-p vterm-buffer-name (buffer-name buffer))))))
                  (display-buffer-reuse-window display-buffer-at-bottom)
                  ;;(display-buffer-reuse-window display-buffer-in-direction)
                  ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                  ;;(direction . bottom)
                  ;;(dedicated . t) ;dedicated is supported in emacs27
                  (reusable-frames . visible)
                  (window-height . 0.3))))

(use-package rainbow-mode
  :hook
((org-mode prog-mode) . rainbow-mode))

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (emacs-lisp-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)
;; optionally
(use-package lsp-ui :commands lsp-ui-mode)
;; if you are helm user
;(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; if you are ivy user
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)

(use-package auctex)
(use-package xenops)
(use-package cdlatex)
(use-package evil-tex)
