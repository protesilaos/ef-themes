;;; ef-cherie-theme.el --- Legible dark theme with warm colors (mostly pink, magenta, gold) -*- lexical-binding:t -*-

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

  (deftheme ef-cherie "Legible dark theme with warm colors (mostly pink, magenta, gold)")

  (defconst ef-cherie-palette
    '(;; Basic tones
      (bg-main      "#190a0f")
      (fg-main      "#d3cfcf")
      (bg-dim       "#291f26")
      (fg-dim       "#808898")
      (bg-alt       "#392a2f")
      (fg-alt       "#bf9cdf")

      (bg-active    "#493a3f")
      (bg-inactive  "#1e1216")

      ;; Basic hues for foreground values
      (red             "#ff7359")
      (red-warmer      "#ff656f")
      (red-cooler      "#ff78aa")
      (red-faint       "#e47f72")
      (green           "#60b444")
      (green-warmer    "#80b25f")
      (green-cooler    "#60bf88")
      (green-faint     "#61a06c")
      (yellow          "#d59c6f")
      (yellow-warmer   "#ea9955")
      (yellow-cooler   "#f59280")
      (yellow-faint    "#bf9f8f")
      (blue            "#8fa5f6")
      (blue-warmer     "#a897ef")
      (blue-cooler     "#7fa5ff")
      (blue-faint      "#7f9ab4")
      (magenta         "#ef80bf")
      (magenta-warmer  "#f470df")
      (magenta-cooler  "#df7fff")
      (magenta-faint   "#cc9bcf")
      (cyan            "#8fbaef")
      (cyan-warmer     "#9ac0e4")
      (cyan-cooler     "#8fcfdf")
      (cyan-faint      "#aac0cf")

      ;; Basic hues for background values
      (bg-red      "#bd1f30")
      (bg-green    "#20a020")
      (bg-yellow   "#847020")
      (bg-blue     "#3633b0")
      (bg-magenta  "#b04fcf")
      (bg-cyan     "#2270be")

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

      (bg-removed        "#4f0c28")
      (bg-removed-faint  "#320a14")
      (bg-removed-refine "#6f1a35")

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
      (bg-mode-line  "#771a4f") (fg-mode-line  "#ffcfdf")
      (bg-accent     "#cca8ff") (fg-accent     "#000000")
      (bg-completion "#4a1937")
      (bg-hover      "#303f6f")
      (bg-hover-alt  "#66364f")
      (bg-hl-line    "#401f33")
      (bg-region     "#232f3f")
      (bg-paren      "#3f5f75")
      (bg-err        "#370f12") ; check with err
      (bg-warning    "#352905") ; check with warning
      (bg-info       "#1c2b00") ; check with info

      (border        "#695960")
      (cursor        "#ff5aaf")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff9f1f")
      (modeline-warning "#c0bf30")
      (modeline-info    "#6fefaf")

      (underline-err     "#df2f2f")
      (underline-warning "#c0b000")
      (underline-info    "#22b022")

      ;; Mappings
      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link magenta-cooler)
      (link-alt yellow)
      (date magenta)
      (name yellow-cooler)
      (keybind yellow-warmer)
      (prompt magenta-warmer)

      (builtin blue-warmer)
      (comment yellow-faint)
      (constant red-cooler)
      (fnname yellow-cooler)
      (keyword magenta)
      (preprocessor cyan)
      (docstring magenta-faint)
      (string yellow)
      (type magenta-warmer)
      (variable magenta-cooler)

      (rx-escape cyan-warmer) ; compare with `string'
      (rx-construct red)

      (accent-0 magenta-warmer)
      (accent-1 yellow)
      (accent-2 blue-warmer)
      (accent-3 red)

      (mail-0 magenta)
      (mail-1 yellow)
      (mail-2 blue-warmer)
      (mail-3 magenta-warmer)
      (mail-4 magenta-cooler)
      (mail-5 green-warmer)

      (rainbow-0 magenta-warmer)
      (rainbow-1 yellow)
      (rainbow-2 magenta)
      (rainbow-3 cyan)
      (rainbow-4 yellow-cooler)
      (rainbow-5 blue-warmer)
      (rainbow-6 red-cooler)
      (rainbow-7 cyan-warmer)
      (rainbow-8 magenta-cooler))
    "The `ef-cherie' palette.")

  (ef-themes-theme ef-cherie ef-cherie-palette)

  (provide-theme 'ef-cherie))

;;; ef-cherie-theme.el ends here
