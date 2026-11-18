;;; ef-october-theme.el --- Legible dark theme with magenta, purple, gold, cyan colors -*- lexical-binding:t -*-

;; Copyright (C) 2022-2026  Free Software Foundation, Inc.

;; Author: Protesilaos <info@protesilaos.com>
;; Maintainer: Protesilaos <info@protesilaos.com>
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

(defconst ef-october-palette-partial
  '((cursor "#ff6dbf")
    (bg-main "#211522")
    (bg-dim "#2b1d2e")
    (bg-alt "#382540")
    (fg-main "#f5dcea")
    (fg-dim "#b2a1b0")
    (fg-alt "#e6a4d3")
    (bg-active "#60415a")
    (bg-inactive "#302233")
    (border "#705466")

    (red "#ff7e93")
    (red-warmer "#ff8874")
    (red-cooler "#ff78c0")
    (red-faint "#d69ba8")
    (green "#8bd89b")
    (green-warmer "#b9d777")
    (green-cooler "#6bdcc7")
    (green-faint "#9bbda8")
    (yellow "#efc46d")
    (yellow-warmer "#ffae72")
    (yellow-cooler "#efb2a2")
    (yellow-faint "#c7a5a6")
    (blue "#94b9ff")
    (blue-warmer "#b0aaff")
    (blue-cooler "#77c5ff")
    (blue-faint "#a0a9df")
    (magenta "#eea1e9")
    (magenta-warmer "#ff87d7")
    (magenta-cooler "#c5a0ff")
    (magenta-faint "#d4a1d3")
    (cyan "#86d8f4")
    (cyan-warmer "#9dc7fa")
    (cyan-cooler "#76e0e5")
    (cyan-faint "#9dbeca")

    (bg-red-intense "#9b3854")
    (bg-green-intense "#2f634c")
    (bg-yellow-intense "#77551d")
    (bg-blue-intense "#375c96")
    (bg-magenta-intense "#713c82")
    (bg-cyan-intense "#2e637f")

    (bg-red-subtle "#51283a")
    (bg-green-subtle "#294637")
    (bg-yellow-subtle "#4a392d")
    (bg-blue-subtle "#2d395b")
    (bg-magenta-subtle "#4b3056")
    (bg-cyan-subtle "#28434d")

    (bg-added "#28483b")
    (bg-added-faint "#26382f")
    (bg-added-refine "#35664b")
    (fg-added "#9be9ad")

    (bg-changed "#51402e")
    (bg-changed-faint "#3a302c")
    (bg-changed-refine "#715033")
    (fg-changed "#ffd391")

    (bg-removed "#552b40")
    (bg-removed-faint "#3c2535")
    (bg-removed-refine "#76364a")
    (fg-removed "#ffabb9")

    (bg-mode-line-active "#7b376c")
    (fg-mode-line-active "#ffeff6")

    (bg-completion "#4d305b")
    (bg-popup "#39253a")
    (bg-hover "#42466f")
    (bg-hover-secondary "#365a4c")
    (bg-hl-line "#3a2540")
    (bg-paren-match "#4d577c")
    (bg-err "#5f293a") ; check with err
    (bg-warning "#5b442c") ; check with warning
    (bg-info "#284d41") ; check with info
    (bg-region "#633965")))

(defconst ef-october-palette-mappings-partial
  '((err red-warmer)
    (warning yellow)
    (info green-cooler)

    (fg-link blue)
    (fg-link-visited green-cooler)
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
    (rx-backslash cyan-cooler) ; compare with `string'
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

    (fg-prose-code yellow)
    (prose-done green-cooler)
    (fg-prose-macro cyan-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag yellow-faint)
    (prose-todo red-warmer)
    (fg-prose-verbatim magenta-cooler)

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
    (rainbow-8 yellow-cooler)))

(defcustom ef-october-palette-overrides nil
  "Overrides for `ef-october-palette'.

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

(defconst ef-october-palette
  (modus-themes-generate-palette
   ef-october-palette-partial
   nil
   nil
   (append ef-october-palette-mappings-partial ef-themes-palette-common)))

;;;###theme-autoload
(modus-themes-theme
 'ef-october
 'ef-themes
 "Legible dark warm plum theme with magenta, purple, gold, cyan colors."
 'dark
 'ef-october-palette
 nil
 'ef-october-palette-overrides)

(provide 'ef-october-theme)

;;; ef-october-theme.el ends here
