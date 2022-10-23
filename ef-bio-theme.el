;;; ef-bio-theme.el --- Legible dark theme with green, teal, blue, purple colors -*- lexical-binding:t -*-

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

  (deftheme ef-bio "Legible dark theme with green, teal, blue, purple colors.")

  (defconst ef-bio-palette
    '(;; Basic tones
      (bg-main      "#111111")
      (fg-main      "#cfdfd5")
      (bg-dim       "#222522")
      (fg-dim       "#808f80")
      (bg-alt       "#303230")
      (fg-alt       "#8fcfaf")

      (bg-active    "#404240")
      (bg-inactive  "#161916")

      ;; Basic hues for foreground values
      (red             "#ef6560")
      (red-warmer      "#f47360")
      (red-cooler      "#ff778f")
      (red-faint       "#d56f72")
      (green           "#3fb83f")
      (green-warmer    "#7fc500")
      (green-cooler    "#00c089")
      (green-faint     "#7fc07f")
      (yellow          "#d4aa02")
      (yellow-warmer   "#e09a0f")
      (yellow-cooler   "#cfc04f")
      (yellow-faint    "#b7a07f")
      (blue            "#37aff6")
      (blue-warmer     "#78afff")
      (blue-cooler     "#32cfef")
      (blue-faint      "#6ab4cf")
      (magenta         "#d38faf")
      (magenta-warmer  "#e490df")
      (magenta-cooler  "#af9fff")
      (magenta-faint   "#caa5bf")
      (cyan            "#6fc5ef")
      (cyan-warmer     "#7fcfdf")
      (cyan-cooler     "#5dc0aa")
      (cyan-faint      "#7fb4cf")

      ;; Basic hues for background values
      (bg-red      "#bd1f30")
      (bg-green    "#20a020")
      (bg-yellow   "#845020")
      (bg-blue     "#2f439f")
      (bg-magenta  "#b04fcf")
      (bg-cyan     "#027080")

      (bg-red-subtle      "#6a002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#5a3000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#50105a")
      (bg-cyan-subtle     "#004065")

      ;; Diffs
      (bg-added          "#00301f")
      (bg-added-faint    "#002110")
      (bg-added-refine   "#03462f")

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
      (bg-mode-line  "#00552f") (fg-mode-line  "#d0ffe0")
      (bg-accent     "#b59ffa") (fg-accent     "#000000")
      (bg-completion "#0f3c2f")
      (bg-hover      "#4f3f9a")
      (bg-hover-alt  "#003e5f")
      (bg-hl-line    "#00331f")
      (bg-region     "#3a3027")
      (bg-paren      "#664950")
      (bg-err        "#361400") ; check with err
      (bg-warning    "#332800") ; check with warning
      (bg-info       "#132b00") ; check with info

      (border        "#525959")
      (cursor        "#35f038")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff9fbf")
      (modeline-warning "#dfcf33")
      (modeline-info    "#7fdfff")

      (underline-err     "#df2f2f")
      (underline-warning "#c0b000")
      (underline-info    "#22b022")

      ;; Mappings
      (err red)
      (warning yellow-cooler)
      (info green)

      (link green-cooler)
      (link-alt cyan-cooler)
      (date cyan-cooler)
      (name green)
      (keybind green)
      (prompt green-warmer)

      (builtin green)
      (comment yellow-faint)
      (constant blue)
      (fnname green-warmer)
      (keyword green-cooler)
      (preprocessor green)
      (docstring green-faint)
      (string magenta-cooler)
      (type cyan-warmer)
      (variable blue-warmer)

      (rx-escape yellow-cooler) ; compare with `string'
      (rx-construct green)

      (accent-0 green-cooler)
      (accent-1 blue-warmer)
      (accent-2 magenta-warmer)
      (accent-3 green-warmer)

      (mail-0 green-cooler)
      (mail-1 blue-warmer)
      (mail-2 green-warmer)
      (mail-3 magenta-cooler)
      (mail-4 green)
      (mail-5 blue)

      (rainbow-0 green-cooler)
      (rainbow-1 green-warmer)
      (rainbow-2 cyan-cooler)
      (rainbow-3 magenta-cooler)
      (rainbow-4 cyan-warmer)
      (rainbow-5 yellow-cooler)
      (rainbow-6 blue)
      (rainbow-7 cyan)
      (rainbow-8 magenta))
    "The `ef-bio' palette.")

  (ef-themes-theme ef-bio ef-bio-palette)

  (provide-theme 'ef-bio))

;;; ef-bio-theme.el ends here
