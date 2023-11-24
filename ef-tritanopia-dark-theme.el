;;; ef-tritanopia-dark-theme.el --- Legible dark theme, optimized for blue-yellow color deficiency -*- lexical-binding:t -*-

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

  ;; Most of the colors here, like the blue and green hues, are defined
  ;; simply to preserve compatibility with the rest of the project.  We
  ;; don't actually rely on them for anything critical.
;;;###theme-autoload
  (deftheme ef-tritanopia-dark
    "Legible dark theme, optimized for blue-yellow color deficiency."
    :background-mode 'dark
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-tritanopia-dark-palette
    '(
;;; Basic values

      (bg-main      "#15050f")
      (fg-main      "#dfd0d5")
      (bg-dim       "#282026")
      (fg-dim       "#908890")
      (bg-alt       "#352f2f")
      (fg-alt       "#afdaef")

      (bg-active    "#554f4f")
      (bg-inactive  "#1a1517")

;;; Basic hues for foreground values

      (red             "#cf4f5f")
      (red-warmer      "#df4f4f")
      (red-cooler      "#d24f7f")
      (red-faint       "#b07f7f")
      (green           "#2fa526")
      (green-warmer    "#64aa0f")
      (green-cooler    "#00b066")
      (green-faint     "#5f9f6f")
      (yellow          "#c48702")
      (yellow-warmer   "#d0730f")
      (yellow-cooler   "#df8f6f")
      (yellow-faint    "#cf9f7f")
      (blue            "#379cf6")
      (blue-warmer     "#6a88ff")
      (blue-cooler     "#029fff")
      (blue-faint      "#6a84af")
      (magenta         "#b2608f")
      (magenta-warmer  "#c560aa")
      (magenta-cooler  "#a6699f")
      (magenta-faint   "#c590af")
      (cyan            "#3fafcf")
      (cyan-warmer     "#3f9aaf")
      (cyan-cooler     "#4fafaf")
      (cyan-faint      "#82a0af")

;;; Basic hues for background values

      (bg-red-intense     "#aa0010")
      (bg-green-intense   "#5f806f")
      (bg-yellow-intense  "#950f4f")
      (bg-blue-intense    "#165f70")
      (bg-magenta-intense "#b07faf")
      (bg-cyan-intense    "#007faa")

      (bg-red-subtle      "#72002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#603000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#5a105f")
      (bg-cyan-subtle     "#004065")

;;; Diffs

      (bg-added          "#002d3f")
      (bg-added-faint    "#001f38")
      (bg-added-refine   "#003b4f")
      (fg-added          "#cbdfff")

      (bg-changed        "#352354")
      (bg-changed-faint  "#351444")
      (bg-changed-refine "#383964")
      (fg-changed        "#e3cfff")

      (bg-removed        "#4d091f")
      (bg-removed-faint  "#37040f")
      (bg-removed-refine "#6b0f26")
      (fg-removed        "#ffbfbf")

;;; Graphs

      (bg-graph-red-0     "#b52c2c")
      (bg-graph-red-1     "#702020")
      (bg-graph-green-0   "#afd1c0")
      (bg-graph-green-1   "#607a8f")
      (bg-graph-yellow-0  "#facfd6")
      (bg-graph-yellow-1  "#b57b85")
      (bg-graph-blue-0    "#4f9fdf")
      (bg-graph-blue-1    "#004559")
      (bg-graph-magenta-0 "#b6427f")
      (bg-graph-magenta-1 "#7f506f")
      (bg-graph-cyan-0    "#57dfea")
      (bg-graph-cyan-1    "#00808f")

;;; Special hues

      (bg-mode-line       "#671822")
      (fg-mode-line       "#ffffff")
      (bg-completion      "#441824")
      (bg-hover           "#00405f")
      (bg-hover-secondary "#5e3e5b")
      (bg-hl-line         "#3f1515")
      (bg-paren           "#2f5f7a")
      (bg-err             "#3a0f0f") ; check with err
      (bg-warning         "#371430") ; check with warning
      (bg-info            "#00253a") ; check with info

      (border        "#555564")
      (cursor        "#fd3333")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff7fbf")
      (modeline-warning "#df9f93")
      (modeline-info    "#4fcfef")

      (underline-err     "#ff0f1f")
      (underline-warning "#ffafa0")
      (underline-info    "#22ffd2")

      (bg-char-0 "#922a00")
      (bg-char-1 "#00709f")
      (bg-char-2 "#5f3faf")

;;; Mappings

;;;; General mappings

      (err red-warmer)
      (warning magenta)
      (info cyan)

      (link cyan)
      (link-alt magenta-cooler)
      (name magenta)
      (keybind red-cooler)
      (identifier magenta-faint)
      (prompt cyan)

      (bg-region "#202d3f")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta)
      (comment red-faint)
      (constant red-cooler)
      (fnname magenta-cooler)
      (keyword red)
      (preprocessor magenta-cooler)
      (docstring cyan-faint)
      (string cyan)
      (type cyan-warmer)
      (variable cyan-cooler)
      (rx-escape cyan-cooler) ; compare with `string'
      (rx-construct red)

;;;; Accent mappings

      (accent-0 cyan)
      (accent-1 red)
      (accent-2 cyan-warmer)
      (accent-3 magenta)

;;;; Date mappings

      (date-common cyan-cooler)
      (date-deadline red-warmer)
      (date-event fg-alt)
      (date-holiday red-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled magenta)
      (date-weekday cyan)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code red)
      (prose-done cyan)
      (prose-macro cyan-warmer)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula err)
      (prose-tag fg-alt)
      (prose-todo red-warmer)
      (prose-verbatim cyan)

;;;; Mail mappings

      (mail-cite-0 cyan)
      (mail-cite-1 red-cooler)
      (mail-cite-2 cyan-cooler)
      (mail-cite-3 red-faint)
      (mail-part cyan-warmer)
      (mail-recipient magenta)
      (mail-subject red-warmer)
      (mail-other magenta-cooler)

;;;; Space mappings

      (bg-space unspecified)
      (fg-space border)
      (bg-space-err bg-red-intense)

;;;; Tab mappings

      (bg-tab-bar      bg-alt)
      (bg-tab-current  bg-main)
      (bg-tab-other    bg-active)

;;;; Rainbow mappings

      (rainbow-0 cyan)
      (rainbow-1 red)
      (rainbow-2 cyan-warmer)
      (rainbow-3 red-cooler)
      (rainbow-4 cyan-cooler)
      (rainbow-5 magenta)
      (rainbow-6 cyan-faint)
      (rainbow-7 magenta-faint)
      (rainbow-8 red-faint))
    "The `ef-tritanopia-dark' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-tritanopia-dark-palette-overrides nil
    "Overrides for `ef-tritanopia-dark-palette'.

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

  (ef-themes-theme ef-tritanopia-dark ef-tritanopia-dark-palette ef-tritanopia-dark-palette-overrides)

  (provide-theme 'ef-tritanopia-dark))

;;; ef-tritanopia-dark-theme.el ends here
