;;; ef-maris-dark-theme.el --- Legible dark theme with blue, cyan, and green colors -*- lexical-binding:t -*-

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

(defconst ef-maris-dark-palette-partial
  '((cursor "#8fdfff")
    (bg-main "#131c2b")
    (bg-dim "#1d2c39")
    (bg-alt "#2a3644")
    (fg-main "#eaedef")
    (fg-dim "#969faf")
    (fg-alt "#90a0dc")
    (bg-active "#4a5664")
    (bg-inactive "#1a2331")
    (border "#595a63")

    (red "#ff6f6f")
    (red-warmer "#ff7a5f")
    (red-cooler "#ff7788")
    (red-faint "#eaa4a4")
    (green "#41bf4f")
    (green-warmer "#7fce5f")
    (green-cooler "#30c489")
    (green-faint "#a9c99f")
    (yellow "#d0d24f")
    (yellow-warmer "#f0c060")
    (yellow-cooler "#cab27f")
    (yellow-faint "#cac89f")
    (blue "#57b0ff")
    (blue-warmer "#70a0ff")
    (blue-cooler "#12b4ff")
    (blue-faint "#9acfff")
    (magenta "#f59acf")
    (magenta-warmer "#fa90ea")
    (magenta-cooler "#cf90ff")
    (magenta-faint "#d4aaf0")
    (cyan "#2fd0db")
    (cyan-warmer "#7fcfdf")
    (cyan-cooler "#65d5a8")
    (cyan-faint "#99bfcf")

    (bg-red-intense "#bd1f30")
    (bg-green-intense "#107840")
    (bg-yellow-intense "#847020")
    (bg-blue-intense "#2f5f9f")
    (bg-magenta-intense "#b05fcf")
    (bg-cyan-intense "#0280b9")

    (bg-red-subtle "#6f293a")
    (bg-green-subtle "#1f523a")
    (bg-yellow-subtle "#604233")
    (bg-blue-subtle "#284477")
    (bg-magenta-subtle "#52336b")
    (bg-cyan-subtle "#204c68")

    (bg-added "#20493f")
    (bg-added-faint "#163530")
    (bg-added-refine "#136244")
    (fg-added "#a0e0a0")

    (bg-changed "#51512f")
    (bg-changed-faint "#40332f")
    (bg-changed-refine "#61621f")
    (fg-changed "#dada90")

    (bg-removed "#5e242f")
    (bg-removed-faint "#4a202d")
    (bg-removed-refine "#772a35")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#2f527b")
    (fg-mode-line-active "#ecf0ff")
    (bg-completion "#204358")
    (bg-hover "#684d54")
    (bg-hover-secondary "#49516a")
    (bg-hl-line "#243242")
    (bg-paren-match "#6c5d54")
    (bg-region "#183c65")
    (bg-err "#551327") ; check with err
    (bg-warning "#403f22") ; check with warning
    (bg-info "#104324") ; check with info

    (err red-warmer)
    (warning yellow-warmer)
    (info green-cooler)

    (fg-link blue)
    (fg-link-alt magenta-cooler)
    (name blue)
    (keybind blue-cooler)
    (identifier magenta-faint)
    (fg-prompt blue-warmer)

    (builtin magenta-faint)
    (comment red-faint)
    (constant blue-cooler)
    (fnname green-warmer)
    (fnname-call green-faint)
    (keyword blue-warmer)
    (preprocessor magenta-cooler)
    (docstring cyan-faint)
    (string cyan-cooler)
    (type green)
    (variable cyan)
    (variable-use cyan-faint)
    (rx-escape yellow) ; compare with `string'
    (rx-construct red)

    (accent-0 blue-cooler)
    (accent-1 green-warmer)
    (accent-2 cyan)
    (accent-3 red-cooler)

    (date-common cyan-cooler)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday blue-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-cooler)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan-warmer)
    (date-weekend red-faint)

    (prose-code cyan)
    (prose-done green-cooler)
    (prose-macro magenta-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula warning)
    (prose-tag cyan-faint)
    (prose-todo red-cooler)
    (prose-verbatim green-warmer)

    (mail-cite-0 cyan-cooler)
    (mail-cite-1 magenta)
    (mail-cite-2 blue-faint)
    (mail-cite-3 yellow-cooler)
    (mail-part cyan)
    (mail-recipient blue-warmer)
    (mail-subject green-warmer)
    (mail-other blue)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 green-cooler)
    (rainbow-1 blue-warmer)
    (rainbow-2 green-warmer)
    (rainbow-3 cyan)
    (rainbow-4 magenta-cooler)
    (rainbow-5 blue-cooler)
    (rainbow-6 magenta)
    (rainbow-7 cyan-cooler)
    (rainbow-8 yellow-cooler))
  "Legible dark marine theme with blue, cyan, and green colors.")

(defcustom ef-maris-dark-palette-overrides nil
  "Overrides for `ef-maris-dark-palette'.

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

(defconst ef-maris-dark-palette
  (append ef-themes-common-palette-overrides ef-maris-dark-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-maris-dark
 'ef-themes
 "Legible dark marine theme with blue, cyan, and green colors."
 'dark
 'modus-vivendi-palette
 'ef-maris-dark-palette
 'ef-maris-dark-palette-overrides
 'ef-themes-custom-faces)

;;; ef-maris-dark-theme.el ends here
