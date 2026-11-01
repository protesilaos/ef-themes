;;; ef-hypnos-theme.el --- Legible light peach cream theme with gold and nuanced colors -*- lexical-binding:t -*-

;; Copyright (C) 2022-2026  Free Software Foundation, Inc.

;; Author: Emin Can Özen <emincan.oezen@gmail.com>
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

(defconst ef-hypnos-palette-partial
  '((cursor "#9b4a00")
    (bg-main "#eee0d4")
    (bg-dim "#e5d4c7")
    (bg-alt "#dcc5ba")
    (fg-main "#342d39")
    (fg-dim "#5d514e")
    (fg-alt "#584579")
    (bg-active "#b9a095")
    (bg-inactive "#dfcbbf")
    (border "#ab8d7b")
    (ok "#00ffff")
    (red "#c12031")
    (red-warmer "#bd2c0e")
    (red-cooler "#ac3d4a")
    (red-faint "#984d4f")
    (green "#00740a")
    (green-warmer "#2e7200")
    (green-cooler "#00724a")
    (green-faint "#4f6b46")
    (yellow "#706400")
    (yellow-warmer "#8b5900")
    (yellow-cooler "#885a1b")
    (yellow-faint "#7b5c54")
    (blue "#0067ab")
    (blue-warmer "#3a659b")
    (blue-cooler "#006a9a")
    (blue-faint "#605f8b")
    (magenta "#9b476f")
    (magenta-warmer "#a04370")
    (magenta-cooler "#7653a2")
    (magenta-faint "#835766")
    (cyan "#196d7b")
    (cyan-warmer "#236e6f")
    (cyan-cooler "#00715a")
    (cyan-faint "#456877")

    (bg-red-intense "#f2a5b3")
    (bg-green-intense "#a5c9a3")
    (bg-yellow-intense "#d3b6b1")
    (bg-blue-intense "#b3b9ef")
    (bg-magenta-intense "#d0b1da")
    (bg-cyan-intense "#8ec6eb")

    (bg-red-subtle "#f2c1c2")
    (bg-green-subtle "#c0d7c1")
    (bg-yellow-subtle "#decbbd")
    (bg-blue-subtle "#c8cded")
    (bg-magenta-subtle "#e3c5da")
    (bg-cyan-subtle "#c2d1e2")

    (bg-added "#b8d4d9")
    (bg-added-faint "#c1dde4")
    (bg-added-refine "#95c5c5")
    (bg-added-fringe "#74b1b1")
    (fg-added "#194762")

    (bg-changed "#d4d4ac")
    (bg-changed-faint "#e4d6d1")
    (bg-changed-refine "#c1c381")
    (bg-changed-fringe "#b2b467")
    (fg-changed "#494700")

    (bg-removed "#efbed0")
    (bg-removed-faint "#f4cadb")
    (bg-removed-refine "#eea1ba")
    (bg-removed-fringe "#e183a4")
    (fg-removed "#5b3342")

    (bg-mode-line-active "#bda0cb")
    (fg-mode-line-active "#251229")
    (bg-completion "#dabac8")
    (bg-popup "#f3e9e1")
    (bg-hover "#d7b3b8")
    (bg-hover-secondary "#bfbad2")
    (bg-hl-line "#d7c6e6")
    (bg-paren-match "#dba7b7")
    (bg-err "#edc0cb") ; check with err
    (bg-warning "#e0cac1") ; check with warning
    (bg-info "#bbd4df") ; check with info
    (bg-region "#c3b6be")))

(defconst ef-hypnos-palette-mappings-partial
  '((err magenta-warmer)
    (warning yellow-warmer)
    (info cyan)

    (fg-link yellow-cooler)
    (fg-link-visited cyan-warmer)
    (name cyan-warmer)
    (keybind cyan)
    (identifier yellow-cooler)
    (fg-prompt magenta)

    (builtin magenta-faint)
    (comment blue-faint)
    (constant blue-warmer)
    (fnname cyan-warmer)
    (fnname-call cyan-faint)
    (keyword yellow-cooler)
    (preprocessor cyan-cooler)
    (docstring yellow-faint)
    (string red-faint)
    (type green-faint)
    (variable magenta)
    (variable-use magenta-faint)
    (rx-backslash cyan-cooler) ; compare with `string'
    (rx-construct red-cooler)

    (accent-0 yellow-cooler)
    (accent-1 red-cooler)
    (accent-2 magenta-warmer)
    (accent-3 blue-warmer)

    (date-common magenta-faint)
    (date-deadline red-cooler)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday red-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-cooler)
    (date-scheduled-subtle yellow-faint)
    (date-weekday magenta)
    (date-weekend blue-faint)

    (fg-prose-code blue-warmer)
    (prose-done cyan-warmer)
    (fg-prose-macro green-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag yellow-faint)
    (prose-todo yellow-warmer)
    (fg-prose-verbatim magenta-warmer)

    (mail-cite-0 yellow-cooler)
    (mail-cite-1 red-cooler)
    (mail-cite-2 cyan-faint)
    (mail-cite-3 green-faint)
    (mail-part red-faint)
    (mail-recipient cyan-faint)
    (mail-subject magenta-warmer)
    (mail-other magenta-faint)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 yellow-cooler)
    (rainbow-1 magenta)
    (rainbow-2 blue-warmer)
    (rainbow-3 red-cooler)
    (rainbow-4 magenta-cooler)
    (rainbow-5 green-cooler)
    (rainbow-6 cyan)
    (rainbow-7 yellow)
    (rainbow-8 red-faint)))


(defcustom ef-hypnos-palette-overrides nil
  "Overrides for `ef-hypnos-palette'.

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

(defconst ef-hypnos-palette
  (modus-themes-generate-palette
   ef-hypnos-palette-partial
   nil
   nil
   (append ef-hypnos-palette-mappings-partial ef-themes-palette-common)))

;;;###theme-autoload
(modus-themes-theme
 'ef-hypnos
 'ef-themes
 "Legible light peach cream theme with gold and nuanced colors."
 'dark
 'ef-hypnos-palette
 nil
 'ef-hypnos-palette-overrides)

(provide 'ef-hypnos-theme)

;;; ef-hypnos-theme.el ends here
