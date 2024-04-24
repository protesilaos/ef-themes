;;; ef-reverie-theme.el --- Legible light theme with gold and nuanced colors -*- lexical-binding:t -*-

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
  (deftheme ef-reverie
    "Legible light theme with gold and nuanced colors."
    :background-mode 'light
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-reverie-palette
    '(
;;; Basic values

      (bg-main     "#f3eddf")
      (fg-main     "#4f204f")
      (bg-dim      "#e5d6d4")
      (fg-dim      "#6f6877")
      (bg-alt      "#d9cac8")
      (fg-alt      "#55447f")

      (bg-active   "#b9aaa8")
      (bg-inactive "#ede4da")

;;; Basic hues for foreground values

      (red             "#ba2d2f")
      (red-warmer      "#b21f00")
      (red-cooler      "#a83058")
      (red-faint       "#a04650")
      (green           "#007a0a")
      (green-warmer    "#5a7400")
      (green-cooler    "#008250")
      (green-faint     "#426340")
      (yellow          "#87591f")
      (yellow-warmer   "#a05900")
      (yellow-cooler   "#906045")
      (yellow-faint    "#7a5c50")
      (blue            "#375cc6")
      (blue-warmer     "#5059c0")
      (blue-cooler     "#265fbf")
      (blue-faint      "#475d8e")
      (magenta         "#9f4e74")
      (magenta-warmer  "#a73080")
      (magenta-cooler  "#7755b4")
      (magenta-faint   "#97508f")
      (cyan            "#3060af")
      (cyan-warmer     "#4f60a0")
      (cyan-cooler     "#0b6e8a")
      (cyan-faint      "#456b82")

;;; Basic hues for background values

      (bg-red-intense     "#ed899f")
      (bg-green-intense   "#96d080")
      (bg-yellow-intense  "#e2b270")
      (bg-blue-intense    "#c0c0f0")
      (bg-magenta-intense "#daaaf0")
      (bg-cyan-intense    "#8fc6d0")

      (bg-red-subtle      "#f0c0b0")
      (bg-green-subtle    "#b9e0b4")
      (bg-yellow-subtle   "#ebe08f")
      (bg-blue-subtle     "#ccd0f4")
      (bg-magenta-subtle  "#edc9ea")
      (bg-cyan-subtle     "#b3e8e0")

;;; Diffs

      (bg-added          "#b4e9d0")
      (bg-added-faint    "#c9edd7")
      (bg-added-refine   "#a4d4c4")
      (fg-added          "#0f443f")

      (bg-changed        "#f5e690")
      (bg-changed-faint  "#f5edaf")
      (bg-changed-refine "#eed284")
      (fg-changed        "#553d00")

      (bg-removed        "#f8c3bf")
      (bg-removed-faint  "#f4d8d0")
      (bg-removed-refine "#f9a8bd")
      (fg-removed        "#801530")

;;; Graphs

      (bg-graph-red-0     "#ef7969")
      (bg-graph-red-1     "#ffaab4")
      (bg-graph-green-0   "#45c050")
      (bg-graph-green-1   "#75ef30")
      (bg-graph-yellow-0  "#ffcf00")
      (bg-graph-yellow-1  "#f9ff00")
      (bg-graph-blue-0    "#7f90ff")
      (bg-graph-blue-1    "#a6c0ff")
      (bg-graph-magenta-0 "#e07fff")
      (bg-graph-magenta-1 "#fad0ff")
      (bg-graph-cyan-0    "#70d3f0")
      (bg-graph-cyan-1    "#afefff")

;;; Special hues

      (bg-mode-line       "#d1b0df")
      (fg-mode-line       "#523044")
      (bg-completion      "#e9cedd")
      (bg-hover           "#ddc97f")
      (bg-hover-secondary "#d0c4e4")
      (bg-hl-line         "#e7d9e0")
      (bg-paren           "#bf9fbf")
      (bg-err             "#ffc4d4") ; check with err
      (bg-warning         "#f0e0a4") ; check with warning
      (bg-info            "#dddef0") ; check with info

      (border        "#c5afb6")
      (cursor        "#9d5744")
      (fg-intense    "#000000")

      (modeline-err     "#900000")
      (modeline-warning "#66008f")
      (modeline-info    "#1f409f")

      (underline-err     "#c00f4f")
      (underline-warning "#bf5f00")
      (underline-info    "#028082")

      (bg-char-0 "#7feaff")
      (bg-char-1 "#f0a0f0")
      (bg-char-2 "#d0e000")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err magenta-warmer)
      (warning yellow-warmer)
      (info cyan)

      (link yellow-cooler)
      (link-alt cyan-warmer)
      (name cyan-warmer)
      (keybind cyan)
      (identifier yellow-cooler)
      (prompt magenta)

      (bg-region "#e0d0ba")
      (fg-region unspecified)

;;;; Code mappings

      (builtin magenta-faint)
      (comment blue-faint)
      (constant blue-warmer)
      (fnname cyan-warmer)
      (keyword yellow-cooler)
      (preprocessor cyan-cooler)
      (docstring yellow-faint)
      (string red-faint)
      (type green-faint)
      (variable magenta)
      (rx-escape cyan-cooler) ; compare with `string'
      (rx-construct red-warmer)

;;;; Accent mappings

      (accent-0 yellow)
      (accent-1 red)
      (accent-2 magenta-warmer)
      (accent-3 blue-warmer)

;;;; Date mappings

      (date-common magenta-faint)
      (date-deadline red-cooler)
      (date-event fg-alt)
      (date-holiday red-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow-cooler)
      (date-weekday magenta)
      (date-weekend blue-faint)

;;;; Prose mappings

      (prose-code blue-warmer)
      (prose-done cyan-cooler)
      (prose-macro green-cooler)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula info)
      (prose-tag yellow-faint)
      (prose-todo yellow-warmer)
      (prose-verbatim magenta-warmer)

;;;; Mail mappings

      (mail-cite-0 yellow-cooler)
      (mail-cite-1 red-cooler)
      (mail-cite-2 cyan-faint)
      (mail-cite-3 green-faint)
      (mail-part red-faint)
      (mail-recipient cyan-faint)
      (mail-subject magenta-warmer)
      (mail-other magenta-faint)

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

      (bg-term-green           green-warmer)
      (fg-term-green           green-warmer)
      (bg-term-green-bright    green-cooler)
      (fg-term-green-bright    green-cooler)

      (bg-term-yellow          yellow)
      (fg-term-yellow          yellow)
      (bg-term-yellow-bright   yellow-warmer)
      (fg-term-yellow-bright   yellow-warmer)

      (bg-term-blue            blue-warmer)
      (fg-term-blue            blue-warmer)
      (bg-term-blue-bright     blue-cooler)
      (fg-term-blue-bright     blue-cooler)

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

      (rainbow-0 yellow-cooler)
      (rainbow-1 magenta)
      (rainbow-2 blue-warmer)
      (rainbow-3 red-cooler)
      (rainbow-4 magenta-cooler)
      (rainbow-5 green-cooler)
      (rainbow-6 cyan)
      (rainbow-7 yellow)
      (rainbow-8 red-faint))
    "The `ef-reverie' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-reverie-palette-overrides nil
    "Overrides for `ef-reverie-palette'.

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

  (ef-themes-theme ef-reverie ef-reverie-palette ef-reverie-palette-overrides)

  (provide-theme 'ef-reverie))

;;; ef-reverie-theme.el ends here
