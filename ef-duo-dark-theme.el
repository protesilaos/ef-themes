;;; ef-duo-dark-theme.el --- Legible dark theme with mostly blue and orange colors -*- lexical-binding:t -*-

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

  ;; Most of the colors here are defined simply to preserve
  ;; compatibility with the rest of the project.  We don't actually rely
  ;; on them for anything critical.
  (deftheme ef-duo-dark "Legible dark theme with mostly blue and orange colors.")

  (defconst ef-duo-dark-palette
    '(;; Basic tones
      (bg-main     "#070019")
      (fg-main     "#d0d0d0")
      (bg-dim      "#1c1926")
      (fg-dim      "#857f8f")
      (bg-alt      "#262230")
      (fg-alt      "#89afef")

      (bg-active   "#363240")
      (bg-inactive "#140e1c")

      ;; Basic hues for foreground values
      (red             "#ef656a")
      (red-warmer      "#f47360")
      (red-cooler      "#ef798f")
      (red-faint       "#d08f72")
      (green           "#1fa526")
      (green-warmer    "#50a22f")
      (green-cooler    "#00b982")
      (green-faint     "#61a06c")
      (yellow          "#c48702")
      (yellow-warmer   "#d0730f")
      (yellow-cooler   "#df805f")
      (yellow-faint    "#9f8f6a")
      (blue            "#379cf6")
      (blue-warmer     "#6f80ff")
      (blue-cooler     "#029fff")
      (blue-faint      "#8a9fdf")
      (magenta         "#d369af")
      (magenta-warmer  "#e580ea")
      (magenta-cooler  "#af85ff")
      (magenta-faint   "#c57faf")
      (cyan            "#5faaef")
      (cyan-warmer     "#7fafff")
      (cyan-cooler     "#0dafdf")
      (cyan-faint      "#8aa0df")

      ;; Basic hues for background values
      (bg-red      "#cd2f30")
      (bg-green    "#20a020")
      (bg-yellow   "#8f5040")
      (bg-blue     "#4648d0")
      (bg-magenta  "#b04fcf")
      (bg-cyan     "#2270be")

      (bg-red-subtle      "#72002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#603000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#5a105f")
      (bg-cyan-subtle     "#004065")

      ;; Diffs
      (bg-added          "#002d1f")
      (bg-added-faint    "#001f18")
      (bg-added-refine   "#003b2f")

      (bg-changed        "#323200")
      (bg-changed-faint  "#2a2000")
      (bg-changed-refine "#444000")

      (bg-removed        "#3d091f")
      (bg-removed-faint  "#27040f")
      (bg-removed-refine "#5b0f26")

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
      (bg-mode-line  "#352487") (fg-mode-line  "#dedeff")
      (bg-accent     "#ffb250") (fg-accent     "#000000")
      (bg-completion "#2f1a5f")
      (bg-hover      "#664f4a")
      (bg-hover-alt  "#264f4a")
      (bg-hl-line    "#301a4f")
      (bg-region     "#042a50")
      (bg-paren      "#2f608e")
      (bg-err        "#330d09") ; check with err
      (bg-warning    "#332600") ; check with warning
      (bg-info       "#002212") ; check with info

      (border        "#545f6f")
      (cursor        "#ef6f11")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff8faf")
      (modeline-warning "#dfcf00")
      (modeline-info    "#00e06f")

      (underline-err     "#ff2f2f")
      (underline-warning "#e0dc00")
      (underline-info    "#22ff52")

      ;; Mappings
      (err red)
      (warning yellow)
      (info green)

      (link cyan-warmer)
      (link-alt green-cooler)
      (date cyan-cooler)
      (name blue)
      (keybind blue-cooler)
      (prompt yellow)

      (builtin cyan)
      (comment yellow-faint)
      (constant blue)
      (fnname cyan-cooler)
      (keyword blue-warmer)
      (preprocessor cyan-warmer)
      (docstring blue-faint)
      (string yellow-cooler)
      (type blue-cooler)
      (variable magenta-cooler)

      (rx-escape magenta-cooler) ; compare with `string'
      (rx-construct blue)

      (accent-0 blue-warmer)
      (accent-1 yellow-warmer)
      (accent-2 green-cooler)
      (accent-3 red)

      (mail-0 cyan)
      (mail-1 yellow-cooler)
      (mail-2 blue-warmer)
      (mail-3 yellow)
      (mail-4 cyan-cooler)
      (mail-5 green-warmer)

      (rainbow-0 blue)
      (rainbow-1 yellow-warmer)
      (rainbow-2 blue-warmer)
      (rainbow-3 yellow-cooler)
      (rainbow-4 cyan-cooler)
      (rainbow-5 yellow)
      (rainbow-6 blue-cooler)
      (rainbow-7 red-cooler)
      (rainbow-8 green-cooler))
    "The `ef-duo-dark' palette.")

  (ef-themes-theme ef-duo-dark ef-duo-dark-palette)

  (provide-theme 'ef-duo-dark))

;;; ef-duo-dark-theme.el ends here
