;;; ef-night-theme.el --- Dark theme with a warm, colorful palette -*- lexical-binding:t -*-

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

  (deftheme ef-night "Dark theme with a warm and pleasant palette.")

  (defconst ef-night-palette
    '(;; Basic tones
      (bg-main "#001313") (fg-main "#afbcbf")
      (bg-dim  "#122024") (fg-dim  "#70857f")
      (bg-alt  "#1a2a2a") (fg-alt  "#70a89f")

      ;; Basic hues for foreground values
      (red             "#ef656a") (green         "#0faa26")
      (red-warmer      "#f47360") (green-warmer  "#50a22f")
      (red-cooler      "#ef798f") (green-cooler  "#00a692")
      (red-faint       "#d56f72") (green-faint   "#61a06c")
      (yellow          "#c48502") (blue          "#379cf6")
      (yellow-warmer   "#e6832f") (blue-warmer   "#6a90ff")
      (yellow-cooler   "#df8f7f") (blue-cooler   "#029fff")
      (yellow-faint    "#cf9f7f") (blue-faint    "#7a94df")
      (magenta         "#d0709f") (cyan          "#4fb0cf")
      (magenta-warmer  "#e580ea") (cyan-warmer   "#6fafff")
      (magenta-cooler  "#a587ff") (cyan-cooler   "#3dc0b0")
      (magenta-faint   "#c57faf") (cyan-faint    "#8aa0df")

      ;; Basic hues for background values
      (bg-red      "#cd2f30") (bg-green  "#20a020")
      (bg-yellow   "#a05f00") (bg-blue   "#2f38af")
      (bg-magenta  "#c040cf") (bg-cyan   "#027080")

      ;; Diffs
      (bg-added          "#003a2f")
      (bg-added-faint    "#002f28")
      (bg-added-refine   "#005a4f")

      (bg-changed        "#424200")
      (bg-changed-faint  "#2a2000")
      (bg-changed-refine "#585800")

      (bg-removed        "#55142a")
      (bg-removed-faint  "#3a111f")
      (bg-removed-refine "#701836")

      ;; Special hues
      (bg-mode-line  "#004f60") (fg-mode-line  "#ceeedf")
      (bg-accent     "#ff9270") (fg-accent     "#000000")
      (bg-completion "#00314f")
      (bg-hover      "#664f4a")
      (bg-hover-alt  "#6f2f5a")
      (bg-hl-line    "#003045")
      (bg-region     "#38261f")
      (bg-active     "#2a3a3a")
      (bg-paren      "#703350")
      (bg-err        "#33140f") ; check with err
      (bg-info       "#00290f") ; check with info

      (border        "#344f4a")
      (cursor        "#22ccdd")
      (fg-intense    "#ffffff")

      ;; Mappings
      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link cyan)
      (link-alt yellow)
      (date cyan-cooler)
      (name green-warmer)
      (keybind blue-cooler)

      (builtin green-warmer)
      (comment yellow-faint)
      (constant blue-cooler)
      (fnname red-cooler)
      (keyword green-cooler)
      (preprocessor red-warmer)
      (docstring fg-alt)
      (string cyan-warmer)
      (type blue-warmer)
      (variable magenta-cooler)

      (accent-0 green-cooler)
      (accent-1 magenta)
      (accent-2 blue-warmer)
      (accent-3 red)

      (mail-0 cyan)
      (mail-1 magenta)
      (mail-2 green-cooler)
      (mail-3 yellow-cooler)
      (mail-4 magenta-cooler)

      (rainbow-0 red-cooler)
      (rainbow-1 magenta-cooler)
      (rainbow-2 green-cooler)
      (rainbow-3 magenta-warmer)
      (rainbow-4 cyan)
      (rainbow-5 yellow)
      (rainbow-6 green)
      (rainbow-7 blue-warmer)
      (rainbow-8 yellow-cooler))
    "The `ef-night' palette.")

  (ef-themes-theme ef-night ef-night-palette)

  (provide-theme 'ef-night))

;;; ef-night-theme.el ends here
