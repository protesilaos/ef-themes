;;; ef-elea-dark-theme.el --- Legible dark theme with brown, magenta, and green colors -*- lexical-binding:t -*-

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

(defconst ef-elea-dark-palette-partial
  '((cursor "#ef7fa8")
    (bg-main "#222524")
    (bg-dim "#303332")
    (bg-alt "#3e4140")
    (fg-main "#eaf2ef")
    (fg-dim "#969faf")
    (fg-alt "#8fcfbb")
    (bg-active "#5e6160")
    (bg-inactive "#2b2e2d")
    (border "#5d5f63")

    (red "#ff656a")
    (red-warmer "#ff7a5f")
    (red-cooler "#fa7f88")
    (red-faint "#eba8a8")
    (green "#7fc87f")
    (green-warmer "#7fca5a")
    (green-cooler "#50cf89")
    (green-faint "#a9c99f")
    (yellow "#cac85f")
    (yellow-warmer "#e0b02f")
    (yellow-cooler "#cfb27f")
    (yellow-faint "#cac89f")
    (blue "#57aff6")
    (blue-warmer "#78afff")
    (blue-cooler "#62cfef")
    (blue-faint "#6ab4ef")
    (magenta "#f59acf")
    (magenta-warmer "#fa90ea")
    (magenta-cooler "#cfaaff")
    (magenta-faint "#d0b9f0")
    (cyan "#6fcfd2")
    (cyan-warmer "#7fcfdf")
    (cyan-cooler "#60d5c2")
    (cyan-faint "#99bfcf")

    (bg-red-intense "#bd1f30")
    (bg-green-intense "#408420")
    (bg-yellow-intense "#847020")
    (bg-blue-intense "#2f5f9f")
    (bg-magenta-intense "#b05fcf")
    (bg-cyan-intense "#028099")

    (bg-red-subtle "#6c2a2a")
    (bg-green-subtle "#2f532a")
    (bg-yellow-subtle "#62432a")
    (bg-blue-subtle "#26486c")
    (bg-magenta-subtle "#59335b")
    (bg-cyan-subtle "#204c60")

    (bg-added "#20493f")
    (bg-added-faint "#203a2f")
    (bg-added-refine "#136244")
    (fg-added "#a0e0a0")

    (bg-changed "#51512f")
    (bg-changed-faint "#40332f")
    (bg-changed-refine "#61621f")
    (fg-changed "#dada90")

    (bg-removed "#5e242f")
    (bg-removed-faint "#4a242a")
    (bg-removed-refine "#772a35")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#35605d")
    (fg-mode-line-active "#ecf0ff")
    (bg-completion "#37493f")
    (bg-hover "#894f7a")
    (bg-hover-secondary "#425d4a")
    (bg-hl-line "#2f413f")
    (bg-paren-match "#3f6f5f")
    (bg-region "#543040")
    (bg-err "#551525") ; check with err
    (bg-warning "#424223") ; check with warning
    (bg-info "#104420") ; check with info

    (err red-warmer)
    (warning yellow-warmer)
    (info green-cooler)

    (fg-link green-warmer)
    (fg-link-alt magenta)
    (name green)
    (keybind magenta)
    (identifier magenta-faint)
    (fg-prompt magenta-cooler)

    (builtin magenta-faint)
    (comment yellow-faint)
    (constant magenta-cooler)
    (fnname green-warmer)
    (fnname-call green-faint)
    (keyword red-faint)
    (preprocessor magenta-warmer)
    (docstring cyan-faint)
    (string green-cooler)
    (type cyan)
    (variable magenta)
    (variable-use magenta-faint)
    (rx-escape magenta-cooler) ; compare with `string'
    (rx-construct red)

    (accent-0 green-cooler)
    (accent-1 magenta)
    (accent-2 magenta-cooler)
    (accent-3 blue-warmer)

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
    (prose-done green-warmer)
    (prose-macro magenta-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag cyan-faint)
    (prose-todo red-warmer)
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
    (rainbow-5 magenta)
    (rainbow-6 green)
    (rainbow-7 yellow-cooler)
    (rainbow-8 blue-faint))
  "Legible dark green theme with brown, magenta, and green colors.")

(defcustom ef-elea-dark-palette-overrides nil
  "Overrides for `ef-elea-dark-palette'.

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

(defconst ef-elea-dark-palette
  (append ef-themes-common-palette-overrides ef-elea-dark-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-elea-dark
 'ef-themes
 "Legible dark green theme with brown, magenta, and green colors."
 'dark
 'modus-vivendi-palette
 'ef-elea-dark-palette
 'ef-elea-dark-palette-overrides
 'ef-themes-custom-faces)

;;; ef-elea-dark-theme.el ends here
