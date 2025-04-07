;;; ef-dark-gray-theme.el --- Legible dark theme with white, gray and black colors -*- lexical-binding:t -*-

;; Copyright (C) 2022-2024  Free Software Foundation, Inc.

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



(eval-and-compile
  (require 'ef-themes)

;;;###theme-autoload
  (deftheme ef-dark-gray
    "Legible dark theme with white, gray and black colors."
    :background-mode 'dark
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-dark-gray-palette
    '(
;;; Basic values

      (bg-main     "#000000")
      (fg-main     "#c7c7c7")
      (bg-dim      "#101010")
      (fg-dim      "#727272")
      (bg-alt      "#1e1e1e")
      (fg-alt      "#a0a0a0")

      (bg-active   "#3a3a3a")
      (bg-inactive "#0a0a0a")

;;; Basic hues for foreground values

      (red             "#8c8c8c")
      (red-warmer      "#959595")
      (red-cooler      "#929292")
      (red-faint       "#868686")
      (green           "#727272")
      (green-warmer    "#818181")
      (green-cooler    "#787878")
      (green-faint     "#7a7a7a")
      (yellow          "#898989")
      (yellow-warmer   "#8b8b8b")
      (yellow-cooler   "#969696")
      (yellow-faint    "#a0a0a0")
      (blue            "#818181")
      (blue-warmer     "#919191")
      (blue-cooler     "#868686")
      (blue-faint      "#888888")
      (magenta         "#898989")
      (magenta-warmer  "#a5a5a5")
      (magenta-cooler  "#969696")
      (magenta-faint   "#969696")
      (cyan            "#9c9c9c")
      (cyan-warmer     "#9d9d9d")
      (cyan-cooler     "#949494")
      (cyan-faint      "#949494")

;;; Basic hues for background values

      (bg-red-intense     "#555555")
      (bg-green-intense   "#4b4b4b")
      (bg-yellow-intense  "#545454")
      (bg-blue-intense    "#505050")
      (bg-magenta-intense "#666666")
      (bg-cyan-intense    "#5f5f5f")

      (bg-red-subtle      "#303030")
      (bg-green-subtle    "#262626")
      (bg-yellow-subtle   "#303030")
      (bg-blue-subtle     "#2c2c2c")
      (bg-magenta-subtle  "#2f2f2f")
      (bg-cyan-subtle     "#2c2c2c")

;;; Diffs

      (bg-added          "#1f1f1f")
      (bg-added-faint    "#151515")
      (bg-added-refine   "#2f2f2f")
      (fg-added          "#bebebe")

      (bg-changed        "#232323")
      (bg-changed-faint  "#151515")
      (bg-changed-refine "#353535")
      (fg-changed        "#e0e0e0")

      (bg-removed        "#202020")
      (bg-removed-faint  "#151515")
      (bg-removed-refine "#353535")
      (fg-removed        "#cccccc")

;;; Graphs

      (bg-graph-red-0     "#585858")
      (bg-graph-red-1     "#333333")
      (bg-graph-green-0   "#a9a9a9")
      (bg-graph-green-1   "#4a4a4a")
      (bg-graph-yellow-0  "#d1d1d1")
      (bg-graph-yellow-1  "#808080")
      (bg-graph-blue-0    "#909090")
      (bg-graph-blue-1    "#2f2f2f")
      (bg-graph-magenta-0 "#a3a3a3")
      (bg-graph-magenta-1 "#4f4f4f")
      (bg-graph-cyan-0    "#b5b5b5")
      (bg-graph-cyan-1    "#5c5c5c")

;;; Special hues

      (bg-mode-line       "#292929")
      (fg-mode-line       "#dedede")
      (bg-completion      "#1e1e1e")
      (bg-hover           "#313131")
      (bg-hover-secondary "#2d2d2d")
      (bg-hl-line         "#151515")
      (bg-paren           "#3f3f3f")
      (bg-err             "#1c1c1c") ; check with err
      (bg-warning         "#222222") ; check with warning
      (bg-info            "#1d1d1d") ; check with info

      (border        "#404040")
      (cursor        "#afafaf")
      (fg-intense    "#fefefe")

      (modeline-err     "#a8a8a8")
      (modeline-warning "#bfbfbf")
      (modeline-info    "#8d8d8d")

      (underline-err     "#6f6f6f")
      (underline-warning "#9d9d9d")
      (underline-info    "#787878")

      (bg-char-0 "#444444")
      (bg-char-1 "#444444")
      (bg-char-2 "#464646")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err red-warmer)
      (warning yellow)
      (info green)

      (link cyan)
      (link-alt magenta)
      (name blue-warmer)
      (keybind blue-cooler)
      (identifier magenta-faint)
      (prompt green-cooler)

      (bg-region "#1e1e1e")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta)
      (comment yellow-faint)
      (constant blue-cooler)
      (fnname magenta-warmer)
      (keyword magenta-cooler)
      (preprocessor red)
      (docstring cyan-faint)
      (string blue-warmer)
      (type green-cooler)
      (variable cyan-cooler)
      (rx-escape green-warmer) ; compare with `string'
      (rx-construct red)

;;;; Accent mappings

      (accent-0 blue)
      (accent-1 magenta-warmer)
      (accent-2 green-cooler)
      (accent-3 red)

;;;; Date mappings

      (date-common green-cooler)
      (date-deadline red-warmer)
      (date-deadline-subtle red-faint)
      (date-event fg-alt)
      (date-holiday magenta)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-scheduled-subtle yellow-faint)
      (date-weekday cyan)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code magenta-warmer)
      (prose-done green)
      (prose-macro green-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula err)
      (prose-tag yellow-faint)
      (prose-todo red-warmer)
      (prose-verbatim blue)

;;;; Mail mappings

      (mail-cite-0 blue)
      (mail-cite-1 magenta-warmer)
      (mail-cite-2 green-cooler)
      (mail-cite-3 yellow-cooler)
      (mail-part magenta-faint)
      (mail-recipient blue-warmer)
      (mail-subject blue-cooler)
      (mail-other cyan)

;;;; Search mappings

      (bg-search-match bg-warning)
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

;;;; Terminal mappings

      (bg-term-black           "black")
      (fg-term-black           "black")
      (bg-term-black-bright    "gray35")
      (fg-term-black-bright    "gray35")

      (bg-term-red             red)
      (fg-term-red             red)
      (bg-term-red-bright      red-warmer)
      (fg-term-red-bright      red-warmer)

      (bg-term-green           green)
      (fg-term-green           green)
      (bg-term-green-bright    green-warmer)
      (fg-term-green-bright    green-warmer)

      (bg-term-yellow          yellow)
      (fg-term-yellow          yellow)
      (bg-term-yellow-bright   yellow-cooler)
      (fg-term-yellow-bright   yellow-cooler)

      (bg-term-blue            blue)
      (fg-term-blue            blue)
      (bg-term-blue-bright     blue-cooler)
      (fg-term-blue-bright     blue-cooler)

      (bg-term-magenta         magenta)
      (fg-term-magenta         magenta)
      (bg-term-magenta-bright  magenta-cooler)
      (fg-term-magenta-bright  magenta-cooler)

      (bg-term-cyan            cyan-warmer)
      (fg-term-cyan            cyan-warmer)
      (bg-term-cyan-bright     cyan-cooler)
      (fg-term-cyan-bright     cyan-cooler)

      (bg-term-white           "gray65")
      (fg-term-white           "gray65")
      (bg-term-white-bright    "white")
      (fg-term-white-bright    "white")

;;;; Rainbow mappings

      (rainbow-0 green-cooler)
      (rainbow-1 blue)
      (rainbow-2 magenta-warmer)
      (rainbow-3 cyan-cooler)
      (rainbow-4 yellow-cooler)
      (rainbow-5 magenta-cooler)
      (rainbow-6 red-cooler)
      (rainbow-7 green-warmer)
      (rainbow-8 yellow))
    "The `ef-dark-gray' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-dark-gray-palette-overrides nil
    "Overrides for `ef-dark-gray-palette'.

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

  (ef-themes-theme ef-dark-gray ef-dark-gray-palette ef-dark-gray-palette-overrides)

  (provide-theme 'ef-dark-gray))

;;; ef-dark-gray-theme.el ends here
