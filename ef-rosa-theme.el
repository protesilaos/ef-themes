;;; ef-rosa-theme.el --- Legible dark theme with magenta and green colors -*- lexical-binding:t -*-

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

(defconst ef-rosa-palette-partial
  '((cursor "#ef607a")
    (bg-main "#322023")
    (bg-dim "#432e32")
    (bg-alt "#4a3842")
    (fg-main "#e4d3e1")
    (fg-dim "#9d9d9d")
    (fg-alt "#96c4af")
    (bg-active "#6a5862")
    (bg-inactive "#362129")
    (border "#6f5f58")

    (red "#ff707f")
    (red-warmer "#ff7f5f")
    (red-cooler "#f0888f")
    (red-faint "#e89f84")
    (green "#5fbb5f")
    (green-warmer "#8ad05a")
    (green-cooler "#49d081")
    (green-faint "#9aba8b")
    (yellow "#e4c53f")
    (yellow-warmer "#f2a85f")
    (yellow-cooler "#eec26f")
    (yellow-faint "#d8c09f")
    (blue "#57aff6")
    (blue-warmer "#78b2ff")
    (blue-cooler "#62cff7")
    (blue-faint "#9fbfdf")
    (magenta "#ffb2d6")
    (magenta-warmer "#f28fdf")
    (magenta-cooler "#cfb1ff")
    (magenta-faint "#c59fdf")
    (cyan "#5fc0dc")
    (cyan-warmer "#7fc5df")
    (cyan-cooler "#80dfbf")
    (cyan-faint "#99bfcf")

    (bg-red-intense "#bd1f30")
    (bg-green-intense "#408420")
    (bg-yellow-intense "#847020")
    (bg-blue-intense "#2f5f9f")
    (bg-magenta-intense "#905fdf")
    (bg-cyan-intense "#028099")

    (bg-red-subtle "#772c2a")
    (bg-green-subtle "#38512f")
    (bg-yellow-subtle "#634627")
    (bg-blue-subtle "#424075")
    (bg-magenta-subtle "#6b3c52")
    (bg-cyan-subtle "#3f4e72")

    (bg-added "#2f4735")
    (bg-added-faint "#2a382f")
    (bg-added-refine "#1d6044")
    (fg-added "#a0e0a0")

    (bg-changed "#51512f")
    (bg-changed-faint "#40332f")
    (bg-changed-refine "#61621f")
    (fg-changed "#dada90")

    (bg-removed "#5f252f")
    (bg-removed-faint "#4a242a")
    (bg-removed-refine "#792d35")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#814558")
    (fg-mode-line-active "#e8e5e7")
    (bg-completion "#6e425f")
    (bg-hover "#3f6a50")
    (bg-hover-secondary "#6a4f5f")
    (bg-hl-line "#42352f")
    (bg-paren-match "#7c454f")
    (bg-region "#45524a")
    (bg-err "#551a07") ; check with err
    (bg-warning "#4f3f13") ; check with warning
    (bg-info "#0f4312") ; check with info

    (err red-warmer)
    (warning yellow-warmer)
    (info green)

    (link green-cooler)
    (link-alt magenta-cooler)
    (name magenta-warmer)
    (keybind magenta-warmer)
    (identifier green-faint)
    (fg-prompt cyan-cooler)

    (builtin magenta-cooler)
    (comment green-faint)
    (constant green-cooler)
    (fnname magenta-warmer)
    (fnname-call magenta-faint)
    (keyword magenta)
    (preprocessor red-cooler)
    (docstring yellow-faint)
    (string green-warmer)
    (type cyan-warmer)
    (variable cyan-cooler)
    (variable-use cyan-faint)
    (rx-escape red-cooler) ; compare with `string'
    (rx-construct blue-cooler)

    (accent-0 green-warmer)
    (accent-1 magenta-warmer)
    (accent-2 yellow-warmer)
    (accent-3 green-cooler)

    (date-common magenta-cooler)
    (date-deadline magenta)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday green)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-cooler)
    (date-scheduled-subtle yellow-faint)
    (date-weekday magenta-cooler)
    (date-weekend red-cooler)

    (prose-code magenta-warmer)
    (prose-done green-cooler)
    (prose-macro red-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag yellow-faint)
    (prose-todo red-warmer)
    (prose-verbatim cyan-cooler)

    (mail-cite-0 green-warmer)
    (mail-cite-1 cyan-cooler)
    (mail-cite-2 red-cooler)
    (mail-cite-3 yellow-cooler)
    (mail-part magenta-cooler)
    (mail-recipient magenta)
    (mail-subject green)
    (mail-other magenta-warmer)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 magenta-warmer)
    (rainbow-1 green-warmer)
    (rainbow-2 magenta)
    (rainbow-3 yellow-cooler)
    (rainbow-4 magenta-cooler)
    (rainbow-5 red-cooler)
    (rainbow-6 green)
    (rainbow-7 yellow-warmer)
    (rainbow-8 cyan-cooler))
  "Legible dark rosewood theme with magenta and green colors.")

(defcustom ef-rosa-palette-overrides nil
  "Overrides for `ef-rosa-palette'.

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

(defconst ef-rosa-palette
  (append ef-themes-common-palette-overrides ef-rosa-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-rosa
 'ef-themes
 "Legible dark rosewood theme with magenta and green colors."
 'dark
 'modus-vivendi-palette
 'ef-rosa-palette
 'ef-rosa-palette-overrides
 'ef-themes-custom-faces)

;;; ef-rosa-theme.el ends here
