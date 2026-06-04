;;; ef-atlantis-theme.el --- Legible dark theme with aquatic colors -*- lexical-binding:t -*-

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

(defconst ef-atlantis-palette-partial
  '((cursor "#baa1ab")
    (bg-main "#1a143e")
    (bg-dim "#1a204b")
    (bg-alt "#272a3e")
    (fg-main "#bfcccf")
    (fg-dim "#7f8385")
    (fg-alt "#967e92")
    (bg-active "#3a4661")
    (bg-inactive "#24314f")
    (border "#454e59")

    (red "#ef656a")
    (red-warmer "#f47360")
    (red-cooler "#ef798f")
    (red-faint "#c57062")
    (green "#1fa526")
    (green-warmer "#77b22f")
    (green-cooler "#00a962")
    (green-faint "#81a06c")
    (yellow "#c48502")
    (yellow-warmer "#e6832f")
    (yellow-cooler "#b5967b")
    (yellow-faint "#cab4a4")
    (blue "#379cf6")
    (blue-warmer "#6a88ff")
    (blue-cooler "#029fff")
    (blue-faint "#7a7fff")
    (magenta "#d590af")
    (magenta-warmer "#e580ea")
    (magenta-cooler "#af9ef2")
    (magenta-faint "#c5a4cf")
    (cyan "#4fb0cf")
    (cyan-warmer "#6fafff")
    (cyan-cooler "#5db2b7")
    (cyan-faint "#90becf")

    (bg-red-intense "#bd1f30")
    (bg-green-intense "#107440")
    (bg-yellow-intense "#846040")
    (bg-blue-intense "#2f5f9f")
    (bg-magenta-intense "#804fd5")
    (bg-cyan-intense "#0280b9")

    (bg-red-subtle "#7a2735")
    (bg-green-subtle "#1a532f")
    (bg-yellow-subtle "#704030")
    (bg-blue-subtle "#1f4685")
    (bg-magenta-subtle "#503575")
    (bg-cyan-subtle "#114b6e")

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

    (bg-mode-line-active "#124a67")
    (fg-mode-line-active "#aaccff")
    (bg-completion "#00417f")
    (bg-popup "#102c3f")
    (bg-hover "#5f4f7a")
    (bg-hover-secondary "#2d3e4a")
    (bg-hl-line "#2b265b")
    (bg-paren-match "#603849")
    (bg-err "#401500") ; check with err
    (bg-warning "#3e300c") ; check with warning
    (bg-info "#003532") ; check with info
    (bg-region "#32446b")))

(defconst ef-atlantis-palette-mappings-partial
  '((err red-cooler)
    (warning yellow-cooler)
    (info green-cooler)

    (modeline-err red)
    (modeline-warning yellow-cooler)
    (modeline-info cyan)

    (fg-link cyan-warmer)
    (fg-link-visited green-cooler)
    (name blue-warmer)
    (keybind cyan-cooler)
    (identifier green-faint)
    (fg-prompt blue-warmer)

    (builtin green-cooler)
    (comment blue-faint)
    (constant blue)
    (fnname magenta-cooler)
    (fnname-call magenta-faint)
    (keyword cyan-cooler)
    (preprocessor yellow-cooler)
    (docstring cyan-faint)
    (string cyan-warmer)
    (type blue-warmer)
    (variable green-warmer)
    (variable-use green-faint)
    (rx-backslash green) ; compare with `string'
    (rx-construct yellow)

    (accent-0 blue-warmer)
    (accent-1 green-warmer)
    (accent-2 cyan-cooler)
    (accent-3 yellow-cooler)

    (date-common cyan-cooler)
    (date-deadline magenta-cooler)
    (date-deadline-subtle magenta-faint)
    (date-event cyan-faint)
    (date-holiday blue-cooler)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled blue)
    (date-scheduled-subtle blue-faint)
    (date-weekday cyan-warmer)
    (date-weekend yellow-faint)

    (fg-prose-code green-cooler)
    (prose-done cyan-cooler)
    (fg-prose-macro yellow-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag fg-alt)
    (prose-todo magenta-warmer)
    (fg-prose-verbatim blue-cooler)

    (mail-cite-0 cyan-warmer)
    (mail-cite-1 green-warmer)
    (mail-cite-2 cyan)
    (mail-cite-3 yellow-cooler)
    (mail-part cyan-cooler)
    (mail-recipient cyan-warmer)
    (mail-subject green-cooler)
    (mail-other blue-warmer)

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
    (rainbow-1 blue-warmer)
    (rainbow-2 green-warmer)
    (rainbow-3 yellow-cooler)
    (rainbow-4 cyan-warmer)
    (rainbow-5 magenta-cooler)
    (rainbow-6 blue)
    (rainbow-7 green)
    (rainbow-8 magenta)))

(defcustom ef-atlantis-palette-overrides nil
  "Overrides for `ef-atlantis-palette'.

Mirror the elements of the aforementioned palette, overriding
their value.

For overrides that are shared across all of the Ef themes,
refer to `ef-themes-common-palette-overrides'.

To preview the palette entries, use `ef-themes-preview-colors' or
`ef-themes-preview-colors-current' (read the documentation for
further details)."
  :group 'ef-themes
  :package-version '(ef-themes . "2.2.0")
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(ef-themes) Palette overrides"))

(defconst ef-atlantis-palette
  (modus-themes-generate-palette
   ef-atlantis-palette-partial
   nil
   nil
   (append ef-atlantis-palette-mappings-partial ef-themes-palette-common)))

;;;###theme-autoload
(modus-themes-theme
 'ef-atlantis
 'ef-themes
 "Legible dark theme with aquatic colors."
 'dark
 'ef-atlantis-palette
 nil
 'ef-atlantis-palette-overrides)

(provide 'ef-atlantis-theme)

;;; ef-atlantis-theme.el ends here
