;;; ef-frost-theme.el --- Legible light theme with blue, cyan, teal, purple colors -*- lexical-binding:t -*-

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

  (deftheme ef-frost "Legible light theme with blue, cyan, teal, purple colors.")

  (defconst ef-frost-palette
    '(;; Basic tones
      (bg-main     "#fcffff")
      (fg-main     "#232323")
      (bg-dim      "#eaefef")
      (fg-dim      "#66657f")
      (bg-alt      "#d7dbdb")
      (fg-alt      "#204f9a")

      (bg-active   "#c7cbcb")
      (bg-inactive "#f7f9f9")

      ;; Basic hues for foreground values
      (red             "#c42d2f")
      (red-warmer      "#d03003")
      (red-cooler      "#cf2f4f")
      (red-faint       "#9a4366")
      (green           "#008a00")
      (green-warmer    "#468400")
      (green-cooler    "#00845f")
      (green-faint     "#517f3c")
      (yellow          "#aa6100")
      (yellow-warmer   "#b6532f")
      (yellow-cooler   "#996c4f")
      (yellow-faint    "#804f4f")
      (blue            "#004fc0")
      (blue-warmer     "#4244ef")
      (blue-cooler     "#065fff")
      (blue-faint      "#375cc8")
      (magenta         "#aa44c5")
      (magenta-warmer  "#c0469a")
      (magenta-cooler  "#7f5ae0")
      (magenta-faint   "#605f9f")
      (cyan            "#1f6fbf")
      (cyan-warmer     "#3a6dd2")
      (cyan-cooler     "#007a85")
      (cyan-faint      "#305f9f")

      ;; Basic hues for background values
      (bg-red      "#ff8f88")
      (bg-green    "#8adf80")
      (bg-yellow   "#fac200")
      (bg-blue     "#cbcfff")
      (bg-magenta  "#df8fff")
      (bg-cyan     "#88c8ff")

      (bg-red-subtle      "#ffcfbf")
      (bg-green-subtle    "#b3fabf")
      (bg-yellow-subtle   "#fff576")
      (bg-blue-subtle     "#ccdfff")
      (bg-magenta-subtle  "#ffddff")
      (bg-cyan-subtle     "#bfefff")

      ;; Diffs
      (bg-added          "#c9ffea")
      (bg-added-faint    "#d7fff5")
      (bg-added-refine   "#b3efdf")

      (bg-changed        "#ffdfb9")
      (bg-changed-faint  "#ffefcb")
      (bg-changed-refine "#ffcfa0")

      (bg-removed        "#ffd6e0")
      (bg-removed-faint  "#ffe9e6")
      (bg-removed-refine "#f5bfc8")

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
      (bg-mode-line  "#9ad0ff") (fg-mode-line  "#051524")
      (bg-accent     "#0000d0") (fg-accent     "#ffffff")
      (bg-completion "#cceff5")
      (bg-hover      "#cab5ff")
      (bg-hover-alt  "#aae0bf")
      (bg-hl-line    "#dff6e4")
      (bg-region     "#d4eaf3")
      (bg-paren      "#cab0ef")
      (bg-err        "#ffdfda") ; check with err
      (bg-warning    "#ffe9bf") ; check with warning
      (bg-info       "#ccefcf") ; check with info

      (border        "#b0b7c0")
      (cursor        "#0055bb")
      (fg-intense    "#000000")

      (modeline-err     "#a00000")
      (modeline-warning "#7f1090")
      (modeline-info    "#0000af")

      (underline-err     "#ef0f1f")
      (underline-warning "#bf5f00")
      (underline-info    "#02af52")

      ;; Mappings
      (err red)
      (warning yellow-cooler)
      (info green)

      (link cyan)
      (link-alt magenta)
      (date cyan-cooler)
      (name cyan-warmer)
      (keybind blue-cooler)
      (prompt blue)

      (builtin cyan)
      (comment yellow-faint)
      (constant blue-cooler)
      (fnname green-cooler)
      (keyword blue)
      (preprocessor magenta)
      (docstring magenta-faint)
      (string blue-warmer)
      (type magenta-cooler)
      (variable cyan-warmer)

      (rx-escape yellow-cooler) ; compare with `string'
      (rx-construct red-cooler)

      (accent-0 blue-warmer)
      (accent-1 green-cooler)
      (accent-2 magenta-warmer)
      (accent-3 blue-cooler)

      (mail-0 blue)
      (mail-1 cyan-cooler)
      (mail-2 magenta)
      (mail-3 cyan)
      (mail-4 cyan-warmer)
      (mail-5 blue-cooler)

      (rainbow-0 cyan-cooler)
      (rainbow-1 blue)
      (rainbow-2 green-cooler)
      (rainbow-3 magenta-cooler)
      (rainbow-4 cyan)
      (rainbow-5 blue-warmer)
      (rainbow-6 green-warmer)
      (rainbow-7 magenta)
      (rainbow-8 cyan-warmer))
    "The `ef-frost' palette.")

  (ef-themes-theme ef-frost ef-frost-palette)

  (provide-theme 'ef-frost))

;;; ef-frost-theme.el ends here
