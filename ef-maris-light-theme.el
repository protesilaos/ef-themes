;;; ef-maris-light-theme.el --- Legible light theme with blue, cyan, and green colors -*- lexical-binding:t -*-

;; Copyright (C) 2023  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Ef-Themes Development <~protesilaos/ef-themes@lists.sr.ht>
;; URL: https://git.sr.ht/~protesilaos/ef-themes
;; Mailing-List: https://lists.sr.ht/~protesilaos/ef-themes
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



(eval-and-compile
  (require 'ef-themes)

;;;###theme-autoload
  (deftheme ef-maris-light
    "Legible light theme with blue, cyan, and green colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-maris-light-palette
    '(
;;; Basic values

      (bg-main     "#edf4f8")
      (fg-main     "#151a27")
      (bg-dim      "#e0e7ef")
      (fg-dim      "#676470")
      (bg-alt      "#cfd8e3")
      (fg-alt      "#3f4f99")

      (bg-active   "#afb8c3")
      (bg-inactive "#e6ecf2")

;;; Basic hues for foreground values

      (red             "#c3303a")
      (red-warmer      "#d00000")
      (red-cooler      "#b02440")
      (red-faint       "#8b4052")
      (green           "#007010")
      (green-warmer    "#3a6f00")
      (green-cooler    "#007047")
      (green-faint     "#4a763f")
      (yellow          "#805a1f")
      (yellow-warmer   "#8b4400")
      (yellow-cooler   "#78542f")
      (yellow-faint    "#7f4f4a")
      (blue            "#375cc6")
      (blue-warmer     "#444fcf")
      (blue-cooler     "#003faf")
      (blue-faint      "#3a5099")
      (magenta         "#80308f")
      (magenta-warmer  "#9a3a6a")
      (magenta-cooler  "#5f2fba")
      (magenta-faint   "#6a4a9f")
      (cyan            "#1f66af")
      (cyan-warmer     "#305675")
      (cyan-cooler     "#006f70")
      (cyan-faint      "#3f627f")

;;; Basic hues for background values

      (bg-red-intense     "#ff8f88")
      (bg-green-intense   "#96df80")
      (bg-yellow-intense  "#efbf00")
      (bg-blue-intense    "#cfceff")
      (bg-magenta-intense "#df9fff")
      (bg-cyan-intense    "#88cfd0")

      (bg-red-subtle      "#f0c6bf")
      (bg-green-subtle    "#c4edaf")
      (bg-yellow-subtle   "#e4e488")
      (bg-blue-subtle     "#ccd7f7")
      (bg-magenta-subtle  "#edd3f2")
      (bg-cyan-subtle     "#b2e6f0")

;;; Diffs

      (bg-added          "#b0e8ca")
      (bg-added-faint    "#c5f0e0")
      (bg-added-refine   "#a0d4b9")
      (fg-added          "#005000")

      (bg-changed        "#f5e8b0")
      (bg-changed-faint  "#f5f2bf")
      (bg-changed-refine "#f0db9a")
      (fg-changed        "#553d00")

      (bg-removed        "#f5c7d6")
      (bg-removed-faint  "#f0d6d6")
      (bg-removed-refine "#efb1cd")
      (fg-removed        "#8f1313")

;;; Graphs

      (bg-graph-red-0     "#ef7969")
      (bg-graph-red-1     "#ffaab4")
      (bg-graph-green-0   "#2fe029")
      (bg-graph-green-1   "#75ef30")
      (bg-graph-yellow-0  "#ffcf00")
      (bg-graph-yellow-1  "#f9ff00")
      (bg-graph-blue-0    "#7f90ff")
      (bg-graph-blue-1    "#9fc6ff")
      (bg-graph-magenta-0 "#e07fff")
      (bg-graph-magenta-1 "#fad0ff")
      (bg-graph-cyan-0    "#70d3f0")
      (bg-graph-cyan-1    "#afefff")

;;; Special hues

      (bg-mode-line       "#a0c2ef")
      (fg-mode-line       "#142810")
      (bg-completion      "#cddbfa")
      (bg-hover           "#d2b4cf")
      (bg-hover-secondary "#b7bbea")
      (bg-hl-line         "#dae5f0")
      (bg-paren           "#cab3b2")
      (bg-err             "#f2c2b5") ; check with err
      (bg-warning         "#e8df9a") ; check with warning
      (bg-info            "#a4e2cf") ; check with info

      (border        "#a2a6af")
      (cursor        "#036f99")
      (fg-intense    "#000000")

      (modeline-err     "#950f0f")
      (modeline-warning "#7000af")
      (modeline-info    "#0040af")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af5f")

      (bg-char-0 "#7feaff")
      (bg-char-1 "#f0a0f0")
      (bg-char-2 "#d0e000")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err red-warmer)
      (warning yellow-warmer)
      (info green-cooler)

      (link blue)
      (link-alt magenta-cooler)
      (name blue)
      (keybind blue-cooler)
      (identifier magenta-faint)
      (prompt blue-warmer)

      (bg-region "#c8dcff")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta-faint)
      (comment red-faint)
      (constant blue-cooler)
      (fnname green-warmer)
      (keyword blue-warmer)
      (preprocessor magenta-cooler)
      (docstring cyan-faint)
      (string cyan-cooler)
      (type green)
      (variable cyan)
      (rx-escape yellow) ; compare with `string'
      (rx-construct red)

;;;; Accent mappings

      (accent-0 blue-cooler)
      (accent-1 green)
      (accent-2 cyan)
      (accent-3 red-cooler)

;;;; Date mappings

      (date-common cyan-cooler)
      (date-deadline red)
      (date-event fg-alt)
      (date-holiday blue-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow-cooler)
      (date-weekday cyan-warmer)
      (date-weekend red-faint)

;;;; Prose mappings

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

;;;; Mail mappings

      (mail-cite-0 cyan)
      (mail-cite-1 magenta)
      (mail-cite-2 blue-faint)
      (mail-cite-3 yellow-cooler)
      (mail-part green-cooler)
      (mail-recipient blue-warmer)
      (mail-subject green-warmer)
      (mail-other blue)

;;;; Search mappings

      (bg-search-current bg-yellow-intense)
      (bg-search-lazy bg-blue-intense)
      (bg-search-replace bg-red-intense)

      (bg-search-rx-group-0 bg-magenta-intense)
      (bg-search-rx-group-1 bg-green-intense)
      (bg-search-rx-group-2 bg-red-subtle)
      (bg-search-rx-group-3 bg-cyan-subtle)

;;;; Space mappings

      (bg-space unspecified)
      (fg-space border)
      (bg-space-err bg-yellow-intense)

;;;; Tab mappings

      (bg-tab-bar      bg-alt)
      (bg-tab-current  bg-main)
      (bg-tab-other    bg-active)

;;;; Rainbow mappings

      (rainbow-0 green-cooler)
      (rainbow-1 blue-warmer)
      (rainbow-2 green-warmer)
      (rainbow-3 cyan)
      (rainbow-4 magenta-cooler)
      (rainbow-5 blue-cooler)
      (rainbow-6 magenta)
      (rainbow-7 cyan-cooler)
      (rainbow-8 yellow-cooler))
    "The `ef-maris-light' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

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

  (ef-themes-theme ef-maris-light ef-maris-light-palette ef-maris-light-palette-overrides)

  (provide-theme 'ef-maris-light))

;;; ef-maris-light-theme.el ends here
