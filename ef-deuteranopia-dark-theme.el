;;; ef-deuteranopia-dark-theme.el --- Legible dark theme, optimized for red-green color deficiency -*- lexical-binding:t -*-

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

  ;; Most of the colors here, like the red and green hues, are defined
  ;; simply to preserve compatibility with the rest of the project.  We
  ;; don't actually rely on them for anything critical.
;;;###theme-autoload
  (deftheme ef-deuteranopia-dark
    "Legible dark theme, optimized for red-green color deficiency."
    :background-mode 'dark
    :kind 'color-scheme
    :family 'ef)

  (defconst ef-deuteranopia-dark-palette
    '(
;;; Basic values

      (bg-main     "#000a1f")
      (fg-main     "#ddddee")
      (bg-dim      "#121f34")
      (fg-dim      "#7f8797")
      (bg-alt      "#243145")
      (fg-alt      "#90afef")

      (bg-active   "#445165")
      (bg-inactive "#0d1429")

;;; Basic hues for foreground values

      (red             "#cf8560")
      (red-warmer      "#e47360")
      (red-cooler      "#cf7a7a")
      (red-faint       "#b57f82")
      (green           "#3faa26")
      (green-warmer    "#7aad0f")
      (green-cooler    "#3fa672")
      (green-faint     "#61a06c")
      (yellow          "#aa9f32")
      (yellow-warmer   "#cfaf00")
      (yellow-cooler   "#bfaf7a")
      (yellow-faint    "#af9a6a")
      (blue            "#3f90f0")
      (blue-warmer     "#6a9fff")
      (blue-cooler     "#009fff")
      (blue-faint      "#7a94df")
      (magenta         "#b379bf")
      (magenta-warmer  "#af80ea")
      (magenta-cooler  "#9f95ff")
      (magenta-faint   "#c59fcf")
      (cyan            "#5faaef")
      (cyan-warmer     "#7fafff")
      (cyan-cooler     "#0db0ff")
      (cyan-faint      "#8aa0df")

;;; Basic hues for background values

      (bg-red-intense     "#8d7f00")
      (bg-green-intense   "#afcf20")
      (bg-yellow-intense  "#5f5f00")
      (bg-blue-intense    "#266fd0")
      (bg-magenta-intense "#6f60c0")
      (bg-cyan-intense    "#007fae")

      (bg-red-subtle      "#72002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#603000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#5a105f")
      (bg-cyan-subtle     "#004065")

;;; Diffs

      (bg-added          "#00234f")
      (bg-added-faint    "#00143f")
      (bg-added-refine   "#03395f")
      (fg-added          "#c4d5ff")

      (bg-changed        "#2f123f")
      (bg-changed-faint  "#1f022f")
      (bg-changed-refine "#3f224f")
      (fg-changed        "#e3cfff")

      (bg-removed        "#323200")
      (bg-removed-faint  "#281a00")
      (bg-removed-refine "#484800")
      (fg-removed        "#d4d48f")

;;; Graphs

      (bg-graph-red-0     "#bf6000")
      (bg-graph-red-1     "#733500")
      (bg-graph-green-0   "#6fbf8f")
      (bg-graph-green-1   "#2f5f4f")
      (bg-graph-yellow-0  "#c1c00a")
      (bg-graph-yellow-1  "#7f6640")
      (bg-graph-blue-0    "#0f90ef")
      (bg-graph-blue-1    "#1f2f8f")
      (bg-graph-magenta-0 "#7f7f8e")
      (bg-graph-magenta-1 "#4f4f5f")
      (bg-graph-cyan-0    "#376f9a")
      (bg-graph-cyan-1    "#00404f")

;;; Special hues

      (bg-mode-line       "#003f8f")
      (fg-mode-line       "#ffffff")
      (bg-completion      "#343420")
      (bg-hover           "#4f4f00")
      (bg-hover-secondary "#00405f")
      (bg-hl-line         "#2e2e1b")
      (bg-paren           "#0f4f9a")
      (bg-err             "#342b00") ; check with err
      (bg-warning         "#32351f") ; check with warning
      (bg-info            "#002252") ; check with info

      (border        "#555a64")
      (cursor        "#ffff00")
      (fg-intense    "#ffffff")

      (modeline-err     "#ffff00")
      (modeline-warning "#ddb300")
      (modeline-info    "#aaaaff")

      (underline-err     "#ffff00")
      (underline-warning "#bfaf50")
      (underline-info    "#22cff2")

      (bg-char-0 "#0050af")
      (bg-char-1 "#7f1f7f")
      (bg-char-2 "#625a00")

;;; Mappings

;;;; General mappings

      (bg-fringe unspecified)
      (fg-fringe unspecified)

      (err yellow-warmer)
      (warning yellow-cooler)
      (info blue-cooler)

      (link blue)
      (link-alt yellow-cooler)
      (name blue-warmer)
      (keybind yellow-warmer)
      (identifier cyan-faint)
      (prompt blue-cooler)

      (bg-region "#223848")
      (fg-region unspecified)

;;;; Code mappings

      (builtin blue-warmer)
      (comment yellow-faint)
      (constant blue-cooler)
      (fnname yellow-cooler)
      (keyword yellow-warmer)
      (preprocessor yellow)
      (docstring cyan-faint)
      (string blue)
      (type magenta-cooler)
      (variable cyan-cooler)
      (rx-escape yellow-faint) ; compare with `string'
      (rx-construct yellow-warmer)

;;;; Accent mappings

      (accent-0 blue-cooler)
      (accent-1 yellow-warmer)
      (accent-2 cyan-warmer)
      (accent-3 magenta-cooler)

;;;; Date mappings

      (date-common yellow-cooler)
      (date-deadline yellow-warmer)
      (date-event fg-alt)
      (date-holiday cyan-warmer)
      (date-now fg-main)
      (date-range fg-alt)
      (date-scheduled yellow-cooler)
      (date-weekday cyan)
      (date-weekend magenta-faint)

;;;; Prose mappings

      (prose-code yellow-warmer)
      (prose-done blue-cooler)
      (prose-macro cyan-warmer)
      (prose-metadata fg-dim)
      (prose-metadata-value fg-alt)
      (prose-table fg-alt)
      (prose-table-formula err)
      (prose-tag fg-alt)
      (prose-todo yellow-warmer)
      (prose-verbatim blue-cooler)

;;;; Mail mappings

      (mail-cite-0 blue-warmer)
      (mail-cite-1 yellow)
      (mail-cite-2 blue-cooler)
      (mail-cite-3 yellow-cooler)
      (mail-part cyan-faint)
      (mail-recipient blue-warmer)
      (mail-subject cyan-cooler)
      (mail-other cyan)

;;;; Search mappings

      (bg-search-current bg-yellow-intense)
      (bg-search-lazy bg-blue-intense)
      (bg-search-replace bg-magenta-intense)

      (bg-search-rx-group-0 bg-cyan-intense)
      (bg-search-rx-group-1 bg-magenta-intense)
      (bg-search-rx-group-2 bg-blue-subtle)
      (bg-search-rx-group-3 bg-yellow-subtle)

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
      (rainbow-1 blue)
      (rainbow-2 yellow-cooler)
      (rainbow-3 blue-warmer)
      (rainbow-4 yellow)
      (rainbow-5 cyan-warmer)
      (rainbow-6 yellow-faint)
      (rainbow-7 blue-faint)
      (rainbow-8 magenta-faint))
    "The `ef-deuteranopia-dark' palette.
Color values have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a color that already exists
in the palette and is associated with a HEX-VALUE.")

  (defcustom ef-deuteranopia-dark-palette-overrides nil
    "Overrides for `ef-deuteranopia-dark-palette'.

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

  (ef-themes-theme ef-deuteranopia-dark ef-deuteranopia-dark-palette ef-deuteranopia-dark-palette-overrides)

  (provide-theme 'ef-deuteranopia-dark))

;;; ef-deuteranopia-dark-theme.el ends here
