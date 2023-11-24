;;; ef-kassio-theme.el --- Legible light theme with blue, red, magenta, and earthly colors -*- lexical-binding:t -*-

;; Copyright (C) 2022-2023  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Ef-Themes Development <~protesilaos/ef-themes@lists.sr.ht>
;; URL: https://git.sr.ht/~protesilaos/ef-themes
;; Mailing-List: https://lists.sr.ht/~protesilaos/ef-themes
;; Keywords: faces, theme, accessibility

;; This file is part of GNU Emacs.

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
  (deftheme ef-kassio
    "Legible light theme with blue, red, magenta, and earthly colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-kassio-palette
    '(
;;; Basic values

      (bg-main     "#fff7f7")
      (fg-main     "#201f36")
      (bg-dim      "#efe7e7")
      (fg-dim      "#776f79")
      (bg-alt      "#e0dbdb")
      (fg-alt      "#af4988")

      (bg-active   "#c0bbbb")
      (bg-inactive "#f9eff3")

;;; Basic hues for foreground values

      (red             "#b00234")
      (red-warmer      "#e00033")
      (red-cooler      "#d5305f")
      (red-faint       "#af3f5f")
      (green           "#217a3c")
      (green-warmer    "#4a7d00")
      (green-cooler    "#008358")
      (green-faint     "#61756c")
      (yellow          "#9a6012")
      (yellow-warmer   "#b6530f")
      (yellow-cooler   "#a04646")
      (yellow-faint    "#a65d6a")
      (blue            "#3c3bbe")
      (blue-warmer     "#4250ef")
      (blue-cooler     "#065fff")
      (blue-faint      "#6060d0")
      (magenta         "#a01f64")
      (magenta-warmer  "#9f248a")
      (magenta-cooler  "#7022bf")
      (magenta-faint   "#954f90")
      (cyan            "#2f5f9f")
      (cyan-warmer     "#3f6faf")
      (cyan-cooler     "#1077ab")
      (cyan-faint      "#506fa0")

;;; Basic hues for background values

      (bg-red-intense     "#ff8f88")
      (bg-green-intense   "#8adf80")
      (bg-yellow-intense  "#fac200")
      (bg-blue-intense    "#cbcfff")
      (bg-magenta-intense "#df8fff")
      (bg-cyan-intense    "#88c8ff")

      (bg-red-subtle      "#ffcfbf")
      (bg-green-subtle    "#b3fabf")
      (bg-yellow-subtle   "#fff576")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#ffddff")
      (bg-cyan-subtle     "#bfefff")

;;; Diffs

      (bg-added          "#c2efcf")
      (bg-added-faint    "#e0f3e0")
      (bg-added-refine   "#bae0c8")
      (fg-added          "#005000")

      (bg-changed        "#ffe5b9")
      (bg-changed-faint  "#ffefc5")
      (bg-changed-refine "#ffd09f")
      (fg-changed        "#553d00")

      (bg-removed        "#ffcfda")
      (bg-removed-faint  "#ffe3e3")
      (bg-removed-refine "#ffb9c9")
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

      (bg-mode-line       "#e0bfba")
      (fg-mode-line       "#151515")
      (bg-completion      "#f2d5c9")
      (bg-hover           "#c0d0ff")
      (bg-hover-secondary "#efd5ff")
      (bg-hl-line         "#f2e5d9")
      (bg-paren           "#b0dffa")
      (bg-err             "#ffdde5") ; check with err
      (bg-warning         "#ffe0aa") ; check with warning
      (bg-info            "#ddf5cc") ; check with info

      (border        "#bab7bc")
      (cursor        "#d06f30")
      (fg-intense    "#000000")

      (modeline-err     "#9f0000")
      (modeline-warning "#5f0070")
      (modeline-info    "#002fa0")

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

      (link blue)
      (link-alt magenta)
      (name magenta)
      (keybind red)
      (identifier yellow-cooler)
      (prompt blue-warmer)

      (bg-region "#dfe4f4")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta)
      (comment green-faint)
      (constant magenta-cooler)
      (fnname magenta-warmer)
      (keyword blue)
      (preprocessor green-warmer)
      (docstring magenta-faint)
      (string yellow-cooler)
      (type red)
      (variable blue-warmer)
      (rx-escape cyan-cooler) ; compare with `string'
      (rx-construct red-cooler)

;;;; Accent mappings

      (accent-0 blue)
      (accent-1 red)
      (accent-2 cyan-cooler)
      (accent-3 yellow-warmer)

;;;; Date mappings

      (date-common cyan-cooler)
      (date-deadline red)
      (date-event fg-alt)
      (date-holiday red-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow-warmer)
      (date-weekday blue)
      (date-weekend red)

;;;; Prose mappings

      (prose-code magenta-warmer)
      (prose-done green-warmer)
      (prose-macro magenta-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table yellow-faint)
      (prose-table-formula info)
      (prose-tag magenta-faint)
      (prose-todo red-warmer)
      (prose-verbatim blue-warmer)

;;;; Mail mappings

      (mail-cite-0 yellow-cooler)
      (mail-cite-1 magenta-warmer)
      (mail-cite-2 cyan-cooler)
      (mail-cite-3 blue-warmer)
      (mail-part cyan)
      (mail-recipient magenta)
      (mail-subject blue)
      (mail-other magenta-faint)

;;;; Space mappings

      (bg-space unspecified)
      (fg-space border)
      (bg-space-err bg-yellow-intense)

;;;; Tab mappings

      (bg-tab-bar      bg-alt)
      (bg-tab-current  bg-main)
      (bg-tab-other    bg-active)

;;;; Rainbow mappings

      (rainbow-0 blue)
      (rainbow-1 magenta)
      (rainbow-2 cyan)
      (rainbow-3 yellow-cooler)
      (rainbow-4 magenta-cooler)
      (rainbow-5 magenta-warmer)
      (rainbow-6 red-cooler)
      (rainbow-7 cyan-cooler)
      (rainbow-8 green-cooler))
    "The `ef-kassio' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-kassio-palette-overrides nil
    "Overrides for `ef-kassio-palette'.

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

  (ef-themes-theme ef-kassio ef-kassio-palette ef-kassio-palette-overrides)

  (provide-theme 'ef-kassio))

;;; ef-kassio-theme.el ends here
