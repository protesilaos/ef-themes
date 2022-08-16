;;; ef-day-theme.el --- Legible light theme -*- lexical-binding:t -*-

;; Copyright (C) 2022  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Ef-Themes Development <~protesilaos/ef-themes@lists.sr.ht>
;; URL: https://git.sr.ht/~protesilaos/ef-themes
;; Mailing-List: https://lists.sr.ht/~protesilaos/ef-themes
;; Version: 0.0.1
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

  (deftheme ef-day "Legible light theme.")

  (defconst ef-day-palette
    '(;; Basic tones
      (bg-main  "#fff5ea")
      (fg-main  "#584141")
      (bg-dim   "#f5eddf")
      (fg-dim   "#63728f")
      (bg-alt   "#e9e0d8")
      (fg-alt   "#8f5f4a")

      ;; Basic hues for foreground values
      (red             "#c42d2f")
      (red-warmer      "#d03003")
      (red-cooler      "#cf2f4f")
      (red-faint       "#b05350")
      (green           "#217a3c")
      (green-warmer    "#4a7d00")
      (green-cooler    "#007f68")
      (green-faint     "#61756c")
      (yellow          "#a45f22")
      (yellow-warmer   "#b6540f")
      (yellow-cooler   "#ae5a30")
      (yellow-faint    "#a05f5a")
      (blue            "#375cc6")
      (blue-warmer     "#5f5fdf")
      (blue-cooler     "#265fbf")
      (blue-faint      "#6a65bf")
      (magenta         "#d5206f")
      (magenta-warmer  "#cb26a0")
      (magenta-cooler  "#9435b4")
      (magenta-faint   "#a04450")
      (cyan            "#1f6fbf")
      (cyan-warmer     "#3f6faf")
      (cyan-cooler     "#0f7b8f")
      (cyan-faint      "#5f60bf")

      ;; Basic hues for background values
      (bg-red      "#ff8f88")
      (bg-green    "#96df80")
      (bg-yellow   "#efbf00")
      (bg-blue     "#cfceff")
      (bg-magenta  "#ff9fee")
      (bg-cyan     "#88cfd0")

      ;; Diffs
      (bg-added          "#c5eaca")
      (bg-added-faint    "#d5fada")
      (bg-added-refine   "#b5e3b8")

      (bg-changed        "#ffdd99")
      (bg-changed-faint  "#ffeebb")
      (bg-changed-refine "#ffc090")

      (bg-removed        "#ffcfcf")
      (bg-removed-faint  "#ffe3df")
      (bg-removed-refine "#ffb0a0")

      ;; Special hues
      (bg-mode-line  "#ffc082") (fg-mode-line  "#542f38")
      (bg-accent     "#106246") (fg-accent     "#ffffff")
      (bg-completion "#ffd5d3")
      (bg-hover      "#b0e0df")
      (bg-hover-alt  "#febcaf")
      (bg-hl-line    "#f9e2b2")
      (bg-region     "#f0d2df")
      (bg-active     "#d9d0c8")
      (bg-paren      "#8fcfdf")
      (bg-err        "#ffddee") ; check with err
      (bg-info       "#ddf5cc") ; check with info

      (border        "#ded0bb")
      (cursor        "#df4f00")
      (fg-intense    "#000000")

      ;; Mappings
      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link red-warmer)
      (link-alt yellow)
      (date cyan-cooler)
      (name green)
      (keybind red-cooler)

      (builtin red)
      (comment magenta-faint)
      (constant red-cooler)
      (fnname green-warmer)
      (keyword yellow-warmer)
      (preprocessor magenta-warmer)
      (docstring red-faint)
      (string green)
      (type blue-warmer)
      (variable cyan)

      (accent-0 green-cooler)
      (accent-1 red)
      (accent-2 blue)
      (accent-3 magenta-warmer)

      (mail-0 cyan-warmer)
      (mail-1 red-cooler)
      (mail-2 magenta-cooler)
      (mail-3 green)
      (mail-4 magenta-warmer)

      (rainbow-0 red-cooler)
      (rainbow-1 magenta-cooler)
      (rainbow-2 green-cooler)
      (rainbow-3 magenta-warmer)
      (rainbow-4 cyan)
      (rainbow-5 yellow)
      (rainbow-6 green)
      (rainbow-7 blue-warmer)
      (rainbow-8 yellow-cooler))
    "The `ef-day' palette.")

  (ef-themes-theme ef-day ef-day-palette)

  (provide-theme 'ef-day))

;;; ef-day-theme.el ends here
