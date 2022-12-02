;;; ef-trio-dark-theme.el --- Legible dark theme with magenta, blue, teal colors -*- lexical-binding:t -*-

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

  (deftheme ef-trio-dark
    "Legible dark theme with magenta, blue, teal colors.")

  (defconst ef-trio-dark-palette
    '(;; Basic tones
      (bg-main      "#160f0f")
      (fg-main      "#d8cfd5")
      (bg-dim       "#2a2228")
      (fg-dim       "#908890")
      (bg-alt       "#362f35")
      (fg-alt       "#afdacf")

      (bg-active    "#564f55")
      (bg-inactive  "#1c1719")

      ;; Basic hues for foreground values
      (red             "#f48359")
      (red-warmer      "#ff7560")
      (red-cooler      "#ff85aa")
      (red-faint       "#e07a9a")
      (green           "#60b444")
      (green-warmer    "#a0c27f")
      (green-cooler    "#60bf88")
      (green-faint     "#61a06c")
      (yellow          "#d4a052")
      (yellow-warmer   "#ef926f")
      (yellow-cooler   "#ef9680")
      (yellow-faint    "#c7a07f")
      (blue            "#7fa5f6")
      (blue-warmer     "#8895ff")
      (blue-cooler     "#72afff")
      (blue-faint      "#7a94df")
      (magenta         "#d37faf")
      (magenta-warmer  "#e772df")
      (magenta-cooler  "#a698ef")
      (magenta-faint   "#c9addf")
      (cyan            "#8fbaff")
      (cyan-warmer     "#9ac2ff")
      (cyan-cooler     "#8fcfdf")
      (cyan-faint      "#8ac0ef")

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
      (bg-mode-line  "#6a294f") (fg-mode-line  "#ffdfdf")
      (bg-accent     "#cc88ff") (fg-accent     "#000000")
      (bg-completion "#2f335a")
      (bg-hover      "#004f3f")
      (bg-hover-alt  "#452f5f")
      (bg-hl-line    "#34223f")
      (bg-region     "#16304f")
      (bg-paren      "#2f605e")
      (bg-err        "#3a0f06") ; check with err
      (bg-warning    "#332910") ; check with warning
      (bg-info       "#1f2c00") ; check with info

      (border        "#605760")
      (cursor        "#ff99ff")
      (fg-intense    "#ffffff")

      (modeline-err     "#ff9fcf")
      (modeline-warning "#edbf00")
      (modeline-info    "#5fd0bf")

      (underline-err     "#df2f2f")
      (underline-warning "#c0b000")
      (underline-info    "#22b022")

      ;; Conditional hues
      (bg-region-intense "#5d336c")

      ;; Mappings
      (err red-warmer)
      (warning yellow)
      (info green)

      (link cyan)
      (link-alt magenta)
      (date cyan-cooler)
      (name blue)
      (keybind magenta-warmer)
      (identifier red-faint)
      (prompt blue-cooler)

      (builtin magenta-cooler)
      (comment yellow-faint)
      (constant magenta-warmer)
      (fnname blue-warmer)
      (keyword magenta)
      (preprocessor red-cooler)
      (docstring magenta-faint)
      (string green-cooler)
      (type cyan-cooler)
      (variable cyan-warmer)

      (rx-escape blue-warmer) ; compare with `string'
      (rx-construct red)

      (accent-0 magenta-warmer)
      (accent-1 green-cooler)
      (accent-2 blue-warmer)
      (accent-3 yellow)

      (mail-0 blue-warmer)
      (mail-1 magenta-warmer)
      (mail-2 green-cooler)
      (mail-3 magenta-cooler)
      (mail-4 cyan-cooler)
      (mail-5 yellow-cooler)

      (rainbow-0 magenta-warmer)
      (rainbow-1 blue-warmer)
      (rainbow-2 green-cooler)
      (rainbow-3 magenta)
      (rainbow-4 cyan)
      (rainbow-5 green-warmer)
      (rainbow-6 magenta-cooler)
      (rainbow-7 cyan-warmer)
      (rainbow-8 yellow-cooler))
    "The `ef-trio-dark' palette.")

  (ef-themes-theme ef-trio-dark ef-trio-dark-palette)

  (provide-theme 'ef-trio-dark))

;;;###theme-autoload
(put 'ef-trio-dark 'theme-properties '(:background-mode dark :kind color-scheme :family ef))

;;; ef-trio-dark-theme.el ends here
