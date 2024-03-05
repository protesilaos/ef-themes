;;; ef-rosa-theme.el --- Legible dark theme with magenta and green colors -*- lexical-binding:t -*-

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
  (deftheme ef-rosa
    "Legible dark theme with magenta and green colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-rosa-palette
    '(
;;; Basic values

      (bg-main     "#322023")
      (fg-main     "#e4d3e1")
      (bg-dim      "#432e32")
      (fg-dim      "#9d9d9d")
      (bg-alt      "#4a3842")
      (fg-alt      "#96c4af")

      (bg-active   "#6a5862")
      (bg-inactive "#362129")

;;; Basic hues for foreground values

      (red             "#ff707f")
      (red-warmer      "#ff7f5f")
      (red-cooler      "#f0888f")
      (red-faint       "#e89f84")
      (green           "#55cb56")
      (green-warmer    "#8ad05a")
      (green-cooler    "#49d081")
      (green-faint     "#9aba8b")
      (yellow          "#e4c53f")
      (yellow-warmer   "#f2a85f")
      (yellow-cooler   "#eec26f")
      (yellow-faint    "#d8c09f")
      (blue            "#57aff6")
      (blue-warmer     "#78b2ff")
      (blue-cooler     "#62cff7")
      (blue-faint      "#9fbfdf")
      (magenta         "#ffb2d6")
      (magenta-warmer  "#f28fdf")
      (magenta-cooler  "#cfb1ff")
      (magenta-faint   "#c59fdf")
      (cyan            "#5fc0dc")
      (cyan-warmer     "#7fc5df")
      (cyan-cooler     "#80dfbf")
      (cyan-faint      "#99bfcf")

;;; Basic hues for background values

      (bg-red-intense     "#bd1f30")
      (bg-green-intense   "#408420")
      (bg-yellow-intense  "#847020")
      (bg-blue-intense    "#2f5f9f")
      (bg-magenta-intense "#905fdf")
      (bg-cyan-intense    "#028099")

      (bg-red-subtle      "#6a102a")
      (bg-green-subtle    "#00522a")
      (bg-yellow-subtle   "#5a4000")
      (bg-blue-subtle     "#243788")
      (bg-magenta-subtle  "#422e6b")
      (bg-cyan-subtle     "#005065")

;;; Diffs

      (bg-added          "#2f4735")
      (bg-added-faint    "#2a382f")
      (bg-added-refine   "#1d6044")
      (fg-added          "#a0e0a0")

      (bg-changed        "#51512f")
      (bg-changed-faint  "#40332f")
      (bg-changed-refine "#61621f")
      (fg-changed        "#dada90")

      (bg-removed        "#5f252f")
      (bg-removed-faint  "#4a242a")
      (bg-removed-refine "#792d35")
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

      (bg-mode-line       "#814558")
      (fg-mode-line       "#e8e5e7")
      (bg-completion      "#6e425f")
      (bg-hover           "#3f6a50")
      (bg-hover-secondary "#6a4f5f")
      (bg-hl-line         "#42352f")
      (bg-paren           "#7c454f")
      (bg-err             "#551a07") ; check with err
      (bg-warning         "#4f3f13") ; check with warning
      (bg-info            "#0f4312") ; check with info

      (border        "#6f5f58")
      (cursor        "#ef607a")
      (fg-intense    "#ffffff")

      (modeline-err     "#ffb4ff")
      (modeline-warning "#dfdf43")
      (modeline-info    "#7fefff")

      (underline-err     "#df4f2f")
      (underline-warning "#d4c000")
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
      (info green)

      (link green)
      (link-alt magenta-cooler)
      (name magenta-warmer)
      (keybind magenta-warmer)
      (identifier green-faint)
      (prompt cyan-cooler)

      (bg-region "#45524a")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta-cooler)
      (comment fg-dim)
      (constant green-cooler)
      (fnname magenta-warmer)
      (keyword magenta)
      (preprocessor red-cooler)
      (docstring yellow-faint)
      (string green-warmer)
      (type cyan-warmer)
      (variable cyan-cooler)
      (rx-escape red-cooler) ; compare with `string'
      (rx-construct blue-cooler)

;;;; Accent mappings

      (accent-0 green-warmer)
      (accent-1 magenta-warmer)
      (accent-2 yellow-warmer)
      (accent-3 green-cooler)

;;;; Date mappings

      (date-common magenta-cooler)
      (date-deadline magenta)
      (date-event fg-alt)
      (date-holiday green)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow-cooler)
      (date-weekday magenta-cooler)
      (date-weekend red-cooler)

;;;; Prose mappings

      (prose-code magenta-warmer)
      (prose-done green-cooler)
      (prose-macro red-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula info)
      (prose-tag yellow-faint)
      (prose-todo red-warmer)
      (prose-verbatim cyan-cooler)

;;;; Mail mappings

      (mail-cite-0 green-warmer)
      (mail-cite-1 cyan-cooler)
      (mail-cite-2 red-cooler)
      (mail-cite-3 yellow-cooler)
      (mail-part magenta-cooler)
      (mail-recipient magenta)
      (mail-subject green-cooler)
      (mail-other magenta-warmer)

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

      (bg-term-cyan            cyan)
      (fg-term-cyan            cyan)
      (bg-term-cyan-bright     cyan-cooler)
      (fg-term-cyan-bright     cyan-cooler)

      (bg-term-white           "gray65")
      (fg-term-white           "gray65")
      (bg-term-white-bright    "white")
      (fg-term-white-bright    "white")

;;;; Rainbow mappings

      (rainbow-0 magenta-warmer)
      (rainbow-1 green-warmer)
      (rainbow-2 magenta)
      (rainbow-3 yellow-cooler)
      (rainbow-4 magenta-cooler)
      (rainbow-5 red-cooler)
      (rainbow-6 green)
      (rainbow-7 yellow-warmer)
      (rainbow-8 cyan-cooler))
    "The `ef-rosa' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-rosa-palette-overrides nil
    "Overrides for `ef-rosa-palette'.

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

  (ef-themes-theme ef-rosa ef-rosa-palette ef-rosa-palette-overrides)

  (provide-theme 'ef-rosa))

;;; ef-rosa-theme.el ends here
