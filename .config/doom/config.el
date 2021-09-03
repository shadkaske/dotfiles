;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Shad Kaske"
    user-mail-address "skaske@showplacewood.com")

;; Don't Ask to Close
(setq confirm-kill-emacs nil)

;; Disable Clipboard Selection and Manager
;; (setq select-enable-clipboard nil
(setq x-select-enable-clipboard-manager t)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 16)
    doom-variable-pitch-font (font-spec :family "Cantarell" :size 16)
    doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 24))
(custom-set-faces!
'(font-lock-comment-face :slant italic)
'(font-lock-keyword-face :slant italic))

;; Variable Pitch Font Setting Function
(defun smk/set-buffer-variable-pitch ()
  (interactive)
  (variable-pitch-mode t)
  (setq line-spacing 3)
  (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-link nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-date nil :inherit 'fixed-pitch)
  (set-face-attribute 'org-special-keyword nil :inherit 'fixed-pitch))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Nextcloud/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `visual)

;; LSP Config settings
(setq
 lsp-auto-guess-root t
 lsp-keymap-prefix "M-l"
 lsp-file-watch-threshold 2000
 lsp-intelephense-licence-key "00JMKSX69F0RDXE"
 lsp-headerline-breadcrumb-enable nil)

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.git\\'"))
;; (map!
;;  :leader
;;  :desc "+LSP"
;;  "l" #'+default/lsp-command-map)

;; Treemacs Config
;; (treemacs-resize-icons 12)

(map!
 :leader
 :desc "treemacs"
 "e" #'+treemacs/toggle)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; mu4e
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")

(require 'org-mu4e)
(add-hook 'org-mode-hook 'org-appear-mode)
(remove-hook! 'mu4e-compose-pre-hook 'org-msg-mode)
(setq! mu4e-attachment-dir "~/Downloads")
(setq! mu4e-maildir (expand-file-name "~/Mail")
        mu4e-get-mail-command "mbsync -a"
        mu4e-update-interval 300
        mu4e-index-update-in-background t
        mu4e-compose-signature-auto-include nil
        mu4e-view-show-addresses t
        mu4e-view-show-images t
        mu4e-use-fancy-chars t
        mu4e-compose-format-flowed t
        mu4e-change-filenames-when-moving t
        mu4e-sent-messages-behavior 'sent)

(setq! mu4e-contexts
        (list
        ;; Work Account
        (make-mu4e-context
        :name "Showplace"
        :match-func
        (lambda (msg)
        (when msg (string-prefix-p "/swp" (mu4e-message-field msg :maildir) t)))
        :vars '((user-mail-address . "skaske@showplacewood.com")
                (mu4e-drafts-folder . "/swp/Drafts")
                (mu4e-sent-folder . "/swp/Sent Items")
                (mu4e-refile-folder . "/swp/Archive")
                (mu4e-trash-folder . "/swp/Deleted Items")
                (mu4e-compose-signature . (concat
                                        "Shad Kaske\n"
                                        "Systems Administrator\n"
                                        "Showplace Cabinetry\n"
                                        "Shad.Kaske@showplacecabinetry.com\n"
                                        "(605) 743-5006"))))
        (make-mu4e-context
        ;; Personal Account
        :name "Gmail"
        :match-func
        (lambda (msg)
        (when msg (string-prefix-p "/gmail" (mu4e-message-field msg :maildir) t)))
        :vars '((user-mail-address . "shadkaske@gmail.com")
                (mu4e-drafts-folder . "/gmail/Drafts")
                (mu4e-sent-folder . "/gmail/Sent Mail")
                (mu4e-refile-folder . "/gmail/All Mail")
                (mu4e-trash-folder . "/gmail/Trash")))))

;; ;;;; Mailbox Shortcuts
;; (setq mu4e-maildir-shortcuts
;;       '(("/kaskshad-showplace/INBOX" . ?si)
;;         ("/kaskshad-showplace/Drafts" . ?sd)))

;;;; Send Mail Settings
(setq! sendmail-program "/usr/bin/msmtp"
        send-mail-function 'smtpmail-send-it
        message-sendmail-f-is-evil t
        message-sendmail-extra-arguments '("--read-envelope-from")
        message-send-mail-function 'message-send-mail-with-sendmail)

;; Org Mode
;;;; Disable LineNumber in Org Mode
;; (add-hook! 'org-mode-hook #'doom-disable-line-numbers-h)

;;;; Set org-appear hook
(add-hook! 'org-mode-hook #'org-superstar-mode)

;;;; Set Variable Pitch Fonts for org mode
;; (add-hook! 'org-mode-hook 'smk/set-buffer-variable-pitch)

(setq org-hide-emphasis-markers t)

;; Set indent mode to 4 spaces
(setq org-indent-indentation-per-level 4)

;;;; Turn On Logging
(setq org-log-done t)
(setq org-log-into-drawer t)
;;  Org ToDo Keywords
(setq org-todo-keywords '((sequence
                        "TODO(t)" "NEXT(n)" "WAITING(w)" "|" "DONE(d!)" "CANC(k!)")
                        (sequence
                        "ACTIVE(a)" "PLAN(p)" "HOLD(h)" "|" "COMPLETE(c!)" )))
;;  Org Todo Keywords Colors
(setq org-todo-keyword-faces '(("TODO" . "DarkCyan")
                                ("NEXT" . "DarkOrange")
                                ("WAITING" . "DimGray")
                                ("ACTIVE" . "LightCoral")
                                ("PLAN" . "BlanchedAlmond")
                                ("HOLD" . "DimGray")))
;;;; Org Agenda Files
(setq org-agenda-files '("~/Nextcloud/org/inbox.org"
                        "~/Nextcloud/org/projects.org"
                        "~/Nextcloud/org/tickler.org"
                        "~/Nextcloud/org/cal/googlecal.org"
                        "~/Nextcloud/org/cal/showplacecal.org"))

;;;; Org Capture Templates
(setq! org-capture-templates
'(("t" "ToDo [Inbox]"
        entry (file "~/Nextcloud/org/inbox.org")
        "* TODO %i%?\n")
        ("T" "Tickler"
        entry (file "~/Nextcloud/org/tickler.org")
        "* TODO %i%? \nSCHEDULED: <%(org-read-date nil nil \"+1d\")>")
        ("P" "New Project"
        entry (file "~/Nextcloud/org/projects.org")
        "* %i%? ")
        ("e" "Email [Inbox]"
        entry (file "~/Nextcloud/org/inbox.org")
        "* TODO %? \n %a")
        ("f" "Link File [Inbox]"
        entry (file "~/Nextcloud/org/inbox.org")
        "* TODO %?\n %A\n")))

;;;; Org Agenda Views
(setq org-agenda-custom-commands
'(("d" "Dashboard"
        ((agenda "" ((org-deadline-warning-days 7)))
        (todo "NEXT" ((org-agenda-overriding-header "Next Task")
                        (org-agenda-sorting-strategy '(priority-down))))
        (todo "ACTIVE" ((org-agenda-overriding-header "Active Projects")))
        (todo "WAITING" ((org-agenda-overriding-header "Waiting Tasks")))))))

;;;; Org Tag Settings
(setq org-tags-column -80)

(setq org-tag-alist '((:startgroup . "Context")
                ("@work" . ?w)
                ("@home" . ?h)
                ("@errands" . ?e)
                ("@email" . ?@)
                ("@dev" . ?d)
                (:endgroup . "Context")
                (:startgroup . "People")
                ("chad" . ?c)
                ("andy" . ?a)
                ("travis" . ?t)
                (:endgroup . "People")
                ("@followup" . ?f)))

;;;; Org Refiler Targets
(setq org-refile-targets '((org-agenda-files :maxlevel . 3)
                        ("~/Nextcloud/org/someday.org" :maxlevel . 2)))
(setq org-refile-allow-creating-parent-nodes 'confirm)
(advice-add 'org-refile :after 'org-save-all-org-buffers)
(setq org-ellipsis "  ▼")
(setq org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●"))
;;;; Org Headline Sizes
(custom-set-faces
'(org-level-1 ((t (:inherit outline-1 :height 1.2))))
'(org-level-2 ((t (:inherit outline-2 :height 1.1))))
'(org-level-3 ((t (:inherit outline-3 :height 1.0))))
'(org-level-4 ((t (:inherit outline-4 :height 0.9))))
'(org-level-5 ((t (:inherit outline-5 :height 0.85)))))

(add-hook! org-mode (electric-indent-local-mode -1))

;;;; Archiving
(use-package! org-archive
  :after org
  :config
  (setq org-archive-location "archive.org::datetree/"))

;;;; Visual Fill Column Mode
(defun smk/org-mode-visual-fill ()
  (setq visual-fill-column-width 120
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

;;;; Visual Fill Column Mode
(defun smk/org-mode-visual-fill ()
  (setq visual-fill-column-width 120
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package! visual-fill-column
  :hook (org-mode . smk/org-mode-visual-fill))
