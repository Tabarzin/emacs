;; Don't show splash screen

(setq inhibit-startup-message t)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-coX1ntents))



;; Turn off some unneeded UI elements
(menu-bar-mode 1)  ; Leave this one on if you're a beginner!
(tool-bar-mode -1)
(scroll-bar-mode -1)
;;;(set-fringe-mode 10)        ; Give some breathing room

;; Display line numbers in every buffer
(global-display-line-numbers-mode -1)

(setq initial-scratch-message "")
(setq default-input-method "russian-computer")
(global-visual-line-mode t)

;; Cursor
(setq-default cursor-type 'bar)

;; Overwriting text

(delete-selection-mode +1)

;; Font-size

(set-face-attribute 'default nil :height 110)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;;; MODUS THEMES ;;;

;; Configure the Modus Themes' appearance

;; Using multiple aspects
(setq modus-themes-mode-line '(accented borderless)
      modus-themes-region '(bg-only)
      modus-themes-bold-constructs t
      modus-themes-italic-constructs t
      modus-themes-fringes 'subtle
      modus-themes-tabs-accented t
      modus-themes-paren-match '(bold intense)
      modus-themes-syntax '(alt-syntax)
      modus-themes-syntax '(green-comments)
      modus-themes-scale-headings t

      modus-themes-headings
      '((1 . (rainbow overline background 1.4))
        (2 . (rainbow background 1.3))
        (3 . (rainbow bold 1.2))
        (t . (semilight 1.1))))


;; Load the theme of your choice:
(load-theme 'modus-operandi) ;; OR (load-theme 'modus-vivendi)

(define-key global-map (kbd "<f5>") #'modus-themes-toggle)


;; enable recent files mode.
(recentf-mode t)

(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)


;; Save what you enter into minibuffer prompts
(setq history-length 25)
(savehist-mode 1)

;; Remember and restore the last cursor location of opened files
(save-place-mode 1)

;; Move customization variables to a separate file and load it
(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

;; Don't pop up UI dialogs when prompting
(setq use-dialog-box nil)


;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; Ivy

(use-package ivy
  :diminish ;removes name from bar below
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;(use-package doom-modeline
; :ensure t
;:init (doom-modeline-mode 1)
;:custom ((doom-modeline-height 15)))

;; Smartparens
(use-package smartparens
  :diminish smartparens-mode ;; Do not show in modeline
  :init
  (require 'smartparens-config)
  :config
  (smartparens-global-mode t) ;; These options can be t or nil.
  (show-smartparens-global-mode t)
  (setq sp-show-pair-from-inside t)
  :custom-face
  (sp-show-pair-match-face ((t (:foreground "White")))) ;; Could also have :background "Grey" for example.
  )


;; Rainbow Delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


(use-package which-key
  :defer 0
  :diminish which-key-mode
  :config
  (which-key-mode)
  (setq which-key-idle-delay 1))


(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("C-M-j" . 'counsel-switch-buffer)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history))
  :custom
  (counsel-linux-app-format-function #'counsel-linux-app-format-function-name-only)
  :config
  (counsel-mode 1))

(use-package hydra)
(defhydra hydra-zoom (global-map "<f2>")
  "zoom"
  ("g" text-scale-increase "in")
  ("l" text-scale-decrease "out"))

;; Magit

(use-package magit
 :ensure t
 :custom
 (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))


(use-package org
  :config
  (setq org-ellipsis "▾"
	org-hide-emphasis-markers t)
  (setq org-agenda-files
	'("~/Dropbox/agenda/tasks.org"))

  )

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; tetris
(defadvice tetris-end-game (around zap-scores activate)
  (save-window-excursion ad-do-it))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package flycheck
  :ensure t
  )

(use-package company
  :ensure t
  :hook ((emacs-lisp-mode clojure-mode) . company-mode)
  )


(use-package lsp-mode
  :ensure t
  :hook (clojure-mode . lsp))
