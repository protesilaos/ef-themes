;;; ef-summer-theme.el --- Legible light theme with magenta, purple, gold, cyan colors -*- lexical-binding:t -*-

;; Copyright (C) 2022-2025  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Protesilaos Stavrou <info@protesilaos.com>
;; URL: https://github.com/protesilaos/ef-themes
;; Keywords: faces, theme, accessibility

;; This file is NOT part of GNU Emacs.

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



(require 'ef-themes)

(defconst ef-summer-palette-partial
  '((cursor "#cf0090")
    (bg-main "#fff2f3")
    (bg-dim "#f2e4ea")
    (bg-alt "#efd3e4")
    (fg-main "#4f4073")
    (fg-dim "#786e74")
    (fg-alt "#af4988")
    (bg-active "#cfb3c4")
    (bg-inactive "#f7ebee")
    (border "#c6bbc6")

    (red "#d3303a")
    (red-warmer "#e00033")
    (red-cooler "#d50f7f")
    (red-faint "#c24552")
    (green "#217a3c")
    (green-warmer "#4a7d00")
    (green-cooler "#007f68")
    (green-faint "#61756c")
    (yellow "#a45f22")
    (yellow-warmer "#b6532f")
    (yellow-cooler "#b65050")
    (yellow-faint "#9a5f6a")
    (blue "#375ce6")
    (blue-warmer "#5250ef")
    (blue-cooler "#065fff")
    (blue-faint "#6060d0")
    (magenta "#ba35af")
    (magenta-warmer "#cb1aaa")
    (magenta-cooler "#8e44f3")
    (magenta-faint "#a45392")
    (cyan "#1f6fbf")
    (cyan-warmer "#3f6faf")
    (cyan-cooler "#0f7b8f")
    (cyan-faint "#5f60bf")

    (bg-red-intense "#ff7f88")
    (bg-green-intense "#86df80")
    (bg-yellow-intense "#ffc200")
    (bg-blue-intense "#cbcfff")
    (bg-magenta-intense "#df8fff")
    (bg-cyan-intense "#88ccff")

    (bg-red-subtle "#fbc3cf")
    (bg-green-subtle "#b9edca")
    (bg-yellow-subtle "#f7e78f")
    (bg-blue-subtle "#ccdfff")
    (bg-magenta-subtle "#facdf5")
    (bg-cyan-subtle "#c2ecf0")

    (bg-added "#caf4da")
    (bg-added-faint "#dff6ea")
    (bg-added-refine "#bae9cf")
    (fg-added "#005000")

    (bg-changed "#ffdfb9")
    (bg-changed-faint "#ffefcb")
    (bg-changed-refine "#ffcfa0")
    (fg-changed "#553d00")

    (bg-removed "#ffcee0")
    (bg-removed-faint "#ffdfe6")
    (bg-removed-refine "#f5b6c8")
    (fg-removed "#8f1313")

    (bg-mode-line-active "#ffa4dc")
    (fg-mode-line-active "#341f58")

    (bg-completion "#f4cfff")
    (bg-hover "#b4cfff")
    (bg-hover-secondary "#aaeccf")
    (bg-hl-line "#ffd6e5")
    (bg-paren-match "#9fc0ef")
    (bg-region "#eecfff")
    (bg-err "#ffd0e6") ; check with err
    (bg-warning "#ffe5ba") ; check with warning
    (bg-info "#bbefda") ; check with info

    (err red-warmer)
    (warning yellow)
    (info green-cooler)

    (link blue)
    (link-alt green-cooler)
    (name magenta-warmer)
    (keybind red-cooler)
    (identifier magenta-faint)
    (fg-prompt magenta-warmer)

    (builtin magenta)
    (comment yellow-faint)
    (constant red-cooler)
    (fnname magenta-warmer)
    (fnname-call magenta-faint)
    (keyword magenta-cooler)
    (preprocessor green-cooler)
    (docstring cyan-faint)
    (string yellow-warmer)
    (type cyan-warmer)
    (variable blue-warmer)
    (variable-use blue-faint)
    (rx-escape cyan-cooler) ; compare with `string'
    (rx-construct red-cooler)

    (accent-0 magenta-cooler)
    (accent-1 yellow)
    (accent-2 cyan-cooler)
    (accent-3 red)

    (date-common cyan-cooler)
    (date-deadline red-warmer)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday magenta-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (prose-code yellow)
    (prose-done green-cooler)
    (prose-macro cyan-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag yellow-faint)
    (prose-todo red-warmer)
    (prose-verbatim magenta-cooler)

    (mail-cite-0 yellow-cooler)
    (mail-cite-1 magenta)
    (mail-cite-2 blue-warmer)
    (mail-cite-3 cyan-warmer)
    (mail-part magenta-faint)
    (mail-recipient magenta-warmer)
    (mail-subject magenta-cooler)
    (mail-other magenta)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (rainbow-0 magenta-warmer)
    (rainbow-1 magenta-cooler)
    (rainbow-2 yellow)
    (rainbow-3 cyan)
    (rainbow-4 magenta)
    (rainbow-5 blue-warmer)
    (rainbow-6 red-cooler)
    (rainbow-7 cyan-cooler)
    (rainbow-8 yellow-cooler))
  "Legible light warm pink theme with magenta, purple, gold, cyan colors.")

(defcustom ef-summer-palette-overrides nil
  "Overrides for `ef-summer-palette'.

Mirror the elements of the aforementioned palette, overriding
their value.

For overrides that are shared across all of the Ef themes,
refer to `ef-themes-common-palette-overrides'.

To preview the palette entries, use `ef-themes-preview-colors' or
`ef-themes-preview-colors-current' (read the documentation for
further details)."
  :group 'ef-themes
  :package-version '(ef-themes . "1.0.0")
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(ef-themes) Palette overrides"))

(defconst ef-summer-palette
  (append ef-themes-common-palette-overrides ef-summer-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-summer
 'ef-themes
 "Legible light warm pink theme with magenta, purple, gold, cyan colors."
 'light
 'modus-operandi-palette
 'ef-summer-palette
 'ef-summer-palette-overrides
 'ef-themes-custom-faces)

;;; ef-summer-theme.el ends here
