;;; ef-themes.el --- Colorful and legible themes -*- lexical-binding:t -*-

;; Copyright (C) 2022-2025  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Protesilaos Stavrou <info@protesilaos.com>
;; URL: https://github.com/protesilaos/ef-themes
;; Version: 2.0.1
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))
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



(require 'modus-themes)
(eval-when-compile (require 'subr-x))

;;;; Basics for building on top of Modus

(defgroup ef-themes ()
  "Colorful and legible themes.
The `ef-themes' are built on top of the `modus-themes'.  To make all the
Modus commands that operate on a theme only consider Ef themes, enable the
`ef-themes-take-over-modus-themes-mode'.  Or, if you prefer to blend Ef
and Modus into a single group, enable `modus-themes-include-derivatives-mode'."
  :group 'faces
  :group 'modus-themes
  :link '(info-link "(ef-themes) Top")
  :link '(info-link "(modus-themes) Top")
  :prefix "ef-themes-"
  :tag "Ef Themes")

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
  "Alias for `ef-themes-items'.")

(defconst ef-themes-items
  (append ef-themes-light-themes ef-themes-dark-themes)
  "Symbols of all the Ef themes.")

(defconst ef-themes-custom-faces
  '(
    `(magit-section-highlight ((,c :background ,bg-alt)))
    `(magit-diff-file-heading-highlight ((,c :inherit magit-diff-file-heading :background ,bg-alt)))))

(defconst ef-themes-with-properties
  '((ef-arbutus ef-themes "Legible light pink theme with red and green colors." light modus-operandi-palette ef-arbutus-palette ef-arbutus-palette-overrides)
    (ef-autumn ef-themes "Legible dark brown-black theme with warm colors (red, yellow, green, teal)." dark modus-vivendi-palette ef-autumn-palette ef-autumn-palette-overrides)
    (ef-bio ef-themes "Legible dark green-black theme with green, teal, blue, purple colors." dark modus-vivendi-palette ef-bio-palette ef-bio-palette-overrides)
    (ef-cherie ef-themes "Legible dark purple-black theme with warm colors (mostly pink, magenta, gold)." dark modus-vivendi-palette ef-cherie-palette ef-cherie-palette-overrides)
    (ef-cyprus ef-themes "Legible light ochre theme with green, yellow, teal, red colors." light modus-operandi-palette ef-cyprus-palette ef-cyprus-palette-overrides)
    (ef-dark ef-themes "Legible dark theme with blue, magenta, cyan, purple colors." dark modus-vivendi-palette ef-dark-palette ef-dark-palette-overrides)
    (ef-day ef-themes "Legible light sandy theme with warm, varied colors (yellow, red, green, purple)." light modus-operandi-palette ef-day-palette ef-day-palette-overrides)
    (ef-deuteranopia-dark ef-themes "Legible dark theme, optimized for red-green color deficiency." dark modus-vivendi-deuteranopia-palette ef-deuteranopia-dark-palette ef-deuteranopia-dark-palette-overrides)
    (ef-deuteranopia-light ef-themes "Legible light theme, optimized for red-green color deficiency." light modus-operandi-deuteranopia-palette ef-deuteranopia-light-palette ef-deuteranopia-light-palette-overrides)
    (ef-dream ef-themes "Legible dark purple grey theme with gold and nuanced colors." dark modus-vivendi-palette ef-dream-palette ef-dream-palette-overrides)
    (ef-duo-dark ef-themes "Legible dark theme with mostly blue and orange colors." dark modus-vivendi-palette ef-duo-dark-palette ef-duo-dark-palette-overrides)
    (ef-duo-light ef-themes "Legible light theme with mostly blue and yellow colors." light modus-operandi-palette ef-duo-light-palette ef-duo-light-palette-overrides)
    (ef-eagle ef-themes "Legible light beige theme with brown, red, and desatured colors." light modus-operandi-palette ef-eagle-palette ef-eagle-palette-overrides)
    (ef-elea-dark ef-themes "Legible dark green theme with brown, magenta, and green colors." dark modus-vivendi-palette ef-elea-dark-palette ef-elea-dark-palette-overrides)
    (ef-elea-light ef-themes "Legible light green theme with brown, magenta, and green colors." light modus-operandi-palette ef-elea-light-palette ef-elea-light-palette-overrides)
    (ef-frost ef-themes "Legible light cool theme with blue, cyan, teal, purple colors." light modus-operandi-palette ef-frost-palette ef-frost-palette-overrides)
    (ef-kassio ef-themes "Legible light grey theme with blue, red, magenta, and earthly colors." light modus-operandi-palette ef-kassio-palette ef-kassio-palette-overrides)
    (ef-light ef-themes "Legible light theme with blue, magenta, cyan, purple colors." light modus-operandi-palette ef-light-palette ef-light-palette-overrides)
    (ef-maris-dark ef-themes "Legible dark marine theme with blue, cyan, and green colors." dark modus-vivendi-palette ef-maris-dark-palette ef-maris-dark-palette-overrides)
    (ef-maris-light ef-themes "Legible light marine theme with blue, cyan, and green colors." light modus-operandi-palette ef-maris-light-palette ef-maris-light-palette-overrides)
    (ef-melissa-dark ef-themes "Legible dark honeybee theme with warm colors (yellow, red, green, cyan)." dark modus-vivendi-palette ef-melissa-dark-palette ef-melissa-dark-palette-overrides)
    (ef-melissa-light ef-themes "Legible light honeybee theme with warm colors (yellow, red, green, cyan)." light modus-operandi-palette ef-melissa-light-palette ef-melissa-light-palette-overrides)
    (ef-night ef-themes "Legible dark sky blue theme with mostly green, blue, purple colors." dark modus-vivendi-palette ef-night-palette ef-night-palette-overrides)
    (ef-owl ef-themes "Legible dark grey theme with blue, cyan, magenta and desaturated colors." dark modus-vivendi-palette ef-owl-palette ef-owl-palette-overrides)
    (ef-reverie ef-themes "Legible light cream theme with gold and nuanced colors." light modus-operandi-palette ef-reverie-palette ef-reverie-palette-overrides)
    (ef-rosa ef-themes "Legible dark rosewood theme with magenta and green colors." dark modus-vivendi-palette ef-rosa-palette ef-rosa-palette-overrides)
    (ef-spring ef-themes "Legible light floral theme with cool, varied colors (green, cyan, red)." light modus-operandi-palette ef-spring-palette ef-spring-palette-overrides)
    (ef-summer ef-themes "Legible light warm pink theme with magenta, purple, gold, cyan colors." light modus-operandi-palette ef-summer-palette ef-summer-palette-overrides)
    (ef-symbiosis ef-themes "Legible dark brown-black theme with blue, green, cyan, gold colors." dark modus-vivendi-palette ef-symbiosis-palette ef-symbiosis-palette-overrides)
    (ef-trio-dark ef-themes "Legible dark purple grey theme with magenta, blue, teal colors." dark modus-vivendi-palette ef-trio-dark-palette ef-trio-dark-palette-overrides)
    (ef-trio-light ef-themes "Legible light purple grey theme with magenta, blue, and teal colors." light modus-operandi-palette ef-trio-light-palette ef-trio-light-palette-overrides)
    (ef-tritanopia-dark ef-themes "Legible dark theme, optimized for blue-yellow color deficiency." dark modus-vivendi-tritanopia-palette ef-tritanopia-dark-palette ef-tritanopia-dark-palette-overrides)
    (ef-tritanopia-light ef-themes "Legible light theme, optimized for blue-yellow color deficiency." light modus-operandi-tritanopia-palette ef-tritanopia-light-palette ef-tritanopia-light-palette-overrides)
    (ef-winter ef-themes "Legible dark purple-black theme with magenta, purple, fawn, teal colors." dark modus-vivendi-palette ef-winter-palette ef-winter-palette-overrides)))

