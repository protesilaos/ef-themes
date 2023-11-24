;;; ef-trio-light-theme.el --- Legible light theme with magenta, blue, and teal colors -*- lexical-binding:t -*-

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
  (deftheme ef-trio-light
    "Legible light theme with magenta, blue, and teal colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-trio-light-palette
    '(
;;; Basic values

      (bg-main     "#f8f5ff")
      (fg-main     "#4f3363")
      (bg-dim      "#ebe7f1")
      (fg-dim      "#786e74")
      (bg-alt      "#e3e0e9")
      (fg-alt      "#3f7668")

      (bg-active   "#c3c0c9")
      (bg-inactive "#efeef7")

;;; Basic hues for foreground values

      (red             "#c3303a")
      (red-warmer      "#d03033")
      (red-cooler      "#c01f5f")
      (red-faint       "#a24568")
      (green           "#057800")
      (green-warmer    "#4f7d0f")
      (green-cooler    "#007f6f")
      (green-faint     "#41754c")
      (yellow          "#a45f22")
      (yellow-warmer   "#b8532f")
      (yellow-cooler   "#b65050")
      (yellow-faint    "#a05b5f")
      (blue            "#375cd6")
      (blue-warmer     "#5165e4")
      (blue-cooler     "#065fbf")
      (blue-faint      "#6060d0")
      (magenta         "#ad45ba")
      (magenta-warmer  "#c035aa")
      (magenta-cooler  "#705ae3")
      (magenta-faint   "#804fb0")
      (cyan            "#1f6fbf")
      (cyan-warmer     "#3f6faf")
      (cyan-cooler     "#0f7a9d")
      (cyan-faint      "#5f60bf")

;;; Basic hues for background values

      (bg-red-intense     "#ff7f88")
      (bg-green-intense   "#86df80")
      (bg-yellow-intense  "#ffc200")
      (bg-blue-intense    "#cbcfff")
      (bg-magenta-intense "#df8fff")
      (bg-cyan-intense    "#88ccff")

      (bg-red-subtle      "#ffc3bf")
      (bg-green-subtle    "#b9f2c6")
      (bg-yellow-subtle   "#fff576")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#ffcdff")
      (bg-cyan-subtle     "#bfeaff")

;;; Diffs

      (bg-added          "#caf4da")
      (bg-added-faint    "#dff6ea")
      (bg-added-refine   "#bae9cf")
      (fg-added          "#005000")

      (bg-changed        "#ffdfb9")
      (bg-changed-faint  "#ffefcb")
      (bg-changed-refine "#ffcfa0")
      (fg-changed        "#553d00")

      (bg-removed        "#ffcee0")
      (bg-removed-faint  "#ffdfe6")
      (bg-removed-refine "#f5b6c8")
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

      (bg-mode-line       "#ddb4ff")
      (fg-mode-line       "#241f48")
      (bg-completion      "#f4cfff")
      (bg-hover           "#aaeccf")
      (bg-hover-secondary "#b4cfff")
      (bg-hl-line         "#cfe6ff")
      (bg-paren           "#dfadaf")
      (bg-err             "#ffdfe6") ; check with err
      (bg-warning         "#ffe5bf") ; check with warning
      (bg-info            "#d0efdf") ; check with info

      (border        "#c6bac5")
      (cursor        "#4f45ff")
      (fg-intense    "#000000")

      (modeline-err     "#980000")
      (modeline-warning "#5f4400")
      (modeline-info    "#1042af")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af52")

      (bg-char-0 "#7feaff")
      (bg-char-1 "#ffaaff")
      (bg-char-2 "#dff000")

;;; Mappings

;;;; General mappings

      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link cyan)
      (link-alt green-warmer)
      (name blue)
      (keybind magenta-warmer)
      (identifier red-faint)
      (prompt blue-cooler)

      (bg-region "#eed0ff")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta-cooler)
      (comment yellow-faint)
      (constant magenta-warmer)
      (fnname blue-warmer)
      (keyword magenta)
      (preprocessor red-cooler)
      (docstring magenta-faint)
      (string green-cooler)
      (type cyan-cooler)
      (variable cyan-warmer)
      (rx-escape blue-warmer) ; compare with `string'
      (rx-construct red)

;;;; Accent mappings

      (accent-0 magenta-warmer)
      (accent-1 green-cooler)
      (accent-2 blue-warmer)
      (accent-3 yellow)

;;;; Date mappings

      (date-common cyan-cooler)
      (date-deadline red-warmer)
      (date-event fg-alt)
      (date-holiday magenta-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-weekday cyan)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code green-cooler)
      (prose-done green)
      (prose-macro blue-warmer)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula err)
      (prose-tag magenta-faint)
      (prose-todo red-warmer)
      (prose-verbatim magenta-warmer)

;;;; Mail mappings

      (mail-cite-0 blue-warmer)
      (mail-cite-1 magenta-warmer)
      (mail-cite-2 cyan-cooler)
      (mail-cite-3 magenta-cooler)
      (mail-part cyan-warmer)
      (mail-recipient blue)
      (mail-subject magenta)
      (mail-other cyan)

;;;; Space mappings

      (bg-space unspecified)
      (fg-space border)
      (bg-space-err bg-yellow-intense)

;;;; Tab mappings

      (bg-tab-bar      bg-alt)
      (bg-tab-current  bg-main)
      (bg-tab-other    bg-active)

;;;; Rainbow mappings

      (rainbow-0 magenta-warmer)
      (rainbow-1 blue-warmer)
      (rainbow-2 green-cooler)
      (rainbow-3 magenta)
      (rainbow-4 cyan)
      (rainbow-5 green-warmer)
      (rainbow-6 magenta-cooler)
      (rainbow-7 cyan-warmer)
      (rainbow-8 yellow-cooler))
    "The `ef-trio-light' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-trio-light-palette-overrides nil
    "Overrides for `ef-trio-light-palette'.

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

  (ef-themes-theme ef-trio-light ef-trio-light-palette ef-trio-light-palette-overrides)

  (provide-theme 'ef-trio-light))

;;; ef-trio-light-theme.el ends here
