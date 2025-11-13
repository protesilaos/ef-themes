;;; ef-elea-light-theme.el --- Legible light theme with brown, magenta, and green colors -*- lexical-binding:t -*-

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

(defconst ef-elea-light-palette-partial
  '((cursor "#770080")
    (bg-main "#edf5e2")
    (bg-dim "#e3e9d6")
    (bg-alt "#d0d7ca")
    (fg-main "#221321")
    (fg-dim "#676470")
    (fg-alt "#5f5f1f")
    (bg-active "#b0b7aa")
    (bg-inactive "#e8eddc")
    (border "#a5aaaf")

    (red "#c3303a")
    (red-warmer "#d00000")
    (red-cooler "#b02440")
    (red-faint "#894852")
    (green "#00601f")
    (green-warmer "#355500")
    (green-cooler "#007047")
    (green-faint "#306630")
    (yellow "#9a501f")
    (yellow-warmer "#b04300")
    (yellow-cooler "#88541f")
    (yellow-faint "#7f4f4a")
    (blue "#375cc6")
    (blue-warmer "#444fcf")
    (blue-cooler "#162f8f")
    (blue-faint "#3a5099")
    (magenta "#80308f")
    (magenta-warmer "#9f356a")
    (magenta-cooler "#5032aa")
    (magenta-faint "#6a4a9f")
    (cyan "#1f70af")
    (cyan-warmer "#3f6faf")
    (cyan-cooler "#00677f")
    (cyan-faint "#4f677f")

    (bg-red-intense "#ff8f88")
    (bg-green-intense "#a6df80")
    (bg-yellow-intense "#efbf00")
    (bg-blue-intense "#cfceff")
    (bg-magenta-intense "#df9fff")
    (bg-cyan-intense "#88cbdc")

    (bg-red-subtle "#f0c6bf")
    (bg-green-subtle "#c0e8a7")
    (bg-yellow-subtle "#e4e48f")
    (bg-blue-subtle "#c9d8f3")
    (bg-magenta-subtle "#edd2f0")
    (bg-cyan-subtle "#b7e4f0")

    (bg-added "#c7e8ba")
    (bg-added-faint "#def0cb")
    (bg-added-refine "#bed9b0")
    (fg-added "#005000")

    (bg-changed "#f5e8b0")
    (bg-changed-faint "#f5f2bf")
    (bg-changed-refine "#f0db9a")
    (fg-changed "#553d00")

    (bg-removed "#f2d0c6")
    (bg-removed-faint "#f0e0c0")
    (bg-removed-refine "#efbfbd")
    (fg-removed "#8f1313")

    (bg-mode-line-active "#a5c67f")
    (fg-mode-line-active "#142810")
    (bg-completion "#c2eaba")
    (bg-hover "#dfbac0")
    (bg-hover-secondary "#b5dfbf")
    (bg-hl-line "#d0e7c4")
    (bg-paren-match "#8ad3a2")
    (bg-region "#d9d2ef")
    (bg-err "#f2d5b5") ; check with err
    (bg-warning "#e8e8aa") ; check with warning
    (bg-info "#b4efc6") ; check with info

    (err red-warmer)
    (warning yellow-warmer)
    (info green-cooler)

    (fg-link green)
    (fg-link-alt magenta)
    (name green-warmer)
    (keybind magenta)
    (identifier magenta-faint)
    (fg-prompt magenta-warmer)

    (builtin magenta-faint)
    (comment yellow-faint)
    (constant magenta-cooler)
    (fnname green-warmer)
    (fnname-call green-faint)
    (keyword red-faint)
    (preprocessor magenta-warmer)
    (docstring cyan-faint)
    (string green-cooler)
    (type blue-cooler)
    (variable magenta)
    (variable-use magenta-faint)
    (rx-escape magenta-cooler) ; compare with `string'
    (rx-construct red)

    (accent-0 green-cooler)
    (accent-1 magenta-warmer)
    (accent-2 magenta-cooler)
    (accent-3 cyan)

    (date-common green-cooler)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday magenta-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan-cooler)
    (date-weekend red-faint)

    (prose-code magenta)
    (prose-done green-cooler)
    (prose-macro magenta-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag cyan-faint)
    (prose-todo red)
    (prose-verbatim cyan-cooler)

    (mail-cite-0 cyan-cooler)
    (mail-cite-1 magenta)
    (mail-cite-2 green-warmer)
    (mail-cite-3 magenta-cooler)
    (mail-part yellow-cooler)
    (mail-recipient red-faint)
    (mail-subject green-cooler)
    (mail-other green)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 green-warmer)
    (rainbow-1 red-faint)
    (rainbow-2 green-faint)
    (rainbow-3 cyan-cooler)
    (rainbow-4 magenta-cooler)
    (rainbow-5 magenta-warmer)
    (rainbow-6 green)
    (rainbow-7 yellow)
    (rainbow-8 magenta-faint))
  "Legible light green theme with brown, magenta, and green colors.")

(defcustom ef-elea-light-palette-overrides nil
  "Overrides for `ef-elea-light-palette'.

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

(defconst ef-elea-light-palette
  (append ef-themes-common-palette-overrides ef-elea-light-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-elea-light
 'ef-themes
 "Legible light green theme with brown, magenta, and green colors."
 'light
 'modus-operandi-palette
 'ef-elea-light-palette
 'ef-elea-light-palette-overrides
 'ef-themes-custom-faces)

;;; ef-elea-light-theme.el ends here
