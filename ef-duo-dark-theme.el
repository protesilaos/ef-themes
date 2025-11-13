;;; ef-duo-dark-theme.el --- Legible dark theme with mostly blue and orange colors -*- lexical-binding:t -*-

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

(defconst ef-duo-dark-palette-partial
  '((cursor "#ef6f11")
    (bg-main "#070019")
    (bg-dim "#1d1a26")
    (bg-alt "#2a2739")
    (fg-main "#d0d0d0")
    (fg-dim "#857f8f")
    (fg-alt "#89afef")
    (bg-active "#4a4759")
    (bg-inactive "#13101f")
    (border "#545f6f")

    (red "#ef656a")
    (red-warmer "#f47360")
    (red-cooler "#ef798f")
    (red-faint "#d08f72")
    (green "#1fa526")
    (green-warmer "#50a22f")
    (green-cooler "#00b982")
    (green-faint "#61a06c")
    (yellow "#c48702")
    (yellow-warmer "#d0730f")
    (yellow-cooler "#df805f")
    (yellow-faint "#9f8f6a")
    (blue "#379cf6")
    (blue-warmer "#6f80ff")
    (blue-cooler "#029fff")
    (blue-faint "#8a9fdf")
    (magenta "#d369af")
    (magenta-warmer "#e580ea")
    (magenta-cooler "#af85ff")
    (magenta-faint "#c57faf")
    (cyan "#5faaef")
    (cyan-warmer "#7fafff")
    (cyan-cooler "#0dafdf")
    (cyan-faint "#8aa0df")

    (bg-red-intense "#cd2f30")
    (bg-green-intense "#407720")
    (bg-yellow-intense "#8f5040")
    (bg-blue-intense "#4648d0")
    (bg-magenta-intense "#b04fcf")
    (bg-cyan-intense "#2270be")

    (bg-red-subtle "#72002a")
    (bg-green-subtle "#00422a")
    (bg-yellow-subtle "#603000")
    (bg-blue-subtle "#242679")
    (bg-magenta-subtle "#501f72")
    (bg-cyan-subtle "#004065")

    (bg-added "#002d1f")
    (bg-added-faint "#001f18")
    (bg-added-refine "#003b2f")
    (fg-added "#a0e0a0")

    (bg-changed "#323200")
    (bg-changed-faint "#2a2000")
    (bg-changed-refine "#444000")
    (fg-changed "#efef80")

    (bg-removed "#3d091f")
    (bg-removed-faint "#27040f")
    (bg-removed-refine "#5b0f26")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#352487")
    (fg-mode-line-active "#dedeff")
    (bg-completion "#2f1a5f")
    (bg-hover "#664f4a")
    (bg-hover-secondary "#264f4a")
    (bg-hl-line "#301a4f")
    (bg-paren-match "#2f608e")
    (bg-region "#042a50")
    (bg-err "#461210") ; check with err
    (bg-warning "#3a3004") ; check with warning
    (bg-info "#10350a") ; check with info

    (err red)
    (warning yellow)
    (info green)

    (fg-link cyan-warmer)
    (fg-link-alt green-cooler)
    (name blue)
    (keybind blue-cooler)
    (identifier red-faint)
    (fg-prompt yellow)

    (builtin cyan)
    (comment red-faint)
    (constant blue)
    (fnname cyan-cooler)
    (fnname-call cyan-faint)
    (keyword blue-warmer)
    (preprocessor cyan-warmer)
    (docstring blue-faint)
    (string yellow-cooler)
    (type blue-cooler)
    (variable magenta-cooler)
    (variable-use magenta-faint)
    (rx-escape magenta-cooler) ; compare with `string'
    (rx-construct blue)

    (accent-0 blue-warmer)
    (accent-1 yellow-warmer)
    (accent-2 green-cooler)
    (accent-3 red)

    (date-common cyan-cooler)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday magenta-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (prose-code yellow-warmer)
    (prose-done green)
    (prose-macro green-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula warning)
    (prose-tag yellow-faint)
    (prose-todo red)
    (prose-verbatim blue-warmer)

    (mail-cite-0 cyan)
    (mail-cite-1 yellow-cooler)
    (mail-cite-2 blue-warmer)
    (mail-cite-3 yellow)
    (mail-part blue-faint)
    (mail-recipient blue)
    (mail-subject yellow-warmer)
    (mail-other cyan-warmer)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 blue)
    (rainbow-1 yellow-warmer)
    (rainbow-2 blue-warmer)
    (rainbow-3 yellow-cooler)
    (rainbow-4 cyan-cooler)
    (rainbow-5 yellow)
    (rainbow-6 blue-cooler)
    (rainbow-7 red-cooler)
    (rainbow-8 green-cooler))
  "Legible dark theme with mostly blue and orange colors.")

(defcustom ef-duo-dark-palette-overrides nil
  "Overrides for `ef-duo-dark-palette'.

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

(defconst ef-duo-dark-palette
  (append ef-themes-common-palette-overrides ef-duo-dark-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-duo-dark
 'ef-themes
 "Legible dark theme with mostly blue and orange colors."
 'dark
 'modus-vivendi-palette
 'ef-duo-dark-palette
 'ef-duo-dark-palette-overrides
 'ef-themes-custom-faces)

;;; ef-duo-dark-theme.el ends here
