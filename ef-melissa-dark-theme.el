;;; ef-melissa-dark-theme.el --- Legible dark theme with warm colors (yellow, red, green, cyan) -*- lexical-binding:t -*-

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
  (deftheme ef-melissa-dark
    "Legible dark theme with warm colors (yellow, red, green, cyan)."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-melissa-dark-palette
    '(
;;; Basic values

      (bg-main     "#352718")
      (fg-main     "#e8e4b1")
      (bg-dim      "#483426")
      (fg-dim      "#90918a")
      (bg-alt      "#59463f")
      (fg-alt      "#a2c080")

      (bg-active   "#79665f")
      (bg-inactive "#3d2e1f")

;;; Basic hues for foreground values

      (red             "#ff7f7f")
      (red-warmer      "#ff7f4f")
      (red-cooler      "#ff8f98")
      (red-faint       "#e89a88")
      (green           "#6fd560")
      (green-warmer    "#a0d13a")
      (green-cooler    "#65d590")
      (green-faint     "#a0d26f")
      (yellow          "#e4b53f")
      (yellow-warmer   "#ffa21f")
      (yellow-cooler   "#e7a06f")
      (yellow-faint    "#eac29f")
      (blue            "#57aff6")
      (blue-warmer     "#98bfff")
      (blue-cooler     "#62cfef")
      (blue-faint      "#6ab4ef")
      (magenta         "#f0aac5")
      (magenta-warmer  "#fa90aa")
      (magenta-cooler  "#c6a2fe")
      (magenta-faint   "#dfcfe0")
      (cyan            "#6fcad0")
      (cyan-warmer     "#7fc5df")
      (cyan-cooler     "#70e0cf")
      (cyan-faint      "#99bfcf")

;;; Basic hues for background values

      (bg-red-intense     "#b02930")
      (bg-green-intense   "#4a7100")
      (bg-yellow-intense  "#8f5040")
      (bg-blue-intense    "#4648d0")
      (bg-magenta-intense "#a04fc5")
      (bg-cyan-intense    "#2270cf")

      (bg-red-subtle      "#72002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#603000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#501f72")
      (bg-cyan-subtle     "#004065")

;;; Diffs

      (bg-added          "#2f491f")
      (bg-added-faint    "#2f3b0f")
      (bg-added-refine   "#3f6234")
      (fg-added          "#a0e0a0")

      (bg-changed        "#544a0f")
      (bg-changed-faint  "#43350f")
      (bg-changed-refine "#615f1f")
      (fg-changed        "#dada90")

      (bg-removed        "#622a1f")
      (bg-removed-faint  "#4b240a")
      (bg-removed-refine "#7f3325")
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

      (bg-mode-line       "#704f00")
      (fg-mode-line       "#f8efd8")
      (bg-completion      "#66421f")
      (bg-hover           "#60518f")
      (bg-hover-secondary "#5a661f")
      (bg-hl-line         "#4f311f")
      (bg-paren           "#5f6f1f")
      (bg-err             "#551a05") ; check with err
      (bg-warning         "#4f3f10") ; check with warning
      (bg-info            "#2f4300") ; check with info

      (border        "#6f5f58")
      (cursor        "#f9cf7a")
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
      (info green)

      (link yellow)
      (link-alt magenta-cooler)
      (name yellow-cooler)
      (keybind yellow-warmer)
      (identifier red-faint)
      (prompt green-warmer)

      (bg-region "#443a4f")
      (fg-region unspecified)

;;;; Code mappings

      (builtin yellow-cooler)
      (comment yellow-faint)
      (constant blue-warmer)
      (fnname green)
      (keyword yellow)
      (preprocessor red-warmer)
      (docstring red-faint)
      (string yellow-warmer)
      (type green-cooler)
      (variable cyan)
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
      (date-weekend red-cooler)

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
      (mail-cite-1 blue-warmer)
      (mail-cite-2 red-cooler)
      (mail-cite-3 green-cooler)
      (mail-part cyan)
      (mail-recipient yellow)
      (mail-subject green)
      (mail-other yellow-cooler)

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

      (rainbow-0 yellow-warmer)
      (rainbow-1 yellow)
      (rainbow-2 green-warmer)
      (rainbow-3 red-cooler)
      (rainbow-4 cyan-warmer)
      (rainbow-5 magenta)
      (rainbow-6 green-cooler)
      (rainbow-7 magenta-warmer)
      (rainbow-8 cyan-cooler))
    "The `ef-melissa-dark' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-melissa-dark-palette-overrides nil
    "Overrides for `ef-melissa-dark-palette'.

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

  (ef-themes-theme ef-melissa-dark ef-melissa-dark-palette ef-melissa-dark-palette-overrides)

  (provide-theme 'ef-melissa-dark))

;;; ef-melissa-dark-theme.el ends here
