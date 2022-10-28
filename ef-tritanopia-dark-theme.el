;;; ef-tritanopia-dark-theme.el --- Legible dark theme, optimized for blue-yellow color deficiency -*- lexical-binding:t -*-

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

  ;; Most of the colors here, like the blue and green hues, are defined
  ;; simply to preserve compatibility with the rest of the project.  We
  ;; don't actually rely on them for anything critical.
  (deftheme ef-tritanopia-dark "Legible dark theme, optimized for blue-yellow color deficiency.")

  (defconst ef-tritanopia-dark-palette
    '(;; Basic tones
      (bg-main      "#15050f")
      (fg-main      "#dfd0d5")
      (bg-dim       "#221a20")
      (fg-dim       "#908890")
      (bg-alt       "#30252a")
      (fg-alt       "#afdaef")

      (bg-active    "#40353a")
      (bg-inactive  "#1a1315")

      ;; Basic hues for foreground values
      (red             "#cf4f5f")
      (red-warmer      "#df4f4f")
      (red-cooler      "#d24f7f")
      (red-faint       "#b07f7f")
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
      (magenta         "#b2608f")
      (magenta-warmer  "#c560aa")
      (magenta-cooler  "#a6699f")
      (magenta-faint   "#c590af")
      (cyan            "#3fafcf")
      (cyan-warmer     "#3f9aaf")
      (cyan-cooler     "#4fafaf")
      (cyan-faint      "#82a0af")

      ;; Basic hues for background values
      (bg-red      "#aa0010")
      (bg-green    "#5f806f")
      (bg-yellow   "#950f4f")
      (bg-blue     "#165f70")
      (bg-magenta  "#b07faf")
      (bg-cyan     "#007faa")

      (bg-red-subtle      "#72002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#603000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#5a105f")
      (bg-cyan-subtle     "#004065")

      ;; Diffs
      (bg-added          "#002d2f")
      (bg-added-faint    "#001f28")
      (bg-added-refine   "#003b3f")

      (bg-changed        "#30234f")
      (bg-changed-faint  "#30143f")
      (bg-changed-refine "#33395f")

      (bg-removed        "#3d091f")
      (bg-removed-faint  "#27040f")
      (bg-removed-refine "#5b0f26")

      ;; Graphs
      (red-graph-0-bg     "#b52c2c")
      (red-graph-1-bg     "#702020")
      (green-graph-0-bg   "#afd1c0")
      (green-graph-1-bg   "#607a8f")
      (yellow-graph-0-bg  "#facfd6")
      (yellow-graph-1-bg  "#b57b85")
      (blue-graph-0-bg    "#4f9fdf")
      (blue-graph-1-bg    "#004559")
      (magenta-graph-0-bg "#b6427f")
      (magenta-graph-1-bg "#7f506f")
      (cyan-graph-0-bg    "#57dfea")
      (cyan-graph-1-bg    "#00808f")

      ;; Special hues
      (bg-mode-line  "#671822") (fg-mode-line  "#ffffff")
      (bg-accent     "#7fccee") (fg-accent     "#000000")
      (bg-completion "#441824")
      (bg-hover      "#00405f")
      (bg-hover-alt  "#5e3e5b")
      (bg-hl-line    "#3f1515")
      (bg-region     "#202d3f")
      (bg-paren      "#2f5f7a")
      (bg-err        "#340f0f") ; check with err
      (bg-warning    "#371430") ; check with warning
      (bg-info       "#00253a") ; check with info

      (border        "#555564")
      (cursor        "#fd3333")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff7fbf")
      (modeline-warning "#df9f93")
      (modeline-info    "#4fcfef")

      (underline-err     "#ff0f1f")
      (underline-warning "#ffafa0")
      (underline-info    "#22ffd2")

      ;; Mappings
      (err red-warmer)
      (warning magenta)
      (info cyan)

      (link cyan)
      (link-alt magenta-cooler)
      (date cyan-cooler)
      (name magenta)
      (keybind red-cooler)
      (prompt cyan)

      (builtin magenta)
      (comment red-faint)
      (constant red-cooler)
      (fnname magenta-cooler)
      (keyword red)
      (preprocessor magenta-cooler)
      (docstring cyan-faint)
      (string cyan)
      (type cyan-warmer)
      (variable cyan-cooler)

      (rx-escape cyan-cooler) ; compare with `string'
      (rx-construct red)

      (accent-0 cyan)
      (accent-1 red)
      (accent-2 cyan-warmer)
      (accent-3 magenta)

      (mail-0 cyan)
      (mail-1 red-cooler)
      (mail-2 cyan-cooler)
      (mail-3 red-faint)
      (mail-4 cyan-warmer)
      (mail-5 red-warmer)

      (rainbow-0 cyan)
      (rainbow-1 red)
      (rainbow-2 cyan-warmer)
      (rainbow-3 red-cooler)
      (rainbow-4 cyan-cooler)
      (rainbow-5 magenta)
      (rainbow-6 cyan-faint)
      (rainbow-7 magenta-faint)
      (rainbow-8 red-faint))
    "The `ef-tritanopia-dark' palette.")

  (ef-themes-theme ef-tritanopia-dark ef-tritanopia-dark-palette)

  (provide-theme 'ef-tritanopia-dark))

;;; ef-tritanopia-dark-theme.el ends here
