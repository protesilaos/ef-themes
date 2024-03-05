;;; ef-maris-dark-theme.el --- Legible dark theme with blue, cyan, and green colors -*- lexical-binding:t -*-

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
  (deftheme ef-maris-dark
    "Legible dark theme with blue, cyan, and green colors."
    :background-mode 'dark
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-maris-dark-palette
    '(
;;; Basic values

      (bg-main      "#131c2b")
      (fg-main      "#eaedef")
      (bg-dim       "#1d2c39")
      (fg-dim       "#969faf")
      (bg-alt       "#2a3644")
      (fg-alt       "#90a0dc")

      (bg-active    "#4a5664")
      (bg-inactive  "#1a2331")

;;; Basic hues for foreground values

      (red             "#ff6f6f")
      (red-warmer      "#ff7a5f")
      (red-cooler      "#ff7788")
      (red-faint       "#eaa4a4")
      (green           "#41bf4f")
      (green-warmer    "#7fce5f")
      (green-cooler    "#30c489")
      (green-faint     "#a9c99f")
      (yellow          "#d0d24f")
      (yellow-warmer   "#f0c060")
      (yellow-cooler   "#cab27f")
      (yellow-faint    "#cac89f")
      (blue            "#57b0ff")
      (blue-warmer     "#70a0ff")
      (blue-cooler     "#12b4ff")
      (blue-faint      "#9acfff")
      (magenta         "#f59acf")
      (magenta-warmer  "#fa90ea")
      (magenta-cooler  "#cf90ff")
      (magenta-faint   "#d4aaf0")
      (cyan            "#2fd0db")
      (cyan-warmer     "#7fcfdf")
      (cyan-cooler     "#65d5a8")
      (cyan-faint      "#99bfcf")

;;; Basic hues for background values

      (bg-red-intense     "#bd1f30")
      (bg-green-intense   "#107840")
      (bg-yellow-intense  "#847020")
      (bg-blue-intense    "#2f5f9f")
      (bg-magenta-intense "#b05fcf")
      (bg-cyan-intense    "#0280b9")

      (bg-red-subtle      "#6a102a")
      (bg-green-subtle    "#00522a")
      (bg-yellow-subtle   "#5a4000")
      (bg-blue-subtle     "#243788")
      (bg-magenta-subtle  "#422e6b")
      (bg-cyan-subtle     "#005065")

;;; Diffs

      (bg-added          "#20493f")
      (bg-added-faint    "#163530")
      (bg-added-refine   "#136244")
      (fg-added          "#a0e0a0")

      (bg-changed        "#51512f")
      (bg-changed-faint  "#40332f")
      (bg-changed-refine "#61621f")
      (fg-changed        "#dada90")

      (bg-removed        "#5e242f")
      (bg-removed-faint  "#4a202d")
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

      (bg-mode-line       "#2f527b")
      (fg-mode-line       "#ecf0ff")
      (bg-completion      "#204358")
      (bg-hover           "#684d54")
      (bg-hover-secondary "#49516a")
      (bg-hl-line         "#243242")
      (bg-paren           "#6c5d54")
      (bg-err             "#551327") ; check with err
      (bg-warning         "#403f22") ; check with warning
      (bg-info            "#104324") ; check with info

      (border        "#595a63")
      (cursor        "#8fdfff")
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

      (link blue)
      (link-alt magenta-cooler)
      (name blue)
      (keybind blue-cooler)
      (identifier magenta-faint)
      (prompt blue-warmer)

      (bg-region "#183c65")
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
      (accent-1 green-warmer)
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

      (mail-cite-0 cyan-cooler)
      (mail-cite-1 magenta)
      (mail-cite-2 blue-faint)
      (mail-cite-3 yellow-cooler)
      (mail-part cyan)
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

;;;; Terminal mappings

      (bg-term-black           "black")
      (fg-term-black           "black")
      (bg-term-black-bright    "gray35")
      (fg-term-black-bright    "gray35")

      (bg-term-red             red)
      (fg-term-red             red)
      (bg-term-red-bright      red-cooler)
      (fg-term-red-bright      red-cooler)

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

      (rainbow-0 green-cooler)
      (rainbow-1 blue-warmer)
      (rainbow-2 green-warmer)
      (rainbow-3 cyan)
      (rainbow-4 magenta-cooler)
      (rainbow-5 blue-cooler)
      (rainbow-6 magenta)
      (rainbow-7 cyan-cooler)
      (rainbow-8 yellow-cooler))
    "The `ef-maris-dark' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-maris-dark-palette-overrides nil
    "Overrides for `ef-maris-dark-palette'.

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

  (ef-themes-theme ef-maris-dark ef-maris-dark-palette ef-maris-dark-palette-overrides)

  (provide-theme 'ef-maris-dark))

;;; ef-maris-dark-theme.el ends here
