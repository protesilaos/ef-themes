;;; ef-halloween-dark-theme.el --- Legible dark theme with a Halloween style -*- lexical-binding:t -*-

;; Copyright (C) 2022-2026  Free Software Foundation, Inc.

;; Author: Protesilaos <info@protesilaos.com>
;; Maintainer: Protesilaos <info@protesilaos.com>
;; URL: https://github.com/protesilaos/ef-themes
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

;;; Code:



(require 'ef-themes)

(defconst ef-halloween-dark-palette-partial
  '((cursor "#f07a23")
    (bg-main "#332019")
    (bg-dim "#452821")
    (bg-alt "#41352f")
    (fg-main "#e8c08a")
    (fg-dim "#b88c7a")
    (fg-alt "#e0926f")
    (bg-active "#5e493b")
    (bg-inactive "#4e362a")
    (border "#89685f")

    (red "#f07160")
    (red-warmer "#f07a3f")
    (red-cooler "#e97f6f")
    (red-faint "#df7f7f")
    (green "#4faf26")
    (green-warmer "#94aa0f")
    (green-cooler "#5fab66")
    (green-faint "#88935f")
    (yellow "#f09c43")
    (yellow-warmer "#da832f")
    (yellow-cooler "#deb351")
    (yellow-faint "#bf8a5f")
    (blue "#379cf6")
    (blue-warmer "#6a88ff")
    (blue-cooler "#029fff")
    (blue-faint "#bac4ef")
    (magenta "#d5839f")
    (magenta-warmer "#d5708a")
    (magenta-cooler "#af79ae")
    (magenta-faint "#9f8890")
    (cyan "#3fa0bf")
    (cyan-warmer "#7fafc2")
    (cyan-cooler "#4dbbb0")
    (cyan-faint "#82a0af")

    (bg-red-intense "#b02930")
    (bg-green-intense "#4a7000")
    (bg-yellow-intense "#8f5040")
    (bg-blue-intense "#4648d0")
    (bg-magenta-intense "#804fd5")
    (bg-cyan-intense "#2270be")

    (bg-red-subtle "#651f2a")
    (bg-green-subtle "#11422f")
    (bg-yellow-subtle "#583020")
    (bg-blue-subtle "#2f3069")
    (bg-magenta-subtle "#542657")
    (bg-cyan-subtle "#123e55")

    (bg-added "#374018")
    (bg-added-faint "#2d3100")
    (bg-added-refine "#42541b")
    (bg-added-fringe "#506123")
    (fg-added "#9bd370")

    (bg-changed "#4f4514")
    (bg-changed-faint "#343010")
    (bg-changed-refine "#604a20")
    (bg-changed-fringe "#765010")
    (fg-changed "#efef80")

    (bg-removed "#67200a")
    (bg-removed-faint "#49240f")
    (bg-removed-refine "#7e2814")
    (bg-removed-fringe "#8c330c")
    (fg-removed "#ff9f8f")

    (bg-mode-line-active "#6e5232")
    (fg-mode-line-active "#fec07a")
    (bg-completion "#622521")
    (bg-popup "#402626")
    (bg-hover "#694a7c")
    (bg-hover-secondary "#583426")
    (bg-hl-line "#4e3020")
    (bg-paren-match "#50542b")
    (bg-err "#552010") ; check with err
    (bg-warning "#58351f") ; check with warning
    (bg-info "#34400a") ; check with info
    (bg-region "#5b201f")))

(defconst ef-halloween-dark-palette-mappings-partial
  '((err red-warmer)
    (warning yellow-cooler)
    (info green-warmer)

    (fg-link magenta-cooler)
    (fg-link-visited green-faint)
    (name yellow)
    (keybind red-warmer)
    (identifier green-faint)
    (fg-prompt red)

    (builtin yellow-warmer)
    (comment magenta-faint)
    (constant magenta-cooler)
    (fnname yellow-cooler)
    (fnname-call red-faint)
    (keyword red-warmer)
    (preprocessor red)
    (docstring yellow-faint)
    (string yellow)
    (type red-cooler)
    (variable green-warmer)
    (variable-use green-faint)
    (rx-backslash magenta-cooler) ; compare with `string'
    (rx-construct red)

    (accent-0 red-warmer)
    (accent-1 magenta-cooler)
    (accent-2 yellow)
    (accent-3 green-warmer)

    (date-common magenta)
    (date-deadline magenta-warmer)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday green-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-cooler)
    (date-scheduled-subtle yellow-faint)
    (date-weekday magenta-cooler)
    (date-weekend red)

    (fg-prose-code red-warmer)
    (prose-done green-cooler)
    (fg-prose-macro magenta-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag yellow-faint)
    (prose-todo red-warmer)
    (fg-prose-verbatim yellow-warmer)

    (mail-cite-0 yellow)
    (mail-cite-1 green-warmer)
    (mail-cite-2 red-faint)
    (mail-cite-3 yellow-faint)
    (mail-part magenta-faint)
    (mail-recipient red-cooler)
    (mail-subject magenta-cooler)
    (mail-other yellow-warmer)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 red-warmer)
    (rainbow-1 yellow)
    (rainbow-2 red)
    (rainbow-3 magenta-cooler)
    (rainbow-4 green-warmer)
    (rainbow-5 red-cooler)
    (rainbow-6 blue-warmer)
    (rainbow-7 yellow-cooler)
    (rainbow-8 green-faint)))

(defcustom ef-halloween-dark-palette-overrides nil
  "Overrides for `ef-halloween-dark-palette'.

Mirror the elements of the aforementioned palette, overriding
their value.

For overrides that are shared across all of the Ef themes,
refer to `ef-themes-common-palette-overrides'.

To preview the palette entries, use `ef-themes-preview-colors' or
`ef-themes-preview-colors-current' (read the documentation for
further details)."
  :group 'ef-themes
  :package-version '(ef-themes . "1.0.0")
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(ef-themes) Palette overrides"))

(defconst ef-halloween-dark-palette
  (modus-themes-generate-palette
   ef-halloween-dark-palette-partial
   nil
   nil
   (append ef-halloween-dark-palette-mappings-partial ef-themes-palette-common)))

;;;###theme-autoload
(modus-themes-theme
 'ef-halloween-dark
 'ef-themes
 "Legible dark theme with a Halloween style."
 'dark
 'ef-halloween-dark-palette
 nil
 'ef-halloween-dark-palette-overrides)

(provide 'ef-halloween-dark-theme)

;;; ef-halloween-dark-theme.el ends here
