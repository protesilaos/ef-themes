;;; ef-light-theme.el --- Legible light theme with blue, magenta, cyan, purple colors -*- lexical-binding:t -*-

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
  (deftheme ef-light
    "Legible light theme with blue, magenta, cyan, purple colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-light-palette
    '(
;;; Basic values

      (bg-main     "#ffffff")
      (fg-main     "#202020")
      (bg-dim      "#efefef")
      (fg-dim      "#70627f")
      (bg-alt      "#dbdbdb")
      (fg-alt      "#196f70")

      (bg-active   "#b3b3b3")
      (bg-inactive "#f9f9f9")

;;; Basic hues for foreground values

      (red             "#d3303a")
      (red-warmer      "#e00033")
      (red-cooler      "#d50f7f")
      (red-faint       "#c24552")
      (green           "#217a3c")
      (green-warmer    "#4a7d00")
      (green-cooler    "#008858")
      (green-faint     "#61756c")
      (yellow          "#a45f22")
      (yellow-warmer   "#b6532f")
      (yellow-cooler   "#b65050")
      (yellow-faint    "#a65f6a")
      (blue            "#3740cf")
      (blue-warmer     "#4250ef")
      (blue-cooler     "#065fff")
      (blue-faint      "#4f54ba")
      (magenta         "#ba35af")
      (magenta-warmer  "#cf25aa")
      (magenta-cooler  "#6052cf")
      (magenta-faint   "#af5a80")
      (cyan            "#1f6fbf")
      (cyan-warmer     "#3f6faf")
      (cyan-cooler     "#1f77bb")
      (cyan-faint      "#506fa0")

;;; Basic hues for background values

      (bg-red-intense     "#ff8f88")
      (bg-green-intense   "#9adf90")
      (bg-yellow-intense  "#fac200")
      (bg-blue-intense    "#cbcfff")
      (bg-magenta-intense "#df8fff")
      (bg-cyan-intense    "#88c8ff")

      (bg-red-subtle      "#ffcfbf")
      (bg-green-subtle    "#b3fabf")
      (bg-yellow-subtle   "#fff576")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#ffddff")
      (bg-cyan-subtle     "#bfefff")

;;; Diffs

      (bg-added          "#d5f8d5")
      (bg-added-faint    "#e5ffe5")
      (bg-added-refine   "#c6e8c6")
      (fg-added          "#005000")

      (bg-changed        "#f4e8bd")
      (bg-changed-faint  "#f9efcb")
      (bg-changed-refine "#efd299")
      (fg-changed        "#553d00")

      (bg-removed        "#ffd8d5")
      (bg-removed-faint  "#ffe9e9")
      (bg-removed-refine "#f3b5af")
      (fg-removed        "#8f1313")

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

      (bg-mode-line       "#b7c7ff")
      (fg-mode-line       "#151515")
      (bg-completion      "#bfe8ff")
      (bg-hover           "#aaeccf")
      (bg-hover-secondary "#ccbfff")
      (bg-hl-line         "#e4efd8")
      (bg-paren           "#dfa0f3")
      (bg-err             "#ffd5ea") ; check with err
      (bg-warning         "#ffeabb") ; check with warning
      (bg-info            "#d0efda") ; check with info

      (border        "#bfc4da")
      (cursor        "#0033cc")
      (fg-intense    "#000000")

      (modeline-err     "#9f0000")
      (modeline-warning "#5f0070")
      (modeline-info    "#002fa0")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af52")

      (bg-char-0 "#7feaff")
      (bg-char-1 "#ffaaff")
      (bg-char-2 "#dff000")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link blue)
      (link-alt magenta)
      (name magenta-cooler)
      (keybind blue-cooler)
      (identifier magenta-faint)
      (prompt green-cooler)

      (bg-region "#bfefff")
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
      (date-event fg-alt)
      (date-holiday magenta-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
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
      (rainbow-2 magenta-warmer)
      (rainbow-3 cyan-cooler)
      (rainbow-4 yellow-cooler)
      (rainbow-5 magenta-cooler)
      (rainbow-6 red-cooler)
      (rainbow-7 green-cooler)
      (rainbow-8 yellow))
    "The `ef-light' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-light-palette-overrides nil
    "Overrides for `ef-light-palette'.

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

  (ef-themes-theme ef-light ef-light-palette ef-light-palette-overrides)

  (provide-theme 'ef-light))

;;; ef-light-theme.el ends here
