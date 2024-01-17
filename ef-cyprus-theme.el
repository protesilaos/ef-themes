;;; ef-cyprus-theme.el --- Legible light theme with green, yellow, teal, red colors -*- lexical-binding:t -*-

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
  (deftheme ef-cyprus
    "Legible light theme with green, yellow, teal, red colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-cyprus-palette
    '(
;;; Basic values

      (bg-main     "#fcf7ef")
      (fg-main     "#242521")
      (bg-dim      "#f0ece0")
      (fg-dim      "#59786f")
      (bg-alt      "#e5e3d8")
      (fg-alt      "#7f475a")

      (bg-active   "#c5c3b8")
      (bg-inactive "#f8f3ea")

;;; Basic hues for foreground values

      (red             "#9f0d0f")
      (red-warmer      "#dd0020")
      (red-cooler      "#ca3400")
      (red-faint       "#b05350")
      (green           "#006f00")
      (green-warmer    "#557400")
      (green-cooler    "#00824f")
      (green-faint     "#3a6f48")
      (yellow          "#a7601f")
      (yellow-warmer   "#bf4400")
      (yellow-cooler   "#a2604f")
      (yellow-faint    "#8f6f4a")
      (blue            "#375cc6")
      (blue-warmer     "#444fcf")
      (blue-cooler     "#065fbf")
      (blue-faint      "#4a659f")
      (magenta         "#9a456f")
      (magenta-warmer  "#bf456a")
      (magenta-cooler  "#8448aa")
      (magenta-faint   "#804f60")
      (cyan            "#1f70af")
      (cyan-warmer     "#3f6faf")
      (cyan-cooler     "#007a9f")
      (cyan-faint      "#4f677f")

;;; Basic hues for background values

      (bg-red-intense     "#ff8f88")
      (bg-green-intense   "#96df80")
      (bg-yellow-intense  "#efbf00")
      (bg-blue-intense    "#cfceff")
      (bg-magenta-intense "#df9fff")
      (bg-cyan-intense    "#88cfd0")

      (bg-red-subtle      "#ffc6bf")
      (bg-green-subtle    "#c4f2af")
      (bg-yellow-subtle   "#f0f07f")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#fad3ff")
      (bg-cyan-subtle     "#bfefff")

;;; Diffs

      (bg-added          "#c1f2d1")
      (bg-added-faint    "#d8f8e1")
      (bg-added-refine   "#b1e4c1")
      (fg-added          "#005000")

      (bg-changed        "#ffdfb9")
      (bg-changed-faint  "#ffefcb")
      (bg-changed-refine "#ffcfa0")
      (fg-changed        "#553d00")

      (bg-removed        "#ffd3d4")
      (bg-removed-faint  "#ffe6e1")
      (bg-removed-refine "#f6c0c9")
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

      (bg-mode-line       "#c0df6f")
      (fg-mode-line       "#142010")
      (bg-completion      "#e6e4bf")
      (bg-hover           "#efc26f")
      (bg-hover-secondary "#afc0f0")
      (bg-hl-line         "#f0e0d4")
      (bg-paren           "#9fcfdf")
      (bg-err             "#ffd4bf") ; check with err
      (bg-warning         "#f0e8ba") ; check with warning
      (bg-info            "#d0efbf") ; check with info

      (border        "#c4c0b6")
      (cursor        "#007f00")
      (fg-intense    "#000000")

      (modeline-err     "#950f0f")
      (modeline-warning "#7f00af")
      (modeline-info    "#0040af")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af5f")

      (bg-char-0 "#7feaff")
      (bg-char-1 "#ffaaff")
      (bg-char-2 "#dff000")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err red-warmer)
      (warning yellow)
      (info green)

      (link yellow)
      (link-alt cyan)
      (name green-warmer)
      (keybind red)
      (identifier green-faint)
      (prompt green)

      (bg-region "#e0e7e5")
      (fg-region unspecified)

;;;; Code mappings

      (builtin green-warmer)
      (comment yellow-faint)
      (constant green-cooler)
      (fnname yellow)
      (keyword green)
      (preprocessor yellow-cooler)
      (docstring cyan-faint)
      (string red-cooler)
      (type blue-warmer)
      (variable cyan-cooler)
      (rx-escape magenta-cooler) ; compare with `string'
      (rx-construct cyan-cooler)

;;;; Accent mappings

      (accent-0 green)
      (accent-1 red-cooler)
      (accent-2 cyan-cooler)
      (accent-3 yellow)

;;;; Date mappings

      (date-common yellow-cooler)
      (date-deadline red-cooler)
      (date-event fg-alt)
      (date-holiday blue-cooler)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-weekday cyan)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code red-cooler)
      (prose-done green)
      (prose-macro cyan-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula info)
      (prose-tag yellow-faint)
      (prose-todo red-warmer)
      (prose-verbatim green)

;;;; Mail mappings

      (mail-cite-0 green-warmer)
      (mail-cite-1 yellow-cooler)
      (mail-cite-2 cyan)
      (mail-cite-3 green-cooler)
      (mail-part blue-faint)
      (mail-recipient green-warmer)
      (mail-subject yellow-warmer)
      (mail-other green)

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

;;;; Rainbow mappings

      (rainbow-0 yellow)
      (rainbow-1 green-warmer)
      (rainbow-2 yellow-warmer)
      (rainbow-3 cyan-warmer)
      (rainbow-4 green-cooler)
      (rainbow-5 magenta)
      (rainbow-6 yellow-cooler)
      (rainbow-7 cyan-cooler)
      (rainbow-8 red))
    "The `ef-cyprus' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-cyprus-palette-overrides nil
    "Overrides for `ef-cyprus-palette'.

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

  (ef-themes-theme ef-cyprus ef-cyprus-palette ef-cyprus-palette-overrides)

  (provide-theme 'ef-cyprus))

;;; ef-cyprus-theme.el ends here
