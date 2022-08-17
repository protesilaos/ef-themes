;;; ef-spring-theme.el --- Legible light theme -*- lexical-binding:t -*-

;; Copyright (C) 2022  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Ef-Themes Development <~protesilaos/ef-themes@lists.sr.ht>
;; URL: https://git.sr.ht/~protesilaos/ef-themes
;; Mailing-List: https://lists.sr.ht/~protesilaos/ef-themes
;; Version: 0.1.0
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

  (deftheme ef-spring "Legible light theme.")

  (defconst ef-spring-palette
    '(;; Basic tones
      (bg-main  "#f6fff9")
      (fg-main  "#3f4946")
      (bg-dim   "#e8f0f0")
      (fg-dim   "#707586")
      (bg-alt   "#e0e6e3")
      (fg-alt   "#9d5e7a")

      ;; Basic hues for foreground values
      (red             "#c42d2f")
      (red-warmer      "#d03003")
      (red-cooler      "#cf2f4f")
      (red-faint       "#b64850")
      (green           "#14872f")
      (green-warmer    "#4a7d00")
      (green-cooler    "#007f68")
      (green-faint     "#61756c")
      (yellow          "#a45f22")
      (yellow-warmer   "#b6540f")
      (yellow-cooler   "#ae5a30")
      (yellow-faint    "#876450")
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
      (cyan-faint      "#5f6abf")

      ;; Basic hues for background values
      (bg-red      "#ff8f88")
      (bg-green    "#6fdf30")
      (bg-yellow   "#efcf00")
      (bg-blue     "#afdfff")
      (bg-magenta  "#ff90fe")
      (bg-cyan     "#88cfe0")

      ;; Diffs
      (bg-added          "#ddfadd")
      (bg-added-faint    "#ecffec")
      (bg-added-refine   "#c0efc0")

      (bg-changed        "#ffe0b9")
      (bg-changed-faint  "#ffefcb")
      (bg-changed-refine "#ffcf9f")

      (bg-removed        "#ffe2e2")
      (bg-removed-faint  "#ffefef")
      (bg-removed-refine "#ffc0c0")

      ;; Special hues
      (bg-mode-line  "#90e8b0") (fg-mode-line  "#243228")
      (bg-accent     "#880044") (fg-accent     "#ffffff")
      (bg-completion "#ccedff")
      (bg-hover      "#ffc09f")
      (bg-hover-alt  "#feb5ff")
      (bg-hl-line    "#f9e0e5")
      (bg-region     "#d0e6ff")
      (bg-active     "#d0d6d3")
      (bg-paren      "#8fddb0")
      (bg-err        "#ffe8e0") ; check with err
      (bg-info       "#ccf5dd") ; check with info

      (border        "#b9d0c4")
      (cursor        "#0077cc")
      (fg-intense    "#000000")

      ;; Mappings
      (err red-warmer)
      (warning yellow-warmer)
      (info green)

      (link green-cooler)
      (link-alt blue-cooler)
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
