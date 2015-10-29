;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/mylayers/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     deft
     emacs-lisp
     eyebrowse
     git
     helm-bibtex
     latex
     markdown
     org
     osx
     pandoc
     pdf-tools
     (ranger :variables
             ranger-show-preview t)
     (shell :variables
            shell-default-term-shell "/usr/local/bin/zsh"
            shell-default-shell 'ansi-term
            shell-default-height 30
            shell-default-position 'bottom)
     shell-scripts
     spell-checking
     sr-speedbar
     syntax-checking
     themes-megapack
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(
                                      lorem-ipsum
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         darktooth
                         wilson
                         sanityinc-solarized-dark
                         jazz
                         sanityinc-solarized-light
                         leuven
                         ample
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Inconsolata"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.4)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."

  ;;;;MODELINE;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq display-time-format "%a %b %d | %H:%M |")
  (display-time-mode)

  ;;;;;;EVIL ESCAPE SEQUENCE;;;;;;;;;;;;;;;;;;
  ;; (setq evil-escape-key-sequence "jk")

  ;;; LOCALE SETTINGS: UTF-8  ;;;;;;;;;;;;;;;;;;
  (setq locale-coding-system 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (set-language-environment 'utf-8)

  ;;; CRUFT ;;;;;;;;;;;;;;;;;;;;
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (menu-bar-mode -1)

    ;;; MODE HOOKS
  (add-hook 'text-mode-hook '(lambda() (turn-on-auto-fill) (set-fill-column 72)))
  (add-hook 'org-mode-hook
            '(lambda()
               (turn-on-auto-fill)
               (set-fill-column 72)
               (golden-ratio-mode)
               (centered-cursor-mode)))
  (add-hook 'markdown-mode-hook '(lambda() (turn-on-auto-fill) (set-fill-column 72)))


  ;;; OTHER ;;;;;;;;;;;;;;;;;;
  (setq-default vc-follow-symlinks t)
  (setq-default git-magit-status-fullscreen t)

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."

  ;;;;; GENERAL SETTINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;;; Turn of minor mode in modeline
  (spacemacs/toggle-mode-line-minor-modes)

  ;; Auto-Save ;;;;;;;;;;;;;;;;;;;;;;;;

  (defun full-auto-save ()
	  (interactive)
	  (save-excursion
      (dolist (buf (buffer-list))
        (set-buffer buf)
        (if (and (buffer-file-name) (buffer-modified-p))
            (basic-save-buffer)))))
	(add-hook 'auto-save-hook 'full-auto-save)

  ;; Count words ;;;;;;;;;;;;;;;
  (evil-leader/set-key "ow" 'count-words)
  ;; visual line mode
  (add-hook 'text-mode-hook 'turn-on-visual-line-mode)
  ;; navigate using visual lines rather than true lines
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  ;; MODELINE control seperators
  (setq powerline-default-separator 'arrow)

  ;;; LINE NUMBERS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;(global-linum-mode) ;; show line numbers
  ; Turn on line numbers for hooked osd modes
  (add-hook 'prog-mode-hook 'linum-mode)
  (add-hook 'markdown-mode-hook
            (lambda ()
              (linum-mode)))
  ;;; line number spacing
  (setq linum-format "%4d ")

  ;;; Highlight current line number
    (require 'linum)

    (defvar linum-current-line 1 "Current line number.")
    (defvar linum-border-width 1 "Border width for linum.")

    (defface linum-current-line
    `((t :inherit linum
        :foreground "goldenrod"
        :weight bold
        ))
    "Face for displaying the current line number."
    :group 'linum)

    (defadvice linum-update (before advice-linum-update activate)
    "Set the current line."
    (setq linum-current-line (line-number-at-pos)
            ;; It's the same algorithm that linum dynamic. I only had added one
            ;; space in front of the first digit.
            linum-border-width (number-to-string
                                (+ 1 (length
                                    (number-to-string
                                    (count-lines (point-min) (point-max))))))))

    (defun linum-highlight-current-line (line-number)
    "Highlight the current line number using `linum-current-line' face."
    (let ((face (if (= line-number linum-current-line)
                    'linum-current-line
                    'linum)))
        (propertize (format (concat "%" linum-border-width "d") line-number)
                    'face face)))

    (setq linum-format 'linum-highlight-current-line)

  ;;; PACKAGE SETTINGS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    ;; MAGIT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (setq magit-repository-directories '("~/Dropbox/Work/Projects/"))

  ;;; RANGER ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (setq
     ranger-cleanup-eagerly t
     ranger-show-dotfiles t
     ranger-ignored-extensions '("mkv" "iso" "mp4")
     ranger-max-preview-size 40)

  ;;; ORG MODE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    (setq default-major-mode 'org-mode) ;; Default to Org Mode
    (require 'org-inlinetask)  ;; allow inline todos
    (setq org-hide-emphasis-markers t)  ;; hide markers 
    (setq org-pretty-entities t) ;; make latex look good
    (evil-leader/set-key "oc" 'clone-indirect-buffer-other-window) ;; set up outline and doc view
    ;;(setq org-latex-pdf-process '("latexmk -f -xelatex %f"))
    ;; go to headings in org
    ;; (setq org-goto-interface 'outline
    ;;       org-goto-max-level 10)

  ;;; ORG LATEX;;;;;;;;;;;;;
    (setq org-latex-pdf-process (list "latexmk -pdflatex=xelatex -f -pdf %f"))
    ;; latex config
    (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  ;;; ORG PANDOC
    (evil-leader/set-key "op" 'org-pandoc-export-to-latex-pdf-and-open)
    ;; default options for all output formats
    (setq org-pandoc-options '((standalone . t)))
    ;; cancel above settings only for 'docx' format
    (setq org-pandoc-options-for-docx '((standalone . nil)))
    ;; special settings for beamer-pdf and latex-pdf exporters
    (setq org-pandoc-options-for-beamer-pdf '((latex-engine . "xelatex")))
    (setq org-pandoc-options-for-latex-pdf '((latex-engine . "xelatex")))

  ;;; HELM_BIBTEX ;;;;;;;;;;;;;;;;;;;;;;;;
  (autoload 'helm-bibtex "helm-bibtex" "" t)
  (load "parsebib.el")
  (setq helm-bibtex-bibliography '("~/Dropbox/Work/Master.bib"))
  (setq helm-bibtex-library-path "~/Dropbox/Work/MasterLib/")
  (setq helm-bibtex-notes-path "~/Dropbox/Work/MasterLib/BibNotes/")
  (setq helm-bibtex-notes-extension ".org")
  (setq helm-bibtex-additional-search-fields '(keywords)) ;; search keywords field
  ;; Set insert citekey with markdown citekeys for org-mode
  (setq helm-bibtex-format-citation-functions
        '((org-mode      . helm-bibtex-format-citation-pandoc-citeproc)
          (latex-mode    . helm-bibtex-format-citation-cite)
          (markdown-mode . helm-bibtex-format-citation-pandoc-citeproc)
          (default       . helm-bibtex-format-citation-default)))

  ;; Set global shortcut for calling helm-bibtex
  (global-set-key (kbd "C-c r") 'helm-bibtex)

  ;; Set default action for helm-bibtex as inserting pandoc citation
  (helm-delete-action-from-source "Insert citation" helm-source-bibtex)
  (helm-add-action-to-source "Insert citation" 'helm-bibtex-insert-citation helm-source-bibtex 0)

  ;;; Version Control-X-prefix
  (setq global-diff-hl-mode)

  ;;; Deft settings
  (setq deft-extensions '("org" "md" "txt"))
  (setq deft-directory "~/Dropbox/Notes")
  (setq deft-text-mode 'org-mode)
  (setq deft-recursive t)
  (setq deft-use-filter-string-for-filename t)

  ;;; markdown & pandoc settings
  (add-hook 'markdown-mode-hook 'pandoc-mode)
  (setq markdown-command "/usr/local/bin/pandoc")
  (setq markdown-open-command "/usr/local/bin/mark")
  (setq markdown-enable-math t)

  ;;; PDF TOOLS SETTINGS

  ;; Use instead of Doc-View
  (defvar tv/prefer-pdf-tools (fboundp 'pdf-view-mode))
  (defun tv/start-pdf-tools-if-pdf ()
    (when (and tv/prefer-pdf-tools
               (eq doc-view-doc-type 'pdf))
      (pdf-view-mode)))

  (add-hook 'doc-view-mode-hook 'tv/start-pdf-tools-if-pdf)

  ;;; Only use spaces
  (setq-default indent-tabs-mode nil)

  ;;; SR-SPEEDBAR ;;;;;;;;;;;;;;;;;;;
  (defun sb-expand-curren-file ()
    "Expand current file in speedbar buffer"
    (interactive)
    (setq current-file (buffer-file-name))
    (sr-speedbar-toggle)
    (sr-speedbar-select-window)
    (sr-speedbar-refresh)
    ;; (switch-to-buffer-other-frame "*SPEEDBAR*")
    (speedbar-find-selected-file current-file)
    (speedbar-expand-line))

  ;; (evil-leader/set-key "os" 'sr-speedbar-toggle)
  (evil-leader/set-key "oe" 'sb-expand-curren-file)

  ;;; LOCATE WITH SPOTLIGHT ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (if (eq system-type 'darwin) (setq helm-locate-fuzzy-match nil))
  (setq helm-locate-command
        (case system-type
          ('gnu/linux "locate -i -r %s")
          ('berkeley-unix "locate -i %s")
          ('windows-nt "es %s")
          ('darwin "mdfind -name %s %s")
          (t "locate %s")))
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
