;;; ef-tritanopia-light-theme.el --- Legible light theme, optimized for blue-yellow color deficiency -*- lexical-binding:t -*-

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

  ;; Most of the colors here, like the blue and green hues, are defined
  ;; simply to preserve compatibility with the rest of the project.  We
  ;; don't actually rely on them for anything critical.
;;;###theme-autoload
  (deftheme ef-tritanopia-light
    "Legible light theme, optimized for blue-yellow color deficiency."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-tritanopia-light-palette
    '(
;;; Basic values

      (bg-main     "#fff9f9")
      (fg-main     "#1a1a1a")
      (bg-dim      "#efecec")
      (fg-dim      "#756275")
      (bg-alt      "#ddd9d9")
      (fg-alt      "#194f90")

      (bg-active   "#bdb9b9")
      (bg-inactive "#f7f2f2")

;;; Basic hues for foreground values

      (red             "#aa0010")
      (red-warmer      "#dd0000")
      (red-cooler      "#c50f4f")
      (red-faint       "#92454f")
      (green           "#217a3c")
      (green-warmer    "#4a7d00")
      (green-cooler    "#008058")
      (green-faint     "#61756c")
      (yellow          "#805d00")
      (yellow-warmer   "#965000")
      (yellow-cooler   "#765040")
      (yellow-faint    "#776d6a")
      (blue            "#375cd8")
      (blue-warmer     "#4250ef")
      (blue-cooler     "#065fff")
      (blue-faint      "#6060d0")
      (magenta         "#aa357f")
      (magenta-warmer  "#bf256a")
      (magenta-cooler  "#af40af")
      (magenta-faint   "#7f4580")
      (cyan            "#2070af")
      (cyan-warmer     "#2f5faf")
      (cyan-cooler     "#007faa")
      (cyan-faint      "#5f6a90")

;;; Basic hues for background values

      (bg-red-intense     "#ffa2a0")
      (bg-green-intense   "#8aefef")
      (bg-yellow-intense  "#ff7f78")
      (bg-blue-intense    "#a8c8ef")
      (bg-magenta-intense "#e09fc0")
      (bg-cyan-intense    "#7bcfcf")

      (bg-red-subtle      "#ffcfbf")
      (bg-green-subtle    "#b3fabf")
      (bg-yellow-subtle   "#fff576")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#ffddff")
      (bg-cyan-subtle     "#bfefff")

;;; Diffs

      (bg-added          "#c9efea")
      (bg-added-faint    "#d7eff5")
      (bg-added-refine   "#b3dfdf")
      (fg-added          "#004840")

      (bg-changed        "#dbdbff")
      (bg-changed-faint  "#e4e4ff")
      (bg-changed-refine "#c0c0ef")
      (fg-changed        "#333399")

      (bg-removed        "#ffd6e0")
      (bg-removed-faint  "#ffe9e6")
      (bg-removed-refine "#f5bfc8")
      (fg-removed        "#8f1313")

;;; Graphs

      (bg-graph-red-0     "#ef7969")
      (bg-graph-red-1     "#ffaab4")
      (bg-graph-green-0   "#68c0a0")
      (bg-graph-green-1   "#a5dfd0")
      (bg-graph-yellow-0  "#d99f9f")
      (bg-graph-yellow-1  "#ffb58f")
      (bg-graph-blue-0    "#80a0df")
      (bg-graph-blue-1    "#a8cfff")
      (bg-graph-magenta-0 "#efafcf")
      (bg-graph-magenta-1 "#ffdaef")
      (bg-graph-cyan-0    "#7fd3ed")
      (bg-graph-cyan-1    "#afefff")

;;; Special hues

      (bg-mode-line       "#ff99aa")
      (fg-mode-line       "#1a0a0f")
      (bg-completion      "#ffcada")
      (bg-hover           "#8fcfff")
      (bg-hover-secondary "#eda9dc")
      (bg-hl-line         "#ffdadf")
      (bg-paren           "#8fc0cf")
      (bg-err             "#ffbfca") ; check with err
      (bg-warning         "#efcae6") ; check with warning
      (bg-info            "#cfdfef") ; check with info

      (border        "#adadad")
      (cursor        "#bb0000")
      (fg-intense    "#000000")

      (modeline-err     "#8f0000")
      (modeline-warning "#6f306f")
      (modeline-info    "#00445f")

      (underline-err     "#ef0f1f")
      (underline-warning "#af7f90")
      (underline-info    "#22afc2")

      (bg-char-0 "#ff908f")
      (bg-char-1 "#bfbfff")
      (bg-char-2 "#5fcfdf")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err red-warmer)
      (warning magenta)
      (info cyan)

      (link cyan)
      (link-alt magenta-cooler)
      (name magenta)
      (keybind red-cooler)
      (identifier magenta-faint)
      (prompt cyan)

      (bg-region "#dadadf")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta)
      (comment red-faint)
      (constant red-cooler)
      (fnname magenta-cooler)
      (keyword red)
      (preprocessor magenta-cooler)
      (docstring cyan-faint)
      (string cyan)
      (type cyan-warmer)
      (variable cyan-cooler)
      (rx-escape cyan-warmer) ; compare with `string'
      (rx-construct red-warmer)

;;;; Accent mappings

      (accent-0 cyan)
      (accent-1 red)
      (accent-2 cyan-warmer)
      (accent-3 magenta)

;;;; Date mappings

      (date-common cyan-cooler)
      (date-deadline red-warmer)
      (date-event fg-alt)
      (date-holiday red-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled magenta)
      (date-weekday cyan)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code red)
      (prose-done cyan)
      (prose-macro cyan-warmer)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula err)
      (prose-tag fg-alt)
      (prose-todo red-warmer)
      (prose-verbatim cyan)

;;;; Mail mappings

      (mail-cite-0 cyan-cooler)
      (mail-cite-1 red-cooler)
      (mail-cite-2 cyan-warmer)
      (mail-cite-3 red-faint)
      (mail-part cyan)
      (mail-recipient magenta)
      (mail-subject red-warmer)
      (mail-other magenta-cooler)

;;;; Search mappings

      (bg-search-match bg-warning)
      (bg-search-current bg-red-intense)
      (bg-search-lazy bg-cyan-intense)
      (bg-search-replace bg-magenta-intense)

      (bg-search-rx-group-0 bg-blue-intense)
      (bg-search-rx-group-1 bg-magenta-intense)
      (bg-search-rx-group-2 bg-cyan-subtle)
      (bg-search-rx-group-3 bg-red-subtle)

;;;; Space mappings

      (bg-space unspecified)
      (fg-space border)
      (bg-space-err bg-red-intense)

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

      (bg-term-cyan            cyan)
      (fg-term-cyan            cyan)
      (bg-term-cyan-bright     cyan-cooler)
      (fg-term-cyan-bright     cyan-cooler)

      (bg-term-white           "gray65")
      (fg-term-white           "gray65")
      (bg-term-white-bright    "white")
      (fg-term-white-bright    "white")

;;;; Rainbow mappings

      (rainbow-0 cyan)
      (rainbow-1 red)
      (rainbow-2 cyan-warmer)
      (rainbow-3 red-cooler)
      (rainbow-4 cyan-cooler)
      (rainbow-5 magenta)
      (rainbow-6 cyan-faint)
      (rainbow-7 magenta-faint)
      (rainbow-8 red-faint))
    "The `ef-tritanopia-light' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-tritanopia-light-palette-overrides nil
    "Overrides for `ef-tritanopia-light-palette'.

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

  (ef-themes-theme ef-tritanopia-light ef-tritanopia-light-palette ef-tritanopia-light-palette-overrides)

  (provide-theme 'ef-tritanopia-light))

;;; ef-tritanopia-light-theme.el ends here
