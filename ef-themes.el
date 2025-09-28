;;; ef-themes.el --- Colorful and legible themes -*- lexical-binding:t -*-

;; Copyright (C) 2022-2025  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Protesilaos Stavrou <info@protesilaos.com>
;; URL: https://github.com/protesilaos/ef-themes
;; Version: 1.11.0
;; Package-Requires: ((emacs "28.1") (modus-themes "4.9.0"))
;; Keywords: faces, theme, accessibility

;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; The `ef-themes' are a collection of light and dark themes for GNU
;; Emacs whose goal is to provide colorful ("pretty") yet legible
;; options for users who want something with a bit more flair than the
;; `modus-themes' (also designed by me).
;;
;; "Ef" is a Greek word (ευ), commonly used as a prefix to denote
;; something good, nice, and/or easy.  For example, eftopia (ευτοπία)
;; is the opposite of dystopia (δυστοπία): a good place as opposed to
;; a bad place.
;;
;; The backronym of the `ef-themes' is: Eclectic Fashion in Themes
;; Hides Exaggerated Markings, Embellishments, and Sparkles.

;;; Code:



(require 'seq)
(require 'modus-themes)
(eval-when-compile (require 'subr-x))

(defgroup ef-themes ()
  "Colorful and legible themes."
  :group 'faces
  :link '(info-link "(ef-themes) Top")
  :link '(url-link :tag "Homepage" "https://protesilaos.com/emacs/ef-themes")
  :link '(url-link :tag "Sample pictures" "https://protesilaos.com/emacs/ef-themes-pictures")
  :prefix "ef-themes-"
  :tag "Ef Themes")

;;; User options

(defconst ef-themes-light-themes
  '(ef-arbutus
    ef-cyprus
    ef-day
    ef-deuteranopia-light
    ef-duo-light
    ef-eagle
    ef-elea-light
    ef-frost
    ef-kassio
    ef-light
    ef-maris-light
    ef-melissa-light
    ef-reverie
    ef-spring
    ef-summer
    ef-trio-light
    ef-tritanopia-light)
  "List of symbols with the light Ef themes.")

(defconst ef-themes-dark-themes
  '(ef-autumn
    ef-bio
    ef-cherie
    ef-dark
    ef-deuteranopia-dark
    ef-dream
    ef-duo-dark
    ef-elea-dark
    ef-maris-dark
    ef-melissa-dark
    ef-night
    ef-owl
    ef-rosa
    ef-symbiosis
    ef-trio-dark
    ef-tritanopia-dark
    ef-winter)
  "List of symbols with the dark Ef themes.")

(defvaralias 'ef-themes-collection 'ef-themes-items
  "Alias of `ef-themes-items'.")

(defconst ef-themes-items
  (append ef-themes-light-themes ef-themes-dark-themes)
  "Symbols of all the Ef themes.")

(defconst ef-themes-palette-common
  '((bg-line-number-active unspecified)
    (bg-line-number-inactive unspecified)
    (bg-mode-line-inactive bg-alt)
    (bg-space unspecified)
    (bg-tab-bar bg-alt)
    (bg-tab-current bg-main)
    (bg-tab-other bg-active)
    (border-mode-line-active border)
    (border-mode-line-inactive border)
    (fg-line-number-active accent-0)
    (fg-mode-line-inactive fg-dim)
    (fg-region unspecified)
    (fg-space border)
    (fringe unspecified)

    (fg-heading-0 rainbow-0)
    (fg-heading-1 rainbow-1)
    (fg-heading-2 rainbow-2)
    (fg-heading-3 rainbow-3)
    (fg-heading-4 rainbow-4)
    (fg-heading-5 rainbow-5)
    (fg-heading-6 rainbow-6)
    (fg-heading-7 rainbow-7)
    (fg-heading-8 rainbow-8))
  "Common palette mappings for the Ef themes.")

(defcustom ef-themes-common-palette-overrides nil
  "Set palette overrides for all the Ef themes.

Mirror the elements of a theme's palette, overriding their value.
The palette variables are named THEME-NAME-palette, while
individual theme overrides are THEME-NAME-palette-overrides.  The
THEME-NAME is one of the symbols in `ef-themes-collection'.

Individual theme overrides take precedence over these common
overrides.

To preview the palette entries, use `ef-themes-preview-colors' or
`ef-themes-preview-colors-current' (read the documentation for
further details)."
  :group 'ef-themes
  :package-version '(ef-themes . "1.0.0")
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(ef-themes) Palette overrides"))

(dolist (theme modus-themes-items)
  (unless (custom-theme-p theme)
    (custom-declare-theme theme 'modus-themes)
    (provide-theme theme)
    (load-theme theme t t)))

;; NOTE 2025-09-28: The `modus-themes-theme' macro also does this, but
;; we want to do it before each theme is loaded so that all commands
;; work as intended.
(dolist (theme ef-themes-items)
  (add-to-list 'modus-themes-registered-items theme))

;;;; Add themes from package to path

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (file-equal-p dir (expand-file-name "themes/" data-directory))
      (add-to-list 'custom-theme-load-path dir))))

(provide 'ef-themes)
;;; ef-themes.el ends here
