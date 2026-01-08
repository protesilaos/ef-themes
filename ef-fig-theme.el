;;; ef-fig-theme.el --- Legible dark theme with warm green, yellow, and magenta colors -*- lexical-binding:t -*-

;; Copyright (C) 2022-2026  Free Software Foundation, Inc.

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

(defconst ef-fig-palette-partial
  '((cursor "#cad45a")
    (bg-main "#3b2043")
    (bg-dim "#432e4e")
    (bg-alt "#4a385e")
    (fg-main "#e4d3e1")
    (fg-dim "#9d9d9d")
    (fg-alt "#c6a4cf")
    (bg-active "#6a586e")
    (bg-inactive "#4a384e")
    (border "#796f6e")

    (red "#ff707f")
    (red-warmer "#ff7f5f")
    (red-cooler "#e088af")
    (red-faint "#e89f84")
    (green "#7fbb3f")
    (green-warmer "#aad05a")
    (green-cooler "#79d081")
    (green-faint "#a2b799")
    (yellow "#e4c53f")
    (yellow-warmer "#f2a85f")
    (yellow-cooler "#eec27f")
    (yellow-faint "#d8c09f")
    (blue "#57aff6")
    (blue-warmer "#78b2ff")
    (blue-cooler "#62cff7")
    (blue-faint "#9fbfdf")
    (magenta "#ffb2d6")
    (magenta-warmer "#f28fdf")
    (magenta-cooler "#afb1ff")
    (magenta-faint "#c59fcf")
    (cyan "#5fc0dc")
    (cyan-warmer "#7fc5df")
    (cyan-cooler "#80dfbf")
    (cyan-faint "#99bfcf")

    (bg-red-intense "#b23f30")
    (bg-green-intense "#506430")
    (bg-yellow-intense "#847020")
    (bg-blue-intense "#2f5f9f")
    (bg-magenta-intense "#704fbf")
    (bg-cyan-intense "#028099")

    (bg-red-subtle "#772c2a")
    (bg-green-subtle "#3f512f")
    (bg-yellow-subtle "#634627")
    (bg-blue-subtle "#424075")
    (bg-magenta-subtle "#6b3c52")
    (bg-cyan-subtle "#3f4e72")

    (bg-added "#3a472f")
    (bg-added-faint "#37382f")
    (bg-added-refine "#3d6014")
    (fg-added "#a0e0a0")

    (bg-changed "#51512f")
    (bg-changed-faint "#40332f")
    (bg-changed-refine "#65641f")
    (fg-changed "#dada90")

    (bg-removed "#5f2f2f")
    (bg-removed-faint "#4f283a")
    (bg-removed-refine "#7e3635")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#57602e")
    (fg-mode-line-active "#c8c597")
    (bg-completion "#604e3f")
    (bg-hover "#7f5a60")
    (bg-hover-secondary "#6a4f6f")
    (bg-hl-line "#413f2f")
    (bg-paren-match "#7e3f84")
    (bg-err "#552407") ; check with err
    (bg-warning "#55421e") ; check with warning
    (bg-info "#3e4200") ; check with info
    (bg-region "#64523e")))

(defconst ef-fig-palette-mappings-partial
  '((err red)
    (warning yellow)
    (info green)

    (fg-link magenta)
    (fg-link-visited magenta-cooler)
    (name green-warmer)
    (keybind green)
    (identifier magenta-faint)
    (fg-prompt red-cooler)

    (builtin magenta)
    (comment cyan-faint)
    (constant magenta-cooler)
    (fnname yellow-cooler)
    (fnname-call red-faint)
    (keyword green-warmer)
    (preprocessor red-warmer)
    (docstring magenta-faint)
    (string green)
    (type red-cooler)
    (variable yellow-warmer)
    (variable-use yellow-faint)
    (rx-backslash magenta-cooler) ; compare with `string'
    (rx-construct magenta-warmer)

    (accent-0 green-warmer)
    (accent-1 magenta-warmer)
    (accent-2 yellow-warmer)
    (accent-3 red)

    (date-common yellow-faint)
    (date-deadline magenta-warmer)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday red-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-warmer)
    (date-scheduled-subtle yellow-faint)
    (date-weekday yellow-cooler)
    (date-weekend red-cooler)

    (fg-prose-code green)
    (prose-done green)
    (fg-prose-macro red-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag green-faint)
    (prose-todo red)
    (fg-prose-verbatim yellow-warmer)

    (mail-cite-0 yellow-cooler)
    (mail-cite-1 green-cooler)
    (mail-cite-2 magenta-cooler)
    (mail-cite-3 magenta-warmer)
    (mail-part yellow-warmer)
    (mail-recipient magenta)
    (mail-subject green-warmer)
    (mail-other red-cooler)

    (bg-search-static bg-warning)
    (bg-search-current bg-magenta-intense)
    (bg-search-lazy bg-green-subtle)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-cyan-intense)
    (bg-search-rx-group-1 bg-yellow-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-red-intense)

    (rainbow-0 magenta)
    (rainbow-1 green-warmer)
    (rainbow-2 yellow-cooler)
    (rainbow-3 magenta-cooler)
    (rainbow-4 green-cooler)
    (rainbow-5 red-cooler)
    (rainbow-6 cyan-cooler)
    (rainbow-7 yellow-warmer)
    (rainbow-8 magenta-warmer)))

(defcustom ef-fig-palette-overrides nil
  "Overrides for `ef-fig-palette'.

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

(defconst ef-fig-palette
  (modus-themes-generate-palette
   ef-fig-palette-partial
   nil
   nil
   (append ef-fig-palette-mappings-partial ef-themes-palette-common)))

(modus-themes-theme
 'ef-fig
 'ef-themes
 "Legible dark theme with warm green, yellow, and magenta colors."
 'dark
 'ef-fig-palette
 nil
 'ef-fig-palette-overrides
 'ef-themes-custom-faces)

;;; ef-fig-theme.el ends here
