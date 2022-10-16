;;; ef-trio-light-theme.el --- Legible light theme with magenta, blue, and teal colors -*- lexical-binding:t -*-

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

  (deftheme ef-trio-light "Legible light theme with magenta, blue, and teal colors.")

  (defconst ef-trio-light-palette
    '(;; Basic tones
      (bg-main     "#f8f5ff")
      (fg-main     "#4f3363")
      (bg-dim      "#f0ecf4")
      (fg-dim      "#786e74")
      (bg-alt      "#e3e0e9")
      (fg-alt      "#3f7668")

      (bg-active   "#d3d0d9")
      (bg-inactive "#f3f1fa")

      ;; Basic hues for foreground values
      (red             "#c3303a")
      (red-warmer      "#d03033")
      (red-cooler      "#c01f5f")
      (red-faint       "#c24552")
      (green           "#057800")
      (green-warmer    "#4f7d0f")
      (green-cooler    "#007f6f")
      (green-faint     "#61756c")
      (yellow          "#a45f22")
      (yellow-warmer   "#b8532f")
      (yellow-cooler   "#b65050")
      (yellow-faint    "#a05b5f")
      (blue            "#375cd6")
      (blue-warmer     "#5165e4")
      (blue-cooler     "#065fbf")
      (blue-faint      "#6060d0")
      (magenta         "#ad45ba")
      (magenta-warmer  "#c035aa")
      (magenta-cooler  "#705ae3")
      (magenta-faint   "#804fb0")
      (cyan            "#1f6fbf")
      (cyan-warmer     "#3f6faf")
      (cyan-cooler     "#0f7a9d")
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
      (bg-mode-line  "#ddb4ff") (fg-mode-line  "#241f48")
      (bg-accent     "#cc2288") (fg-accent     "#ffffff")
      (bg-completion "#f4cfff")
      (bg-hover      "#aaeccf")
      (bg-hover-alt  "#b4cfff")
      (bg-hl-line    "#cfe6ff")
      (bg-region     "#eed0ff")
      (bg-paren      "#dfadaf")
      (bg-err        "#ffdfe6") ; check with err
      (bg-warning    "#ffe5bf") ; check with warning
      (bg-info       "#d0efdf") ; check with info

      (border        "#cabfca")
      (cursor        "#4f45ff")
      (fg-intense    "#000000")

      (modeline-err     "#980000")
      (modeline-warning "#5f4400")
      (modeline-info    "#1042af")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af52")

      ;; Mappings
      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link cyan)
      (link-alt magenta)
      (date cyan-cooler)
      (name blue)
      (keybind magenta-warmer)
      (prompt blue-cooler)

      (builtin magenta-cooler)
      (comment yellow-faint)
      (constant magenta-warmer)
      (fnname blue-warmer)
      (keyword magenta)
      (preprocessor red-cooler)
      (docstring magenta-faint)
      (string green-cooler)
      (type cyan-cooler)
      (variable blue)

      (rx-escape blue-warmer) ; compare with `string'
      (rx-construct red)

      (accent-0 magenta-warmer)
      (accent-1 green-cooler)
      (accent-2 blue-warmer)
      (accent-3 yellow)

      (mail-0 blue-warmer)
      (mail-1 magenta-warmer)
      (mail-2 green-cooler)
      (mail-3 magenta-cooler)
      (mail-4 cyan)
      (mail-5 yellow-cooler)

      (rainbow-0 magenta-warmer)
      (rainbow-1 blue-warmer)
      (rainbow-2 green-cooler)
      (rainbow-3 magenta)
      (rainbow-4 cyan)
      (rainbow-5 green-warmer)
      (rainbow-6 magenta-cooler)
      (rainbow-7 cyan-warmer)
      (rainbow-8 yellow-cooler))
    "The `ef-trio-light' palette.")

  (ef-themes-theme ef-trio-light ef-trio-light-palette)

  (provide-theme 'ef-trio-light))

;;; ef-trio-light-theme.el ends here
