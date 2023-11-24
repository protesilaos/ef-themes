;;; ef-melissa-light-theme.el --- Legible light theme with warm colors (yellow, red, green, cyan) -*- lexical-binding:t -*-

;; Copyright (C) 2022-2023  Free Software Foundation, Inc.

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
  (deftheme ef-melissa-light
    "Legible light theme with warm colors (yellow, red, green, cyan)."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-melissa-light-palette
    '(
;;; Basic values

      (bg-main     "#fff6d8")
      (fg-main     "#484431")
      (bg-dim      "#f5e9cb")
      (fg-dim      "#68708a")
      (bg-alt      "#e7d7c6")
      (fg-alt      "#66713a")

      (bg-active   "#c7b7a6")
      (bg-inactive "#f9efd4")

;;; Basic hues for foreground values

      (red             "#ba2d2f")
      (red-warmer      "#b21f00")
      (red-cooler      "#c03f3f")
      (red-faint       "#b05350")
      (green           "#007a0a")
      (green-warmer    "#5a7400")
      (green-cooler    "#008250")
      (green-faint     "#61756c")
      (yellow          "#a46110")
      (yellow-warmer   "#ba5205")
      (yellow-cooler   "#946830")
      (yellow-faint    "#92616a")
      (blue            "#375cc6")
      (blue-warmer     "#5f5fdf")
      (blue-cooler     "#265fbf")
      (blue-faint      "#4a659f")
      (magenta         "#aa3e74")
      (magenta-warmer  "#b02f80")
      (magenta-cooler  "#6448ca")
      (magenta-faint   "#905ea0")
      (cyan            "#3f60af")
      (cyan-warmer     "#4060a0")
      (cyan-cooler     "#0f708a")
      (cyan-faint      "#4f6f8f")

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

      (bg-added          "#d7ecb0")
      (bg-added-faint    "#eef3c2")
      (bg-added-refine   "#c9dda0")
      (fg-added          "#005000")

      (bg-changed        "#f5e690")
      (bg-changed-faint  "#f5edaf")
      (bg-changed-refine "#edd482")
      (fg-changed        "#553d00")

      (bg-removed        "#f8d0b6")
      (bg-removed-faint  "#f5deb0")
      (bg-removed-refine "#f0bba9")
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

      (bg-mode-line       "#f3cf72")
      (fg-mode-line       "#403328")
      (bg-completion      "#ffe2a8")
      (bg-hover           "#deb4f0")
      (bg-hover-secondary "#c4d47a")
      (bg-hl-line         "#fae7b0")
      (bg-paren           "#afcf8f")
      (bg-err             "#ffd4b5") ; check with err
      (bg-warning         "#ffe89f") ; check with warning
      (bg-info            "#ddf5ac") ; check with info

      (border        "#c5baa6")
      (cursor        "#a07f00")
      (fg-intense    "#000000")

      (modeline-err     "#900000")
      (modeline-warning "#66008f")
      (modeline-info    "#1f409f")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af52")

      (bg-char-0 "#7feaff")
      (bg-char-1 "#f0a0f0")
      (bg-char-2 "#d0e000")

;;; Mappings

;;;; General mappings

      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link yellow)
      (link-alt magenta-cooler)
      (name yellow-cooler)
      (keybind yellow-warmer)
      (identifier red-faint)
      (prompt green-warmer)

      (bg-region "#f0d4d8")
      (fg-region unspecified)

;;;; Code mappings

      (builtin yellow-cooler)
      (comment yellow-faint)
      (constant cyan)
      (fnname green-warmer)
      (keyword yellow)
      (preprocessor yellow-warmer)
      (docstring red-faint)
      (string red-warmer)
      (type green-cooler)
      (variable cyan-cooler)
      (rx-escape green) ; compare with `string'
      (rx-construct magenta-cooler)

;;;; Accent mappings

      (accent-0 yellow-warmer)
      (accent-1 green-cooler)
      (accent-2 red)
      (accent-3 magenta-cooler)

;;;; Date mappings

      (date-common green-warmer)
      (date-deadline red)
      (date-event fg-alt)
      (date-holiday magenta-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-weekday green-warmer)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code yellow-warmer)
      (prose-done green)
      (prose-macro green-warmer)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula err)
      (prose-tag yellow-faint)
      (prose-todo red-warmer)
      (prose-verbatim red)

;;;; Mail mappings

      (mail-cite-0 yellow-warmer)
      (mail-cite-1 cyan-warmer)
      (mail-cite-2 red-cooler)
      (mail-cite-3 green-cooler)
      (mail-part cyan-cooler)
      (mail-recipient yellow)
      (mail-subject green-warmer)
      (mail-other yellow-cooler)

;;;; Space mappings

      (bg-space unspecified)
      (fg-space border)
      (bg-space-err bg-yellow-intense)

;;;; Tab mappings

      (bg-tab-bar      bg-alt)
      (bg-tab-current  bg-main)
      (bg-tab-other    bg-active)

;;;; Rainbow mappings

      (rainbow-0 yellow-warmer)
      (rainbow-1 yellow)
      (rainbow-2 green-warmer)
      (rainbow-3 red-cooler)
      (rainbow-4 cyan-warmer)
      (rainbow-5 magenta)
      (rainbow-6 green-cooler)
      (rainbow-7 magenta-warmer)
      (rainbow-8 cyan-cooler))
    "The `ef-melissa-light' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-melissa-light-palette-overrides nil
    "Overrides for `ef-melissa-light-palette'.

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

  (ef-themes-theme ef-melissa-light ef-melissa-light-palette ef-melissa-light-palette-overrides)

  (provide-theme 'ef-melissa-light))

;;; ef-melissa-light-theme.el ends here
