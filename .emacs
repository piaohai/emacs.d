;; ============================================================== ;;;
;; Author: Adam Jiang
;; Reversion: 2.0
;; Update: 2012/05/01
;; ============================================================== ;;;

;;; split the previous version to several parts; do NOT use byte
;;; compile anymore; all extra libraries except those with distro
;;; binaries will be put into ${HOME}/.emacs.d/site-lisp/
;;; Use this file on Ubuntu 11.04 with following package installed
;;; emacs cscope quilt w3m

;;; ============================================================= ;;;
;;; EXECUTABLE PATH
;;; ============================================================= ;;;
;;; have a private script directory for emacs only; all utilities will
;;; be put into ~/.emacs.d/scripts
(setenv "PATH" (concat (getenv "PATH") ":~/.emacs.d/scripts"))
(setq exec-path (append exec-path '("~/.emacs.d/scripts")))
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)
;;; ============================================================= ;;;
;;; LOADPATH
(let ((default-directory "~/.emacs.d/site-lisp/"))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))

(setq load-path (cons "~/.emacs.d/site-lisp/" load-path))

;;;============================================================;;;
;;; USER INFO
;;;============================================================;;;
(setq user-full-name "piaohai")
(setq user-mail-address "piaohai@gmail.com")

;;; =============================================================== ;;;
;;; Version control tools
;;; =============================================================== ;;;
;;;(require 'egg)

(mouse-avoidance-mode 'animate) ;;
(show-paren-mode 1)     
;;;-----------------------------------------------------------------;;;
;;; CEDET
;;;-----------------------------------------------------------------;;;
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
(require 'cedet)

 (setq semantic-default-submodes '(global-semantic-idle-scheduler-mode
                                   global-semanticdb-minor-mode
                                   global-semantic-idle-summary-mode
                                  global-semantic-mru-bookmark-mode))

;;;;;;;;;;
;;; JS3
;;;;;;;
;;;(add-to-list 'load-path "~/work/js3-mode")
;;;(autoload 'js3-mode "js3" nil t)
;;;(add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))

(add-to-list 'load-path "~/work/auto-complete")
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "~/work/auto-complete/dict")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)


(add-to-list 'load-path "~/work/yasnippet")
;; Load the library
(require 'yasnippet)
(yas/initialize)
;; Load the snippet files themselves
(yas/load-directory "~/work/yasnippet/snippets/text-mode")
;; Let's have snippets in the auto-complete dropdown
(add-to-list 'ac-sources 'ac-source-yasnippet)

(add-to-list 'load-path "~/work/lintnode")
(add-to-list 'load-path "~/work/flymake")
(require 'flymake-jslint)
;; Nice Flymake minibuffer messages
(require 'flymake-cursor)

;; Make sure we can find the lintnode executable
(setq lintnode-location "~/work/lintnode")
;; JSLint can be... opinionated
(setq lintnode-jslint-excludes (list 'nomen 'plusplus 'onevar 'eqeqeq 'laxbreak 'undef 'strict))
(setq lintnode-jslint-includes (list 'node 'sloppy))
(setq lintnode-jslint-set "maxlen:100")
(setq lintnode-autostart t)
;; Start the server when we first open a js file and start checking
(add-hook 'js-mode-hook
          (lambda ()
            (lintnode-hook)))

;(add-hook 'js3-mode-hook
;          (lambda ()
;            (lintnode-hook)))



(add-to-list 'load-path "~/work/js-comint")
(require 'js-comint)
;; Use node as our repl
(setq inferior-js-program-command "node")


;;git-emacs
(add-to-list 'load-path "~/work/git-emacs")
(require 'git-emacs) 
(put 'upcase-region 'disabled nil)

(when (equal system-type 'darwin)
  (setenv "PATH" (concat "/opt/local/bin:/usr/local/bin:" (getenv "PATH")))
  (push "/opt/local/bin" exec-path))


;;;Add the following custom-set-variables to use 'lazy' modes
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(js3-lazy-commas t)
 '(js3-lazy-operators t)
 '(js3-lazy-dots t)
 '(js3-expr-indent-offset 2)
 '(js3-paren-indent-offset 2)
 '(js3-square-indent-offset 2)
 '(js3-curly-indent-offset 2)
 '(lintnode-autostart true)
)



(set-cursor-color "#ffffff")
(set-background-color "black") ;; 使用黑色背景
(set-foreground-color "white") ;; 使用白色前景
(set-face-foreground 'region "green")  ;; 区域前景颜色设为绿色
(set-face-background 'region "blue") ;; 区域背景色设为蓝色

(add-to-list 'load-path "~/work/evil")
(require 'evil)
(evil-mode 1)

(setq default-directory "/home/sailor/workspace/")

;;(add-to-list 'load-path "~/work/maxframe")
;;(require 'maxframe)
;;(add-hook 'window-setup-hook 'maximize-frame t)

;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/w3m")
;;(require 'w3m-load)
;;(require 'w3m-e21)
;;(provide 'w3m-e23)
;;(autoload 'w3m "w3m" "interface for w3m on emacs" t)
;;(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;;(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)

;;(setq w3m-use-favicon nil)
;;(setq w3m-command-arguments '("-cookie" "-F"))
;;(setq w3m-use-cookies t)
;;(setq w3m-home-page "http://www.google.com")
;;(setq w3m-display-inline-image t)

(autoload 'linum-mode "linum" "toggle line numbers on/off" t) 
(global-set-key (kbd "C-<f5>") 'linum-mode)    

(add-to-list 'load-path "~/.emacs.d")
(require 'dirtree)
(require 'tree-mode)
(require 'windata)
(autoload 'dirtree "dirtree" "Add directory to tree view" t)
(global-set-key (kbd "C-<f6>") 'dirtree-show)    

(add-to-list 'load-path "~/work/highlight")
(require 'auto-highlight-symbol-config)
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

