;;; ef-cherie-theme.el --- Legible dark theme with warm colors (mostly pink, magenta, gold) -*- lexical-binding:t -*-

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
  (deftheme ef-cherie
    "Legible dark theme with warm colors (mostly pink, magenta, gold)"
    :background-mode 'dark
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-cherie-palette
    '(
;;; Basic values

      (bg-main      "#190a0f")
      (fg-main      "#d3cfcf")
      (bg-dim       "#291f26")
      (fg-dim       "#808898")
      (bg-alt       "#392a2f")
      (fg-alt       "#bf9cdf")

      (bg-active    "#594a4f")
      (bg-inactive  "#1e1216")

;;; Basic hues for foreground values

      (red             "#ff7359")
      (red-warmer      "#ff656f")
      (red-cooler      "#ff78aa")
      (red-faint       "#e47f72")
      (green           "#60b444")
      (green-warmer    "#80b25f")
      (green-cooler    "#60bf88")
      (green-faint     "#61a06c")
      (yellow          "#e5b76f")
      (yellow-warmer   "#ea9955")
      (yellow-cooler   "#f59280")
      (yellow-faint    "#bf9f8f")
      (blue            "#8fa5f6")
      (blue-warmer     "#a897ef")
      (blue-cooler     "#7fa5ff")
      (blue-faint      "#7f9ab4")
      (magenta         "#ef80bf")
      (magenta-warmer  "#f470df")
      (magenta-cooler  "#df7fff")
      (magenta-faint   "#cc9bcf")
      (cyan            "#8fbaef")
      (cyan-warmer     "#9ac0e4")
      (cyan-cooler     "#8fcfdf")
      (cyan-faint      "#aac0cf")

;;; Basic hues for background values

      (bg-red-intense     "#b02930")
      (bg-green-intense   "#2a7140")
      (bg-yellow-intense  "#8f5040")
      (bg-blue-intense    "#4648d0")
      (bg-magenta-intense "#804fd5")
      (bg-cyan-intense    "#2270cf")

      (bg-red-subtle      "#65102a")
      (bg-green-subtle    "#0a422f")
      (bg-yellow-subtle   "#523324")
      (bg-blue-subtle     "#2a3463")
      (bg-magenta-subtle  "#562654")
      (bg-cyan-subtle     "#133d58")

;;; Diffs

      (bg-added          "#00351f")
      (bg-added-faint    "#002410")
      (bg-added-refine   "#034d2f")
      (fg-added          "#a0e0a0")

      (bg-changed        "#363300")
      (bg-changed-faint  "#2a1f00")
      (bg-changed-refine "#4a4a00")
      (fg-changed        "#efef80")

      (bg-removed        "#510c28")
      (bg-removed-faint  "#340a14")
      (bg-removed-refine "#701a35")
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

      (bg-mode-line       "#771a4f")
      (fg-mode-line       "#ffcfdf")
      (bg-completion      "#4a1937")
      (bg-hover           "#303f6f")
      (bg-hover-secondary "#66364f")
      (bg-hl-line         "#401f33")
      (bg-paren           "#3f5f75")
      (bg-err             "#461017") ; check with err
      (bg-warning         "#3a3004") ; check with warning
      (bg-info            "#00352a") ; check with info

      (border        "#695960")
      (cursor        "#ff5aaf")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff9f1f")
      (modeline-warning "#c0bf30")
      (modeline-info    "#6fefaf")

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

      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link magenta-cooler)
      (link-alt yellow)
      (name yellow-cooler)
      (keybind yellow-warmer)
      (identifier magenta-faint)
      (prompt magenta-warmer)

      (bg-region "#232f3f")
      (fg-region unspecified)

;;;; Code mappings

      (builtin blue-warmer)
      (comment yellow-faint)
      (constant red-cooler)
      (fnname yellow-cooler)
      (keyword magenta)
      (preprocessor cyan)
      (docstring magenta-faint)
      (string yellow)
      (type magenta-warmer)
      (variable magenta-cooler)
      (rx-escape cyan-warmer) ; compare with `string'
      (rx-construct red)

;;;; Accent mappings

      (accent-0 magenta-warmer)
      (accent-1 yellow)
      (accent-2 blue-warmer)
      (accent-3 red)

;;;; Date mappings

      (date-common magenta)
      (date-deadline red-warmer)
      (date-deadline-subtle red-faint)
      (date-event fg-alt)
      (date-holiday blue-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow-warmer)
      (date-scheduled-subtle yellow-faint)
      (date-weekday cyan)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code yellow)
      (prose-done green)
      (prose-macro blue-warmer)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula warning)
      (prose-tag yellow-faint)
      (prose-todo red-warmer)
      (prose-verbatim magenta-warmer)

;;;; Mail mappings

      (mail-cite-0 magenta)
      (mail-cite-1 yellow)
      (mail-cite-2 blue-warmer)
      (mail-cite-3 magenta-warmer)
      (mail-part magenta-cooler)
      (mail-recipient yellow-cooler)
      (mail-subject red)
      (mail-other yellow-warmer)

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
      (rainbow-1 yellow)
      (rainbow-2 magenta)
      (rainbow-3 cyan)
      (rainbow-4 yellow-cooler)
      (rainbow-5 blue-warmer)
      (rainbow-6 red-cooler)
      (rainbow-7 cyan-warmer)
      (rainbow-8 magenta-cooler))
    "The `ef-cherie' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-cherie-palette-overrides nil
    "Overrides for `ef-cherie-palette'.

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

  (ef-themes-theme ef-cherie ef-cherie-palette ef-cherie-palette-overrides)

  (provide-theme 'ef-cherie))

;;; ef-cherie-theme.el ends here
