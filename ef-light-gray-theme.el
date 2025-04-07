;;; ef-light-gray-theme.el --- Legible light theme with white, gray and black colors -*- lexical-binding:t -*-

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
  (deftheme ef-light-gray
    "Legible light theme with white, gray and black colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-light-gray-palette
    '(
;;; Basic values

      (bg-main     "#fefefe")
      (fg-main     "#151515")
      (bg-dim      "#ebebeb")
      (fg-dim      "#666666")
      (bg-alt      "#d4d4d4")
      (fg-alt      "#585858")

      (bg-active   "#a6a6a6")
      (bg-inactive "#f7f7f7")

;;; Basic hues for foreground values

      (red             "#696969")
      (red-warmer      "#6b6b6b")
      (red-cooler      "#6a6a6a")
      (red-faint       "#686868")
      (green           "#505050")
      (green-warmer    "#565656")
      (green-cooler    "#5b5b5b")
      (green-faint     "#5d5d5d")
      (yellow          "#636363")
      (yellow-warmer   "#666666")
      (yellow-cooler   "#676767")
      (yellow-faint    "#686868")
      (blue            "#494949")
      (blue-warmer     "#5a5a5a")
      (blue-cooler     "#5f5f5f")
      (blue-faint      "#4f4f4f")
      (magenta         "#6b6b6b")
      (magenta-warmer  "#717171")
      (magenta-cooler  "#5a5a5a")
      (magenta-faint   "#6d6d6d")
      (cyan            "#5b5b5b")
      (cyan-warmer     "#5c5c5c")
      (cyan-cooler     "#5f5f5f")
      (cyan-faint      "#5c5c5c")

;;; Basic hues for background values

      (bg-red-intense     "#ababab")
      (bg-green-intense   "#bababa")
      (bg-yellow-intense  "#c0c0c0")
      (bg-blue-intense    "#cccccc")
      (bg-magenta-intense "#adadad")
      (bg-cyan-intense    "#b4b4b4")

      (bg-red-subtle      "#d6d6d6")
      (bg-green-subtle    "#dadada")
      (bg-yellow-subtle   "#e9e9e9")
      (bg-blue-subtle     "#d7d7d7")
      (bg-magenta-subtle  "#e7e7e7")
      (bg-cyan-subtle     "#dedede")

;;; Diffs

      (bg-added          "#dedede")
      (bg-added-faint    "#f2f2f2")
      (bg-added-refine   "#cccccc")
      (fg-added          "#2e2e2e")

      (bg-changed        "#e2e2e2")
      (bg-changed-faint  "#ebebeb")
      (bg-changed-refine "#cecece")
      (fg-changed        "#323232")

      (bg-removed        "#dedede")
      (bg-removed-faint  "#ececec")
      (bg-removed-refine "#bfbfbf")
      (fg-removed        "#3f3f3f")

;;; Graphs

      (bg-graph-red-0     "#969696")
      (bg-graph-red-1     "#bebebe")
      (bg-graph-green-0   "#8b8b8b")
      (bg-graph-green-1   "#b8b8b8")
      (bg-graph-yellow-0  "#cbcbcb")
      (bg-graph-yellow-1  "#eaeaea")
      (bg-graph-blue-0    "#8d8d8d")
      (bg-graph-blue-1    "#b6b6b6")
      (bg-graph-magenta-0 "#a6a6a6")
      (bg-graph-magenta-1 "#dddddd")
      (bg-graph-cyan-0    "#b4b4b4")
      (bg-graph-cyan-1    "#dadada")

;;; Special hues

      (bg-mode-line       "#c0c0c0")
      (fg-mode-line       "#0c0c0c")
      (bg-completion      "#d9d9d9")
      (bg-hover           "#cfcfcf")
      (bg-hover-secondary "#c2c2c2")
      (bg-hl-line         "#e5e5e5")
      (bg-paren           "#b4b4b4")
      (bg-err             "#dfdfdf") ; check with err
      (bg-warning         "#e8e8e8") ; check with warning
      (bg-info            "#dedede") ; check with info

      (border        "#bbbbbb")
      (cursor        "#3e3e3e")
      (fg-intense    "#000000")

      (modeline-err     "#464646")
      (modeline-warning "#303030")
      (modeline-info    "#313131")

      (underline-err     "#737373")
      (underline-warning "#6e6e6e")
      (underline-info    "#787878")

      (bg-char-0 "#cacaca")
      (bg-char-1 "#c9c9c9")
      (bg-char-2 "#d6d6d6")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link blue-warmer)
      (link-alt magenta)
      (name magenta-cooler)
      (keybind blue-cooler)
      (identifier magenta-faint)
      (prompt green-cooler)

      (bg-region "#dedede")
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
      (rx-escape green-cooler) ; compare with `string'
      (rx-construct magenta)

;;;; Accent mappings

      (accent-0 blue-warmer)
      (accent-1 magenta-warmer)
      (accent-2 green-cooler)
      (accent-3 yellow-warmer)

;;;; Date mappings

      (date-common cyan-cooler)
      (date-deadline red)
      (date-deadline-subtle red-cooler)
      (date-event fg-alt)
      (date-holiday magenta-warmer)
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
      (prose-tag green-faint)
      (prose-todo red-warmer)
      (prose-verbatim blue-warmer)

;;;; Mail mappings

      (mail-cite-0 blue-warmer)
      (mail-cite-1 magenta)
      (mail-cite-2 cyan-cooler)
      (mail-cite-3 yellow-cooler)
      (mail-part cyan-warmer)
      (mail-recipient magenta-cooler)
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

      (bg-term-red             red-cooler)
      (fg-term-red             red-cooler)
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

      (bg-term-blue            blue-warmer)
      (fg-term-blue            blue-warmer)
      (bg-term-blue-bright     blue-cooler)
      (fg-term-blue-bright     blue-cooler)

      (bg-term-magenta         magenta)
      (fg-term-magenta         magenta)
      (bg-term-magenta-bright  magenta-cooler)
      (fg-term-magenta-bright  magenta-cooler)

      (bg-term-cyan            cyan)
      (fg-term-cyan            cyan)
      (bg-term-cyan-bright     cyan-cooler)
      (fg-term-cyan-bright     cyan-cooler)

      (bg-term-white           "gray65")
      (fg-term-white           "gray65")
      (bg-term-white-bright    "white")
      (fg-term-white-bright    "white")

;;;; Rainbow mappings

      (rainbow-0 green-cooler)
      (rainbow-1 blue-faint)
      (rainbow-2 magenta)
      (rainbow-3 cyan-cooler)
      (rainbow-4 yellow-cooler)
      (rainbow-5 magenta-cooler)
      (rainbow-6 red-cooler)
      (rainbow-7 green-cooler)
      (rainbow-8 yellow))
    "The `ef-light-gray' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-light-gray-palette-overrides nil
    "Overrides for `ef-light-gray-palette'.

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

  (ef-themes-theme ef-light-gray ef-light-gray-palette ef-light-gray-palette-overrides)

  (provide-theme 'ef-light-gray))

;;; ef-light-gray-theme.el ends here
