;;; ef-deuteranopia-dark-theme.el --- Legible dark theme, optimized for red-green color deficiency -*- lexical-binding:t -*-

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

  ;; Most of the colors here, like the red and green hues, are defined
  ;; simply to preserve compatibility with the rest of the project.  We
  ;; don't actually rely on them for anything critical.
  (deftheme ef-deuteranopia-dark
    "Legible dark theme, optimized for red-green color deficiency.")

  (defconst ef-deuteranopia-dark-palette
    '(;; Basic tones
      (bg-main     "#000a1f")
      (fg-main     "#ddddee")
      (bg-dim      "#121f34")
      (fg-dim      "#7f8797")
      (bg-alt      "#243145")
      (fg-alt      "#90afef")

      (bg-active   "#445165")
      (bg-inactive "#0d1429")

      ;; Basic hues for foreground values
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

      ;; Basic hues for background values
      (bg-red      "#8d7f00")
      (bg-green    "#afcf20")
      (bg-yellow   "#5f5f00")
      (bg-blue     "#264fa0")
      (bg-magenta  "#6f6aff")
      (bg-cyan     "#007fae")

      (bg-red-subtle      "#72002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#603000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#5a105f")
      (bg-cyan-subtle     "#004065")

      ;; Diffs
      (bg-added          "#00234f")
      (bg-added-faint    "#00143f")
      (bg-added-refine   "#03395f")

      (bg-changed        "#2f123f")
      (bg-changed-faint  "#1f022f")
      (bg-changed-refine "#3f224f")

      (bg-removed        "#323200")
      (bg-removed-faint  "#281a00")
      (bg-removed-refine "#484800")

      ;; Graphs
      (red-graph-0-bg     "#705c3c")
      (red-graph-1-bg     "#504420")
      (green-graph-0-bg   "#4f666f")
      (green-graph-1-bg   "#204840")
      (yellow-graph-0-bg  "#c1c00a")
      (yellow-graph-1-bg  "#6f6f00")
      (blue-graph-0-bg    "#2fafef")
      (blue-graph-1-bg    "#1f2f8f")
      (magenta-graph-0-bg "#7f7f8e")
      (magenta-graph-1-bg "#4f4f5f")
      (cyan-graph-0-bg    "#376f9a")
      (cyan-graph-1-bg    "#00404f")

      ;; Special hues
      (bg-mode-line  "#003f8f") (fg-mode-line  "#ffffff")
      (bg-accent     "#ffaa33") (fg-accent     "#000000")
      (bg-completion "#343420")
      (bg-hover      "#4f4f00")
      (bg-hover-alt  "#00405f")
      (bg-hl-line    "#2e2e1b")
      (bg-region     "#223848")
      (bg-paren      "#0f4f9a")
      (bg-err        "#342d09") ; check with err
      (bg-warning    "#292900") ; check with warning
      (bg-info       "#002252") ; check with info

      (border        "#555a64")
      (cursor        "#ffff00")
      (fg-intense    "#ffffff")

      (modeline-err     "#ffff00")
      (modeline-warning "#ddb300")
      (modeline-info    "#aaaaff")

      (underline-err     "#ffff00")
      (underline-warning "#bfaf50")
      (underline-info    "#22cff2")

      ;; Conditional hues
      (bg-region-intense "#1f2f70")

      ;; Mappings
      (err yellow-warmer)
      (warning yellow)
      (info blue-cooler)

      (link blue)
      (link-alt yellow-cooler)
      (date yellow-cooler)
      (name blue-warmer)
      (keybind yellow-warmer)
      (identifier cyan-faint)
      (prompt yellow)

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

      (accent-0 blue-cooler)
      (accent-1 yellow-warmer)
      (accent-2 cyan-warmer)
      (accent-3 magenta-cooler)

      (mail-0 blue-warmer)
      (mail-1 yellow)
      (mail-2 blue-cooler)
      (mail-3 yellow-cooler)
      (mail-4 cyan)
      (mail-5 cyan-cooler)

      (rainbow-0 yellow-warmer)
      (rainbow-1 blue)
      (rainbow-2 yellow-cooler)
      (rainbow-3 blue-warmer)
      (rainbow-4 yellow)
      (rainbow-5 cyan-warmer)
      (rainbow-6 yellow-faint)
      (rainbow-7 blue-faint)
      (rainbow-8 magenta-faint))
    "The `ef-deuteranopia-dark' palette.")

  (ef-themes-theme ef-deuteranopia-dark ef-deuteranopia-dark-palette)

  (provide-theme 'ef-deuteranopia-dark))

;;;###theme-autoload
(put 'ef-deuteranopia-dark 'theme-properties '(:background-mode dark :kind color-scheme :family ef))

;;; ef-deuteranopia-dark-theme.el ends here
