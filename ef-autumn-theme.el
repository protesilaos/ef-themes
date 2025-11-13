;;; ef-autumn-theme.el --- Legible dark theme with warm, varied colors (red, yellow, green, teal) -*- lexical-binding:t -*-

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

(defconst ef-autumn-palette-partial
  '((cursor "#ffaa33")
    (bg-main "#0f0e06")
    (bg-dim "#26211d")
    (bg-alt "#36322f")
    (fg-main "#cfbcba")
    (fg-dim "#887c8a")
    (fg-alt "#70a89f")
    (bg-active "#56524f")
    (bg-inactive "#15140d")
    (border "#58514f")

    (red "#ef656a")
    (red-warmer "#f06a3f")
    (red-cooler "#ff7a7f")
    (red-faint "#df7f7f")
    (green "#2fa526")
    (green-warmer "#64aa0f")
    (green-cooler "#00b066")
    (green-faint "#5f9f6f")
    (yellow "#c48702")
    (yellow-warmer "#d0730f")
    (yellow-cooler "#df8f6f")
    (yellow-faint "#cf9f7f")
    (blue "#379cf6")
    (blue-warmer "#6a88ff")
    (blue-cooler "#029fff")
    (blue-faint "#6a84af")
    (magenta "#d570af")
    (magenta-warmer "#e580ea")
    (magenta-cooler "#af8aff")
    (magenta-faint "#c590af")
    (cyan "#4fb0cf")
    (cyan-warmer "#6fafff")
    (cyan-cooler "#3dbbb0")
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

    (bg-added "#17360f")
    (bg-added-faint "#0a2900")
    (bg-added-refine "#204810")
    (fg-added "#a0e0a0")

    (bg-changed "#363300")
    (bg-changed-faint "#2a1f00")
    (bg-changed-refine "#4a4a00")
    (fg-changed "#efef80")

    (bg-removed "#4b120a")
    (bg-removed-faint "#3a0a00")
    (bg-removed-refine "#6f1a16")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#692a12")
    (fg-mode-line-active "#feeeca")
    (bg-completion "#36213a")
    (bg-hover "#265f4a")
    (bg-hover-secondary "#55345a")
    (bg-hl-line "#302a3a")
    (bg-paren-match "#2f6c4a")
    (bg-region "#3f1324")
    (bg-err "#461204") ; check with err
    (bg-warning "#353504") ; check with warning
    (bg-info "#1f3b0a") ; check with info

    (err red-warmer)
    (warning yellow)
    (info green-cooler)

    (fg-link yellow)
    (fg-link-alt cyan-cooler)
    (name green-warmer)
    (keybind red-warmer)
    (identifier magenta-faint)
    (fg-prompt cyan-cooler)

    (builtin red-cooler)
    (comment yellow-faint)
    (constant green-warmer)
    (fnname cyan-cooler)
    (fnname-call cyan-faint)
    (keyword yellow)
    (preprocessor magenta)
    (docstring green-faint)
    (string red-warmer)
    (type green)
    (variable cyan-warmer)
    (variable-use cyan-faint)
    (rx-escape green-cooler) ; compare with `string'
    (rx-construct magenta-cooler)

    (accent-0 green-cooler)
    (accent-1 yellow-warmer)
    (accent-2 cyan-cooler)
    (accent-3 magenta-cooler)

    (date-common yellow-cooler)
    (date-deadline red-warmer)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday cyan-cooler)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (prose-code yellow-warmer)
    (prose-done green-cooler)
    (prose-macro cyan-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag fg-alt)
    (prose-todo red-warmer)
    (prose-verbatim green-cooler)

    (mail-cite-0 yellow-warmer)
    (mail-cite-1 green-warmer)
    (mail-cite-2 red)
    (mail-cite-3 yellow-cooler)
    (mail-part green-faint)
    (mail-recipient green-warmer)
    (mail-subject green-cooler)
    (mail-other yellow)

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
    (rainbow-1 green-warmer)
    (rainbow-2 red)
    (rainbow-3 cyan-cooler)
    (rainbow-4 yellow-cooler)
    (rainbow-5 blue)
    (rainbow-6 red-cooler)
    (rainbow-7 green)
    (rainbow-8 yellow))
  "Legible dark brown-black theme with warm colors (red, yellow, green, teal).")

(defcustom ef-autumn-palette-overrides nil
  "Overrides for `ef-autumn-palette'.

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

(defconst ef-autumn-palette
  (append ef-themes-common-palette-overrides ef-autumn-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-autumn
 'ef-themes
 "Legible dark brown-black theme with warm colors (red, yellow, green, teal)."
 'dark
 'modus-vivendi-palette
 'ef-autumn-palette
 'ef-autumn-palette-overrides
 'ef-themes-custom-faces)

;;; ef-autumn-theme.el ends here
