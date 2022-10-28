;;; ef-dark-theme.el --- Legible dark theme with blue, magenta, cyan, purple colors -*- lexical-binding:t -*-

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

  (deftheme ef-dark "Legible dark theme with blue, magenta, cyan, purple colors.")

  (defconst ef-dark-palette
    '(;; Basic tones
      (bg-main     "#000000")
      (fg-main     "#d0d0d0")
      (bg-dim      "#1a1a1a")
      (fg-dim      "#857f8f")
      (bg-alt      "#2b2b2b")
      (fg-alt      "#89afef")

      (bg-active   "#3b3b3b")
      (bg-inactive "#0c0c0c")

      ;; Basic hues for foreground values
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
      (magenta-faint   "#c57faf")
      (cyan            "#4fbaef")
      (cyan-warmer     "#6fafff")
      (cyan-cooler     "#1dbfcf")
      (cyan-faint      "#8aa0df")

      ;; Basic hues for background values
      (bg-red      "#cd2f30")
      (bg-green    "#20a020")
      (bg-yellow   "#8f5040")
      (bg-blue     "#4648d0")
      (bg-magenta  "#a050cf")
      (bg-cyan     "#2270be")

      (bg-red-subtle      "#72002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#603000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#5a105f")
      (bg-cyan-subtle     "#004065")

      ;; Diffs
      (bg-added          "#00331f")
      (bg-added-faint    "#002410")
      (bg-added-refine   "#03492f")

      (bg-changed        "#323200")
      (bg-changed-faint  "#281a00")
      (bg-changed-refine "#484800")

      (bg-removed        "#4a1119")
      (bg-removed-faint  "#320a0f")
      (bg-removed-refine "#751a1f")

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
      (bg-mode-line  "#2a2a75") (fg-mode-line  "#e0e0ff")
      (bg-accent     "#25adff") (fg-accent     "#000000")
      (bg-completion "#0f2d4a")
      (bg-hover      "#004a5f")
      (bg-hover-alt  "#551f5a")
      (bg-hl-line    "#002435")
      (bg-region     "#2a234a")
      (bg-paren      "#20577a")
      (bg-err        "#330d09") ; check with err
      (bg-warning    "#332600") ; check with warning
      (bg-info       "#002212") ; check with info

      (border        "#4f4f5f")
      (cursor        "#ff76ff")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff80af")
      (modeline-warning "#dfcf33")
      (modeline-info    "#2fc82f")

      (underline-err     "#df2f2f")
      (underline-warning "#c0b000")
      (underline-info    "#22b022")

      ;; Mappings
      (err red-warmer)
      (warning yellow)
      (info green)

      (link cyan)
      (link-alt magenta)
      (date green-cooler)
      (name blue-warmer)
      (keybind blue-cooler)
      (prompt green-cooler)

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

      (accent-0 blue)
      (accent-1 magenta-warmer)
      (accent-2 green-cooler)
      (accent-3 red)

      (mail-0 blue)
      (mail-1 magenta-warmer)
      (mail-2 green-cooler)
      (mail-3 yellow-cooler)
      (mail-4 magenta-cooler)
      (mail-5 cyan)

      (rainbow-0 green-cooler)
      (rainbow-1 blue)
      (rainbow-2 magenta-warmer)
      (rainbow-3 cyan-cooler)
      (rainbow-4 yellow-cooler)
      (rainbow-5 magenta-cooler)
      (rainbow-6 red-cooler)
      (rainbow-7 green-warmer)
      (rainbow-8 yellow))
    "The `ef-dark' palette.")

  (ef-themes-theme ef-dark ef-dark-palette)

  (provide-theme 'ef-dark))

;;; ef-dark-theme.el ends here
