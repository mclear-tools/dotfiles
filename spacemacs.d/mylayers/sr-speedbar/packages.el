;;; packages.el --- sr-speedbar Layer packages File for Spacemacs
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
(setq sr-speedbar-packages
    '(sr-speedbar))

(defun sr-speedbar/post-init-sr-speedbar ()
  (defun spacemacs/sr-speedbar-show-or-hide ()
    (interactive)
    (cond ((sr-speedbar-exist-p) (kill-buffer speedbar-buffer))
          (t (sr-speedbar-open) (linum-mode -1) (speedbar-refresh)))))

(defun sr-speedbar/init-sr-speedbar ()
  (use-package sr-speedbar
    :defer t
    :init
    (setq sr-speedbar-width 50)
    (setq sr-speedbar-right-side nil)
    (setq speedbar-show-unknown-files t) ; show all files
    (setq speedbar-use-images nil)
    :config
    (spacemacs|evilify-map speedbar-mode-map)))

;; List of packages to exclude.
(setq sr-speedbar-excluded-packages '())

;; For each package, define a function sr-speedbar/init-<package-name>
;;
;; (defun sr-speedbar/init-sr-speedbar ()

;;  )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
