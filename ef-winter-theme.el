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
;; Work-in-progress.

;;; Code:



(eval-and-compile
  (require 'ef-themes)

  (deftheme ef-winter "Legible dark theme.")

  (defconst ef-winter-palette
    '(;; Basic tones
      (bg-main "#0f0b15") (fg-main "#b8c6d5")
      (bg-dim  "#221a2f") (fg-dim  "#807c9f")
      (bg-alt  "#252544") (fg-alt  "#b0889f")

      ;; Basic hues for foreground values
      (red             "#ef6560") (green         "#0faa26")
      (red-warmer      "#f47360") (green-warmer  "#6aad0f")
      (red-cooler      "#ff5a7a") (green-cooler  "#00a692")
      (red-faint       "#d56f72") (green-faint   "#61a06c")
      (yellow          "#c48032") (blue          "#379cf6")
      (yellow-warmer   "#d1843f") (blue-warmer   "#6a9fff")
      (yellow-cooler   "#df8f7f") (blue-cooler   "#029fff")
      (yellow-faint    "#cf9f7f") (blue-faint    "#7a94df")
      (magenta         "#dc669f") (cyan          "#4fb0cf")
      (magenta-warmer  "#e580ea") (cyan-warmer   "#6fafff")
      (magenta-cooler  "#af85ff") (cyan-cooler   "#1dbfcf")
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
      (bg-info       "#001d40") ; check with info

      (border        "#543f6f")
      (cursor        "#ff55cc")
      (fg-intense    "#ffffff")

      ;; Mappings
      (err red-warmer)
      (warning yellow-warmer)
      (info blue)

      (link blue-warmer)
      (link-alt cyan-warmer)
      (date green-cooler)
      (name blue)
      (keybind blue-cooler)

      (builtin magenta-cooler)
      (comment yellow-faint)
      (constant cyan-cooler)
      (fnname blue)
      (keyword green-cooler)
      (preprocessor green-warmer)
      (docstring cyan-faint)
      (string yellow)
      (type magenta-warmer)
      (variable magenta)

      (accent-0 magenta-cooler)
      (accent-1 yellow)
      (accent-2 cyan-cooler)
      (accent-3 red)

      (mail-0 yellow-warmer)
      (mail-1 magenta-cooler)
      (mail-2 green-cooler)
      (mail-3 red-cooler)
      (mail-4 cyan)

      (rainbow-0 magenta-cooler)
      (rainbow-1 yellow-warmer)
      (rainbow-2 blue)
      (rainbow-3 red)
      (rainbow-4 cyan)
      (rainbow-5 magenta-warmer)
      (rainbow-6 green-warmer)
      (rainbow-7 cyan-warmer)
      (rainbow-8 red-cooler))
    "The `ef-winter' palette.")

  (ef-themes-theme ef-winter ef-winter-palette)

  (provide-theme 'ef-winter))

;;; ef-winter-theme.el ends here
