;;; ef-maris-light-theme.el --- Legible light theme with blue, cyan, and green colors -*- lexical-binding:t -*-

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

(defconst ef-maris-light-palette-partial
  '((cursor "#036f99")
    (bg-main "#edf4f8")
    (bg-dim "#e0e7ef")
    (bg-alt "#cfd8e3")
    (fg-main "#151a27")
    (fg-dim "#676470")
    (fg-alt "#3f4f99")
    (bg-active "#afb8c3")
    (bg-inactive "#e6ecf2")
    (border "#a2a6af")

    (red "#c3303a")
    (red-warmer "#d00000")
    (red-cooler "#b02440")
    (red-faint "#8b4052")
    (green "#007010")
    (green-warmer "#3a6f00")
    (green-cooler "#007047")
    (green-faint "#4a763f")
    (yellow "#805a1f")
    (yellow-warmer "#8b4400")
    (yellow-cooler "#78542f")
    (yellow-faint "#7f4f4a")
    (blue "#375cc6")
    (blue-warmer "#444fcf")
    (blue-cooler "#003faf")
    (blue-faint "#3a5099")
    (magenta "#80308f")
    (magenta-warmer "#9a3a6a")
    (magenta-cooler "#5f2fba")
    (magenta-faint "#6a4a9f")
    (cyan "#1f66af")
    (cyan-warmer "#305675")
    (cyan-cooler "#006f70")
    (cyan-faint "#3f627f")

    (bg-red-intense "#ff8f88")
    (bg-green-intense "#96df80")
    (bg-yellow-intense "#efbf00")
    (bg-blue-intense "#cfceff")
    (bg-magenta-intense "#df9fff")
    (bg-cyan-intense "#88cfd0")

    (bg-red-subtle "#f0c6cf")
    (bg-green-subtle "#b0ebca")
    (bg-yellow-subtle "#e4e498")
    (bg-blue-subtle "#ccd5f7")
    (bg-magenta-subtle "#edd3f2")
    (bg-cyan-subtle "#b2e6f0")

    (bg-added "#b0e8ca")
    (bg-added-faint "#c5f0e0")
    (bg-added-refine "#a0d4b9")
    (fg-added "#005000")

    (bg-changed "#f5e8b0")
    (bg-changed-faint "#f5f2bf")
    (bg-changed-refine "#f0db9a")
    (fg-changed "#553d00")

    (bg-removed "#f5c7d6")
    (bg-removed-faint "#f0d6d6")
    (bg-removed-refine "#efb1cd")
    (fg-removed "#8f1313")

    (bg-mode-line-active "#a0c2ef")
    (fg-mode-line-active "#142810")
    (bg-completion "#cddbfa")
    (bg-hover "#d2b4cf")
    (bg-hover-secondary "#b7bbea")
    (bg-hl-line "#dae5f0")
    (bg-paren-match "#cab3b2")
    (bg-region "#c8dcff")
    (bg-err "#f2c2b5") ; check with err
    (bg-warning "#e8df9a") ; check with warning
    (bg-info "#a4e2cf") ; check with info

    (err red-warmer)
    (warning yellow-warmer)
    (info green-cooler)

    (fg-link blue)
    (fg-link-alt magenta-cooler)
    (name blue)
    (keybind blue-cooler)
    (identifier magenta-faint)
    (fg-prompt blue-warmer)

    (builtin magenta-faint)
    (comment red-faint)
    (constant blue-cooler)
    (fnname green-warmer)
    (fnname-call green-faint)
    (keyword blue-warmer)
    (preprocessor magenta-cooler)
    (docstring cyan-faint)
    (string cyan-cooler)
    (type green)
    (variable cyan)
    (variable-use cyan-faint)
    (rx-escape yellow) ; compare with `string'
    (rx-construct red)

    (accent-0 blue-cooler)
    (accent-1 green)
    (accent-2 cyan)
    (accent-3 red-cooler)

    (date-common cyan-cooler)
    (date-deadline red)
    (date-deadline-subtle red-cooler)
    (date-event fg-alt)
    (date-holiday blue-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan-warmer)
    (date-weekend red-faint)

    (prose-code cyan)
    (prose-done green-cooler)
    (prose-macro magenta-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula warning)
    (prose-tag cyan-faint)
    (prose-todo red-cooler)
    (prose-verbatim green-warmer)

    (mail-cite-0 cyan)
    (mail-cite-1 magenta)
    (mail-cite-2 blue-faint)
    (mail-cite-3 yellow-cooler)
    (mail-part green-cooler)
    (mail-recipient blue-warmer)
    (mail-subject green-warmer)
    (mail-other blue)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 green-cooler)
    (rainbow-1 blue-warmer)
    (rainbow-2 green-warmer)
    (rainbow-3 cyan)
    (rainbow-4 magenta-cooler)
    (rainbow-5 blue-cooler)
    (rainbow-6 magenta)
    (rainbow-7 cyan-cooler)
    (rainbow-8 yellow-cooler))
  "Legible light marine theme with blue, cyan, and green colors.")

(defcustom ef-maris-light-palette-overrides nil
  "Overrides for `ef-maris-light-palette'.

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

(defconst ef-maris-light-palette
  (append ef-themes-common-palette-overrides ef-maris-light-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-maris-light
 'ef-themes
 "Legible light marine theme with blue, cyan, and green colors."
 'light
 'modus-operandi-palette
 'ef-maris-light-palette
 'ef-maris-light-palette-overrides
 'ef-themes-custom-faces)

;;; ef-maris-light-theme.el ends here
