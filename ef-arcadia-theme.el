;;; ef-arcadia-theme.el --- Legible light theme with verdant colors -*- lexical-binding:t -*-

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

(defconst ef-arcadia-palette-partial
  '((cursor "#495080")
    (bg-main "#d6e4d3")
    (bg-dim "#ced7c8")
    (bg-alt "#b0b7aa")
    (fg-main "#40314e")
    (fg-dim "#646170")
    (fg-alt "#3f5f5f")
    (bg-active "#b0b7aa")
    (bg-inactive "#c0c2b0")
    (border "#a5aaaf")

    (red "#882000")
    (red-warmer "#9a1500")
    (red-cooler "#800e38")
    (red-faint "#702f1f")
    (green "#206020")
    (green-warmer "#3f7000")
    (green-cooler "#006e50")
    (green-faint "#125724")
    (yellow "#6b4500")
    (yellow-warmer "#743f00")
    (yellow-cooler "#775228")
    (yellow-faint "#6a5937")
    (blue "#113384")
    (blue-warmer "#3a40a0")
    (blue-cooler "#0020b9")
    (blue-faint "#302080")
    (magenta "#922e7f")
    (magenta-warmer "#960f4f")
    (magenta-cooler "#503094")
    (magenta-faint "#72366f")
    (cyan "#125a7f")
    (cyan-warmer "#2a5090")
    (cyan-cooler "#005070")
    (cyan-faint "#304650")

    (bg-red-intense "#f08f88")
    (bg-green-intense "#96df8f")
    (bg-yellow-intense "#dfbf30")
    (bg-blue-intense "#cfceff")
    (bg-magenta-intense "#dfafff")
    (bg-cyan-intense "#a0ddd0")

    (bg-red-subtle "#efcabf")
    (bg-green-subtle "#c3e6a0")
    (bg-yellow-subtle "#efe07f")
    (bg-blue-subtle "#c7dbe8")
    (bg-magenta-subtle "#e3d0e7")
    (bg-cyan-subtle "#bfe0d0")

    (bg-added "#a0d7b0")
    (bg-added-faint "#c0d7b2")
    (bg-added-refine "#9ad590")
    (fg-added "#005200")

    (bg-changed "#e5e690")
    (bg-changed-faint "#e5ddaf")
    (bg-changed-refine "#edd482")
    (fg-changed "#553d00")

    (bg-removed "#f8c8a6")
    (bg-removed-faint "#e0c9ac")
    (bg-removed-refine "#f0aa90")
    (fg-removed "#8f1013")

    (bg-mode-line-active "#75b194")
    (fg-mode-line-active "#155239")
    (bg-completion "#d5c8af")
    (bg-popup "#d0d3c1")
    (bg-hover "#afbad0")
    (bg-hover-secondary "#b5dfbf")
    (bg-hl-line "#d0d0c0")
    (bg-paren-match "#a09e84")
    (bg-err "#e7c5a5") ; check with err
    (bg-warning "#e8d89a") ; check with warning
    (bg-info "#a4dfb6") ; check with info
    (bg-region "#b3c5c0")))

(defconst ef-arcadia-palette-mappings-partial
  '((err red-cooler)
    (warning yellow-cooler)
    (info green-cooler)

    (modeline-err red)
    (modeline-warning yellow-cooler)
    (modeline-info cyan)

    (fg-link magenta-cooler)
    (fg-link-visited yellow-cooler)
    (name blue)
    (keybind cyan-cooler)
    (identifier magenta-faint)
    (fg-prompt green-cooler)

    (builtin green-warmer)
    (comment magenta-faint)
    (constant magenta-cooler)
    (fnname magenta)
    (fnname-call magenta-faint)
    (keyword cyan)
    (preprocessor blue-warmer)
    (docstring cyan-faint)
    (string cyan-warmer)
    (type cyan-cooler)
    (variable green-cooler)
    (variable-use green-faint)
    (rx-backslash yellow) ; compare with `string'
    (rx-construct red-warmer)

    (accent-0 cyan)
    (accent-1 magenta)
    (accent-2 blue-cooler)
    (accent-3 green)

    (date-common green-cooler)
    (date-deadline magenta)
    (date-deadline-subtle magenta-faint)
    (date-event cyan-faint)
    (date-holiday red-cooler)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled blue-warmer)
    (date-scheduled-subtle cyan-faint)
    (date-weekday cyan-cooler)
    (date-weekend magenta)

    (fg-prose-code green-warmer)
    (prose-done green-cooler)
    (fg-prose-macro blue-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag fg-alt)
    (prose-todo magenta-warmer)
    (fg-prose-verbatim magenta)

    (mail-cite-0 cyan-warmer)
    (mail-cite-1 green-cooler)
    (mail-cite-2 green-warmer)
    (mail-cite-3 magenta-cooler)
    (mail-part cyan-cooler)
    (mail-recipient cyan-warmer)
    (mail-subject magenta)
    (mail-other blue-warmer)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-cyan-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 cyan)
    (rainbow-1 cyan-cooler)
    (rainbow-2 magenta)
    (rainbow-3 cyan-warmer)
    (rainbow-4 green-warmer)
    (rainbow-5 blue)
    (rainbow-6 magenta-cooler)
    (rainbow-7 green)
    (rainbow-8 blue-warmer)))

(defcustom ef-arcadia-palette-overrides nil
  "Overrides for `ef-arcadia-palette'.

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

(defconst ef-arcadia-palette
  (modus-themes-generate-palette
   ef-arcadia-palette-partial
   nil
   nil
   (append ef-arcadia-palette-mappings-partial ef-themes-palette-common)))

;;;###theme-autoload
(modus-themes-theme
 'ef-arcadia
 'ef-themes
 "Legible light theme with verdant colors."
 'light
 'ef-arcadia-palette
 nil
 'ef-arcadia-palette-overrides)

(provide 'ef-arcadia-theme)

;;; ef-arcadia-theme.el ends here
