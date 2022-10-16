;;; ef-summer-theme.el --- Legible light theme with magenta, purple, gold, cyan colors -*- lexical-binding:t -*-

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

  (deftheme ef-summer "Legible light theme with magenta, purple, gold, cyan colors.")

  (defconst ef-summer-palette
    '(;; Basic tones
      (bg-main     "#fff2f3")
      (fg-main     "#4f4073")
      (bg-dim      "#f3e7eb")
      (fg-dim      "#786e74")
      (bg-alt      "#efd3e4")
      (fg-alt      "#af4988")

      (bg-active   "#dfc3d4")
      (bg-inactive "#f9eff0")

      ;; Basic hues for foreground values
      (red             "#d3303a")
      (red-warmer      "#e00033")
      (red-cooler      "#d50f7f")
      (red-faint       "#c24552")
      (green           "#217a3c")
      (green-warmer    "#4a7d00")
      (green-cooler    "#007f68")
      (green-faint     "#61756c")
      (yellow          "#a45f22")
      (yellow-warmer   "#b6532f")
      (yellow-cooler   "#b65050")
      (yellow-faint    "#9a5f6a")
      (blue            "#375ce6")
      (blue-warmer     "#5250ef")
      (blue-cooler     "#065fff")
      (blue-faint      "#6060d0")
      (magenta         "#ba35af")
      (magenta-warmer  "#cb1aaa")
      (magenta-cooler  "#8e44f3")
      (magenta-faint   "#bf3580")
      (cyan            "#1f6fbf")
      (cyan-warmer     "#3f6faf")
      (cyan-cooler     "#0f7b8f")
      (cyan-faint      "#5f60bf")

      ;; Basic hues for background values
      (bg-red      "#ff7f88")
      (bg-green    "#86df80")
      (bg-yellow   "#ffc200")
      (bg-blue     "#cbcfff")
      (bg-magenta  "#df8fff")
      (bg-cyan     "#88ccff")

      (bg-red-subtle      "#ffc3bf")
      (bg-green-subtle    "#b9f2c6")
      (bg-yellow-subtle   "#fff576")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#ffcdff")
      (bg-cyan-subtle     "#bfeaff")

      ;; Diffs
      (bg-added          "#caf4da")
      (bg-added-faint    "#dff6ea")
      (bg-added-refine   "#bae9cf")

      (bg-changed        "#ffdfb9")
      (bg-changed-faint  "#ffefcb")
      (bg-changed-refine "#ffcfa0")

      (bg-removed        "#ffcee0")
      (bg-removed-faint  "#ffdfe6")
      (bg-removed-refine "#f5b6c8")

      ;; Graphs
      (red-graph-0-bg     "#ef7969")
      (red-graph-1-bg     "#ffaab4")
      (green-graph-0-bg   "#4faa09")
      (green-graph-1-bg   "#8fef00")
      (yellow-graph-0-bg  "#ffcf00")
      (yellow-graph-1-bg  "#f9ff00")
      (blue-graph-0-bg    "#7090ff")
      (blue-graph-1-bg    "#9fc6ff")
      (magenta-graph-0-bg "#e07fff")
      (magenta-graph-1-bg "#fad0ff")
      (cyan-graph-0-bg    "#70d3f0")
      (cyan-graph-1-bg    "#afefff")

      ;; Special hues
      (bg-mode-line  "#ffa4dc") (fg-mode-line  "#341f58")
      (bg-accent     "#004f6f") (fg-accent     "#ffffff")
      (bg-completion "#f4cfff")
      (bg-hover      "#b4cfff")
      (bg-hover-alt  "#aaeccf")
      (bg-hl-line    "#ffd6e5")
      (bg-region     "#eecfff")
      (bg-paren      "#9fc0ef")
      (bg-err        "#ffd0e6") ; check with err
      (bg-warning    "#ffe5ba") ; check with warning
      (bg-info       "#bbefda") ; check with info

      (border        "#cabfca")
      (cursor        "#cf0090")
      (fg-intense    "#000000")

      (modeline-err     "#9f003f")
      (modeline-warning "#5f009f")
      (modeline-info    "#1240af")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af52")

      ;; Mappings
      (err red-warmer)
      (warning yellow-warmer)
      (info green-cooler)

      (link blue)
      (link-alt green-cooler)
      (date cyan-cooler)
      (name magenta-warmer)
      (keybind red-cooler)
      (prompt magenta-warmer)

      (builtin magenta)
      (comment yellow-faint)
      (constant red-cooler)
      (fnname magenta-warmer)
      (keyword magenta-cooler)
      (preprocessor green-warmer)
      (docstring cyan-faint)
      (string yellow-warmer)
      (type cyan-warmer)
      (variable blue-warmer)

      (rx-escape cyan-cooler) ; compare with `string'
      (rx-construct red-cooler)

      (accent-0 magenta-cooler)
      (accent-1 yellow)
      (accent-2 cyan-cooler)
      (accent-3 red)

      (mail-0 yellow-cooler)
      (mail-1 cyan-cooler)
      (mail-2 magenta-warmer)
      (mail-3 blue-warmer)
      (mail-4 magenta-cooler)
      (mail-5 green-warmer)

      (rainbow-0 magenta-warmer)
      (rainbow-1 magenta-cooler)
      (rainbow-2 yellow)
      (rainbow-3 cyan)
      (rainbow-4 magenta)
      (rainbow-5 blue-warmer)
      (rainbow-6 red-warmer)
      (rainbow-7 cyan-cooler)
      (rainbow-8 yellow-cooler))
    "The `ef-summer' palette.")

  (ef-themes-theme ef-summer ef-summer-palette)

  (provide-theme 'ef-summer))

;;; ef-summer-theme.el ends here
