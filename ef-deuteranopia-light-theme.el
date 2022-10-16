;;; ef-deuteranopia-light-theme.el --- Legible light theme, optimized for red-green color deficiency -*- lexical-binding:t -*-

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
  (deftheme ef-deuteranopia-light "Legible light theme, optimized for red-green color deficiency.")

  (defconst ef-deuteranopia-light-palette
    '(;; Basic tones
      (bg-main     "#f5f5ff")
      (fg-main     "#1a1a2f")
      (bg-dim      "#e8e8ea")
      (fg-dim      "#70627f")
      (bg-alt      "#d3d3e0")
      (fg-alt      "#196f70")

      (bg-active   "#c3c3d0")
      (bg-inactive "#efeff5")

      ;; Basic hues for foreground values
      (red             "#d3303a")
      (red-warmer      "#e00033")
      (red-cooler      "#d50f7f")
      (red-faint       "#c24552")
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
      (magenta         "#ba35af")
      (magenta-warmer  "#cf25aa")
      (magenta-cooler  "#6052cf")
      (magenta-faint   "#bf3580")
      (cyan            "#1f6fbf")
      (cyan-warmer     "#3f6faf")
      (cyan-cooler     "#1f77bb")
      (cyan-faint      "#506fa0")

      ;; Basic hues for background values
      (bg-red      "#cac200")
      (bg-green    "#9aaf80")
      (bg-yellow   "#fac200")
      (bg-blue     "#cbcfff")
      (bg-magenta  "#3fbfff")
      (bg-cyan     "#98e8ff")

      (bg-red-subtle      "#ffcfbf")
      (bg-green-subtle    "#afffbf")
      (bg-yellow-subtle   "#fff576")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#ffddff")
      (bg-cyan-subtle     "#bfefff")

      ;; Diffs
      (bg-added          "#dbdbff")
      (bg-added-faint    "#e4e4ff")
      (bg-added-refine   "#c0c0ef")

      (bg-changed        "#eecfdf")
      (bg-changed-faint  "#f0dde5")
      (bg-changed-refine "#e0b0d0")

      (bg-removed        "#fff0af")
      (bg-removed-faint  "#efefcb")
      (bg-removed-refine "#f0da88")

      ;; Graphs
      (red-graph-0-bg     "#b0b029")
      (red-graph-1-bg     "#e0cab4")
      (green-graph-0-bg   "#90b7c0")
      (green-graph-1-bg   "#a3dfe5")
      (yellow-graph-0-bg  "#ffcf00")
      (yellow-graph-1-bg  "#f9ff00")
      (blue-graph-0-bg    "#7f9fff")
      (blue-graph-1-bg    "#9fc6ff")
      (magenta-graph-0-bg "#b0b0d0")
      (magenta-graph-1-bg "#d0dfdf")
      (cyan-graph-0-bg    "#6faad9")
      (cyan-graph-1-bg    "#bfe0ff")

      ;; Special hues
      (bg-mode-line  "#99c7ff") (fg-mode-line  "#0a0a1f")
      (bg-accent     "#eecc33") (fg-accent     "#000000")
      (bg-completion "#f0dacf")
      (bg-hover      "#eebb20")
      (bg-hover-alt  "#afafef")
      (bg-hl-line    "#f3e0d5")
      (bg-region     "#dadadf")
      (bg-paren      "#8fc0cf")
      (bg-err        "#f0e0aa") ; check with err
      (bg-warning    "#ffe0aa") ; check with warning
      (bg-info       "#d0dfff") ; check with info

      (border        "#c0c0d4")
      (cursor        "#0000bb")
      (fg-intense    "#000000")

      (modeline-err     "#000000") ; too dark to have red/yellow here
      (modeline-warning "#0a0a1f")
      (modeline-info    "#2222c3")

      (underline-err     "#c08f00")
      (underline-warning "#6f3f00")
      (underline-info    "#025f92")

      ;; Mappings
      (err yellow-warmer)
      (warning yellow)
      (info blue-cooler)

      (link blue)
      (link-alt yellow-cooler)
      (date yellow-cooler)
      (name blue-warmer)
      (keybind yellow-warmer)
      (prompt blue)

      (builtin cyan)
      (comment yellow-faint)
      (constant yellow-cooler)
      (fnname blue-cooler)
      (keyword blue-warmer)
      (preprocessor magenta-cooler)
      (docstring cyan-faint)
      (string yellow-warmer)
      (type yellow)
      (variable cyan-cooler)

      (rx-escape cyan-faint) ; compare with `string'
      (rx-construct blue-warmer)

      (accent-0 blue-cooler)
      (accent-1 yellow-warmer)
      (accent-2 cyan)
      (accent-3 yellow-cooler)

      (mail-0 blue-warmer)
      (mail-1 yellow-cooler)
      (mail-2 cyan-cooler)
      (mail-3 yellow)
      (mail-4 cyan)
      (mail-5 blue-cooler)

      (rainbow-0 blue)
      (rainbow-1 yellow)
      (rainbow-2 blue-warmer)
      (rainbow-3 yellow-cooler)
      (rainbow-4 blue-cooler)
      (rainbow-5 yellow-warmer)
      (rainbow-6 blue-faint)
      (rainbow-7 yellow-faint)
      (rainbow-8 cyan))
    "The `ef-deuteranopia-light' palette.")

  (ef-themes-theme ef-deuteranopia-light ef-deuteranopia-light-palette)

  (provide-theme 'ef-deuteranopia-light))

;;; ef-deuteranopia-light-theme.el ends here
