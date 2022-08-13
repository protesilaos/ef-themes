;;; ef-summer-theme.el --- Elegant, highly legible and customizable light theme -*- lexical-binding:t -*-

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



(defun test-ef-summer ()
  (interactive)
  (mapc #'disable-theme custom-enabled-themes)
  (load-theme 'ef-summer :no-confirm))

(add-to-list 'custom-theme-load-path "/home/prot/Git/Projects/ef-themes/")

(eval-and-compile
  (require 'ef-themes)

  (deftheme ef-summer "Light theme with a warm, pleasant palette.")

  (defconst ef-summer-palette
    '(;; Basic tones
      (bg-main "#fff2f3") (fg-main "#5f3f8f")
      (bg-dim  "#fbe3ef") (fg-dim  "#7f6887")
      (bg-alt  "#efd0e4") (fg-alt  "#af506f")

      ;; Basic hues for foreground values
      (red             "#d3303a") (green         "#217a3c")
      (red-warmer      "#e00033") (green-warmer  "#4a7d00")
      (red-cooler      "#d50f7f") (green-cooler  "#007f68")
      (red-faint       "#c24552") (green-faint   "#61756c")
      (yellow          "#a45f22") (blue          "#375ce6")
      (yellow-warmer   "#b6532f") (blue-warmer   "#5250ef")
      (yellow-cooler   "#b65050") (blue-cooler   "#065fff")
      (yellow-faint    "#a05f5a") (blue-faint    "#6070d0")
      (magenta         "#ba35af") (cyan          "#1f6fbf")
      (magenta-warmer  "#cb1aaa") (cyan-warmer   "#3f6faf")
      (magenta-cooler  "#7450df") (cyan-cooler   "#0f7b8f")
      (magenta         "#bf3580") (cyan-faint    "#5f60bf")

      ;; Basic hues for background values
      (bg-red      "#ff7f88") (bg-green  "#86df80")
      (bg-yellow   "#ffc200") (bg-blue   "#cbcfff")
      (bg-magenta  "#ff9fee") (bg-cyan   "#88ccff")

      ;; Diffs
      (bg-added          "#c5eaff")
      (bg-added-faint    "#dff6ff")
      (bg-added-refine   "#bad7f5")

      (bg-changed        "#ffdd99")
      (bg-changed-faint  "#ffeebb")
      (bg-changed-refine "#ffca9f")

      (bg-removed        "#ffc0ef")
      (bg-removed-faint  "#ffcdef")
      (bg-removed-refine "#f0a8ea")

      ;; (bg-removed        "#ffc8df")
      ;; (bg-removed-faint  "#ffcfef")
      ;; (bg-removed-refine "#ffb0ca")

      ;; Special hues
      (bg-mode-line  "#ffa4dc") (fg-mode-line  "#341f58")
      (bg-completion "#f4cfff")
      (bg-hover      "#b4cfff")
      (bg-hover-alt  "#aaeccf")
      (bg-hl-line    "#f5deb3")
      (bg-region     "#eecfff")

      (border        "#eebfef")
      (cursor        "#cf0090")
      (fg-intense    "#000000")

      ;; Mappings
      (err red-warmer)
      (warning red)
      (info blue)

      (link blue-warmer)
      (link-alt cyan-warmer)
      (date cyan)
      (name blue)
      (keybind blue-cooler)

      (builtin magenta)
      (comment yellow-cooler)
      (constant red-cooler)
      (fnname magenta-warmer)
      (keyword magenta-cooler)
      (preprocessor green-warmer)
      (docstring cyan-faint)
      (string cyan-cooler)
      (type cyan-warmer)
      (variable blue-warmer)

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
      (rainbow-3 yellow)
      (rainbow-4 cyan)
      (rainbow-5 magenta-warmer)
      (rainbow-6 green)
      (rainbow-7 blue-warmer)
      (rainbow-8 yellow-cooler))
    "The `ef-summer' palette.")

  (ef-themes-theme ef-summer ef-summer-palette)

  (provide-theme 'ef-summer))

;;; ef-summer-theme.el ends here
