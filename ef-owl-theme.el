;;; ef-owl-theme.el --- Legible dark theme with blue, cyan, magenta and desaturated colors -*- lexical-binding:t -*-

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
  (deftheme ef-owl
    "Legible dark theme with blue, cyan, magenta and desaturated colors."
    :background-mode 'dark
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-owl-palette
    '(
;;; Basic values

      (bg-main     "#292c2f")
      (fg-main     "#d0d0d0")
      (bg-dim      "#373b3d")
      (fg-dim      "#857f8f")
      (bg-alt      "#40474b")
      (fg-alt      "#aab9af")

      (bg-active   "#60676b")
      (bg-inactive "#333539")

;;; Basic hues for foreground values

      (red             "#d67869")
      (red-warmer      "#df885f")
      (red-cooler      "#e4959f")
      (red-faint       "#eba0af")
      (green           "#70bb70")
      (green-warmer    "#98c06f")
      (green-cooler    "#60bd90")
      (green-faint     "#9fb3a7")
      (yellow          "#c09f6f")
      (yellow-warmer   "#d1a45f")
      (yellow-cooler   "#cf9f90")
      (yellow-faint    "#cbb0a0")
      (blue            "#80a4e0")
      (blue-warmer     "#a0a0ef")
      (blue-cooler     "#72aff0")
      (blue-faint      "#aab2df")
      (magenta         "#e5a0ea")
      (magenta-warmer  "#d389af")
      (magenta-cooler  "#cfa0e8")
      (magenta-faint   "#e5bbd7")
      (cyan            "#8fb8ea")
      (cyan-warmer     "#99bfd0")
      (cyan-cooler     "#7ac0b9")
      (cyan-faint      "#a2c5d8")

;;; Basic hues for background values

      (bg-red-intense     "#a02f50")
      (bg-green-intense   "#30682f")
      (bg-yellow-intense  "#8f665f")
      (bg-blue-intense    "#4f509f")
      (bg-magenta-intense "#885997")
      (bg-cyan-intense    "#4f70aa")

      (bg-red-subtle      "#682a33")
      (bg-green-subtle    "#2f502f")
      (bg-yellow-subtle   "#5a4020")
      (bg-blue-subtle     "#3a3980")
      (bg-magenta-subtle  "#553977")
      (bg-cyan-subtle     "#22526a")

;;; Diffs

      (bg-added          "#304a3f")
      (bg-added-faint    "#1a3630")
      (bg-added-refine   "#2f6757")
      (fg-added          "#a0d0d0")

      (bg-changed        "#51512f")
      (bg-changed-faint  "#40332f")
      (bg-changed-refine "#64651f")
      (fg-changed        "#dada90")

      (bg-removed        "#5a3142")
      (bg-removed-faint  "#4a2034")
      (bg-removed-refine "#782a4a")
      (fg-removed        "#f0bfcf")

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

      (bg-mode-line       "#5b637e")
      (fg-mode-line       "#dadfe5")
      (bg-completion      "#354864")
      (bg-hover           "#8f7a7f")
      (bg-hover-secondary "#415960")
      (bg-hl-line         "#344255")
      (bg-paren           "#706069")
      (bg-err             "#4f231f") ; check with err
      (bg-warning         "#3f3c2f") ; check with warning
      (bg-info            "#104032") ; check with info

      (border        "#4f5f66")
      (cursor        "#afe6ef")
      (fg-intense    "#ffffff")

      (modeline-err     "#ffd2ff")
      (modeline-warning "#e4e947")
      (modeline-info    "#8defff")

      (underline-err     "#df4f2f")
      (underline-warning "#d4c000")
      (underline-info    "#22b022")

      (bg-char-0 "#0050af")
      (bg-char-1 "#7f1f7f")
      (bg-char-2 "#625a00")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link cyan-warmer)
      (link-alt yellow-cooler)
      (name blue)
      (keybind green-cooler)
      (identifier magenta-faint)
      (prompt blue-cooler)

      (bg-region "#404f66")
      (fg-region unspecified)

;;;; Code mappings

      (builtin blue)
      (comment blue-faint)
      (constant yellow-cooler)
      (fnname green-cooler)
      (keyword cyan-warmer)
      (preprocessor green-warmer)
      (docstring green-faint)
      (string cyan-cooler)
      (type magenta-cooler)
      (variable blue-warmer)
      (rx-escape yellow) ; compare with `string'
      (rx-construct red)

;;;; Accent mappings

      (accent-0 cyan-cooler)
      (accent-1 yellow-cooler)
      (accent-2 red)
      (accent-3 green)

;;;; Date mappings

      (date-common cyan-cooler)
      (date-deadline red)
      (date-event fg-alt)
      (date-holiday red)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-weekday cyan-cooler)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code green-warmer)
      (prose-done green)
      (prose-macro green-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula err)
      (prose-tag cyan-faint)
      (prose-todo red-warmer)
      (prose-verbatim blue)

;;;; Mail mappings

      (mail-cite-0 cyan)
      (mail-cite-1 green-cooler)
      (mail-cite-2 blue-warmer)
      (mail-cite-3 yellow-cooler)
      (mail-part magenta)
      (mail-recipient cyan-warmer)
      (mail-subject blue-cooler)
      (mail-other cyan-cooler)

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
      (bg-term-yellow-bright   yellow-cooler)
      (fg-term-yellow-bright   yellow-cooler)

      (bg-term-blue            blue)
      (fg-term-blue            blue)
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

      (rainbow-0 green-cooler)
      (rainbow-1 blue)
      (rainbow-2 cyan-cooler)
      (rainbow-3 magenta-cooler)
      (rainbow-4 yellow-cooler)
      (rainbow-5 green-warmer)
      (rainbow-6 magenta-warmer)
      (rainbow-7 cyan-warmer)
      (rainbow-8 yellow))
    "The `ef-owl' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-owl-palette-overrides nil
    "Overrides for `ef-owl-palette'.

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

  (ef-themes-theme ef-owl ef-owl-palette ef-owl-palette-overrides)

  (provide-theme 'ef-owl))

;;; ef-owl-theme.el ends here
