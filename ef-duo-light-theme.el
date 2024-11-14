;;; ef-duo-light-theme.el --- Legible light theme with mostly blue and yellow colors -*- lexical-binding:t -*-

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
  (deftheme ef-duo-light
    "Legible light theme with mostly blue and yellow colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-duo-light-palette
    '(
;;; Basic values

      (bg-main     "#fff8f0")
      (fg-main     "#222222")
      (bg-dim      "#f6ece8")
      (fg-dim      "#63728f")
      (bg-alt      "#e7e0da")
      (fg-alt      "#856f4a")

      (bg-active   "#c7c0ba")
      (bg-inactive "#f9f2ef")

;;; Basic hues for foreground values

      (red             "#cc3333")
      (red-warmer      "#dd1100")
      (red-cooler      "#c04440")
      (red-faint       "#a2403f")
      (green           "#217a3c")
      (green-warmer    "#4a7d00")
      (green-cooler    "#008058")
      (green-faint     "#61756c")
      (yellow          "#8a5d00")
      (yellow-warmer   "#9f4a00")
      (yellow-cooler   "#8f5a3a")
      (yellow-faint    "#765640")
      (blue            "#375cd8")
      (blue-warmer     "#4250ef")
      (blue-cooler     "#065fff")
      (blue-faint      "#6060d0")
      (magenta         "#ba35af")
      (magenta-warmer  "#cf25aa")
      (magenta-cooler  "#6052cf")
      (magenta-faint   "#af569f")
      (cyan            "#1f6fbf")
      (cyan-warmer     "#3f70a0")
      (cyan-cooler     "#1f77bb")
      (cyan-faint      "#406f90")

;;; Basic hues for background values

      (bg-red-intense     "#ff8f88")
      (bg-green-intense   "#8adf80")
      (bg-yellow-intense  "#fac200")
      (bg-blue-intense    "#cbcfff")
      (bg-magenta-intense "#df8fff")
      (bg-cyan-intense    "#88c8ff")

      (bg-red-subtle      "#ffcfbf")
      (bg-green-subtle    "#aff7c5")
      (bg-yellow-subtle   "#f9f376")
      (bg-blue-subtle     "#cfdff9")
      (bg-magenta-subtle  "#f9ddf0")
      (bg-cyan-subtle     "#bfeaf0")

;;; Diffs

      (bg-added          "#ccefcf")
      (bg-added-faint    "#e0f3e0")
      (bg-added-refine   "#bae0c0")
      (fg-added          "#005000")

      (bg-changed        "#ffe5b9")
      (bg-changed-faint  "#ffefc5")
      (bg-changed-refine "#ffd09f")
      (fg-changed        "#553d00")

      (bg-removed        "#ffd4d8")
      (bg-removed-faint  "#ffe3e3")
      (bg-removed-refine "#ffc0ca")
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

      (bg-mode-line       "#f8cf8f")
      (fg-mode-line       "#111133")
      (bg-completion      "#fadacf")
      (bg-hover           "#b4cfff")
      (bg-hover-secondary "#aaeccf")
      (bg-hl-line         "#f9e8c0")
      (bg-paren           "#afbfef")
      (bg-err             "#ffdfe6") ; check with err
      (bg-warning         "#ffe5ba") ; check with warning
      (bg-info            "#cff5d0") ; check with info

      (border        "#baafba")
      (cursor        "#1144ff")
      (fg-intense    "#000000")

      (modeline-err     "#950000")
      (modeline-warning "#6f008f")
      (modeline-info    "#00409f")

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

      (err red)
      (warning yellow)
      (info green)

      (link cyan)
      (link-alt green-cooler)
      (name blue)
      (keybind blue-cooler)
      (identifier red-faint)
      (prompt blue-warmer)

      (bg-region "#caeafa")
      (fg-region unspecified)

;;;; Code mappings

      (builtin cyan-cooler)
      (comment red-faint)
      (constant blue)
      (fnname cyan)
      (keyword blue-warmer)
      (preprocessor cyan-warmer)
      (docstring cyan-faint)
      (string yellow-warmer)
      (type blue-cooler)
      (variable magenta-cooler)
      (rx-escape cyan) ; compare with `string'
      (rx-construct red-warmer)

;;;; Accent mappings

      (accent-0 blue-warmer)
      (accent-1 yellow-warmer)
      (accent-2 green-cooler)
      (accent-3 red)

;;;; Date mappings

      (date-common cyan-cooler)
      (date-deadline red)
      (date-deadline-subtle red-faint)
      (date-event fg-alt)
      (date-holiday magenta-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-scheduled-subtle yellow-faint)
      (date-weekday cyan)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code yellow-warmer)
      (prose-done green)
      (prose-macro green-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula err)
      (prose-tag yellow-faint)
      (prose-todo red)
      (prose-verbatim blue-warmer)

;;;; Mail mappings

      (mail-cite-0 blue)
      (mail-cite-1 yellow-cooler)
      (mail-cite-2 cyan-cooler)
      (mail-cite-3 red-cooler)
      (mail-part blue-faint)
      (mail-recipient blue)
      (mail-subject yellow-warmer)
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
      (bg-term-green-bright    green-cooler)
      (fg-term-green-bright    green-cooler)

      (bg-term-yellow          yellow)
      (fg-term-yellow          yellow)
      (bg-term-yellow-bright   yellow-warmer)
      (fg-term-yellow-bright   yellow-warmer)

      (bg-term-blue            blue-warmer)
      (fg-term-blue            blue-warmer)
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

      (rainbow-0 blue)
      (rainbow-1 yellow-warmer)
      (rainbow-2 blue-warmer)
      (rainbow-3 yellow-cooler)
      (rainbow-4 magenta-cooler)
      (rainbow-5 green-warmer)
      (rainbow-6 cyan-warmer)
      (rainbow-7 yellow)
      (rainbow-8 green-cooler))
    "The `ef-duo-light' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-duo-light-palette-overrides nil
    "Overrides for `ef-duo-light-palette'.

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

  (ef-themes-theme ef-duo-light ef-duo-light-palette ef-duo-light-palette-overrides)

  (provide-theme 'ef-duo-light))

;;; ef-duo-light-theme.el ends here
