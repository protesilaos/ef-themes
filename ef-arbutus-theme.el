;;; ef-arbutus-theme.el --- Legible light theme with red and green colors -*- lexical-binding:t -*-

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
  (deftheme ef-arbutus
    "Legible light theme with red and green colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-arbutus-palette
    '(
;;; Basic values

      (bg-main     "#ffead8")
      (fg-main     "#393330")
      (bg-dim      "#f0d8cf")
      (fg-dim      "#6e678f")
      (bg-alt      "#e7d2cb")
      (fg-alt      "#8a5f4a")

      (bg-active   "#c7b2ab")
      (bg-inactive "#f7e2d2")

;;; Basic hues for foreground values

      (red             "#b0000f")
      (red-warmer      "#b20f00")
      (red-cooler      "#aa184f")
      (red-faint       "#8f2f30")
      (green           "#007000")
      (green-warmer    "#557000")
      (green-cooler    "#00704f")
      (green-faint     "#3f712f")
      (yellow          "#906200")
      (yellow-warmer   "#b44405")
      (yellow-cooler   "#8a6340")
      (yellow-faint    "#8d6068")
      (blue            "#375cc6")
      (blue-warmer     "#5f55df")
      (blue-cooler     "#265fbf")
      (blue-faint      "#4a659f")
      (magenta         "#a23ea4")
      (magenta-warmer  "#bf2c90")
      (magenta-cooler  "#6448ca")
      (magenta-faint   "#845592")
      (cyan            "#3f69af")
      (cyan-warmer     "#4060a0")
      (cyan-cooler     "#0f7688")
      (cyan-faint      "#546f70")

;;; Basic hues for background values

      (bg-red-intense     "#ff8f88")
      (bg-green-intense   "#96df80")
      (bg-yellow-intense  "#efbf00")
      (bg-blue-intense    "#afbeff")
      (bg-magenta-intense "#bf9fff")
      (bg-cyan-intense    "#88d4f0")

      (bg-red-subtle      "#ffc2bf")
      (bg-green-subtle    "#c4f2af")
      (bg-yellow-subtle   "#efef6f")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#f0d0f9")
      (bg-cyan-subtle     "#bfe4f6")

;;; Diffs

;; TODO 2023-12-27:
      (bg-added          "#d0e6b0")
      (bg-added-faint    "#e2efc0")
      (bg-added-refine   "#bbd799")
      (fg-added          "#005000")

      (bg-changed        "#f5e690")
      (bg-changed-faint  "#f5edaf")
      (bg-changed-refine "#edd482")
      (fg-changed        "#553d00")

      (bg-removed        "#f8c6b6")
      (bg-removed-faint  "#f5d0b0")
      (bg-removed-refine "#f0aaa9")
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

      (bg-mode-line       "#e9a0a0")
      (fg-mode-line       "#40231f")
      (bg-completion      "#f3c4c4")
      (bg-hover           "#afdeaf")
      (bg-hover-secondary "#f5bfc5")
      (bg-hl-line         "#fad8bf")
      (bg-paren           "#efafbf")
;; TODO 2023-12-27:
      (bg-err             "#ffd4b5") ; check with err
      (bg-warning         "#efe48f") ; check with warning
      (bg-info            "#d0f0bc") ; check with info

      (border        "#c0b4a6")
      (cursor        "#208f10")
      (fg-intense    "#000000")

      (modeline-err     "#900000")
      (modeline-warning "#70008f")
      (modeline-info    "#00448f")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af52")

      (bg-char-0 "#7feaff")
      (bg-char-1 "#f0a0f0")
      (bg-char-2 "#d0e000")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err red-warmer)
      (warning yellow)
      (info green)

      (link green-cooler)
      (link-alt magenta-cooler)
      (name red-cooler)
      (keybind red)
      (identifier magenta-faint)
      (prompt red-faint)

      (bg-region "#dbe0c0")
      (fg-region unspecified)

;;;; Code mappings

      (builtin green-cooler)
      (comment fg-dim)
      (constant magenta)
      (fnname green)
      (keyword red-faint)
      (preprocessor cyan-cooler)
      (docstring yellow-faint)
      (string green-warmer)
      (type red)
      (variable red-cooler)
      (rx-escape yellow-warmer) ; compare with `string'
      (rx-construct cyan-cooler)

;;;; Accent mappings

      (accent-0 green)
      (accent-1 red)
      (accent-2 cyan)
      (accent-3 yellow-warmer)

;;;; Date mappings

      (date-common green-faint)
      (date-deadline red-cooler)
      (date-event fg-alt)
      (date-holiday yellow-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow)
      (date-weekday green-cooler)
      (date-weekend red-cooler)

;;;; Prose mappings

      (prose-code magenta-warmer)
      (prose-done green)
      (prose-macro yellow-warmer)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula info)
      (prose-tag cyan-faint)
      (prose-todo yellow-warmer)
      (prose-verbatim blue-cooler)

;;;; Mail mappings

      (mail-cite-0 green-cooler)
      (mail-cite-1 green-warmer)
      (mail-cite-2 red-cooler)
      (mail-cite-3 yellow)
      (mail-part green)
      (mail-recipient red-faint)
      (mail-subject red)
      (mail-other red-warmer)

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

      (rainbow-0 green)
      (rainbow-1 red-faint)
      (rainbow-2 green-cooler)
      (rainbow-3 yellow)
      (rainbow-4 green-warmer)
      (rainbow-5 cyan-cooler)
      (rainbow-6 yellow-cooler)
      (rainbow-7 red-cooler)
      (rainbow-8 cyan))
    "The `ef-arbutus' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-arbutus-palette-overrides nil
    "Overrides for `ef-arbutus-palette'.

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

  (ef-themes-theme ef-arbutus ef-arbutus-palette ef-arbutus-palette-overrides)

  (provide-theme 'ef-arbutus))

;;; ef-arbutus-theme.el ends here
