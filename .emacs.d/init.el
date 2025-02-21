(defun append-to-load-path (dir)
  "Append DIR to the list variable ‘load-path’ only if it exist."
  (if (file-directory-p dir)
      (add-to-list 'load-path (directory-file-name dir) t)
    (message "Load-path %s does not exist" dir)))

(defun elsub (sub-dir)      ;TODO: better name
  (abbreviate-file-name
   (expand-file-name sub-dir user-emacs-directory)))

(server-start)
(defvar package-archives)               ;TODO: set INITVALUE to next line
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")
                         ;; NOTE: disabled broken or very slow
                         ;; ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("elpy" . "https://jorgenschaefer.github.io/packages/")
                         ;; https://github.com/d12frosted/elpa-mirror
                         ("melpa" . "http://melpa.org/packages/") ;MELPA
                         ;; NOTE do not use MELPA stable: https://www.reddit.com/r/emacs/comments/etikbz/speaking_as_a_package_maintainer_please_do_not/
                         ;; ("melpa" . "http://melpa.milkbox.net/packages/") ;MELPA mirror. Was down 2018-11-28
                         ;; ("melpa" . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/melpa/")
                         ))


(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
;(tooltip-mode -1)
;(menu-bar-mode -1)
(set-fringe-mode 10)
;(setq visible-bell t)
(blink-cursor-mode 0)

;(load-theme 'wombat)
;; (load-theme 'doom-solarized-dark-high-contrast)
(load-theme 'deeper-blue)
;(load-theme 'tango-dark)
;(set-face-attribute 'default nil :font "Fira Code Retina" :height 100)

; c-x c-e  ||  a-x eval-buffer
;----
;; swiper (fuzzy match over lines in buffer)


;; Initialize package sources
(require 'package)

;;  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;;  						 ("org" . "https://orgmode.org/elpa/")
;;  						 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;(use-package command-log-mode)

; (use-package ivy {{{
;   :diminish
;   :bind (("C-s" . swiper)
;          :map ivy-minibuffer-map
;          ("TAB" . ivy-alt-done)
;          ("C-1" . ivy-alt-done)
;          ("C-j" . ivy-next-line)
;          ("C-k" . ivy-previous-line)
;          :map ivy-switch-buffer-map
;          ("C-k" . ivy-previous-line)
;          ("C-l" . ivy-done)
;          ("C-d" . ivy-switch-buffer-kill)
;          :map ivy-reverse-i-search-map
;          ("C-k" . ivy-previous-line)
;          ("C-d" . ivy-reverse-i-search-kill))
;   :config
;   (ivy-mode 1)) }}}

; https://github.com/emacs-evil/evil (+directions for installing)
;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 10)))
(use-package doom-themes)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package lsp-mode
  :ensure t
  :hook (prog-mode . lsp-deferred)
  :custom
  (lsp-completion-provider t)
  (lsp-auto-guess-root t)
  (lsp-keep-workspace-alive nil)
  (lsp-warn-no-matched-clients nil) ;silence warning when loading ‘emacs-lisp-mode’.
  :config
  (lsp-dired-mode 1)  ;TODO: currently doesn’t have any visible in dired buffers
  ;; silence warning when loading ‘emacs-lisp-mode’.
  (add-to-list 'lsp-language-id-configuration '(emacs-lisp-mode . "elisp")))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;;; Slime ----
; (setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/.quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "/usr/bin/sbcl")

;;; ===========================================================================
;;; LilyPond

(when (append-to-load-path (elsub "lilypond"))
  (load-file (file-name-concat (elsub "lilypond") "lilypond-init.el"))
  (require 'lilypond-mode))

(use-package flycheck-lilypond
  :ensure t
  :defer t
  :config
  (add-hook 'LilyPond-mode-hook 'flycheck-mode)
  (eval-after-load 'flycheck '(require 'flycheck-lilypond)))

;(use-package ivy-rich
;  :init

; (autoload 'iimage-mode "iimage" "Support Inline image minor mode." t)
; (autoload 'turn-on-iimage-mode "iimage" "Turn on Inline image minor mode." t)

(global-set-key [(f6)] 'first-error)
(global-set-key [(f7)] 'previous-error)
(global-set-key [(f8)] 'next-error)
(global-set-key [(f11)] 'compile)
(global-set-key [(control f11)] 'recompile)

;;; Eclipse Style bindings
(global-set-key [(control meta ?,)] 'previous-error)
(global-set-key [(control meta ?.)] 'next-error)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-safe-themes
   '("9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac" "f6665ce2f7f56c5ed5d91ed5e7f6acb66ce44d0ef4acfaa3a42c7cfe9e9a9013" default))
 '(exwm-floating-border-color "#011417")
 '(fci-rule-color "#62787f")
 '(highlight-tail-colors
   ((("#0e332f" "#0e332f" "green")
     . 0)
    (("#06343d" "#06343d" "brightcyan")
     . 20)))
 '(jdee-db-active-breakpoint-face-colors (cons "#01323d" "#3c98e0"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#01323d" "#93a61a"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#01323d" "#56697A"))
 '(objed-cursor-color "#ec423a")
 '(package-selected-packages
   '(slime flycheck-lilypond lsp-mode flycheck which-key rainbow-delimiters doom-themes doom-modeline evil use-package))
 '(pdf-view-midnight-colors (cons "#8d9fa1" "#002732"))
 '(rustic-ansi-faces
   ["#002732" "#ec423a" "#93a61a" "#c49619" "#3c98e0" "#e2468f" "#3cafa5" "#8d9fa1"])
 '(vc-annotate-background "#002732")
 '(vc-annotate-color-map
   (list
    (cons 20 "#93a61a")
    (cons 40 "#a3a019")
    (cons 60 "#b39b19")
    (cons 80 "#c49619")
    (cons 100 "#cb811c")
    (cons 120 "#d36c1f")
    (cons 140 "#db5823")
    (cons 160 "#dd5247")
    (cons 180 "#df4c6b")
    (cons 200 "#e2468f")
    (cons 220 "#e54472")
    (cons 240 "#e84356")
    (cons 260 "#ec423a")
    (cons 280 "#c64b4a")
    (cons 300 "#a1555a")
    (cons 320 "#7b5f6a")
    (cons 340 "#62787f")
    (cons 360 "#62787f")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
