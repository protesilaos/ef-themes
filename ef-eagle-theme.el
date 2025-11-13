;;; ef-eagle-theme.el --- Legible light theme with brown, red, and desatured colors -*- lexical-binding:t -*-

;; Copyright (C) 2022-2025  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Protesilaos Stavrou <info@protesilaos.com>
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

(defconst ef-eagle-palette-partial
  '((cursor "#774400")
    (bg-main "#f1ecd0")
    (bg-dim "#e4dbc0")
    (bg-alt "#cec8ae")
    (fg-main "#231a1f")
    (fg-dim "#685f53")
    (fg-alt "#524874")
    (bg-active "#aea88e")
    (bg-inactive "#e7e0ca")
    (border "#7f785f")

    (red "#882000")
    (red-warmer "#9a0000")
    (red-cooler "#8f0038")
    (red-faint "#702f1f")
    (green "#226022")
    (green-warmer "#3a7800")
    (green-cooler "#006e50")
    (green-faint "#42573f")
    (yellow "#6b4500")
    (yellow-warmer "#843300")
    (yellow-cooler "#775228")
    (yellow-faint "#6a5937")
    (blue "#113384")
    (blue-warmer "#3a3da0")
    (blue-cooler "#000080")
    (blue-faint "#2f3460")
    (magenta "#822478")
    (magenta-warmer "#960f4f")
    (magenta-cooler "#50119f")
    (magenta-faint "#603a6f")
    (cyan "#125a7f")
    (cyan-warmer "#4a5d90")
    (cyan-cooler "#00676f")
    (cyan-faint "#304f60")

    (bg-red-intense "#f08f88")
    (bg-green-intense "#96df8f")
    (bg-yellow-intense "#efbf00")
    (bg-blue-intense "#cfceff")
    (bg-magenta-intense "#dfafff")
    (bg-cyan-intense "#a0ddd0")

    (bg-red-subtle "#efcabf")
    (bg-green-subtle "#c3e6a0")
    (bg-yellow-subtle "#efe07f")
    (bg-blue-subtle "#c7dbe8")
    (bg-magenta-subtle "#e3d0e7")
    (bg-cyan-subtle "#bfe0d0")

    (bg-added "#b0e7b0")
    (bg-added-faint "#d0e7c2")
    (bg-added-refine "#9ad590")
    (fg-added "#005200")

    (bg-changed "#f5e690")
    (bg-changed-faint "#f5edaf")
    (bg-changed-refine "#edd482")
    (fg-changed "#553d00")

    (bg-removed "#f8c8a6")
    (bg-removed-faint "#f0d9bc")
    (bg-removed-refine "#f0aa90")
    (fg-removed "#8f1013")

    (bg-mode-line-active "#cfab80")
    (fg-mode-line-active "#2f1005")
    (bg-completion "#dfc8af")
    (bg-hover "#c0cbd7")
    (bg-hover-secondary "#c5d8a2")
    (bg-hl-line "#ecdfba")
    (bg-paren-match "#9fd0cc")
    (bg-region "#ddc5af")
    (bg-err "#f2d4b5") ; check with err
    (bg-warning "#e7de80") ; check with warning
    (bg-info "#cdeeb0") ; check with info

    (err red-warmer)
    (warning yellow-warmer)
    (info green)

    (fg-link yellow-cooler)
    (fg-link-alt cyan-faint)
    (name green)
    (keybind red-warmer)
    (identifier cyan-faint)
    (fg-prompt yellow-warmer)

    (builtin yellow-cooler)
    (comment yellow-faint)
    (constant green-cooler)
    (fnname red)
    (fnname-call red-faint)
    (keyword red-faint)
    (preprocessor red-warmer)
    (docstring green-faint)
    (string green-warmer)
    (type green)
    (variable cyan)
    (variable-use cyan-faint)
    (rx-escape magenta-warmer) ; compare with `string'
    (rx-construct blue-cooler)

    (accent-0 red)
    (accent-1 green-cooler)
    (accent-2 blue)
    (accent-3 red-warmer)

    (date-common red-faint)
    (date-deadline red-cooler)
    (date-deadline-subtle red)
    (date-event fg-alt)
    (date-holiday red-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-cooler)
    (date-scheduled-subtle yellow-faint)
    (date-weekday red)
    (date-weekend cyan)

    (prose-code green-cooler)
    (prose-done green-warmer)
    (prose-macro blue)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula warning)
    (prose-tag yellow-faint)
    (prose-todo red-warmer)
    (prose-verbatim red-cooler)

    (mail-cite-0 red)
    (mail-cite-1 yellow)
    (mail-cite-2 green)
    (mail-cite-3 blue-faint)
    (mail-part green-cooler)
    (mail-recipient yellow)
    (mail-subject red-warmer)
    (mail-other yellow-warmer)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-cyan-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 red)
    (rainbow-1 cyan-faint)
    (rainbow-2 red-faint)
    (rainbow-3 green-cooler)
    (rainbow-4 yellow)
    (rainbow-5 red-cooler)
    (rainbow-6 blue-faint)
    (rainbow-7 yellow-warmer)
    (rainbow-8 green))
  "Legible light beige theme with brown, red, and desatured colors.")

(defcustom ef-eagle-palette-overrides nil
  "Overrides for `ef-eagle-palette'.

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

(defconst ef-eagle-palette
  (append ef-themes-common-palette-overrides ef-eagle-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-eagle
 'ef-themes
 "Legible light beige theme with brown, red, and desatured colors."
 'light
 'modus-operandi-palette
 'ef-eagle-palette
 'ef-eagle-palette-overrides
 'ef-themes-custom-faces)

;;; ef-eagle-theme.el ends here
