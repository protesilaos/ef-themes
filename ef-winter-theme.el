;;; ef-winter-theme.el --- Legible dark theme with magenta, purple, fawn, teal colors -*- lexical-binding:t -*-

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

  (deftheme ef-winter
    "Legible dark theme with magenta, purple, fawn, teal colors.")

  (defconst ef-winter-palette
    '(;; Basic tones
      (bg-main      "#0f0b15")
      (fg-main      "#b8c6d5")
      (bg-dim       "#1d202f")
      (fg-dim       "#807c9f")
      (bg-alt       "#2a2f42")
      (fg-alt       "#bf8f8f")

      (bg-active    "#4a4f62")
      (bg-inactive  "#19181f")

      ;; Basic hues for foreground values
      (red             "#f47359")
      (red-warmer      "#ef6560")
      (red-cooler      "#ff6a7a")
      (red-faint       "#d56f72")
      (green           "#29a444")
      (green-warmer    "#6aad0f")
      (green-cooler    "#00a392")
      (green-faint     "#61a06c")
      (yellow          "#b58a52")
      (yellow-warmer   "#d1803f")
      (yellow-cooler   "#df9080")
      (yellow-faint    "#c0a38a")
      (blue            "#3f95f6")
      (blue-warmer     "#6a9fff")
      (blue-cooler     "#029fff")
      (blue-faint      "#7a94df")
      (magenta         "#d369af")
      (magenta-warmer  "#e580e0")
      (magenta-cooler  "#af85ea")
      (magenta-faint   "#c57faf")
      (cyan            "#4fbaef")
      (cyan-warmer     "#6fafdf")
      (cyan-cooler     "#35afbf")
      (cyan-faint      "#8aa0df")

      ;; Basic hues for background values
      (bg-red      "#bd1f30")
      (bg-green    "#20a020")
      (bg-yellow   "#845020")
      (bg-blue     "#3633b0")
      (bg-magenta  "#b04fcf")
      (bg-cyan     "#2270be")

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
      (bg-mode-line  "#5f1f5f") (fg-mode-line  "#dedeff")
      (bg-accent     "#ffb250") (fg-accent     "#000000")
      (bg-completion "#2f2a7a")
      (bg-hover      "#00474f")
      (bg-hover-alt  "#44196f")
      (bg-hl-line    "#003045")
      (bg-region     "#342464")
      (bg-paren      "#2f608e")
      (bg-err        "#330d06") ; check with err
      (bg-warning    "#332610") ; check with warning
      (bg-info       "#0f2e10") ; check with info

      (border        "#4a4955")
      (cursor        "#ff6ff0")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff9fbf")
      (modeline-warning "#ddb300")
      (modeline-info    "#40e0af")

      (underline-err     "#df2f2f")
      (underline-warning "#c0b000")
      (underline-info    "#22b022")

      ;; Conditional hues
      (bg-region-intense "#4f2f5d")

      ;; Mappings
      (err red-warmer)
      (warning yellow)
      (info green)

      (link magenta)
      (link-alt cyan-warmer)
      (date cyan-cooler)
      (name magenta)
      (keybind cyan-cooler)
      (identifier magenta-faint)
      (prompt magenta-warmer)

      (builtin magenta-warmer)
      (comment yellow-faint)
      (constant magenta)
      (fnname cyan-cooler)
      (keyword magenta-cooler)
      (preprocessor red-cooler)
      (docstring cyan-faint)
      (string yellow-cooler)
      (type cyan)
      (variable blue-warmer)

      (rx-escape green) ; compare with `string'
      (rx-construct blue)

      (accent-0 magenta-cooler)
      (accent-1 yellow)
      (accent-2 green-cooler)
      (accent-3 magenta-warmer)

      (mail-0 magenta-cooler)
      (mail-1 yellow-cooler)
      (mail-2 cyan-cooler)
      (mail-3 magenta)
      (mail-4 blue-warmer)
      (mail-5 green)

      (rainbow-0 magenta)
      (rainbow-1 cyan-cooler)
      (rainbow-2 magenta-cooler)
      (rainbow-3 yellow)
      (rainbow-4 blue-warmer)
      (rainbow-5 magenta-warmer)
      (rainbow-6 green-cooler)
      (rainbow-7 yellow-cooler)
      (rainbow-8 cyan-warmer))
    "The `ef-winter' palette.")

  (ef-themes-theme ef-winter ef-winter-palette)

  (provide-theme 'ef-winter))

;;;###theme-autoload
(put 'ef-winter 'theme-properties '(:background-mode dark :kind color-scheme :family ef))

;;; ef-winter-theme.el ends here
