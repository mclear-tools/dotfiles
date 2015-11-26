;;; packages.el --- helm-bibtex Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq helm-bibtex-packages
      '(helm-bibtex))

;; List of packages to exclude.
(setq helm-bibtex-excluded-packages '())

;; For each package, define a function helm-bibtex/init-<package-name>
;;
(defun helm-bibtex/init-helm-bibtex ()
  (use-package helm-bibtex)
    :defer t
    :config
    (load "parsebib.el")
    (setq helm-bibtex-bibliography '("~/Dropbox/Work/Master.bib"))
    (setq helm-bibtex-library-path "~/Dropbox/Work/MasterLib/")
    (setq helm-bibtex-notes-path "~/Dropbox/Work/MasterLib/BibNotes/bibnotes.org")
    (setq helm-bibtex-notes-extension ".org")
    (setq helm-bibtex-additional-search-fields '(keywords)) ;; search keywords field
    ;; Set insert citekey with markdown citekeys for org-mode
    (setq helm-bibtex-format-citation-functions
           '((org-mode      . helm-bibtex-format-citation-pandoc-citeproc)
            (latex-mode    . helm-bibtex-format-citation-cite)
            (markdown-mode . helm-bibtex-format-citation-pandoc-citeproc)
            (default       . helm-bibtex-format-citation-default)))

    ;; Set default action for helm-bibtex as inserting pandoc citation
    (helm-delete-action-from-source "Insert citation" helm-source-bibtex)
    (helm-add-action-to-source "Insert citation" 'helm-bibtex-insert-citation helm-source-bibtex 0)


;;  (autoload 'helm-bibtex "helm-bibtex" "" t)
   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
