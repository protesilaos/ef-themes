;;; ef-melissa-dark-theme.el --- Legible dark theme with warm colors (yellow, red, green, cyan) -*- lexical-binding:t -*-

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

(defconst ef-melissa-dark-palette-partial
  '((cursor "#f9cf7a")
    (bg-main "#352718")
    (bg-dim "#483426")
    (bg-alt "#59463f")
    (fg-main "#e8e4b1")
    (fg-dim "#90918a")
    (fg-alt "#ccaa70")
    (bg-active "#79665f")
    (bg-inactive "#3d2e1f")
    (border "#6f5f58")

    (red "#ff7f7f")
    (red-warmer "#ff7f4f")
    (red-cooler "#ff8f98")
    (red-faint "#e89a88")
    (green "#6fd560")
    (green-warmer "#a0d13a")
    (green-cooler "#65d590")
    (green-faint "#a0d26f")
    (yellow "#e4b53f")
    (yellow-warmer "#ffa21f")
    (yellow-cooler "#e7a06f")
    (yellow-faint "#eab780")
    (blue "#57aff6")
    (blue-warmer "#98bfff")
    (blue-cooler "#62cfef")
    (blue-faint "#6ab4ef")
    (magenta "#f0aac5")
    (magenta-warmer "#fa90aa")
    (magenta-cooler "#c6a2fe")
    (magenta-faint "#dfcfe0")
    (cyan "#6fcad0")
    (cyan-warmer "#7fc5df")
    (cyan-cooler "#70e0cf")
    (cyan-faint "#99bfcf")

    (bg-red-intense "#b02930")
    (bg-green-intense "#4a7100")
    (bg-yellow-intense "#8f5040")
    (bg-blue-intense "#4648d0")
    (bg-magenta-intense "#a04fc5")
    (bg-cyan-intense "#2270cf")

    (bg-red-subtle "#72292a")
    (bg-green-subtle "#3f521a")
    (bg-yellow-subtle "#604b13")
    (bg-blue-subtle "#384862")
    (bg-magenta-subtle "#613a50")
    (bg-cyan-subtle "#2f4f4f")

    (bg-added "#2f491f")
    (bg-added-faint "#2f3b0f")
    (bg-added-refine "#3f6234")
    (fg-added "#a0e0a0")

    (bg-changed "#544a0f")
    (bg-changed-faint "#43350f")
    (bg-changed-refine "#615f1f")
    (fg-changed "#dada90")

    (bg-removed "#622a1f")
    (bg-removed-faint "#4b240a")
    (bg-removed-refine "#7f3325")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#704f00")
    (fg-mode-line-active "#f8efd8")
    (bg-completion "#66421f")
    (bg-hover "#60518f")
    (bg-hover-secondary "#5a661f")
    (bg-hl-line "#4f311f")
    (bg-paren-match "#5f6f1f")
    (bg-region "#443a4f")
    (bg-err "#571a05") ; check with err
    (bg-warning "#4e4310") ; check with warning
    (bg-info "#2f4302") ; check with info

    (err red-warmer)
    (warning yellow-warmer)
    (info green)

    (fg-link yellow)
    (fg-link-alt magenta-cooler)
    (name yellow-cooler)
    (keybind yellow-warmer)
    (identifier red-faint)
    (fg-prompt green-warmer)

    (builtin yellow-cooler)
    (comment yellow-faint)
    (constant blue-warmer)
    (fnname green)
    (fnname-call green-faint)
    (keyword yellow)
    (preprocessor red-warmer)
    (docstring red-faint)
    (string yellow-warmer)
    (type green-cooler)
    (variable cyan)
    (variable-use cyan-faint)
    (rx-escape green) ; compare with `string'
    (rx-construct magenta-cooler)

    (accent-0 yellow-warmer)
    (accent-1 green-cooler)
    (accent-2 red)
    (accent-3 magenta-cooler)

    (date-common green-warmer)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday magenta-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday green-warmer)
    (date-weekend red-cooler)

    (prose-code yellow-warmer)
    (prose-done green)
    (prose-macro green-warmer)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag yellow-faint)
    (prose-todo red-warmer)
    (prose-verbatim red)

    (mail-cite-0 yellow-warmer)
    (mail-cite-1 blue-warmer)
    (mail-cite-2 red-cooler)
    (mail-cite-3 green-cooler)
    (mail-part cyan)
    (mail-recipient yellow)
    (mail-subject green)
    (mail-other yellow-cooler)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 yellow-warmer)
    (rainbow-1 yellow)
    (rainbow-2 green-warmer)
    (rainbow-3 red-cooler)
    (rainbow-4 cyan-warmer)
    (rainbow-5 magenta)
    (rainbow-6 green-cooler)
    (rainbow-7 magenta-warmer)
    (rainbow-8 cyan-cooler))
  "Legible dark honeybee theme with warm colors (yellow, red, green, cyan).")

(defcustom ef-melissa-dark-palette-overrides nil
  "Overrides for `ef-melissa-dark-palette'.

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

(defconst ef-melissa-dark-palette
  (append ef-themes-common-palette-overrides ef-melissa-dark-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-melissa-dark
 'ef-themes
 "Legible dark honeybee theme with warm colors (yellow, red, green, cyan)."
 'dark
 'modus-vivendi-palette
 'ef-melissa-dark-palette
 'ef-melissa-dark-palette-overrides
 'ef-themes-custom-faces)

;;; ef-melissa-dark-theme.el ends here
