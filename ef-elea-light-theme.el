;;; ef-elea-light-theme.el --- Legible light theme with brown, magenta, and green colors -*- lexical-binding:t -*-

;; Copyright (C) 2023  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Ef-Themes Development <~protesilaos/ef-themes@lists.sr.ht>
;; URL: https://git.sr.ht/~protesilaos/ef-themes
;; Mailing-List: https://lists.sr.ht/~protesilaos/ef-themes
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
  (deftheme ef-elea-light
    "Legible light theme with brown, magenta, and green colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-elea-light-palette
    '(
;;; Basic values

      (bg-main     "#edf5e2")
      (fg-main     "#221321")
      (bg-dim      "#e3e9d6")
      (fg-dim      "#676470")
      (bg-alt      "#d0d7ca")
      (fg-alt      "#5f5f1f")

      (bg-active   "#b0b7aa")
      (bg-inactive "#e8eddc")

;;; Basic hues for foreground values

      (red             "#c3303a")
      (red-warmer      "#d00000")
      (red-cooler      "#b02440")
      (red-faint       "#894852")
      (green           "#00601f")
      (green-warmer    "#355500")
      (green-cooler    "#007047")
      (green-faint     "#306630")
      (yellow          "#9a501f")
      (yellow-warmer   "#b04300")
      (yellow-cooler   "#88541f")
      (yellow-faint    "#7f4f4a")
      (blue            "#375cc6")
      (blue-warmer     "#444fcf")
      (blue-cooler     "#162f8f")
      (blue-faint      "#3a5099")
      (magenta         "#80308f")
      (magenta-warmer  "#9f356a")
      (magenta-cooler  "#5032aa")
      (magenta-faint   "#6a4a9f")
      (cyan            "#1f70af")
      (cyan-warmer     "#3f6faf")
      (cyan-cooler     "#00677f")
      (cyan-faint      "#4f677f")

;;; Basic hues for background values

      (bg-red-intense     "#ff8f88")
      (bg-green-intense   "#96df80")
      (bg-yellow-intense  "#efbf00")
      (bg-blue-intense    "#cfceff")
      (bg-magenta-intense "#df9fff")
      (bg-cyan-intense    "#88cfd0")

      (bg-red-subtle      "#f0c6bf")
      (bg-green-subtle    "#c4edaf")
      (bg-yellow-subtle   "#e4e488")
      (bg-blue-subtle     "#ccd7f7")
      (bg-magenta-subtle  "#edd3f2")
      (bg-cyan-subtle     "#b2e6f0")

;;; Diffs

      (bg-added          "#c7e8ba")
      (bg-added-faint    "#def0cb")
      (bg-added-refine   "#bed9b0")
      (fg-added          "#005000")

      (bg-changed        "#f5e8b0")
      (bg-changed-faint  "#f5f2bf")
      (bg-changed-refine "#f0db9a")
      (fg-changed        "#553d00")

      (bg-removed        "#f2d0c6")
      (bg-removed-faint  "#f0e0c0")
      (bg-removed-refine "#efbfbd")
      (fg-removed        "#8f1313")

;;; Graphs

      (bg-graph-red-0     "#ef7969")
      (bg-graph-red-1     "#ffaab4")
      (bg-graph-green-0   "#2fe029")
      (bg-graph-green-1   "#75ef30")
      (bg-graph-yellow-0  "#ffcf00")
      (bg-graph-yellow-1  "#f9ff00")
      (bg-graph-blue-0    "#7f90ff")
      (bg-graph-blue-1    "#9fc6ff")
      (bg-graph-magenta-0 "#e07fff")
      (bg-graph-magenta-1 "#fad0ff")
      (bg-graph-cyan-0    "#70d3f0")
      (bg-graph-cyan-1    "#afefff")

;;; Special hues

      (bg-mode-line       "#a5c67f")
      (fg-mode-line       "#142810")
      (bg-completion      "#c2eaba")
      (bg-hover           "#dfbac0")
      (bg-hover-secondary "#b5dfbf")
      (bg-hl-line         "#d0e7c4")
      (bg-paren           "#8ad3a2")
      (bg-err             "#f2d5b5") ; check with err
      (bg-warning         "#e8e8aa") ; check with warning
      (bg-info            "#b4efc6") ; check with info

      (border        "#a5aaaf")
      (cursor        "#770080")
      (fg-intense    "#000000")

      (modeline-err     "#950f0f")
      (modeline-warning "#7000af")
      (modeline-info    "#0040af")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af5f")

      (bg-char-0 "#7feaff")
      (bg-char-1 "#f0a0f0")
      (bg-char-2 "#d0e000")

;;; Mappings

;;;; General mappings

      (err red-warmer)
      (warning yellow-warmer)
      (info green-cooler)

      (link green)
      (link-alt magenta)
      (name green-warmer)
      (keybind magenta)
      (identifier magenta-faint)
      (prompt magenta-warmer)

      (bg-region "#d9d2ef")
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
      (type blue-cooler)
      (variable magenta)
      (rx-escape magenta-cooler) ; compare with `string'
      (rx-construct red)

;;;; Accent mappings

      (accent-0 green-cooler)
      (accent-1 magenta-warmer)
      (accent-2 magenta-cooler)
      (accent-3 cyan)

;;;; Date mappings

      (date-common green-cooler)
      (date-deadline red)
      (date-event fg-alt)
      (date-holiday magenta-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-weekday cyan-cooler)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code magenta)
      (prose-done green-cooler)
      (prose-macro magenta-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-tag cyan-faint)
      (prose-todo red)
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

;;;; Space mappings

      (bg-space unspecified)
      (fg-space border)
      (bg-space-err bg-yellow-intense)

;;;; Tab mappings

      (bg-tab-bar      bg-alt)
      (bg-tab-current  bg-main)
      (bg-tab-other    bg-active)

;;;; Rainbow mappings

      (rainbow-0 green-warmer)
      (rainbow-1 red-faint)
      (rainbow-2 green-faint)
      (rainbow-3 cyan-cooler)
      (rainbow-4 magenta-cooler)
      (rainbow-5 magenta-warmer)
      (rainbow-6 green)
      (rainbow-7 yellow)
      (rainbow-8 magenta-faint))
    "The `ef-elea-light' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-elea-light-palette-overrides nil
    "Overrides for `ef-elea-light-palette'.

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

  (ef-themes-theme ef-elea-light ef-elea-light-palette ef-elea-light-palette-overrides)

  (provide-theme 'ef-elea-light))

;;; ef-elea-light-theme.el ends here
