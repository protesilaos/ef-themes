;;; ef-dark-theme.el --- Legible dark theme with blue, magenta, cyan, purple colors -*- lexical-binding:t -*-

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
  (deftheme ef-dark
    "Legible dark theme with blue, magenta, cyan, purple colors."
    :background-mode 'dark
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-dark-palette
    '(
;;; Basic values

      (bg-main     "#000000")
      (fg-main     "#d0d0d0")
      (bg-dim      "#1a1a1a")
      (fg-dim      "#857f8f")
      (bg-alt      "#2b2b2b")
      (fg-alt      "#89afef")

      (bg-active   "#4b4b4b")
      (bg-inactive "#121212")

;;; Basic hues for foreground values

      (red             "#ef6560")
      (red-warmer      "#f47360")
      (red-cooler      "#ff5a7a")
      (red-faint       "#d56f72")
      (green           "#0faa26")
      (green-warmer    "#6aad0f")
      (green-cooler    "#00a692")
      (green-faint     "#61a06c")
      (yellow          "#bf9032")
      (yellow-warmer   "#d1843f")
      (yellow-cooler   "#df8a5a")
      (yellow-faint    "#cf9f8f")
      (blue            "#3f95f6")
      (blue-warmer     "#6a9fff")
      (blue-cooler     "#029fff")
      (blue-faint      "#7a94df")
      (magenta         "#d369af")
      (magenta-warmer  "#e580ea")
      (magenta-cooler  "#af85ff")
      (magenta-faint   "#c58faf")
      (cyan            "#4fbaef")
      (cyan-warmer     "#6fafff")
      (cyan-cooler     "#1dbfcf")
      (cyan-faint      "#8aa0df")

;;; Basic hues for background values

      (bg-red-intense     "#cd2f30")
      (bg-green-intense   "#20a020")
      (bg-yellow-intense  "#8f5040")
      (bg-blue-intense    "#4648d0")
      (bg-magenta-intense "#a050cf")
      (bg-cyan-intense    "#2270be")

      (bg-red-subtle      "#72002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#603000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#5a105f")
      (bg-cyan-subtle     "#004065")

;;; Diffs

      (bg-added          "#00381f")
      (bg-added-faint    "#002910")
      (bg-added-refine   "#034f2f")
      (fg-added          "#a0e0a0")

      (bg-changed        "#363300")
      (bg-changed-faint  "#2a1f00")
      (bg-changed-refine "#4a4a00")
      (fg-changed        "#efef80")

      (bg-removed        "#4f1119")
      (bg-removed-faint  "#380a0f")
      (bg-removed-refine "#781a1f")
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

      (bg-mode-line       "#2a2a75")
      (fg-mode-line       "#e0e0ff")
      (bg-completion      "#0f2d4a")
      (bg-hover           "#004a5f")
      (bg-hover-secondary "#551f5a")
      (bg-hl-line         "#002435")
      (bg-paren           "#20577a")
      (bg-err             "#360d09") ; check with err
      (bg-warning         "#332600") ; check with warning
      (bg-info            "#002c12") ; check with info

      (border        "#4f4f5f")
      (cursor        "#ff76ff")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff80af")
      (modeline-warning "#dfcf33")
      (modeline-info    "#2fc82f")

      (underline-err     "#df2f2f")
      (underline-warning "#c0b000")
      (underline-info    "#22b022")

      (bg-char-0 "#0050af")
      (bg-char-1 "#7f1f7f")
      (bg-char-2 "#625a00")

;;; Mappings

;;;; General mappings

      (err red-warmer)
      (warning yellow)
      (info green)

      (link cyan)
      (link-alt magenta)
      (name blue-warmer)
      (keybind blue-cooler)
      (identifier magenta-faint)
      (prompt green-cooler)

      (bg-region "#2a234a")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta)
      (comment yellow-faint)
      (constant blue-cooler)
      (fnname magenta-warmer)
      (keyword magenta-cooler)
      (preprocessor red-warmer)
      (docstring cyan-faint)
      (string blue-warmer)
      (type green-cooler)
      (variable cyan-cooler)
      (rx-escape green-warmer) ; compare with `string'
      (rx-construct red)

;;;; Accent mappings

      (accent-0 blue)
      (accent-1 magenta-warmer)
      (accent-2 green-cooler)
      (accent-3 red)

;;;; Date mappings

      (date-common green-cooler)
      (date-deadline red-warmer)
      (date-event fg-alt)
      (date-holiday magenta)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-weekday cyan)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code magenta-warmer)
      (prose-done green)
      (prose-macro green-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-tag yellow-faint)
      (prose-todo red-warmer)
      (prose-verbatim blue)

;;;; Mail mappings

      (mail-cite-0 blue)
      (mail-cite-1 magenta-warmer)
      (mail-cite-2 green-cooler)
      (mail-cite-3 yellow-cooler)
      (mail-part magenta-faint)
      (mail-recipient blue-warmer)
      (mail-subject blue-cooler)
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

      (rainbow-0 green-cooler)
      (rainbow-1 blue)
      (rainbow-2 magenta-warmer)
      (rainbow-3 cyan-cooler)
      (rainbow-4 yellow-cooler)
      (rainbow-5 magenta-cooler)
      (rainbow-6 red-cooler)
      (rainbow-7 green-warmer)
      (rainbow-8 yellow))
    "The `ef-dark' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-dark-palette-overrides nil
    "Overrides for `ef-dark-palette'.

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

  (ef-themes-theme ef-dark ef-dark-palette ef-dark-palette-overrides)

  (provide-theme 'ef-dark))

;;; ef-dark-theme.el ends here
