;;; ef-spring-theme.el --- Light theme with a pleasant palette -*- lexical-binding:t -*-

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

  (deftheme ef-spring "Light theme with a pleasant palette.")

  (defconst ef-spring-palette
    '(;; Basic tones
      (bg-main "#f6fff9") (fg-main "#3f4946")
      (bg-dim  "#e8f0f0") (fg-dim  "#7f6f8a")
      (bg-alt  "#e0e6e3") (fg-alt  "#8d6e6a")

      ;; Basic hues for foreground values
      (red             "#c42d2f") (green         "#14872f")
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
      (bg-red      "#ff8f88") (bg-green  "#96df20")
      (bg-yellow   "#efcf00") (bg-blue   "#afdfff")
      (bg-magenta  "#ff90fe") (bg-cyan   "#88cfe0")

      ;; Diffs
      (bg-added          "#c0efd0")
      (bg-added-faint    "#d0ffe0")
      (bg-added-refine   "#a9e6c0")

      (bg-changed        "#ffdd99")
      (bg-changed-faint  "#ffeebb")
      (bg-changed-refine "#ffca9f")

      (bg-removed        "#ffcfcf")
      (bg-removed-faint  "#ffe3df")
      (bg-removed-refine "#ffbfaf")

      ;; Special hues
      (bg-mode-line  "#90e8b0") (fg-mode-line  "#243228")
      (bg-accent     "#880044") (fg-accent     "#ffffff")
      (bg-completion "#ccedff")
      (bg-hover      "#ffc09f")
      (bg-hover-alt  "#feb5ff")
      (bg-hl-line    "#f9e0e5")
      (bg-region     "#d0e6ff")
      (bg-active     "#d0d6d3")
      (bg-paren      "#8fcfdf")
      (bg-err        "#ffe8e0") ; check with err
      (bg-info       "#ccf5dd") ; check with info

      (border        "#b9d0c4")
      (cursor        "#0077cc")
      (fg-intense    "#000000")

      ;; Mappings
      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link blue-cooler)
      (link-alt red-cooler)
      (date cyan)
      (name green-cooler)
      (keybind blue-cooler)

      (builtin green)
      (comment yellow-faint)
      (constant red-warmer)
      (fnname green-warmer)
      (keyword green-cooler)
      (preprocessor magenta-warmer)
      (docstring red-faint)
      (string yellow-warmer)
      (type magenta-cooler)
      (variable cyan)

      (accent-0 green)
      (accent-1 red-cooler)
      (accent-2 blue)
      (accent-3 yellow-warmer)

      (mail-0 green)
      (mail-1 magenta-cooler)
      (mail-2 yellow-warmer)
      (mail-3 blue)
      (mail-4 green-warmer)

      (rainbow-0 red-cooler)
      (rainbow-1 green-cooler)
      (rainbow-2 magenta-warmer)
      (rainbow-3 blue-warmer)
      (rainbow-4 yellow-warmer)
      (rainbow-5 cyan)
      (rainbow-6 red-warmer)
      (rainbow-7 magenta-cooler)
      (rainbow-8 yellow-cooler))
    "The `ef-spring' palette.")

  (ef-themes-theme ef-spring ef-spring-palette)

  (provide-theme 'ef-spring))

;;; ef-spring-theme.el ends here
