;;; ef-eagle-theme.el --- Legible light theme with brown, red, and desatured colors -*- lexical-binding:t -*-

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
  (deftheme ef-eagle
    "Legible light theme with brown, red, and desaturated colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-eagle-palette
    '(
;;; Basic values

      (bg-main     "#f1ecd0")
      (fg-main     "#231a1f")
      (bg-dim      "#e4dbc0")
      (fg-dim      "#685f53")
      (bg-alt      "#cec8ae")
      (fg-alt      "#524874")

      (bg-active   "#aea88e")
      (bg-inactive "#e7e0ca")

;;; Basic hues for foreground values

      (red             "#882000")
      (red-warmer      "#9a0000")
      (red-cooler      "#8f0038")
      (red-faint       "#702f1f")
      (green           "#226022")
      (green-warmer    "#3a7800")
      (green-cooler    "#006e50")
      (green-faint     "#42573f")
      (yellow          "#6b4500")
      (yellow-warmer   "#843300")
      (yellow-cooler   "#775228")
      (yellow-faint    "#6a5937")
      (blue            "#113384")
      (blue-warmer     "#3a3da0")
      (blue-cooler     "#000080")
      (blue-faint      "#2f3460")
      (magenta         "#822478")
      (magenta-warmer  "#960f4f")
      (magenta-cooler  "#50119f")
      (magenta-faint   "#603a6f")
      (cyan            "#125a7f")
      (cyan-warmer     "#4a5d90")
      (cyan-cooler     "#00676f")
      (cyan-faint      "#304f60")

;;; Basic hues for background values

      (bg-red-intense     "#f08f88")
      (bg-green-intense   "#96df8f")
      (bg-yellow-intense  "#efbf00")
      (bg-blue-intense    "#cfceff")
      (bg-magenta-intense "#dfafff")
      (bg-cyan-intense    "#a0ddd0")

      (bg-red-subtle      "#efcabf")
      (bg-green-subtle    "#c8e8aa")
      (bg-yellow-subtle   "#efe07f")
      (bg-blue-subtle     "#ccdee8")
      (bg-magenta-subtle  "#e3d0e7")
      (bg-cyan-subtle     "#bfe0d0")

;;; Diffs

      (bg-added          "#b0e7b0")
      (bg-added-faint    "#d0e7c2")
      (bg-added-refine   "#9ad590")
      (fg-added          "#005200")

      (bg-changed        "#f5e690")
      (bg-changed-faint  "#f5edaf")
      (bg-changed-refine "#edd482")
      (fg-changed        "#553d00")

      (bg-removed        "#f8c8a6")
      (bg-removed-faint  "#f0d9bc")
      (bg-removed-refine "#f0aa90")
      (fg-removed        "#8f1013")

;;; Graphs

      (bg-graph-red-0     "#ef7969")
      (bg-graph-red-1     "#ffaab4")
      (bg-graph-green-0   "#45c050")
      (bg-graph-green-1   "#75ef30")
      (bg-graph-yellow-0  "#ffcf00")
      (bg-graph-yellow-1  "#f9ff00")
      (bg-graph-blue-0    "#7f90ff")
      (bg-graph-blue-1    "#a6c0ff")
      (bg-graph-magenta-0 "#e07fff")
      (bg-graph-magenta-1 "#fad0ff")
      (bg-graph-cyan-0    "#70d3f0")
      (bg-graph-cyan-1    "#afefff")

;;; Special hues

      (bg-mode-line       "#cfab80")
      (fg-mode-line       "#2f1005")
      (bg-completion      "#dfc8af")
      (bg-hover           "#c0cbd7")
      (bg-hover-secondary "#c5d8a2")
      (bg-hl-line         "#ecdfba")
      (bg-paren           "#9fd0cc")
      (bg-err             "#f2d4b5") ; check with err
      (bg-warning         "#e7de80") ; check with warning
      (bg-info            "#cdeeb0") ; check with info

      (border        "#7f785f")
      (cursor        "#774400")
      (fg-intense    "#000000")

      (modeline-err     "#800000")
      (modeline-warning "#66008f")
      (modeline-info    "#1f407f")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af52")

      (bg-char-0 "#7feaff")
      (bg-char-1 "#f0a0f0")
      (bg-char-2 "#d0e000")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link yellow-cooler)
      (link-alt cyan-faint)
      (name green)
      (keybind red-warmer)
      (identifier cyan-faint)
      (prompt yellow-warmer)

      (bg-region "#ddc5af")
      (fg-region unspecified)

;;;; Code mappings

      (builtin yellow-cooler)
      (comment yellow-faint)
      (constant green-cooler)
      (fnname red)
      (keyword red-faint)
      (preprocessor red-warmer)
      (docstring green-faint)
      (string green-warmer)
      (type green)
      (variable cyan)
      (rx-escape magenta-warmer) ; compare with `string'
      (rx-construct blue-cooler)

;;;; Accent mappings

      (accent-0 red)
      (accent-1 green-cooler)
      (accent-2 blue)
      (accent-3 red-warmer)

;;;; Date mappings

      (date-common red-faint)
      (date-deadline red-cooler)
      (date-event fg-alt)
      (date-holiday red-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow-cooler)
      (date-weekday red)
      (date-weekend cyan)

;;;; Prose mappings

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

;;;; Mail mappings

      (mail-cite-0 red)
      (mail-cite-1 yellow)
      (mail-cite-2 green)
      (mail-cite-3 blue-faint)
      (mail-part green-cooler)
      (mail-recipient yellow)
      (mail-subject red-warmer)
      (mail-other yellow-warmer)

;;;; Search mappings

      (bg-search-match bg-warning)
      (bg-search-current bg-yellow-intense)
      (bg-search-lazy bg-cyan-intense)
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

      (rainbow-0 red)
      (rainbow-1 cyan-faint)
      (rainbow-2 red-faint)
      (rainbow-3 green-cooler)
      (rainbow-4 yellow)
      (rainbow-5 red-cooler)
      (rainbow-6 blue-faint)
      (rainbow-7 yellow-warmer)
      (rainbow-8 green))
    "The `ef-eagle' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

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

  (ef-themes-theme ef-eagle ef-eagle-palette ef-eagle-palette-overrides)

  (provide-theme 'ef-eagle))

;;; ef-eagle-theme.el ends here
