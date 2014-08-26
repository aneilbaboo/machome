(setq inhibit-splash-screen t)
(setq delete-selection-mode 1)
(setq standard-indent 2)
(setq-default indent-tabs-mode nil)
(put 'upcase-region 'disabled nil)
(add-to-list 'load-path "~/.emacs.d/")
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict/")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

;; js mode setup:
(setq js-indent-level 2)

;; yasnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(setq yas/snippet-dirs "~/.emacs.d/plugins/yasnippet/snippets")
(yas/initialize)
(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets/text-mode")
(add-to-list 'ac-sources 'ac-source-yasnippet)
(yas/global-mode 1)

;; start lintnode
(start-process "lintnode" "lintnode" "node" "~/.emacs.d/plugins/lintnode/app.js" "--set" "sloppy:true")

;; lintnode - node.js syntax checking
;;(add-to-list 'load-path "~/.emacs.d/plugins/lintnode")
;;(require 'flymake-jslint)
;; Make sure we can find the lintnode executable
;;(setq lintnode-location "~/.emacs.d/plugins/lintnode")
;; JSLint can be... opinionated
;;(setq lintnode-jslint-excludes (list 'nomen 'undef 'plusplus 'onevar 'white))
;; Start the server when we first open a js file and start checking
;;(add-hook 'js-mode-hook
 ;;         (lambda ()
  ;;          (lintnode-hook)))
;; lintnode settings:
;;(setq lintnode-jslint-set "sloppy:true")


(add-to-list 'load-path "~/.emacs.d/minor-modes")
;; mdfind mode:
(require 'mdfind)

;; Flymake Cursor - moar syntax checking!
;; Nice Flymake minibuffer messages
;;(require 'flymake-cursor)

;; js-comint - REPL for javascript
(add-to-list 'load-path "~/.emacs.d/plugins")
(require 'js-comint)
;; Use node as our repl
(setq inferior-js-program-command "node")
 
(setq inferior-js-mode-hook
      (lambda ()
        ;; We like nice colors
        (ansi-color-for-comint-mode-on)
        ;; Deal with some prompt nonsense
        (add-to-list 'comint-preoutput-filter-functions
		     (lambda (output)
                       (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
						 (replace-regexp-in-string ".*1G.*3G" "> " output))))))

;; MARKDOWN major mode
(add-to-list 'load-path "~/.emacs.d/major-modes/markdown-mode")
(defun my-markdown-mode-hooks () 
  (auto-fill-mode 0)
  )
(autoload 'markdown-mode "markdown-mode.el")
(setq auto-mode-alist
      (append '(("\\.text" . markdown-mode) ("\\.md" . markdown-mode))
              auto-mode-alist))


;; DUST as html mode
(setq auto-mode-alist
      (append `(("\\.dust" . html-mode)) auto-mode-alist))

;; load Yegge
(load-library "yegge.el")
