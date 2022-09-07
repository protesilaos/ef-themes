;;; ef-light-theme.el --- Legible light theme with blue, magenta, cyan, purple colors -*- lexical-binding:t -*-

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

  (deftheme ef-light "Legible light theme with blue, magenta, cyan, purple colors.")

  (defconst ef-light-palette
    '(;; Basic tones
      (bg-main     "#ffffff")
      (fg-main     "#202020")
      (bg-dim      "#efefef")
      (fg-dim      "#70627f")
      (bg-alt      "#dbdbdb")
      (fg-alt      "#196f70")

      (bg-active   "#cbcbcb")
      (bg-inactive "#f9f9f9")

      ;; Basic hues for foreground values
      (red             "#d3303a")
      (red-warmer      "#e00033")
      (red-cooler      "#d50f7f")
      (red-faint       "#c24552")
      (green           "#217a3c")
      (green-warmer    "#4a7d00")
      (green-cooler    "#008858")
      (green-faint     "#61756c")
      (yellow          "#a45f22")
      (yellow-warmer   "#b6532f")
      (yellow-cooler   "#b65050")
      (yellow-faint    "#a65f6a")
      (blue            "#375cd8")
      (blue-warmer     "#4250ef")
      (blue-cooler     "#065fff")
      (blue-faint      "#6060d0")
      (magenta         "#ba35af")
      (magenta-warmer  "#cf25aa")
      (magenta-cooler  "#6052cf")
      (magenta-faint   "#bf3580")
      (cyan            "#1f6fbf")
      (cyan-warmer     "#3f6faf")
      (cyan-cooler     "#1f77bb")
      (cyan-faint      "#506fa0")

      ;; Basic hues for background values
      (bg-red      "#ff8f88")
      (bg-green    "#8adf80")
      (bg-yellow   "#fac200")
      (bg-blue     "#cbcfff")
      (bg-magenta  "#ff9fef")
      (bg-cyan     "#88c8ff")

      (bg-red-subtle      "#ffcfbf")
      (bg-green-subtle    "#b3fabf")
      (bg-yellow-subtle   "#fff576")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#ffddff")
      (bg-cyan-subtle     "#bfefff")

      ;; Diffs
      (bg-added          "#d5f8d5")
      (bg-added-faint    "#e5ffe5")
      (bg-added-refine   "#c6e8c6")

      (bg-changed        "#ffdfa9")
      (bg-changed-faint  "#ffefbf")
      (bg-changed-refine "#fac090")

      (bg-removed        "#ffd8d5")
      (bg-removed-faint  "#ffe9e9")
      (bg-removed-refine "#f3b5af")

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
      (bg-mode-line  "#b7c7ff") (fg-mode-line  "#151515")
      (bg-accent     "#0000cc") (fg-accent     "#ffffff")
      (bg-completion "#bfe8ff")
      (bg-hover      "#aaeccf")
      (bg-hover-alt  "#b4cfff")
      (bg-hl-line    "#e4efd8")
      (bg-region     "#bfefff")
      (bg-paren      "#efa09f")
      (bg-err        "#ffd5ea") ; check with err
      (bg-warning    "#ffeabb") ; check with warning
      (bg-info       "#d0efda") ; check with info

      (border        "#c4cadf")
      (cursor        "#0033cc")
      (fg-intense    "#000000")

      (modeline-err     "#9f0000")
      (modeline-warning "#5f0070")
      (modeline-info    "#002fa0")

      ;; Mappings
      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link blue)
      (link-alt magenta)
      (date cyan-cooler)
      (name magenta-cooler)
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

      (rx-escape green-cooler) ; compare with `string'
      (rx-construct magenta)

      (accent-0 blue-warmer)
      (accent-1 magenta-warmer)
      (accent-2 green-cooler)
      (accent-3 yellow-warmer)

      (mail-0 blue-warmer)
      (mail-1 magenta)
      (mail-2 cyan-cooler)
      (mail-3 yellow-cooler)
      (mail-4 cyan-warmer)
      (mail-5 green-warmer)

      (rainbow-0 green-cooler)
      (rainbow-1 blue)
      (rainbow-2 magenta-warmer)
      (rainbow-3 cyan-cooler)
      (rainbow-4 yellow-cooler)
      (rainbow-5 magenta-cooler)
      (rainbow-6 red-cooler)
      (rainbow-7 green-cooler)
      (rainbow-8 yellow))
    "The `ef-light' palette.")

  (ef-themes-theme ef-light ef-light-palette)

  (provide-theme 'ef-light))

;;; ef-light-theme.el ends here
