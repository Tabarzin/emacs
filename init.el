(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
 (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#689d6a")
 '(cua-normal-cursor-color "#7c6f64")
 '(cua-overwrite-cursor-color "#b57614")
 '(cua-read-only-cursor-color "#98971a")
 '(custom-safe-themes
   (quote
    ("7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" default)))
 '(fci-rule-color "#ebdbb2")
 '(highlight-changes-colors (quote ("#d3869b" "#8f3f71")))
 '(highlight-symbol-colors
   (quote
    ("#eca7d1029ac0" "#d5cfdbc8aed7" "#eaa6bb6792aa" "#e0ddc362b133" "#e32ad9af9d49" "#ee3ac34a94bf" "#c5a0cc76b306")))
 '(highlight-symbol-foreground-color "#665c54")
 '(highlight-tail-colors
   (quote
    (("#ebdbb2" . 0)
     ("#c6c148" . 20)
     ("#82cc73" . 30)
     ("#5b919b" . 50)
     ("#e29a3f" . 60)
     ("#df6835" . 70)
     ("#f598a7" . 85)
     ("#ebdbb2" . 100))))
 '(hl-bg-colors
   (quote
    ("#e29a3f" "#df6835" "#cf5130" "#f598a7" "#c2608f" "#5b919b" "#82cc73" "#c6c148")))
 '(hl-fg-colors
   (quote
    ("#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7" "#fbf1c7")))
 '(hl-paren-colors (quote ("#689d6a" "#b57614" "#076678" "#8f3f71" "#98971a")))
 '(lsp-ui-doc-border "#665c54")
 '(nrepl-message-colors
   (quote
    ("#9d0006" "#af3a03" "#b57614" "#747400" "#c6c148" "#004858" "#689d6a" "#d3869b" "#8f3f71")))
 '(org-agenda-files (quote ("~/Desktop/testbib.org")))
 '(package-selected-packages
   (quote
    (pug-mode format-all poet-theme color-theme-solarized dired-sidebar web-mode js2-mode magit dumb-jump flycheck use-package yasnippet-snippets find-file-in-project elpy org-roam-bibtex org-ref org-bullets auto-complete)))
 '(pos-tip-background-color "#ebdbb2")
 '(pos-tip-foreground-color "#665c54")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#98971a" "#ebdbb2" 0.2))
 '(term-default-bg-color "#fbf1c7")
 '(term-default-fg-color "#7c6f64")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#9d0006")
     (40 . "#aa884a060b5a")
     (60 . "#b02a60b10f67")
     (80 . "#b57614")
     (100 . "#ac5581ab15c1")
     (120 . "#a7aa873816bb")
     (140 . "#a2be8c9c17c4")
     (160 . "#9d8891dd18dc")
     (180 . "#98971a")
     (200 . "#8b4b99073ab0")
     (220 . "#84009a084776")
     (240 . "#7bdf9b065366")
     (260 . "#72aa9c035ed9")
     (280 . "#689d6a")
     (300 . "#4da086527087")
     (320 . "#3e1b7b4d7349")
     (340 . "#2ac8708575c4")
     (360 . "#076678"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fbf1c7" "#ebdbb2" "#750000" "#9d0006" "#747400" "#98971a" "#8a5100" "#b57614" "#004858" "#076678" "#9f4d64" "#d3869b" "#2e7d33" "#689d6a" "#7c6f64" "#3c3836")))
 '(xterm-color-names
   ["#ebdbb2" "#9d0006" "#98971a" "#b57614" "#076678" "#d3869b" "#689d6a" "#32302f"])
 '(xterm-color-names-bright
   ["#fbf1c7" "#af3a03" "#a89984" "#3c3836" "#7c6f64" "#8f3f71" "#665c54" "#282828"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(italic ((t (:slant italic))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.1))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0)))))
