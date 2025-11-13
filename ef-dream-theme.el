;;; ef-dream-theme.el --- Legible dark theme with gold and nuanced colors -*- lexical-binding:t -*-

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

(defconst ef-dream-palette-partial
  '((cursor "#f3c09a")
    (bg-main "#232025")
    (bg-dim "#322f34")
    (bg-alt "#3b393e")
    (fg-main "#efd5c5")
    (fg-dim "#8f8886")
    (fg-alt "#b0a0cf")
    (bg-active "#5b595e")
    (bg-inactive "#2a272c")
    (border "#635850")

    (red "#ff6f6f")
    (red-warmer "#ff7a5f")
    (red-cooler "#e47980")
    (red-faint "#f3a0a0")
    (green "#51b04f")
    (green-warmer "#7fce5f")
    (green-cooler "#3fc489")
    (green-faint "#a9c99f")
    (yellow "#c0b24f")
    (yellow-warmer "#d09950")
    (yellow-cooler "#deb07a")
    (yellow-faint "#caa89f")
    (blue "#57b0ff")
    (blue-warmer "#80aadf")
    (blue-cooler "#12b4ff")
    (blue-faint "#a0a0cf")
    (magenta "#ffaacf")
    (magenta-warmer "#f498c0")
    (magenta-cooler "#d0b0ff")
    (magenta-faint "#e3b0c0")
    (cyan "#6fb3c0")
    (cyan-warmer "#8fcfd0")
    (cyan-cooler "#65c5a8")
    (cyan-faint "#99bfcf")

    (bg-red-intense "#a02f50")
    (bg-green-intense "#30682f")
    (bg-yellow-intense "#8f665f")
    (bg-blue-intense "#4f509f")
    (bg-magenta-intense "#885997")
    (bg-cyan-intense "#0280b9")

    (bg-red-subtle "#6f202a")
    (bg-green-subtle "#2a532f")
    (bg-yellow-subtle "#62432a")
    (bg-blue-subtle "#3a3e73")
    (bg-magenta-subtle "#66345a")
    (bg-cyan-subtle "#334d69")

    (bg-added "#304a4f")
    (bg-added-faint "#16383f")
    (bg-added-refine "#2f6767")
    (fg-added "#a0d0f0")

    (bg-changed "#51512f")
    (bg-changed-faint "#40332f")
    (bg-changed-refine "#64651f")
    (fg-changed "#dada90")

    (bg-removed "#5a3142")
    (bg-removed-faint "#4a2034")
    (bg-removed-refine "#782a4a")
    (fg-removed "#f0bfcf")

    (bg-mode-line-active "#675072")
    (fg-mode-line-active "#fedeff")
    (bg-completion "#503240")
    (bg-hover "#957856")
    (bg-hover-secondary "#665f7a")
    (bg-hl-line "#412f4f")
    (bg-paren-match "#885566")
    (bg-region "#544a50")
    (bg-err "#501a2d") ; check with err
    (bg-warning "#4e3930") ; check with warning
    (bg-info "#0f3f4f") ; check with info

    (err magenta-warmer)
    (warning yellow-warmer)
    (info cyan)

    (fg-link yellow-cooler)
    (fg-link-alt cyan-warmer)
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
    (rx-escape cyan-cooler) ; compare with `string'
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

    (prose-code blue-warmer)
    (prose-done cyan-warmer)
    (prose-macro green-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag yellow-faint)
    (prose-todo yellow-warmer)
    (prose-verbatim magenta-warmer)

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
    (rainbow-8 red-faint))
  "Legible dark purple grey theme with gold and nuanced colors.")

(defcustom ef-dream-palette-overrides nil
  "Overrides for `ef-dream-palette'.

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

(defconst ef-dream-palette
  (append ef-themes-common-palette-overrides ef-dream-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-dream
 'ef-themes
 "Legible dark purple grey theme with gold and nuanced colors."
 'dark
 'modus-vivendi-palette
 'ef-dream-palette
 'ef-dream-palette-overrides
 'ef-themes-custom-faces)

;;; ef-dream-theme.el ends here
