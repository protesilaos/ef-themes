;;; ef-deuteranopia-light-theme.el --- Legible light theme, optimized for red-green color deficiency -*- lexical-binding:t -*-

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

  ;; Most of the colors here, like the red and green hues, are defined
  ;; simply to preserve compatibility with the rest of the project.  We
  ;; don't actually rely on them for anything critical.
;;;###theme-autoload
  (deftheme ef-deuteranopia-light
    "Legible light theme, optimized for red-green color deficiency."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-deuteranopia-light-palette
    '(
;;; Basic values

      (bg-main     "#f5f5ff")
      (fg-main     "#1a1a2f")
      (bg-dim      "#e8e8ea")
      (fg-dim      "#70627f")
      (bg-alt      "#d3d3e0")
      (fg-alt      "#196f70")

      (bg-active   "#b3b3c0")
      (bg-inactive "#efeff5")

;;; Basic hues for foreground values

      (red             "#d3303a")
      (red-warmer      "#e00033")
      (red-cooler      "#d50f7f")
      (red-faint       "#c24552")
      (green           "#217a3c")
      (green-warmer    "#4a7d00")
      (green-cooler    "#008058")
      (green-faint     "#61756c")
      (yellow          "#805d00")
      (yellow-warmer   "#965000")
      (yellow-cooler   "#765040")
      (yellow-faint    "#77604a")
      (blue            "#375cd8")
      (blue-warmer     "#4250ef")
      (blue-cooler     "#065fff")
      (blue-faint      "#6060d0")
      (magenta         "#ba35af")
      (magenta-warmer  "#cf25aa")
      (magenta-cooler  "#6052cf")
      (magenta-faint   "#9f5080")
      (cyan            "#1f6fbf")
      (cyan-warmer     "#3f6faf")
      (cyan-cooler     "#1f77bb")
      (cyan-faint      "#506fa0")

;;; Basic hues for background values

      (bg-red-intense     "#cac200")
      (bg-green-intense   "#9aaf80")
      (bg-yellow-intense  "#fac200")
      (bg-blue-intense    "#cbcfff")
      (bg-magenta-intense "#3fbfff")
      (bg-cyan-intense    "#98e8ff")

      (bg-red-subtle      "#ffcfbf")
      (bg-green-subtle    "#afffbf")
      (bg-yellow-subtle   "#fff576")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#ffddff")
      (bg-cyan-subtle     "#bfefff")

;;; Diffs

      (bg-added          "#dbdbff")
      (bg-added-faint    "#e4e4ff")
      (bg-added-refine   "#c0c0ef")
      (fg-added          "#333399")

      (bg-changed        "#eecfdf")
      (bg-changed-faint  "#f0dde5")
      (bg-changed-refine "#e0b0d0")
      (fg-changed        "#6f1343")

      (bg-removed        "#fff0af")
      (bg-removed-faint  "#efefcb")
      (bg-removed-refine "#f0da88")
      (fg-removed        "#553d00")

;;; Graphs

      (bg-graph-red-0     "#d0b029")
      (bg-graph-red-1     "#e0cab4")
      (bg-graph-green-0   "#8ac050")
      (bg-graph-green-1   "#afdfa5")
      (bg-graph-yellow-0  "#ffcf00")
      (bg-graph-yellow-1  "#f9ff00")
      (bg-graph-blue-0    "#7f9fff")
      (bg-graph-blue-1    "#afd0ff")
      (bg-graph-magenta-0 "#b0b0d0")
      (bg-graph-magenta-1 "#d0dfdf")
      (bg-graph-cyan-0    "#6faad9")
      (bg-graph-cyan-1    "#bfe0ff")

;;; Special hues

      (bg-mode-line       "#99c7ff")
      (fg-mode-line       "#0a0a1f")
      (bg-completion      "#f0dacf")
      (bg-hover           "#eebb20")
      (bg-hover-secondary "#afafef")
      (bg-hl-line         "#f3e0d5")
      (bg-paren           "#8fc0cf")
      (bg-err             "#f0e0a0") ; check with err
      (bg-warning         "#e3ea9a") ; check with warning
      (bg-info            "#d0dfff") ; check with info

      (border        "#bcbcd0")
      (cursor        "#0000bb")
      (fg-intense    "#000000")

      (modeline-err     "#000000") ; too dark to have red/yellow here
      (modeline-warning "#0a0a1f")
      (modeline-info    "#2222c3")

      (underline-err     "#c08f00")
      (underline-warning "#6f3f00")
      (underline-info    "#025f92")

      (bg-char-0 "#7feaff")
      (bg-char-1 "#ffaaff")
      (bg-char-2 "#dff000")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err yellow-warmer)
      (warning yellow-cooler)
      (info blue-cooler)

      (link blue)
      (link-alt yellow-cooler)
      (name blue-warmer)
      (keybind yellow-warmer)
      (identifier cyan-faint)
      (prompt blue)

      (bg-region "#dadadf")
      (fg-region unspecified)

