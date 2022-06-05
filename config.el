;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "samoorai"
      user-mail-address "bartelloni.guglielmo@gmail.com")


(setq display-line-numbers-type t)
(latex-preview-pane-enable)
(use-package laas
  :hook (LaTeX-mode . laas-mode)
  :config ; do whatever here
  (aas-set-snippets 'laas-mode
                    ;; set condition!
                    "tex" (lambda () (interactive)
                            (yas-expand-snippet "\\textbf{$1}$0"))
                    :cond #'texmathp ; expand only while in math
                    "supp" "\\supp"
                    "On" "O(n)"
                    "O1" "O(1)"
                    "Olog" "O(\\log n)"
                    "Olon" "O(n \\log n)"
                    "Olon" "O(n \\log n)"
                    ;; bind to functions!
                    "sum" (lambda () (interactive)
                            (yas-expand-snippet "\\sum_{$1}^{$2} $0"))
                    "span" (lambda () (interactive)
                             (yas-expand-snippet "\\Span($1)$0"))
                    ;; add accent snippets
                    :cond #'laas-object-on-left-condition
                    "qq" (lambda () (interactive) (laas-wrap-previous-object "sqrt"))))

(setq doom-font (font-spec :family "Fira Code" :size 16 :weight 'medium))

(setq doom-theme 'doom-one-light)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(setq org-directory "~/Nextcloud/Documents/org")
(setq org-roam-dailies-directory "journal/")
