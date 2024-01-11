;;; ef-winter-theme.el --- Legible dark theme with magenta, purple, fawn, teal colors -*- lexical-binding:t -*-

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
  (deftheme ef-winter
    "Legible dark theme with magenta, purple, fawn, teal colors."
    :background-mode 'dark
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-winter-palette
    '(
;;; Basic values

      (bg-main      "#0f0b15")
      (fg-main      "#b8c6d5")
      (bg-dim       "#1d202f")
      (fg-dim       "#807c9f")
      (bg-alt       "#2a2f42")
      (fg-alt       "#bf8f8f")

      (bg-active    "#4a4f62")
      (bg-inactive  "#19181f")

;;; Basic hues for foreground values

      (red             "#f47359")
      (red-warmer      "#ef6560")
      (red-cooler      "#ff6a7a")
      (red-faint       "#d56f72")
      (green           "#29a444")
      (green-warmer    "#6aad0f")
      (green-cooler    "#00a392")
      (green-faint     "#61a06c")
      (yellow          "#b58a52")
      (yellow-warmer   "#d1803f")
      (yellow-cooler   "#df9080")
      (yellow-faint    "#c0a38a")
      (blue            "#3f95f6")
      (blue-warmer     "#6a9fff")
      (blue-cooler     "#029fff")
      (blue-faint      "#7a94df")
      (magenta         "#d369af")
      (magenta-warmer  "#e580e0")
      (magenta-cooler  "#af85ea")
      (magenta-faint   "#c57faf")
      (cyan            "#4fbaef")
      (cyan-warmer     "#6fafdf")
      (cyan-cooler     "#35afbf")
      (cyan-faint      "#8aa0df")

;;; Basic hues for background values

      (bg-red-intense     "#b02930")
      (bg-green-intense   "#0a7040")
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

      (bg-added          "#00371f")
      (bg-added-faint    "#002918")
      (bg-added-refine   "#004c2f")
      (fg-added          "#a0e0a0")

      (bg-changed        "#363300")
      (bg-changed-faint  "#2a1f00")
      (bg-changed-refine "#4a4a00")
      (fg-changed        "#efef80")

      (bg-removed        "#450f1f")
      (bg-removed-faint  "#2f060f")
      (bg-removed-refine "#641426")
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

      (bg-mode-line       "#5f1f5f")
      (fg-mode-line       "#dedeff")
      (bg-completion      "#2f2a7a")
      (bg-hover           "#00474f")
      (bg-hover-secondary "#44196f")
      (bg-hl-line         "#003045")
      (bg-paren           "#2f608e")
      (bg-err             "#330d06") ; check with err
      (bg-warning         "#332610") ; check with warning
      (bg-info            "#0f2e10") ; check with info

      (border        "#4a4955")
      (cursor        "#ff6ff0")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff9fbf")
      (modeline-warning "#ddb300")
      (modeline-info    "#40e0af")

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
      (warning yellow)
      (info green)

      (link magenta)
      (link-alt cyan-warmer)
      (name magenta)
      (keybind cyan-cooler)
      (identifier magenta-faint)
      (prompt magenta-warmer)

      (bg-region "#342464")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta-warmer)
      (comment yellow-faint)
      (constant magenta)
      (fnname cyan-cooler)
      (keyword magenta-cooler)
      (preprocessor red-cooler)
      (docstring cyan-faint)
      (string yellow-cooler)
      (type cyan)
      (variable blue-warmer)
      (rx-escape green) ; compare with `string'
      (rx-construct blue)

;;;; Accent mappings

      (accent-0 magenta-cooler)
      (accent-1 yellow)
      (accent-2 green-cooler)
      (accent-3 magenta-warmer)

;;;; Date mappings

      (date-common cyan-cooler)
      (date-deadline red-warmer)
      (date-event fg-alt)
      (date-holiday magenta)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-weekday cyan)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code yellow)
      (prose-done green)
      (prose-macro green-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula info)
      (prose-tag cyan-faint)
      (prose-todo red-warmer)
      (prose-verbatim magenta-cooler)

;;;; Mail mappings

      (mail-cite-0 magenta-cooler)
      (mail-cite-1 yellow-cooler)
      (mail-cite-2 cyan-cooler)
      (mail-cite-3 magenta)
      (mail-part magenta-faint)
      (mail-recipient magenta)
      (mail-subject blue-warmer)
      (mail-other magenta-cooler)

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

      (rainbow-0 magenta)
      (rainbow-1 cyan-cooler)
      (rainbow-2 magenta-cooler)
      (rainbow-3 yellow)
      (rainbow-4 blue-warmer)
      (rainbow-5 magenta-warmer)
      (rainbow-6 green-cooler)
      (rainbow-7 yellow-cooler)
      (rainbow-8 cyan-warmer))
    "The `ef-winter' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-winter-palette-overrides nil
    "Overrides for `ef-winter-palette'.

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

  (ef-themes-theme ef-winter ef-winter-palette ef-winter-palette-overrides)

  (provide-theme 'ef-winter))

;;; ef-winter-theme.el ends here
