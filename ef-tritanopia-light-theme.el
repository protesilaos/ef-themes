;;; ef-tritanopia-light-theme.el --- Legible light theme, optimized for blue-yellow color deficiency -*- lexical-binding:t -*-

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
  (deftheme ef-tritanopia-light
    "Legible light theme, optimized for blue-yellow color deficiency.")

  (defconst ef-tritanopia-light-palette
    '(;; Basic tones
      (bg-main     "#fff9f9")
      (fg-main     "#1a1a1a")
      (bg-dim      "#efecec")
      (fg-dim      "#756275")
      (bg-alt      "#ddd9d9")
      (fg-alt      "#194f90")

      (bg-active   "#bdb9b9")
      (bg-inactive "#f7f2f2")

      ;; Basic hues for foreground values
      (red             "#aa0010")
      (red-warmer      "#dd0000")
      (red-cooler      "#c50f4f")
      (red-faint       "#92454f")
      (green           "#217a3c")
      (green-warmer    "#4a7d00")
      (green-cooler    "#008058")
      (green-faint     "#61756c")
      (yellow          "#805d00")
      (yellow-warmer   "#965000")
      (yellow-cooler   "#765040")
      (yellow-faint    "#776d6a")
      (blue            "#375cd8")
      (blue-warmer     "#4250ef")
      (blue-cooler     "#065fff")
      (blue-faint      "#6060d0")
      (magenta         "#aa357f")
      (magenta-warmer  "#bf256a")
      (magenta-cooler  "#af40af")
      (magenta-faint   "#7f4580")
      (cyan            "#2070af")
      (cyan-warmer     "#2f5faf")
      (cyan-cooler     "#007faa")
      (cyan-faint      "#5f6a90")

      ;; Basic hues for background values
      (bg-red      "#ffa2a0")
      (bg-green    "#8aefef")
      (bg-yellow   "#ff7f78")
      (bg-blue     "#a8c8ef")
      (bg-magenta  "#e09fc0")
      (bg-cyan     "#7bcfcf")

      (bg-red-subtle      "#ffcfbf")
      (bg-green-subtle    "#b3fabf")
      (bg-yellow-subtle   "#fff576")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#ffddff")
      (bg-cyan-subtle     "#bfefff")

      ;; Diffs
      (bg-added          "#c9efea")
      (bg-added-faint    "#d7eff5")
      (bg-added-refine   "#b3dfdf")

      (bg-changed        "#dbdbff")
      (bg-changed-faint  "#e4e4ff")
      (bg-changed-refine "#c0c0ef")

      (bg-removed        "#ffd6e0")
      (bg-removed-faint  "#ffe9e6")
      (bg-removed-refine "#f5bfc8")

      ;; Graphs
      (red-graph-0-bg     "#ef7969")
      (red-graph-1-bg     "#ffaab4")
      (green-graph-0-bg   "#90b7c0")
      (green-graph-1-bg   "#a3dfe5")
      (yellow-graph-0-bg  "#d99f9f")
      (yellow-graph-1-bg  "#ffb58f")
      (blue-graph-0-bg    "#80a0df")
      (blue-graph-1-bg    "#9fcaff")
      (magenta-graph-0-bg "#efafcf")
      (magenta-graph-1-bg "#ffdaef")
      (cyan-graph-0-bg    "#7fd3ed")
      (cyan-graph-1-bg    "#afefff")

      ;; Special hues
      (bg-mode-line  "#ff99aa") (fg-mode-line  "#1a0a0f")
      (bg-accent     "#2299cc") (fg-accent     "#000000")
      (bg-completion "#ffcada")
      (bg-hover      "#8fcfff")
      (bg-hover-alt  "#eda9dc")
      (bg-hl-line    "#ffdadf")
      (bg-region     "#dadadf")
      (bg-paren      "#8fc0cf")
      (bg-err        "#ffbfca") ; check with err
      (bg-warning    "#efcae6") ; check with warning
      (bg-info       "#cfdfef") ; check with info

      (border        "#adadad")
      (cursor        "#bb0000")
      (fg-intense    "#000000")

      (modeline-err     "#8f0000")
      (modeline-warning "#6f306f")
      (modeline-info    "#00445f")

      (underline-err     "#ef0f1f")
      (underline-warning "#af7f90")
      (underline-info    "#22afc2")

      ;; Conditional hues
      (bg-region-intense "#dfa5a5")

      ;; Mappings
      (err red-warmer)
      (warning magenta)
      (info cyan)

      (link cyan)
      (link-alt magenta-cooler)
      (date cyan-cooler)
      (name magenta)
      (keybind red-cooler)
      (identifier magenta-faint)
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

      (rx-escape cyan-warmer) ; compare with `string'
      (rx-construct red-warmer)

      (accent-0 cyan)
      (accent-1 red)
      (accent-2 cyan-warmer)
      (accent-3 magenta)

      (mail-0 cyan-cooler)
      (mail-1 red-cooler)
      (mail-2 cyan-warmer)
      (mail-3 red-faint)
      (mail-4 cyan)
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
    "The `ef-tritanopia-light' palette.")

  (ef-themes-theme ef-tritanopia-light ef-tritanopia-light-palette)

  (provide-theme 'ef-tritanopia-light))

;;;###theme-autoload
(put 'ef-tritanopia-light 'theme-properties '(:background-mode light :kind color-scheme :family ef))

;;; ef-tritanopia-light-theme.el ends here
