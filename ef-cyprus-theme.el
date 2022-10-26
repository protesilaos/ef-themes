;;; ef-cyprus-theme.el --- Legible light theme with green, yellow, teal, red colors -*- lexical-binding:t -*-

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

  (deftheme ef-cyprus "Legible light theme with green, yellow, teal, red colors.")

  (defconst ef-cyprus-palette
    '(;; Basic tones
      (bg-main     "#fcf7ef")
      (fg-main     "#242521")
      (bg-dim      "#f0ece0")
      (fg-dim      "#59786f")
      (bg-alt      "#e5e3d8")
      (fg-alt      "#7f475a")

      (bg-active   "#d5d3c8")
      (bg-inactive "#f8f3ea")

      ;; Basic hues for foreground values
      (red             "#9f0d0f")
      (red-warmer      "#dd0020")
      (red-cooler      "#ca3400")
      (red-faint       "#b05350")
      (green           "#006f00")
      (green-warmer    "#557400")
      (green-cooler    "#00824f")
      (green-faint     "#4f654c")
      (yellow          "#a7601f")
      (yellow-warmer   "#bf4400")
      (yellow-cooler   "#a2604f")
      (yellow-faint    "#8f6f4a")
      (blue            "#375cc6")
      (blue-warmer     "#444fcf")
      (blue-cooler     "#065fbf")
      (blue-faint      "#4a659f")
      (magenta         "#9a456f")
      (magenta-warmer  "#bf456a")
      (magenta-cooler  "#8448aa")
      (magenta-faint   "#804f60")
      (cyan            "#1f70af")
      (cyan-warmer     "#3f6faf")
      (cyan-cooler     "#007a9f")
      (cyan-faint      "#4f677f")

      ;; Basic hues for background values
      (bg-red      "#ff8f88")
      (bg-green    "#96df80")
      (bg-yellow   "#efbf00")
      (bg-blue     "#cfceff")
      (bg-magenta  "#df9fff")
      (bg-cyan     "#88cfd0")

      (bg-red-subtle      "#ffc6bf")
      (bg-green-subtle    "#c4f2af")
      (bg-yellow-subtle   "#f0f07f")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#fad3ff")
      (bg-cyan-subtle     "#bfefff")

      ;; Diffs
      (bg-added          "#c1f2d1")
      (bg-added-faint    "#d8f8e1")
      (bg-added-refine   "#b1e4c1")

      (bg-changed        "#ffdfb9")
      (bg-changed-faint  "#ffefcb")
      (bg-changed-refine "#ffcfa0")

      (bg-removed        "#ffd3d4")
      (bg-removed-faint  "#ffe6e1")
      (bg-removed-refine "#f6c0c9")

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
      (bg-mode-line  "#c0df6f") (fg-mode-line  "#142010")
      (bg-accent     "#802000") (fg-accent     "#ffffff")
      (bg-completion "#e6e4bf")
      (bg-hover      "#efc26f")
      (bg-hover-alt  "#afc0f0")
      (bg-hl-line    "#f0e0d4")
      (bg-region     "#e0e7e5")
      (bg-paren      "#9fcfdf")
      (bg-err        "#ffd4bf") ; check with err
      (bg-warning    "#f0e8ba") ; check with warning
      (bg-info       "#d0efbf") ; check with info

      (border        "#c4c0b6")
      (cursor        "#007f00")
      (fg-intense    "#000000")

      (modeline-err     "#950f0f")
      (modeline-warning "#7f00af")
      (modeline-info    "#0040af")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af5f")

      ;; Mappings
      (err red-warmer)
      (warning yellow)
      (info green)

      (link yellow)
      (link-alt cyan)
      (date yellow-cooler)
      (name green-warmer)
      (keybind red)
      (prompt green)

      (builtin green-warmer)
      (comment yellow-faint)
      (constant green-cooler)
      (fnname yellow)
      (keyword green)
      (preprocessor yellow-cooler)
      (docstring cyan-faint)
      (string red-cooler)
      (type blue-warmer)
      (variable cyan-cooler)

      (rx-escape magenta-cooler) ; compare with `string'
      (rx-construct cyan-cooler)

      (accent-0 green)
      (accent-1 red-cooler)
      (accent-2 cyan-cooler)
      (accent-3 yellow)

      (mail-0 green-warmer)
      (mail-1 yellow-cooler)
      (mail-2 cyan)
      (mail-3 green-cooler)
      (mail-4 green)
      (mail-5 red)

      (rainbow-0 yellow)
      (rainbow-1 green-warmer)
      (rainbow-2 yellow-warmer)
      (rainbow-3 cyan-warmer)
      (rainbow-4 green-cooler)
      (rainbow-5 magenta)
      (rainbow-6 yellow-cooler)
      (rainbow-7 cyan-cooler)
      (rainbow-8 red))
    "The `ef-cyprus' palette.")

  (ef-themes-theme ef-cyprus ef-cyprus-palette)

  (provide-theme 'ef-cyprus))

;;; ef-cyprus-theme.el ends here
