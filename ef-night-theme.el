;;; ef-night-theme.el --- Legible dark theme with mostly green, blue, purple colors -*- lexical-binding:t -*-

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

(defconst ef-night-palette-partial
  '((cursor "#00ccff")
    (bg-main "#000e17")
    (bg-dim "#1a202b")
    (bg-alt "#242e39")
    (fg-main "#afbcbf")
    (fg-dim "#70819f")
    (fg-alt "#b0a0a0")
    (bg-active "#444e59")
    (bg-inactive "#11141f")
    (border "#3a4a66")

    (red "#ef656a")
    (red-warmer "#f47360")
    (red-cooler "#ef798f")
    (red-faint "#d56f72")
    (green "#1fa526")
    (green-warmer "#50a22f")
    (green-cooler "#00a972")
    (green-faint "#61a06c")
    (yellow "#c48502")
    (yellow-warmer "#e6832f")
    (yellow-cooler "#df8f6f")
    (yellow-faint "#cf9f7f")
    (blue "#379cf6")
    (blue-warmer "#6a88ff")
    (blue-cooler "#029fff")
    (blue-faint "#7a94df")
    (magenta "#d570af")
    (magenta-warmer "#e580ea")
    (magenta-cooler "#af8aff")
    (magenta-faint "#c59fcf")
    (cyan "#4fb0cf")
    (cyan-warmer "#6fafff")
    (cyan-cooler "#3dc0b0")
    (cyan-faint "#92b4df")

    (bg-red-intense "#bd1f30")
    (bg-green-intense "#107440")
    (bg-yellow-intense "#847020")
    (bg-blue-intense "#2f5f9f")
    (bg-magenta-intense "#804fd5")
    (bg-cyan-intense "#0280b9")

    (bg-red-subtle "#6a1b2f")
    (bg-green-subtle "#0a432f")
    (bg-yellow-subtle "#533420")
    (bg-blue-subtle "#1f3665")
    (bg-magenta-subtle "#502555")
    (bg-cyan-subtle "#113b5e")

    (bg-added "#00371f")
    (bg-added-faint "#002918")
    (bg-added-refine "#004c2f")
    (fg-added "#a0e0a0")

    (bg-changed "#363300")
    (bg-changed-faint "#2a1f00")
    (bg-changed-refine "#4a4a00")
    (fg-changed "#efef80")

    (bg-removed "#450f1f")
    (bg-removed-faint "#2f060f")
    (bg-removed-refine "#641426")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#003a7f")
    (fg-mode-line-active "#ceeeff")
    (bg-completion "#00314f")
    (bg-hover "#6f345a")
    (bg-hover-secondary "#493737")
    (bg-hl-line "#002255")
    (bg-paren-match "#664950")
    (bg-region "#253146")
    (bg-err "#471014") ; check with err
    (bg-warning "#3b2f04") ; check with warning
    (bg-info "#103512") ; check with info

    (err red)
    (warning yellow-warmer)
    (info green-cooler)

    (link cyan-warmer)
    (link-alt magenta)
    (name blue-warmer)
    (keybind green-cooler)
    (identifier magenta-faint)
    (fg-prompt cyan-warmer)

    (builtin green-cooler)
    (comment yellow-faint)
    (constant magenta-cooler)
    (fnname cyan-cooler)
    (fnname-call cyan-faint)
    (keyword blue-warmer)
    (preprocessor red-faint)
    (docstring cyan-faint)
    (string blue-cooler)
    (type magenta-faint)
    (variable cyan-warmer)
    (variable-use cyan-faint)
    (rx-escape green) ; compare with `string'
    (rx-construct magenta-warmer)

    (accent-0 blue-cooler)
    (accent-1 magenta-warmer)
    (accent-2 cyan-cooler)
    (accent-3 red-cooler)

    (date-common cyan)
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

    (prose-code magenta-warmer)
    (prose-done green-cooler)
    (prose-macro cyan-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag fg-alt)
    (prose-todo red)
    (prose-verbatim blue-cooler)

    (mail-cite-0 blue)
    (mail-cite-1 magenta-warmer)
    (mail-cite-2 green-cooler)
    (mail-cite-3 yellow-cooler)
    (mail-part cyan)
    (mail-recipient blue-warmer)
    (mail-subject cyan-cooler)
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

    (rainbow-0 cyan-warmer)
    (rainbow-1 magenta-cooler)
    (rainbow-2 yellow-cooler)
    (rainbow-3 blue-warmer)
    (rainbow-4 magenta)
    (rainbow-5 green)
    (rainbow-6 yellow)
    (rainbow-7 cyan)
    (rainbow-8 green-warmer))
  "Legible dark sky blue theme with mostly green, blue, purple colors.")

(defcustom ef-night-palette-overrides nil
  "Overrides for `ef-night-palette'.

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

(defconst ef-night-palette
  (append ef-themes-common-palette-overrides ef-night-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-night
 'ef-themes
 "Legible dark sky blue theme with mostly green, blue, purple colors."
 'dark
 'modus-vivendi-palette
 'ef-night-palette
 'ef-night-palette-overrides
 'ef-themes-custom-faces)

;;; ef-night-theme.el ends here
