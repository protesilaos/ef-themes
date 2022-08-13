;;; ef-winter-theme.el --- Elegant, highly legible and customizable light theme -*- lexical-binding:t -*-

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

  (deftheme ef-winter "Dark theme with a pleasant palette.")

  (defconst ef-winter-palette
    '(;; Basic tones
      (bg-main "#0f0b15") (fg-main "#b8bbd5")
      (bg-dim  "#221a2f") (fg-dim  "#80779f")
      (bg-alt  "#252544") (fg-alt  "#b0629f")

      ;; Basic hues for foreground values
      (red             "#ef656a") (green         "#0faa26")
      (red-warmer      "#f47360") (green-warmer  "#6aad0f")
      (red-cooler      "#ff5f7f") (green-cooler  "#00af8f")
      (red-faint       "#d56f72") (green-faint   "#61a06c")
      (yellow          "#c48502") (blue          "#379cf6")
      (yellow-warmer   "#e6832f") (blue-warmer   "#6a9fff")
      (yellow-cooler   "#df8f7f") (blue-cooler   "#029fff")
      (yellow-faint    "#cf9f7f") (blue-faint    "#7a94df")
      (magenta         "#d0669f") (cyan          "#4fb0cf")
      (magenta-warmer  "#e580ea") (cyan-warmer   "#6fafff")
      (magenta-cooler  "#af8fff") (cyan-cooler   "#20bfdf")
      (magenta-faint   "#c57faf") (cyan-faint    "#8aa0df")

      ;; Basic hues for background values
      (bg-red      "#cd2f30") (bg-green  "#20a020")
      (bg-yellow   "#b47040") (bg-blue   "#4648d0")
      (bg-magenta  "#c040cf") (bg-cyan   "#2270be")

      ;; Diffs
      (bg-added          "#003959")
      (bg-added-faint    "#001f48")
      (bg-added-refine   "#234f8f")

      (bg-changed        "#424200")
      (bg-changed-faint  "#2a2000")
      (bg-changed-refine "#585800")

      (bg-removed        "#500f39")
      (bg-removed-faint  "#3a162f")
      (bg-removed-refine "#85284f")

      ;; Special hues
      (bg-mode-line  "#600f5a") (fg-mode-line  "#dedeff")
      (bg-completion "#2f2a7a")
      (bg-hover      "#00474f")
      (bg-hover-alt  "#6030a5")
      (bg-hl-line    "#003045")
      (bg-region     "#34246f")

      (border        "#eebfef")
      (cursor        "#ff55cc")
      (fg-intense    "#ffffff")

      ;; Mappings
      (err red-warmer)
      (warning red)
      (info blue)

      (link blue-warmer)
      (link-alt cyan-warmer)
      (date cyan)
      (name blue)
      (keybind blue-cooler)

      (builtin magenta-warmer)
      (comment yellow-faint)
      (constant blue-cooler)
      (fnname magenta)
      (keyword magenta-cooler)
      (preprocessor red-warmer)
      (docstring cyan-faint)
      (string cyan-cooler)
      (type green-warmer)
      (variable green-cooler)

      (accent-0 magenta-warmer)
      (accent-1 green-cooler)
      (accent-2 red-cooler)
      (accent-3 blue-cooler)

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
    "The `ef-winter' palette.")

  (ef-themes-theme ef-winter ef-winter-palette)

  (provide-theme 'ef-winter))

;;; ef-winter-theme.el ends here
