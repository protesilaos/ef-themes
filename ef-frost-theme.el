;;; ef-frost-theme.el --- Legible light theme with blue, cyan, teal, purple colors -*- lexical-binding:t -*-

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

  (deftheme ef-frost
    "Legible light theme with blue, cyan, teal, purple colors.")

  (defconst ef-frost-palette
    '(
;;; Basic values

      (bg-main     "#fcffff")
      (fg-main     "#232323")
      (bg-dim      "#eaefef")
      (fg-dim      "#66657f")
      (bg-alt      "#d7dbdb")
      (fg-alt      "#204f9a")

      (bg-active   "#b5b8b8")
      (bg-inactive "#f7f9f9")

;;; Basic hues for foreground values

      (red             "#c42d2f")
      (red-warmer      "#d03003")
      (red-cooler      "#cf2f4f")
      (red-faint       "#9a4366")
      (green           "#008a00")
      (green-warmer    "#468400")
      (green-cooler    "#00845f")
      (green-faint     "#517f3c")
      (yellow          "#aa6100")
      (yellow-warmer   "#b6532f")
      (yellow-cooler   "#996c4f")
      (yellow-faint    "#804f4f")
      (blue            "#004fc0")
      (blue-warmer     "#4244ef")
      (blue-cooler     "#065fff")
      (blue-faint      "#375cc8")
      (magenta         "#aa44c5")
      (magenta-warmer  "#c0469a")
      (magenta-cooler  "#7f5ae0")
      (magenta-faint   "#605f9f")
      (cyan            "#1f6fbf")
      (cyan-warmer     "#3a6dd2")
      (cyan-cooler     "#007a85")
      (cyan-faint      "#305f9f")

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

      (bg-added          "#c9ffea")
      (bg-added-faint    "#d7fff5")
      (bg-added-refine   "#b3efdf")
      (fg-added          "#004840")

      (bg-changed        "#f4e8bd")
      (bg-changed-faint  "#f9efcb")
      (bg-changed-refine "#efd299")
      (fg-changed        "#553d00")

      (bg-removed        "#ffd6e0")
      (bg-removed-faint  "#ffe9e6")
      (bg-removed-refine "#f5bfc8")
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

      (bg-mode-line       "#9ad0ff")
      (fg-mode-line       "#051524")
      (bg-completion      "#cceff5")
      (bg-hover           "#eab5ff")
      (bg-hover-secondary "#aae0bf")
      (bg-hl-line         "#dff6e4")
      (bg-region          "#d4eaf3")
      (bg-paren           "#cab0ef")
      (bg-err             "#ffdfda") ; check with err
      (bg-warning         "#ffe9bf") ; check with warning
      (bg-info            "#ccefcf") ; check with info

      (border        "#b0b7c0")
      (cursor        "#0055bb")
      (fg-intense    "#000000")

      (modeline-err     "#a00000")
      (modeline-warning "#7f1090")
      (modeline-info    "#0000af")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af52")

      (bg-char-0 "#7feaff")
      (bg-char-1 "#ffaaff")
      (bg-char-2 "#dff000")

;;; Conditional hues

      (bg-region-intense "#aadfcc")

;;; Mappings

;;;; General mappings

      (err red)
      (warning yellow-cooler)
      (info green)

      (link cyan)
      (link-alt magenta)
      (name cyan-warmer)
      (keybind blue-cooler)
      (identifier magenta-faint)
      (prompt blue)

;;;; Code mappings

      (builtin cyan)
      (comment yellow-faint)
      (constant blue-cooler)
      (fnname green-cooler)
      (keyword blue)
      (preprocessor magenta)
      (docstring magenta-faint)
      (string blue-warmer)
      (type magenta-cooler)
      (variable cyan-warmer)
      (rx-escape yellow-cooler) ; compare with `string'
      (rx-construct red-cooler)

;;;; Accent mappings

      (accent-0 blue-warmer)
      (accent-1 green-cooler)
      (accent-2 magenta-warmer)
      (accent-3 blue-cooler)

;;;; Date mappings

      (date-common cyan-cooler)
      (date-deadline red)
      (date-event fg-alt)
      (date-holiday magenta-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow-cooler)
      (date-weekday cyan)
      (date-weekend red-faint)

;;;; Prose mappings

      (prose-code green-cooler)
      (prose-done green)
      (prose-macro magenta-warmer)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-tag yellow-faint)
      (prose-todo red)
      (prose-verbatim blue-warmer)

;;;; Mail mappings

      (mail-cite-0 blue)
      (mail-cite-1 cyan-cooler)
      (mail-cite-2 yellow-cooler)
      (mail-cite-3 magenta-cooler)
      (mail-part cyan)
      (mail-recipient cyan-warmer)
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

      (rainbow-0 cyan-cooler)
      (rainbow-1 blue)
      (rainbow-2 green-cooler)
      (rainbow-3 magenta-cooler)
      (rainbow-4 cyan)
      (rainbow-5 blue-warmer)
      (rainbow-6 green-warmer)
      (rainbow-7 magenta)
      (rainbow-8 cyan-warmer))
    "The `ef-frost' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-frost-palette-overrides nil
    "Overrides for `ef-frost-palette'.

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

  (ef-themes-theme ef-frost ef-frost-palette ef-frost-palette-overrides)

  (provide-theme 'ef-frost))

;;;###theme-autoload
(put 'ef-frost 'theme-properties '(:background-mode light :kind color-scheme :family ef))

;;; ef-frost-theme.el ends here
