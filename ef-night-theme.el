;;; ef-night-theme.el --- Legible dark theme with mostly green, blue, purple colors -*- lexical-binding:t -*-

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

  (deftheme ef-night
    "Legible dark theme with mostly green, blue, purple colors.")

  (defconst ef-night-palette
    '(;; Basic tones
      (bg-main     "#000e17")
      (fg-main     "#afbcbf")
      (bg-dim      "#1a202b")
      (fg-dim      "#70819f")
      (bg-alt      "#242e39")
      (fg-alt      "#b0a0a0")

      (bg-active   "#444e59")
      (bg-inactive "#11141f")

      ;; Basic hues for foreground values
      (red             "#ef656a")
      (red-warmer      "#f47360")
      (red-cooler      "#ef798f")
      (red-faint       "#d56f72")
      (green           "#1fa526")
      (green-warmer    "#50a22f")
      (green-cooler    "#00a972")
      (green-faint     "#61a06c")
      (yellow          "#c48502")
      (yellow-warmer   "#e6832f")
      (yellow-cooler   "#df8f6f")
      (yellow-faint    "#cf9f7f")
      (blue            "#379cf6")
      (blue-warmer     "#6a88ff")
      (blue-cooler     "#029fff")
      (blue-faint      "#7a94df")
      (magenta         "#d570af")
      (magenta-warmer  "#e580ea")
      (magenta-cooler  "#af8aff")
      (magenta-faint   "#c59faf")
      (cyan            "#4fb0cf")
      (cyan-warmer     "#6fafff")
      (cyan-cooler     "#3dc0b0")
      (cyan-faint      "#92b4df")

      ;; Basic hues for background values
      (bg-red      "#cd2f30")
      (bg-green    "#20a020")
      (bg-yellow   "#904f30")
      (bg-blue     "#2f439f")
      (bg-magenta  "#b04fcf")
      (bg-cyan     "#027080")

      (bg-red-subtle      "#6a002a")
      (bg-green-subtle    "#00422a")
      (bg-yellow-subtle   "#5a3000")
      (bg-blue-subtle     "#242679")
      (bg-magenta-subtle  "#50105a")
      (bg-cyan-subtle     "#004065")

      ;; Diffs
      (bg-added          "#00371f")
      (bg-added-faint    "#002918")
      (bg-added-refine   "#004c2f")

      (bg-changed        "#363300")
      (bg-changed-faint  "#2a1f00")
      (bg-changed-refine "#4a4a00")

      (bg-removed        "#450f1f")
      (bg-removed-faint  "#2f060f")
      (bg-removed-refine "#641426")

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
      (bg-mode-line  "#003a7f") (fg-mode-line  "#ceeeff")
      (bg-accent     "#ff9270") (fg-accent     "#000000")
      (bg-completion "#00314f")
      (bg-hover      "#6f345a")
      (bg-hover-alt  "#493737")
      (bg-hl-line    "#002255")
      (bg-region     "#222f40")
      (bg-paren      "#664950")
      (bg-err        "#331419") ; check with err
      (bg-warning    "#332613") ; check with warning
      (bg-info       "#002e1f") ; check with info

      (border        "#3a4a66")
      (cursor        "#00ccff")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff8faf")
      (modeline-warning "#dfcf00")
      (modeline-info    "#00e06f")

      (underline-err     "#df2f2f")
      (underline-warning "#c0b000")
      (underline-info    "#22b022")

      ;; Conditional hues
      (bg-region-intense "#3f2f60")

      ;; Mappings
      (err red)
      (warning yellow-warmer)
      (info green-cooler)

      (link cyan-warmer)
      (link-alt magenta)
      (date cyan)
      (name blue-warmer)
      (keybind green-cooler)
      (identifier magenta-faint)
      (prompt cyan-cooler)

      (builtin green-cooler)
      (comment yellow-faint)
      (constant magenta-cooler)
      (fnname cyan-cooler)
      (keyword blue-warmer)
      (preprocessor red-warmer)
      (docstring cyan-faint)
      (string blue-cooler)
      (type magenta-cooler)
      (variable cyan)

      (rx-escape green) ; compare with `string'
      (rx-construct magenta-warmer)

      (accent-0 blue-cooler)
      (accent-1 magenta-warmer)
      (accent-2 cyan-cooler)
      (accent-3 red-cooler)

      (mail-0 blue)
      (mail-1 magenta-warmer)
      (mail-2 green-cooler)
      (mail-3 yellow)
      (mail-4 magenta-cooler)
      (mail-5 cyan)

      (rainbow-0 cyan-warmer)
      (rainbow-1 magenta-cooler)
      (rainbow-2 yellow-cooler)
      (rainbow-3 blue-warmer)
      (rainbow-4 magenta)
      (rainbow-5 green)
      (rainbow-6 yellow)
      (rainbow-7 cyan)
      (rainbow-8 green-warmer))
    "The `ef-night' palette.")

  (ef-themes-theme ef-night ef-night-palette)

  (provide-theme 'ef-night))

;;;###theme-autoload
(put 'ef-night 'theme-properties '(:background-mode dark :kind color-scheme :family ef))

;;; ef-night-theme.el ends here
