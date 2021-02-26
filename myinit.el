;; [[file:myinit.org::*Language][Language:1]]
(setq default-input-method "russian-computer")
;; Language:1 ends here

;; [[file:myinit.org::*Dictionary][Dictionary:1]]
(use-package flyspell
  :ensure t
  :defer t
  :config
  (define-key flyspell-mode-map [down-mouse-3] 'flyspell-correct-word))

(setq ispell-program-name "aspell")
;; Dictionary:1 ends here

;; [[file:myinit.org::*Line wrap][Line wrap:1]]
(global-visual-line-mode t)
;; Line wrap:1 ends here

;; [[file:myinit.org::*Interface][Interface:1]]
;; Do not show the startup screen.
(setq
 inhibit-startup-message t
 initial-scratch-message nil
 )
;; Disable tool bar, scroll bar.
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Disable tool bar, scroll bar.
(tool-bar-mode -1)
(scroll-bar-mode -1)

(line-number-mode t)
;; y/n
(defalias 'yes-or-no-p 'y-or-n-p)
;; Interface:1 ends here

;; [[file:myinit.org::*Cursor][Cursor:1]]
(setq-default cursor-type 'bar)
;; Cursor:1 ends here

;; [[file:myinit.org::*Sidebar][Sidebar:1]]
(use-package dired-sidebar
  :bind (("C-x C-n" . dired-sidebar-toggle-sidebar))
  :ensure t
  :commands (dired-sidebar-toggle-sidebar)
  :init
  (add-hook 'dired-sidebar-mode-hook
            (lambda ()
              (unless (file-remote-p default-directory)
                (auto-revert-mode))))
  :config
  (push 'toggle-window-split dired-sidebar-toggle-hidden-commands)
  (push 'rotate-windows dired-sidebar-toggle-hidden-commands)

  (setq dired-sidebar-subtree-line-prefix "__")
  (setq dired-sidebar-use-term-integration t)
  (setq dired-sidebar-use-custom-font t))
;; Sidebar:1 ends here

;; [[file:myinit.org::*Open recent][Open recent:1]]
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)
;; Open recent:1 ends here

;; [[file:myinit.org::*Backup files][Backup files:1]]
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;; Backup files:1 ends here

;; [[file:myinit.org::*Overwriting text][Overwriting text:1]]
(delete-selection-mode +1)
;; Overwriting text:1 ends here

;; [[file:myinit.org::*try][try:1]]
(use-package try
	:ensure t)
;; try:1 ends here

;; [[file:myinit.org::*Color Theme][Color Theme:1]]
(use-package poet-theme 
  :ensure t
  :load-path "themes"
 )
(set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 104)
(set-face-attribute 'fixed-pitch nil :family "DejaVu Sans Mono")
(set-face-attribute 'variable-pitch nil :family "IBM Plex Serif")

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)
;; Color Theme:1 ends here

;; [[file:myinit.org::*which key][which key:1]]
(use-package which-key
  :ensure t 
  :config
  (which-key-mode))
;; which key:1 ends here

;; [[file:myinit.org::*Org mode][Org mode:1]]
(use-package org 
     :ensure t
     :pin org)

(use-package org-bullets
     :ensure t
     :config
     (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;; Org mode:1 ends here

;; [[file:myinit.org::*Company][Company:1]]
(use-package company
:ensure t
:config
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 3)

(global-company-mode t)
)
(defun my-web-mode-hook ()
  (set (make-local-variable 'company-backends) '(company-css company-web-html company-yasnippet company-files))
)
;; Company:1 ends here

;; [[file:myinit.org::*Font Highlight][Font Highlight:1]]
(setq org-hide-emphasis-markers t)                            
(setq org-emphasis-alist   
(quote (("*" bold)
("/" italic)
("_" underline)
("=" (:foreground "yellow" :background "black"))
("~" org-verbatim verbatim)
("+"
(:strike-through t))
)))
;; Font Highlight:1 ends here

;; [[file:myinit.org::*PDF][PDF:1]]
(use-package pdf-tools
  :pin manual ;; manually update
  :config
  ;; initialise
  (pdf-tools-install)
  ;; open pdfs scaled to fit page
  (setq-default pdf-view-display-size 'fit-page)
  ;; automatically annotate highlights
  (setq pdf-annot-activate-created-annotations t)
  ;; use normal isearch
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))
;; PDF:1 ends here

;; [[file:myinit.org::*Flycheck][Flycheck:1]]
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t))
;; Flycheck:1 ends here

;; [[file:myinit.org::*Bookmarks][Bookmarks:1]]
(setq bookmark-default-file "~/Dropbox/common/emacs/bookmarks.bmk" bookmark-save-flag 1)
;; Bookmarks:1 ends here

;; [[file:myinit.org::*WRITING][WRITING:1]]
(use-package writegood-mode
    :ensure t
    :bind ("C-c g" . writegood-mode)
    :config
    (add-to-list 'writegood-weasel-words "actionable"))
;; WRITING:1 ends here

;; [[file:myinit.org::*Org-ref][Org-ref:1]]
(use-package org-ref
         :ensure t
         :after org
         :init
         
         (setq org-ref-default-bibliography '("~/Dropbox/bibliography/references.bib"))
         (setq org-ref-pdf-directory '("~/Yandex.Disk/LIBRARY")))

(setq bibtex-completion-bibliography "~/Dropbox/bibliography/references.bib"
      bibtex-completion-library-path "~/Yandex.Disk/LIBRARY/bibtex-pdfs"
      bibtex-completion-notes-path "~/Dropbox/bibliography/helm-bibtex-notes")

(setq bibtex-completion-pdf-open-function 'org-open-file)


(defun get-bibtex-from-doi (doi)
 "Get a BibTeX entry from the DOI"
 (interactive "MDOI: ")
 (let ((url-mime-accept-string "text/bibliography;style=bibtex"))
   (with-current-buffer 
     (url-retrieve-synchronously 
       (format "http://dx.doi.org/%s" 
       	(replace-regexp-in-string "http://dx.doi.org/" "" doi)))
     (switch-to-buffer (current-buffer))
     (goto-char (point-max))
     (setq bibtex-entry 
     	  (buffer-substring 
          	(string-match "@" (buffer-string))
              (point)))
     (kill-buffer (current-buffer))))
 (insert (decode-coding-string bibtex-entry 'utf-8))
 (bibtex-fill-entry))

(require 'org-ref-pdf)
(require 'org-ref-url-utils)
;; Org-ref:1 ends here

;; [[file:myinit.org::*Helm][Helm:1]]
(use-package helm
    :ensure t)

(use-package helm-bibtex
    :ensure t)
;; Helm:1 ends here

;; [[file:myinit.org::*Presentations][Presentations:1]]
(use-package ox-reveal
  :ensure t
  :config
    (require 'ox-reveal)
    (setq org-reveal-root "file:///home/tam/Dropbox/reveal.js-master")
    
)
    (use-package htmlize
    :ensure t)
;; Presentations:1 ends here

;; [[file:myinit.org::*CODING][CODING:1]]
(use-package smartparens
    :ensure t
    :config
    (add-hook 'prog-mode-hook 'smartparens-mode))

(use-package dumb-jump
    :ensure t
    :bind (("C-M-g" . dumb-jump-go)
           ("C-M-p" . dumb-jump-back)
           ("C-M-q" . dumb-jump-quick-look)))

(use-package magit
    :ensure t
    :bind ("C-x g" . magit-status))

(use-package yasnippet
      :ensure t
      :config
      (add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets")
      (yas-global-mode 1))

(use-package js2-mode
    :ensure t
    :mode "\\.js\\'"
    :config
    (setq-default js2-ignored-warnings '("msg.extra.trailing.comma")))


 (use-package web-mode
    :ensure t 
    :mode ("\\.html\\'")
    :config
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
    (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode)))

(use-package emmet-mode
  :ensure t 
  :defer t
  :init
  (setq emmet-indentation 2)
  (setq emmet-move-cursor-between-quotes t)
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
  (add-hook 'web-mode-hook  'emmet-mode)
  (add-hook 'html-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook  'emmet-mode)) ;; enable Emmet's css abbreviation.

;;Code formatting.

(use-package format-all
     :ensure t
)
;; CODING:1 ends here

;; [[file:myinit.org::*Pug][Pug:1]]
(use-package pug-mode
    :ensure t)
;; Pug:1 ends here
