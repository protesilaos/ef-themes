;;; ef-winter-theme.el --- Legible dark theme -*- lexical-binding:t -*-

;; Copyright (C) 2022  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Ef-Themes Development <~protesilaos/ef-themes@lists.sr.ht>
;; URL: https://git.sr.ht/~protesilaos/ef-themes
;; Mailing-List: https://lists.sr.ht/~protesilaos/ef-themes
;; Version: 0.0.0
;; Package-Requires: ((emacs "28.1"))
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

  (deftheme ef-winter "Legible dark theme.")

  (defconst ef-winter-palette
    '(;; Basic tones
      (bg-main  "#0f0b15")
      (fg-main  "#b8c6d5")
      (bg-dim   "#221a2f")
      (fg-dim   "#807c9f")
      (bg-alt   "#252544")
      (fg-alt   "#ba8a9f")

      ;; Basic hues for foreground values
      (red             "#ef6560")
      (red-warmer      "#f47360")
      (red-cooler      "#ff5a7a")
      (red-faint       "#d56f72")
      (green           "#0faa26")
      (green-warmer    "#6aad0f")
      (green-cooler    "#00a692")
      (green-faint     "#61a06c")
      (yellow          "#c48032")
      (yellow-warmer   "#d1843f")
      (yellow-cooler   "#df8f5a")
      (yellow-faint    "#cf9f8f")
      (blue            "#3f95f6")
      (blue-warmer     "#6a9fff")
      (blue-cooler     "#029fff")
      (blue-faint      "#7a94df")
      (magenta         "#d369af")
      (magenta-warmer  "#e580ea")
      (magenta-cooler  "#af85ff")
      (magenta-faint   "#c57faf")
      (cyan            "#4fbaef")
      (cyan-warmer     "#6fafff")
      (cyan-cooler     "#1dbfcf")
      (cyan-faint      "#8aa0df")

      ;; Basic hues for background values
      (bg-red      "#bd1f30")
      (bg-green    "#20a020")
      (bg-yellow   "#945020")
      (bg-blue     "#4648d0")
      (bg-magenta  "#c040cf")
      (bg-cyan     "#2270be")

      ;; Diffs
      (bg-added          "#004035")
      (bg-added-faint    "#002f28")
      (bg-added-refine   "#036f3f")

      (bg-changed        "#424200")
      (bg-changed-faint  "#2a2000")
      (bg-changed-refine "#585800")

      (bg-removed        "#500f39")
      (bg-removed-faint  "#3a162f")
      (bg-removed-refine "#85284f")

      ;; Special hues
      (bg-mode-line  "#5a2a85") (fg-mode-line  "#dedeff")
      (bg-accent     "#ffb250") (fg-accent     "#000000")
      (bg-completion "#2f2a7a")
      (bg-hover      "#00474f")
      (bg-hover-alt  "#600f5a")
      (bg-hl-line    "#003045")
      (bg-region     "#34246f")
      (bg-active     "#353554")
      (bg-paren      "#3f4fbe")
      (bg-err        "#330d09") ; check with err
      (bg-info       "#002a10") ; check with info

      (border        "#543f6f")
      (cursor        "#ff55cc")
      (fg-intense    "#ffffff")

      ;; Mappings
      (err red)
      (warning yellow-warmer)
      (info green)

      (link blue-warmer)
      (link-alt magenta)
      (date cyan)
      (name magenta-cooler)
      (keybind blue-cooler)

      (builtin magenta-cooler)
      (comment yellow-faint)
      (constant cyan-cooler)
      (fnname blue)
      (keyword magenta)
      (preprocessor green-warmer)
      (docstring cyan-faint)
      (string yellow-cooler)
      (type cyan)
      (variable green-cooler)

      (accent-0 blue-warmer)
      (accent-1 yellow-cooler)
      (accent-2 magenta-warmer)
      (accent-3 green-cooler)

      (mail-0 cyan-cooler)
      (mail-1 magenta-cooler)
      (mail-2 yellow-cooler)
      (mail-3 blue-warmer)
      (mail-4 green-cooler)

      (rainbow-0 magenta)
      (rainbow-1 green-cooler)
      (rainbow-2 magenta-cooler)
      (rainbow-3 yellow)
      (rainbow-4 blue)
      (rainbow-5 green)
      (rainbow-6 red-cooler)
      (rainbow-7 cyan)
      (rainbow-8 magenta-warmer))
    "The `ef-winter' palette.")

  (ef-themes-theme ef-winter ef-winter-palette)

  (provide-theme 'ef-winter))

;;; ef-winter-theme.el ends here
