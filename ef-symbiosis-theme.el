;;; ef-symbiosis-theme.el --- Legible dark theme with blue, green, cyan, gold colors -*- lexical-binding:t -*-

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
  (deftheme ef-symbiosis
    "Legible dark theme with blue, magenta, cyan, purple colors."
    :background-mode 'dark
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-symbiosis-palette
    '(
;;; Basic values

      (bg-main     "#130911")
      (fg-main     "#d0d0d0")
      (bg-dim      "#221920")
      (fg-dim      "#857f8f")
      (bg-alt      "#372d32")
      (fg-alt      "#89afef")

      (bg-active   "#4b3f47")
      (bg-inactive "#191317")

;;; Basic hues for foreground values

      (red             "#ef6360")
      (red-warmer      "#ff7355")
      (red-cooler      "#fe5a7a")
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
      (bg-yellow-intense  "#706310")
      (bg-blue-intense    "#2641a0")
      (bg-magenta-intense "#a050cf")
      (bg-cyan-intense    "#2270be")

      (bg-red-subtle      "#72002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#603000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#5a105f")
      (bg-cyan-subtle     "#004065")

;;; Diffs

      (bg-added          "#233b0f")
      (bg-added-faint    "#102a00")
      (bg-added-refine   "#2f512f")
      (fg-added          "#a0e0a0")

      (bg-changed        "#363300")
      (bg-changed-faint  "#2a1f00")
      (bg-changed-refine "#4a4a00")
      (fg-changed        "#efef80")

      (bg-removed        "#4e111f")
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

      (bg-mode-line       "#583435")
      (fg-mode-line       "#ffe5f0")
      (bg-completion      "#1f334f")
      (bg-hover           "#304477")
      (bg-hover-secondary "#5f3f3a")
      (bg-hl-line         "#1f2f3f")
      (bg-paren           "#005f4a")
      (bg-err             "#360d09") ; check with err
      (bg-warning         "#332600") ; check with warning
      (bg-info            "#002c12") ; check with info

      (border        "#4d4a4b")
      (cursor        "#f0af7f")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff906f")
      (modeline-warning "#dfcf73")
      (modeline-info    "#7fc82f")

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
      (link-alt magenta-cooler)
      (name blue)
      (keybind yellow-cooler)
      (identifier yellow-faint)
      (prompt cyan)

      (bg-region "#2f2630")
      (fg-region unspecified)

;;;; Code mappings

      (builtin blue)
      (comment fg-dim)
      (constant cyan-cooler)
      (fnname magenta-cooler)
      (keyword green-warmer)
      (preprocessor red-warmer)
      (docstring yellow-faint)
      (string yellow-cooler)
      (type green-cooler)
      (variable blue-warmer)
      (rx-escape green-cooler) ; compare with `string'
      (rx-construct red)

;;;; Accent mappings

      (accent-0 cyan)
      (accent-1 yellow-warmer)
      (accent-2 green-warmer)
      (accent-3 magenta-cooler)

;;;; Date mappings

      (date-common green-cooler)
      (date-deadline red-warmer)
      (date-event fg-alt)
      (date-holiday yellow-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-weekday yellow-cooler)
      (date-weekend blue)

;;;; Prose mappings

      (prose-code cyan-cooler)
      (prose-done green)
      (prose-macro green-warmer)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula err)
      (prose-tag magenta-faint)
      (prose-todo red)
      (prose-verbatim blue-warmer)

;;;; Mail mappings

      (mail-cite-0 yellow-cooler)
      (mail-cite-1 blue-faint)
      (mail-cite-2 green-faint)
      (mail-cite-3 fg-dim)
      (mail-part cyan)
      (mail-recipient cyan-warmer)
      (mail-subject magenta-cooler)
      (mail-other blue-warmer)

;;;; Space mappings

      (bg-space unspecified)
      (fg-space border)
      (bg-space-err bg-yellow-intense)

;;;; Tab mappings

      (bg-tab-bar      bg-alt)
      (bg-tab-current  bg-main)
      (bg-tab-other    bg-active)

;;;; Rainbow mappings

      (rainbow-0 yellow-cooler)
      (rainbow-1 blue-warmer)
      (rainbow-2 magenta-cooler)
      (rainbow-3 cyan)
      (rainbow-4 magenta)
      (rainbow-5 green-cooler)
      (rainbow-6 red-faint)
      (rainbow-7 yellow)
      (rainbow-8 cyan-warmer))
    "The `ef-symbiosis' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-symbiosis-palette-overrides nil
    "Overrides for `ef-symbiosis-palette'.

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

  (ef-themes-theme ef-symbiosis ef-symbiosis-palette ef-symbiosis-palette-overrides)

  (provide-theme 'ef-symbiosis))

;;; ef-symbiosis-theme.el ends here