(defvar ef-themes--declared-p nil)

(defun ef-themes-declare-themes ()
  "Declare the Ef themes."
  (unless ef-themes--declared-p
    (dolist (theme ef-themes-with-properties)
      (apply #'modus-themes-declare theme)
      (modus-themes-register (car theme)))
    (setq ef-themes--declared-p t)))

(ef-themes-declare-themes)

(defconst ef-themes-palette-common
  '((fringe unspecified)
    (fg-region unspecified)

    (bg-diff-context bg-dim)

    (bg-tab-bar bg-alt)
    (bg-tab-current bg-main)
    (bg-tab-other bg-active)

    (fg-link-symbolic fg-alt)
    (underline-link border)
    (underline-link-symbolic border)

    (border-mode-line-active border)
    (bg-mode-line-inactive bg-alt)
    (fg-mode-line-inactive fg-dim)
    (border-mode-line-inactive border)

    (bg-line-number-active unspecified)
    (fg-line-number-active accent-0)
    (bg-line-number-inactive unspecified)

    (bg-prominent-err bg-err)
    (bg-prominent-warning bg-warning)
    (bg-prominent-note bg-info)
    (fg-prominent-err err)
    (fg-prominent-warning warning)
    (fg-prominent-note info)

    (bg-space unspecified)
    (fg-space border)

    (bg-active-argument bg-warning)
    (fg-active-argument warning)
    (bg-active-value bg-info)
    (fg-active-value info)

    (bg-mark-delete bg-err)
    (fg-mark-delete err)
    (bg-mark-select bg-info)
    (fg-mark-select info)
    (bg-mark-other bg-warning)
    (fg-mark-other warning)

    (fg-completion-match-0 accent-0)
    (fg-completion-match-1 accent-1)
    (fg-completion-match-2 accent-2)
    (fg-completion-match-3 accent-3)

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

;;;; Compatibility with older versions of the Ef themes

(defvar ef-themes--aliased-p nil)

(defun ef-themes-define-alias (prefix suffix &optional is-function)
  "Make alias for the Modus themes symbol with PREFIX and SUFFIX.
If IS-FUNCTION is non-nil, use the appropriate calls for functions, else
assume this is a variable."
  (let ((our-symbol (intern (format "%s-%s" prefix suffix)))
        (modus-symbol (intern-soft (format "modus-themes-%s" suffix))))
    (when (symbolp modus-symbol)
      (funcall
       (if is-function
           #'defalias
         #'defvaralias)
       our-symbol
       modus-symbol
       (format "`%s' is an alias for `%s'.
Since version 2.0.0, `ef-themes' derive from the `modus-themes'.
You can configure the `ef-themes' via the user options of the
`modus-themes'.

To make all the Modus commands that operate on a theme consider only Ef
themes, enable `ef-themes-take-over-modus-themes-mode'.  Or, if you
prefer to blend Ef and Modus into a single group, enable
`modus-themes-include-derivatives-mode' instead.

Alternatively, use the commands `ef-themes-rotate', `ef-themes-select',
`ef-themes-load-random', `ef-themes-load-random-dark',
`ef-themes-load-random-light', `ef-themes-list-colors',
`ef-themes-list-colors-current'.  They are all designed to only consider
Ef themes." our-symbol modus-symbol)))))

(defun ef-themes-define-option-aliases ()
  "Define aliases for the user options of the Modus themes."
  (unless ef-themes--aliased-p
    (dolist (suffix '( disable-other-themes to-toggle to-rotate after-load-theme-hook
                       post-load-hook italic-constructs bold-constructs variable-pitch-ui mixed-fonts
                       headings completions prompts common-palette-overrides))
      (ef-themes-define-alias "ef-themes" suffix))
    (setq ef-themes--aliased-p t)))

(ef-themes-define-option-aliases)

(defalias 'ef-themes-load-theme 'modus-themes-load-theme
  "Alias for `modus-themes-load-theme'.")

(defalias 'ef-themes-with-colors 'modus-themes-with-colors
  "Alias for `modus-themes-with-colors.")

;;;; Limit the Modus themes to only Ef themes

;;;###autoload
(define-minor-mode ef-themes-take-over-modus-themes-mode
  "When enabled, all Modus themes commands consider only Ef themes.
Alternatively, use the commands `ef-themes-rotate', `ef-themes-select',
`ef-themes-load-random', `ef-themes-load-random-dark',
`ef-themes-load-random-light', `ef-themes-list-colors',
`ef-themes-list-colors-current'.  They are all designed to only consider
Ef themes."
  :global t
  :init-value nil)

(cl-defmethod modus-themes-get-themes (&context (ef-themes-take-over-modus-themes-mode (eql t)))
  "Return list of Ef themes, per `ef-themes-take-over-modus-themes-mode'."
  (if-let* ((themes (modus-themes-get-all-known-themes 'ef-themes))
            (sorted-a-z (sort themes #'string-lessp))
            (sorted-light-dark (modus-themes-sort sorted-a-z 'light)))
      sorted-light-dark
    ef-themes-items))

;;;; Convenience commands

;;;###autoload (autoload 'ef-themes-toggle "ef-themes")
(modus-themes-define-derivative-command ef-themes toggle)

;;;###autoload (autoload 'ef-themes-rotate "ef-themes")
(modus-themes-define-derivative-command ef-themes rotate)

;;;###autoload (autoload 'ef-themes-select "ef-themes")
(modus-themes-define-derivative-command ef-themes select)

;;;###autoload (autoload 'ef-themes-load-random "ef-themes")
(modus-themes-define-derivative-command ef-themes load-random)

;;;###autoload (autoload 'ef-themes-load-random-dark "ef-themes")
(modus-themes-define-derivative-command ef-themes load-random-dark)

;;;###autoload (autoload 'ef-themes-load-random-light "ef-themes")
(modus-themes-define-derivative-command ef-themes load-random-light)

;;;###autoload (autoload 'ef-themes-list-colors "ef-themes")
(modus-themes-define-derivative-command ef-themes list-colors)

;;;###autoload (autoload 'ef-themes-list-colors-current "ef-themes")
(modus-themes-define-derivative-command ef-themes list-colors-current)

;;;; Add themes from package to path

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (file-equal-p dir (expand-file-name "themes/" data-directory))
      (add-to-list 'custom-theme-load-path dir))))

(provide 'ef-themes)
;;; ef-themes.el ends here
