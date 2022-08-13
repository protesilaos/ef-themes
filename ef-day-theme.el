;;; ef-day-theme.el --- Elegant, highly legible and customizable light theme -*- lexical-binding:t -*-

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
;; Work-in-progress.

;;; Code:



(eval-and-compile
  (require 'ef-themes)

  (deftheme ef-day "Light theme with a pleasant palette.")

  (defconst ef-day-palette
    '(;; Basic tones
      (bg-main "#fff5ea") (fg-main "#624a4a")
      (bg-dim  "#f5e9dd") (fg-dim  "#836887")
      (bg-alt  "#e6ddd2") (fg-alt  "#9f5f6a")

      ;; Basic hues for foreground values
      (red             "#c42d2f") (green         "#217a3c")
      (red-warmer      "#d03003") (green-warmer  "#4a7d00")
      (red-cooler      "#cf2f4f") (green-cooler  "#007f68")
      (red-faint       "#b05350") (green-faint   "#61756c")
      (yellow          "#a45f22") (blue          "#375cc6")
      (yellow-warmer   "#b6540f") (blue-warmer   "#5f5fdf")
      (yellow-cooler   "#ae5a30") (blue-cooler   "#265fbf")
      (yellow-faint    "#a05f5a") (blue-faint    "#6a65bf")
      (magenta         "#d5206f") (cyan          "#1f6fbf")
      (magenta-warmer  "#cb26a0") (cyan-warmer   "#3f6faf")
      (magenta-cooler  "#9435b4") (cyan-cooler   "#0f7b8f")
      (magenta-faint   "#a04450") (cyan-faint    "#5f60bf")

      ;; Basic hues for background values
      (bg-red      "#ff8f88") (bg-green  "#96df80")
      (bg-yellow   "#efbf00") (bg-blue   "#cfceff")
      (bg-magenta  "#ff9fee") (bg-cyan   "#88cfd0")

      ;; Diffs
      (bg-added          "#d5efcf")
      (bg-added-faint    "#e5ffdf")
      (bg-added-refine   "#c0e6bf")

      (bg-changed        "#ffdd99")
      (bg-changed-faint  "#ffeebb")
      (bg-changed-refine "#ffca9f")

      (bg-removed        "#ffcfcf")
      (bg-removed-faint  "#ffe3df")
      (bg-removed-refine "#ffbfaf")

      ;; Special hues
      (bg-mode-line  "#ffaf7c") (fg-mode-line  "#542f38")
      (bg-completion "#ffcfcf")
      (bg-hover      "#b0e0df")
      (bg-hover-alt  "#febcaf")
      (bg-hl-line    "#f0eacf")
      (bg-region     "#fed8c4")

      (border        "#ded0bb")
      (cursor        "#df4f00")
      (fg-intense    "#000000")

      ;; Mappings
      (err red-warmer)
      (warning red)
      (info green)

      (link red-cooler)
      (link-alt magenta-cooler)
      (date yellow-cooler)
      (name green-warmer)
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

      (accent-0 red-warmer)
      (accent-1 green-cooler)
      (accent-2 magenta-warmer)
      (accent-3 blue)

      (mail-0 blue-warmer)
      (mail-1 magenta-warmer)
      (mail-2 cyan-cooler)
      (mail-3 yellow-cooler)
      (mail-4 magenta)

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
