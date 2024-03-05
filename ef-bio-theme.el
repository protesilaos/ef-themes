;;; ef-bio-theme.el --- Legible dark theme with green, teal, blue, purple colors -*- lexical-binding:t -*-

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
  (deftheme ef-bio
    "Legible dark theme with green, teal, blue, purple colors."
    :background-mode 'dark
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-bio-palette
    '(
;;; Basic values

      (bg-main      "#111111")
      (fg-main      "#cfdfd5")
      (bg-dim       "#222522")
      (fg-dim       "#808f80")
      (bg-alt       "#303230")
      (fg-alt       "#8fcfaf")

      (bg-active    "#505250")
      (bg-inactive  "#161916")

;;; Basic hues for foreground values

      (red             "#ef6560")
      (red-warmer      "#f47360")
      (red-cooler      "#ff778f")
      (red-faint       "#d56f72")
      (green           "#3fb83f")
      (green-warmer    "#7fc500")
      (green-cooler    "#00c089")
      (green-faint     "#7fc07f")
      (yellow          "#d4aa02")
      (yellow-warmer   "#e09a0f")
      (yellow-cooler   "#cfc04f")
      (yellow-faint    "#b7a07f")
      (blue            "#37aff6")
      (blue-warmer     "#78afff")
      (blue-cooler     "#32cfef")
      (blue-faint      "#6ab4cf")
      (magenta         "#d38faf")
      (magenta-warmer  "#e490df")
      (magenta-cooler  "#af9fff")
      (magenta-faint   "#caa5bf")
      (cyan            "#6fc5ef")
      (cyan-warmer     "#7fcfdf")
      (cyan-cooler     "#5dc0aa")
      (cyan-faint      "#7fb4cf")

;;; Basic hues for background values

      (bg-red-intense     "#b02930")
      (bg-green-intense   "#407430")
      (bg-yellow-intense  "#8f5040")
      (bg-blue-intense    "#4648d0")
      (bg-magenta-intense "#a04fc5")
      (bg-cyan-intense    "#2270be")

      (bg-red-subtle      "#72002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#603000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#501f72")
      (bg-cyan-subtle     "#004065")

;;; Diffs

      (bg-added          "#003b1f")
      (bg-added-faint    "#002a10")
      (bg-added-refine   "#03512f")
      (fg-added          "#a0e0a0")

      (bg-changed        "#363300")
      (bg-changed-faint  "#2a1f00")
      (bg-changed-refine "#4a4a00")
      (fg-changed        "#efef80")

      (bg-removed        "#4e1119")
      (bg-removed-faint  "#380a0f")
      (bg-removed-refine "#751a1f")
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

      (bg-mode-line       "#00552f")
      (fg-mode-line       "#d0ffe0")
      (bg-completion      "#0f3c2f")
      (bg-hover           "#4f3f9a")
      (bg-hover-secondary "#003e5f")
      (bg-hl-line         "#00331f")
      (bg-paren           "#664950")
      (bg-err             "#48100f") ; check with err
      (bg-warning         "#3b3400") ; check with warning
      (bg-info            "#1a3b0f") ; check with info

      (border        "#525959")
      (cursor        "#35f038")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff9fbf")
      (modeline-warning "#dfcf33")
      (modeline-info    "#7fdfff")

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
      (warning yellow-cooler)
      (info green)

      (link green-cooler)
      (link-alt magenta)
      (name green)
      (keybind green)
      (identifier magenta-faint)
      (prompt cyan-cooler)

      (bg-region "#3a3027")
      (fg-region unspecified)

;;;; Code mappings

      (builtin green)
      (comment yellow-faint)
      (constant blue)
      (fnname green-warmer)
      (keyword green-cooler)
      (preprocessor green)
      (docstring green-faint)
      (string magenta-cooler)
      (type cyan-warmer)
      (variable blue-warmer)
      (rx-escape yellow-cooler) ; compare with `string'
      (rx-construct green)

;;;; Accent mappings

      (accent-0 green-cooler)
      (accent-1 blue-warmer)
      (accent-2 magenta-warmer)
      (accent-3 green-warmer)

;;;; Date mappings

      (date-common cyan-cooler)
      (date-deadline red-cooler)
      (date-event fg-alt)
      (date-holiday magenta-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow-cooler)
      (date-weekday cyan)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code blue-warmer)
      (prose-done green)
      (prose-macro magenta-warmer)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula warning)
      (prose-tag yellow-faint)
      (prose-todo red)
      (prose-verbatim green-cooler)

;;;; Mail mappings

      (mail-cite-0 green-cooler)
      (mail-cite-1 blue-warmer)
      (mail-cite-2 green-warmer)
      (mail-cite-3 magenta-cooler)
      (mail-part green-faint)
      (mail-recipient green)
      (mail-subject blue)
      (mail-other green-warmer)

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

      (rainbow-0 green-cooler)
      (rainbow-1 green-warmer)
      (rainbow-2 cyan-cooler)
      (rainbow-3 magenta-cooler)
      (rainbow-4 cyan-warmer)
      (rainbow-5 yellow-cooler)
      (rainbow-6 blue)
      (rainbow-7 cyan)
      (rainbow-8 magenta))
    "The `ef-bio' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-bio-palette-overrides nil
    "Overrides for `ef-bio-palette'.

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

  (ef-themes-theme ef-bio ef-bio-palette ef-bio-palette-overrides)

  (provide-theme 'ef-bio))

;;; ef-bio-theme.el ends here