;;;; Code mappings

      (builtin cyan)
      (comment yellow-faint)
      (constant yellow-cooler)
      (fnname blue-cooler)
      (keyword blue-warmer)
      (preprocessor magenta-cooler)
      (docstring cyan-faint)
      (string yellow-warmer)
      (type yellow)
      (variable cyan-cooler)
      (rx-escape cyan-faint) ; compare with `string'
      (rx-construct blue-warmer)

;;;; Accent mappings

      (accent-0 blue-cooler)
      (accent-1 yellow-warmer)
      (accent-2 cyan)
      (accent-3 yellow-cooler)

;;;; Date mappings

      (date-common yellow-cooler)
      (date-deadline yellow-warmer)
      (date-event fg-alt)
      (date-holiday cyan)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow-cooler)
      (date-weekday cyan)
      (date-weekend magenta-faint)

;;;; Prose mappings

      (prose-code yellow-warmer)
      (prose-done blue-cooler)
      (prose-macro cyan)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula err)
      (prose-tag green-faint)
      (prose-todo yellow-warmer)
      (prose-verbatim blue-cooler)

;;;; Mail mappings

      (mail-cite-0 blue-warmer)
      (mail-cite-1 yellow-cooler)
      (mail-cite-2 cyan-cooler)
      (mail-cite-3 yellow)
      (mail-part blue-faint)
      (mail-recipient blue-warmer)
      (mail-subject blue-cooler)
      (mail-other cyan)

;;;; Space mappings

      (bg-space unspecified)
      (fg-space border)
      (bg-space-err bg-yellow-intense)

;;;; Search mappings

      (bg-search-current bg-yellow-intense)
      (bg-search-lazy bg-blue-intense)
      (bg-search-replace bg-magenta-intense)

      (bg-search-rx-group-0 bg-cyan-intense)
      (bg-search-rx-group-1 bg-magenta-intense)
      (bg-search-rx-group-2 bg-blue-subtle)
      (bg-search-rx-group-3 bg-yellow-subtle)

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

      (rainbow-0 blue)
      (rainbow-1 yellow)
      (rainbow-2 blue-warmer)
      (rainbow-3 yellow-cooler)
      (rainbow-4 blue-cooler)
      (rainbow-5 yellow-warmer)
      (rainbow-6 blue-faint)
      (rainbow-7 yellow-faint)
      (rainbow-8 cyan))
    "The `ef-deuteranopia-light' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-deuteranopia-light-palette-overrides nil
    "Overrides for `ef-deuteranopia-light-palette'.

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

  (ef-themes-theme ef-deuteranopia-light ef-deuteranopia-light-palette ef-deuteranopia-light-palette-overrides)

  (provide-theme 'ef-deuteranopia-light))

;;; ef-deuteranopia-light-theme.el ends here
