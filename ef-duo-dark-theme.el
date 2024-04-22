;;; ef-duo-dark-theme.el --- Legible dark theme with mostly blue and orange colors -*- lexical-binding:t -*-

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
  (deftheme ef-duo-dark
    "Legible dark theme with mostly blue and orange colors."
    :background-mode 'dark
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-duo-dark-palette
    '(
;;; Basic values

      (bg-main     "#070019")
      (fg-main     "#d0d0d0")
      (bg-dim      "#1d1a26")
      (fg-dim      "#857f8f")
      (bg-alt      "#2a2739")
      (fg-alt      "#89afef")

      (bg-active   "#4a4759")
      (bg-inactive "#13101f")

;;; Basic hues for foreground values

      (red             "#ef656a")
      (red-warmer      "#f47360")
      (red-cooler      "#ef798f")
      (red-faint       "#d08f72")
      (green           "#1fa526")
      (green-warmer    "#50a22f")
      (green-cooler    "#00b982")
      (green-faint     "#61a06c")
      (yellow          "#c48702")
      (yellow-warmer   "#d0730f")
      (yellow-cooler   "#df805f")
      (yellow-faint    "#9f8f6a")
      (blue            "#379cf6")
      (blue-warmer     "#6f80ff")
      (blue-cooler     "#029fff")
      (blue-faint      "#8a9fdf")
      (magenta         "#d369af")
      (magenta-warmer  "#e580ea")
      (magenta-cooler  "#af85ff")
      (magenta-faint   "#c57faf")
      (cyan            "#5faaef")
      (cyan-warmer     "#7fafff")
      (cyan-cooler     "#0dafdf")
      (cyan-faint      "#8aa0df")

;;; Basic hues for background values

      (bg-red-intense     "#cd2f30")
      (bg-green-intense   "#407720")
      (bg-yellow-intense  "#8f5040")
      (bg-blue-intense    "#4648d0")
      (bg-magenta-intense "#b04fcf")
      (bg-cyan-intense    "#2270be")

      (bg-red-subtle      "#72002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#603000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#501f72")
      (bg-cyan-subtle     "#004065")

;;; Diffs

      (bg-added          "#002d1f")
      (bg-added-faint    "#001f18")
      (bg-added-refine   "#003b2f")
      (fg-added          "#a0e0a0")

      (bg-changed        "#323200")
      (bg-changed-faint  "#2a2000")
      (bg-changed-refine "#444000")
      (fg-changed        "#efef80")

      (bg-removed        "#3d091f")
      (bg-removed-faint  "#27040f")
      (bg-removed-refine "#5b0f26")
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

      (bg-mode-line       "#352487")
      (fg-mode-line       "#dedeff")
      (bg-completion      "#2f1a5f")
      (bg-hover           "#664f4a")
      (bg-hover-secondary "#264f4a")
      (bg-hl-line         "#301a4f")
      (bg-paren           "#2f608e")
      (bg-err             "#461210") ; check with err
      (bg-warning         "#3a3004") ; check with warning
      (bg-info            "#10350a") ; check with info

      (border        "#545f6f")
      (cursor        "#ef6f11")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff8faf")
      (modeline-warning "#dfcf00")
      (modeline-info    "#00e06f")

      (underline-err     "#df2f2f")
      (underline-warning "#c0b000")
      (underline-info    "#22b022")

      (bg-char-0 "#0050af")
      (bg-char-1 "#7f1f7f")
      (bg-char-2 "#625a00")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err red)
      (warning yellow)
      (info green)

      (link cyan-warmer)
      (link-alt green-cooler)
      (name blue)
      (keybind blue-cooler)
      (identifier red-faint)
      (prompt yellow)

      (bg-region "#042a50")
      (fg-region unspecified)

;;;; Code mappings

      (builtin cyan)
      (comment red-faint)
      (constant blue)
      (fnname cyan-cooler)
      (keyword blue-warmer)
      (preprocessor cyan-warmer)
      (docstring blue-faint)
      (string yellow-cooler)
      (type blue-cooler)
      (variable magenta-cooler)
      (rx-escape magenta-cooler) ; compare with `string'
      (rx-construct blue)

;;;; Accent mappings

      (accent-0 blue-warmer)
      (accent-1 yellow-warmer)
      (accent-2 green-cooler)
      (accent-3 red)

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

      (prose-code yellow-warmer)
      (prose-done green)
      (prose-macro green-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula warning)
      (prose-tag yellow-faint)
      (prose-todo red)
      (prose-verbatim blue-warmer)

;;;; Mail mappings

      (mail-cite-0 cyan)
      (mail-cite-1 yellow-cooler)
      (mail-cite-2 blue-warmer)
      (mail-cite-3 yellow)
      (mail-part blue-faint)
      (mail-recipient blue)
      (mail-subject yellow-warmer)
      (mail-other cyan-warmer)

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

      (bg-term-green           green-warmer)
      (fg-term-green           green-warmer)
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
      (rainbow-1 yellow-warmer)
      (rainbow-2 blue-warmer)
      (rainbow-3 yellow-cooler)
      (rainbow-4 cyan-cooler)
      (rainbow-5 yellow)
      (rainbow-6 blue-cooler)
      (rainbow-7 red-cooler)
      (rainbow-8 green-cooler))
    "The `ef-duo-dark' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-duo-dark-palette-overrides nil
    "Overrides for `ef-duo-dark-palette'.

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

  (ef-themes-theme ef-duo-dark ef-duo-dark-palette ef-duo-dark-palette-overrides)

  (provide-theme 'ef-duo-dark))

;;; ef-duo-dark-theme.el ends here
