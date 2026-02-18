;;; ef-orange-theme.el ---  Legible light theme with orange, yellow, and green colors -*- lexical-binding:t -*-

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

(defconst ef-orange-palette-partial
  '((cursor "#cf5f00")
    (bg-main "#ffedc9")
    (bg-dim "#f7e5b6")
    (bg-alt "#e9d0a8")
    (fg-main "#6c4631")
    (fg-dim "#6f6a70")
    (fg-alt "#8f5f4a")
    (bg-active "#c9b088")
    (bg-inactive "#efdbac")
    (border "#cfbe9b")

    (red "#ba2d2f")
    (red-warmer "#c13f00")
    (red-cooler "#cf2030")
    (red-faint "#b04340")
    (green "#007a0a")
    (green-warmer "#5f7200")
    (green-cooler "#2f783f")
    (green-faint "#527545")
    (yellow "#a05a22")
    (yellow-warmer "#b05115")
    (yellow-cooler "#aa4f30")
    (yellow-faint "#93604a")
    (blue "#375cc6")
    (blue-warmer "#5f50df")
    (blue-cooler "#265fbf")
    (blue-faint "#4a659f")
    (magenta "#ba3e54")
    (magenta-warmer "#c32f80")
    (magenta-cooler "#8448aa")
    (magenta-faint "#a04450")
    (cyan "#467080")
    (cyan-warmer "#3f6fa2")
    (cyan-cooler "#0f738f")
    (cyan-faint "#4f6f8f")

    (bg-red-intense "#f3a058")
    (bg-green-intense "#a6df70")
    (bg-yellow-intense "#efcf00")
    (bg-blue-intense "#90b5e0")
    (bg-magenta-intense "#ef9fbf")
    (bg-cyan-intense "#98cfc0")

    (bg-red-subtle "#f2c3b0")
    (bg-green-subtle "#cbe08f")
    (bg-yellow-subtle "#f0e76e")
    (bg-blue-subtle "#c6deeb")
    (bg-magenta-subtle "#eac7cf")
    (bg-cyan-subtle "#bfe2d0")

    (bg-added "#d7e890")
    (bg-added-faint "#e2eba6")
    (bg-added-refine "#c2d580")
    (fg-added "#2f6500")

    (bg-changed "#f5e690")
    (bg-changed-faint "#f5edaf")
    (bg-changed-refine "#edd482")
    (fg-changed "#553d00")

    (bg-removed "#ffd090")
    (bg-removed-faint "#f5de9f")
    (bg-removed-refine "#f0b972")
    (fg-removed "#9f2f00")

    (bg-mode-line-active "#ffc255")
    (fg-mode-line-active "#742f18")
    (bg-completion "#fbdf8f")
    (bg-hover "#c0e47f")
    (bg-hover-secondary "#ebdc8f")
    (bg-hl-line "#ffdaa6")
    (bg-paren-match "#8fcf7f")
    (bg-err "#ffcc95") ; check with err
    (bg-warning "#ecdc7a") ; check with warning
    (bg-info "#dde58c") ; check with info
    (bg-region "#eeb48f")))

(defconst ef-orange-palette-mappings-partial
  '((err red-warmer)
    (warning yellow)
    (info green-warmer)

    (fg-link green-warmer)
    (fg-link-visited red-faint)
    (name yellow)
    (keybind red-warmer)
    (identifier yellow-faint)
    (fg-prompt green)

    (builtin red)
    (comment fg-dim)
    (constant yellow)
    (fnname red-cooler)
    (fnname-call magenta-faint)
    (keyword red-warmer)
    (preprocessor cyan-warmer)
    (docstring green-faint)
    (string green-warmer)
    (type yellow-cooler)
    (variable green-cooler)
    (variable-use cyan-faint)
    (rx-backslash green-cooler) ; compare with `string'
    (rx-construct red-warmer)

    (accent-0 red-warmer)
    (accent-1 green-cooler)
    (accent-2 yellow)
    (accent-3 green-warmer)

    (date-common green-faint)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday red-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday green-warmer)
    (date-weekend red-faint)

    (fg-prose-code green-cooler)
    (prose-done green)
    (fg-prose-macro yellow)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag yellow-faint)
    (prose-todo red-warmer)
    (fg-prose-verbatim red)

    (mail-cite-0 yellow-cooler)
    (mail-cite-1 green-faint)
    (mail-cite-2 red-cooler)
    (mail-cite-3 fg-alt)
    (mail-part red-faint)
    (mail-recipient yellow)
    (mail-subject red-warmer)
    (mail-other green-cooler)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-green-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-yellow-intense)
    (bg-search-rx-group-1 bg-magenta-intense)
    (bg-search-rx-group-2 bg-green-subtle)
    (bg-search-rx-group-3 bg-blue-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 red-warmer)
    (rainbow-1 yellow-warmer)
    (rainbow-2 green-warmer)
    (rainbow-3 yellow-cooler)
    (rainbow-4 green-cooler)
    (rainbow-5 yellow)
    (rainbow-6 red-faint)
    (rainbow-7 green-faint)
    (rainbow-8 red-faint)))

(defcustom ef-orange-palette-overrides nil
  "Overrides for `ef-orange-palette'.

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

(defconst ef-orange-palette
  (modus-themes-generate-palette
   ef-orange-palette-partial
   nil
   nil
   (append ef-orange-palette-mappings-partial ef-themes-palette-common)))

(modus-themes-theme
 'ef-orange
 'ef-themes
 "Legible light theme with orange, yellow, and green colors."
 'light
 'ef-orange-palette
 nil
 'ef-orange-palette-overrides)

;;; ef-orange-theme.el ends here
