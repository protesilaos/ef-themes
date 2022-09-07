;;; ef-autumn-theme.el --- Legible dark theme with warm, varied colors (red, yellow, green, teal) -*- lexical-binding:t -*-

;; Copyright (C) 2022  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Ef-Themes Development <~protesilaos/ef-themes@lists.sr.ht>
;; URL: https://git.sr.ht/~protesilaos/ef-themes
;; Mailing-List: https://lists.sr.ht/~protesilaos/ef-themes
;; Keywords: faces, theme, accessibility

;; This file is part of GNU Emacs.

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

  (deftheme ef-autumn "Legible dark theme with warm, varied colors (red, yellow, green, teal).")

  (defconst ef-autumn-palette
    '(;; Basic tones
      (bg-main     "#0f0e06")
      (fg-main     "#cfbcba")
      (bg-dim      "#1f1b19")
      (fg-dim      "#887c8a")
      (bg-alt      "#36322f")
      (fg-alt      "#70a89f")

      (bg-active   "#46423f")
      (bg-inactive "#14130a")

      ;; Basic hues for foreground values
      (red             "#ef656a")
      (red-warmer      "#f06a3f")
      (red-cooler      "#ff7a7f")
      (red-faint       "#d08f72")
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
      (magenta         "#d570af")
      (magenta-warmer  "#e580ea")
      (magenta-cooler  "#af8aff")
      (magenta-faint   "#c590af")
      (cyan            "#4fb0cf")
      (cyan-warmer     "#6fafff")
      (cyan-cooler     "#3dbbb0")
      (cyan-faint      "#82a0af")

      ;; Basic hues for background values
      (bg-red      "#cd2f30")
      (bg-green    "#20a020")
      (bg-yellow   "#9a4f20")
      (bg-blue     "#3f43af")
      (bg-magenta  "#c040cf")
      (bg-cyan     "#027080")

      (bg-red-subtle      "#77002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#693200")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#611062")
      (bg-cyan-subtle     "#004065")

      ;; Diffs
      (bg-added          "#172c0f")
      (bg-added-faint    "#0a1f00")
      (bg-added-refine   "#203f10")

      (bg-changed        "#323200")
      (bg-changed-faint  "#281a00")
      (bg-changed-refine "#484800")

      (bg-removed        "#46120a")
      (bg-removed-faint  "#330a00")
      (bg-removed-refine "#6a1a16")

      ;; Graphs
      (red-graph-0-bg     "#b52c2c")
      (red-graph-1-bg     "#702020")
      (green-graph-0-bg   "#4fd100")
      (green-graph-1-bg   "#007800")
      (yellow-graph-0-bg  "#f1e00a")
      (yellow-graph-1-bg  "#b08600")
      (blue-graph-0-bg    "#2fafef")
      (blue-graph-1-bg    "#1f2f8f")
      (magenta-graph-0-bg "#bf94fe")
      (magenta-graph-1-bg "#5f509f")
      (cyan-graph-0-bg    "#47dfea")
      (cyan-graph-1-bg    "#00808f")

      ;; Special hues
      (bg-mode-line  "#692a12") (fg-mode-line  "#feeeca")
      (bg-accent     "#ffa200") (fg-accent     "#000000")
      (bg-completion "#36213a")
      (bg-hover      "#265f4a")
      (bg-hover-alt  "#6f345a")
      (bg-hl-line    "#302a3a")
      (bg-region     "#3f1020")
      (bg-paren      "#7f2d40")
      (bg-err        "#361400") ; check with err
      (bg-warning    "#332800") ; check with warning
      (bg-info       "#152800") ; check with info

      (border        "#4f4945")
      (cursor        "#ffaa33")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff9fbf")
      (modeline-warning "#dfcf33")
      (modeline-info    "#4fdf5f")

      ;; Mappings
      (err red-warmer)
      (warning yellow-warmer)
      (info green-cooler)

      (link yellow)
      (link-alt cyan-cooler)
      (date yellow-cooler)
      (name green-warmer)
      (keybind red-warmer)
      (prompt cyan-cooler)

      (builtin red-cooler)
      (comment yellow-faint)
      (constant green-warmer)
      (fnname cyan-cooler)
      (keyword yellow)
      (preprocessor magenta)
      (docstring green-faint)
      (string red-warmer)
      (type green)
      (variable cyan-warmer)

      (rx-escape green-cooler) ; compare with `string'
      (rx-construct magenta-cooler)

      (accent-0 green-cooler)
      (accent-1 yellow-warmer)
      (accent-2 cyan-cooler)
      (accent-3 magenta-cooler)

      (mail-0 yellow-warmer)
      (mail-1 green-cooler)
      (mail-2 red-warmer)
      (mail-3 magenta)
      (mail-4 green-warmer)
      (mail-5 cyan)

      (rainbow-0 yellow-warmer)
      (rainbow-1 green-warmer)
      (rainbow-2 red)
      (rainbow-3 cyan-cooler)
      (rainbow-4 yellow-cooler)
      (rainbow-5 blue)
      (rainbow-6 red-cooler)
      (rainbow-7 green)
      (rainbow-8 yellow))
    "The `ef-autumn' palette.")

  (ef-themes-theme ef-autumn ef-autumn-palette)

  (provide-theme 'ef-autumn))

;;; ef-autumn-theme.el ends here
