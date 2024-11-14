;;; ef-elea-dark-theme.el --- Legible dark theme with brown, magenta, and green colors -*- lexical-binding:t -*-

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
  (deftheme ef-elea-dark
    "Legible dark theme with brown, magenta, and green colors."
    :background-mode 'dark
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-elea-dark-palette
    '(
;;; Basic values

      (bg-main      "#222524")
      (fg-main      "#eaf2ef")
      (bg-dim       "#303332")
      (fg-dim       "#969faf")
      (bg-alt       "#3e4140")
      (fg-alt       "#8fcfbb")

      (bg-active    "#5e6160")
      (bg-inactive  "#2b2e2d")

;;; Basic hues for foreground values

      (red             "#ff656a")
      (red-warmer      "#ff7a5f")
      (red-cooler      "#fa7f88")
      (red-faint       "#eba8a8")
      (green           "#7fc87f")
      (green-warmer    "#7fca5a")
      (green-cooler    "#50cf89")
      (green-faint     "#a9c99f")
      (yellow          "#cac85f")
      (yellow-warmer   "#e0b02f")
      (yellow-cooler   "#cfb27f")
      (yellow-faint    "#cac89f")
      (blue            "#57aff6")
      (blue-warmer     "#78afff")
      (blue-cooler     "#62cfef")
      (blue-faint      "#6ab4ef")
      (magenta         "#f59acf")
      (magenta-warmer  "#fa90ea")
      (magenta-cooler  "#cfaaff")
      (magenta-faint   "#d0b9f0")
      (cyan            "#6fcfd2")
      (cyan-warmer     "#7fcfdf")
      (cyan-cooler     "#60d5c2")
      (cyan-faint      "#99bfcf")

;;; Basic hues for background values

      (bg-red-intense     "#bd1f30")
      (bg-green-intense   "#408420")
      (bg-yellow-intense  "#847020")
      (bg-blue-intense    "#2f5f9f")
      (bg-magenta-intense "#b05fcf")
      (bg-cyan-intense    "#028099")

      (bg-red-subtle      "#6c2a2a")
      (bg-green-subtle    "#2f532a")
      (bg-yellow-subtle   "#62432a")
      (bg-blue-subtle     "#26486c")
      (bg-magenta-subtle  "#59335b")
      (bg-cyan-subtle     "#204c60")

;;; Diffs

      (bg-added          "#20493f")
      (bg-added-faint    "#203a2f")
      (bg-added-refine   "#136244")
      (fg-added          "#a0e0a0")

      (bg-changed        "#51512f")
      (bg-changed-faint  "#40332f")
      (bg-changed-refine "#61621f")
      (fg-changed        "#dada90")

      (bg-removed        "#5e242f")
      (bg-removed-faint  "#4a242a")
      (bg-removed-refine "#772a35")
      (fg-removed        "#ffbfbf")

;;; Graphs

      (bg-graph-red-0     "#b52c2c")
      (bg-graph-red-1     "#702020")
      (bg-graph-green-0   "#0fed00")
      (bg-graph-green-1   "#007800")
      (bg-graph-yellow-0  "#f1e00a")
      (bg-graph-yellow-1  "#b08940")
      (bg-graph-blue-0    "#2fafef")
      (bg-graph-blue-1    "#1f2f8f")
      (bg-graph-magenta-0 "#bf94fe")
      (bg-graph-magenta-1 "#5f509f")
      (bg-graph-cyan-0    "#47dfea")
      (bg-graph-cyan-1    "#00808f")

;;; Special hues

      (bg-mode-line       "#35605d")
      (fg-mode-line       "#ecf0ff")
      (bg-completion      "#37493f")
      (bg-hover           "#894f7a")
      (bg-hover-secondary "#425d4a")
      (bg-hl-line         "#2f413f")
      (bg-paren           "#3f6f5f")
      (bg-err             "#551525") ; check with err
      (bg-warning         "#424223") ; check with warning
      (bg-info            "#104420") ; check with info

      (border        "#5d5f63")
      (cursor        "#ef7fa8")
      (fg-intense    "#ffffff")

      (modeline-err     "#ffbfbf")
      (modeline-warning "#dfd443")
      (modeline-info    "#7fefff")

      (underline-err     "#df2f2f")
      (underline-warning "#c0b000")
      (underline-info    "#22b022")

      (bg-char-0 "#0050af")
      (bg-char-1 "#7f1f7f")
      (bg-char-2 "#6f6600")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err red-warmer)
      (warning yellow-warmer)
      (info green-cooler)

      (link green-warmer)
      (link-alt magenta)
      (name green)
      (keybind magenta)
      (identifier magenta-faint)
      (prompt magenta-cooler)

      (bg-region "#543040")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta-faint)
      (comment yellow-faint)
      (constant magenta-cooler)
      (fnname green-warmer)
      (keyword red-faint)
      (preprocessor magenta-warmer)
      (docstring cyan-faint)
      (string green-cooler)
      (type cyan)
      (variable magenta)
      (rx-escape magenta-cooler) ; compare with `string'
      (rx-construct red)

;;;; Accent mappings

      (accent-0 green-cooler)
      (accent-1 magenta)
      (accent-2 magenta-cooler)
      (accent-3 blue-warmer)

;;;; Date mappings

      (date-common green-cooler)
      (date-deadline red)
      (date-deadline-subtle red-faint)
      (date-event fg-alt)
      (date-holiday magenta-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-scheduled-subtle yellow-faint)
      (date-weekday cyan-cooler)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code magenta)
      (prose-done green-warmer)
      (prose-macro magenta-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula err)
      (prose-tag cyan-faint)
      (prose-todo red-warmer)
      (prose-verbatim cyan-cooler)

;;;; Mail mappings

      (mail-cite-0 cyan-cooler)
      (mail-cite-1 magenta)
      (mail-cite-2 green-warmer)
      (mail-cite-3 magenta-cooler)
      (mail-part yellow-cooler)
      (mail-recipient red-faint)
      (mail-subject green-cooler)
      (mail-other green)

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
      (bg-term-green-bright    green-cooler)
      (fg-term-green-bright    green-cooler)

      (bg-term-yellow          yellow)
      (fg-term-yellow          yellow)
      (bg-term-yellow-bright   yellow-warmer)
      (fg-term-yellow-bright   yellow-warmer)

      (bg-term-blue            blue)
      (fg-term-blue            blue)
      (bg-term-blue-bright     blue-warmer)
      (fg-term-blue-bright     blue-warmer)

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

      (rainbow-0 green-warmer)
      (rainbow-1 red-faint)
      (rainbow-2 green-faint)
      (rainbow-3 cyan-cooler)
      (rainbow-4 magenta-cooler)
      (rainbow-5 magenta)
      (rainbow-6 green)
      (rainbow-7 yellow-cooler)
      (rainbow-8 blue-faint))
    "The `ef-elea-dark' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-elea-dark-palette-overrides nil
    "Overrides for `ef-elea-dark-palette'.

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

  (ef-themes-theme ef-elea-dark ef-elea-dark-palette ef-elea-dark-palette-overrides)

  (provide-theme 'ef-elea-dark))

;;; ef-elea-dark-theme.el ends here
