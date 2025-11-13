;;; ef-bio-theme.el --- Legible dark theme with green, teal, blue, purple colors -*- lexical-binding:t -*-

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

(defconst ef-bio-palette-partial
  '((cursor "#35f038")
    (bg-main "#111111")
    (bg-dim "#222522")
    (bg-alt "#303230")
    (fg-main "#cfdfd5")
    (fg-dim "#808f80")
    (fg-alt "#8fcfaf")
    (bg-active "#505250")
    (bg-inactive "#161916")
    (border "#525959")

    (red "#ef6560")
    (red-warmer "#f47360")
    (red-cooler "#ff778f")
    (red-faint "#d56f72")
    (green "#3fb83f")
    (green-warmer "#7fc500")
    (green-cooler "#00c089")
    (green-faint "#7fc07f")
    (yellow "#d4aa02")
    (yellow-warmer "#e09a0f")
    (yellow-cooler "#cfc04f")
    (yellow-faint "#b7a07f")
    (blue "#37aff6")
    (blue-warmer "#78afff")
    (blue-cooler "#32cfef")
    (blue-faint "#6ab4cf")
    (magenta "#d38faf")
    (magenta-warmer "#e490df")
    (magenta-cooler "#af9fff")
    (magenta-faint "#caa5bf")
    (cyan "#6fc5ef")
    (cyan-warmer "#7fcfdf")
    (cyan-cooler "#5dc0aa")
    (cyan-faint "#7fb4cf")

    (bg-red-intense "#b02930")
    (bg-green-intense "#407430")
    (bg-yellow-intense "#8f5040")
    (bg-blue-intense "#4648d0")
    (bg-magenta-intense "#a04fc5")
    (bg-cyan-intense "#2270be")

    (bg-red-subtle "#65201a")
    (bg-green-subtle "#0a4425")
    (bg-yellow-subtle "#523324")
    (bg-blue-subtle "#1a3863")
    (bg-magenta-subtle "#572853")
    (bg-cyan-subtle "#113e57")

    (bg-added "#003b1f")
    (bg-added-faint "#002a10")
    (bg-added-refine "#03512f")
    (fg-added "#a0e0a0")

    (bg-changed "#363300")
    (bg-changed-faint "#2a1f00")
    (bg-changed-refine "#4a4a00")
    (fg-changed "#efef80")

    (bg-removed "#4e1119")
    (bg-removed-faint "#380a0f")
    (bg-removed-refine "#751a1f")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#00552f")
    (fg-mode-line-active "#d0ffe0")
    (bg-completion "#0f3c2f")
    (bg-hover "#4f3f9a")
    (bg-hover-secondary "#003e5f")
    (bg-hl-line "#00331f")
    (bg-paren-match "#664950")
    (bg-region "#3a3027")
    (bg-err "#48100f") ; check with err
    (bg-warning "#3b3400") ; check with warning
    (bg-info "#1a3b0f") ; check with info

    (err red)
    (warning yellow-cooler)
    (info green)

    (fg-link green-cooler)
    (fg-link-alt magenta)
    (name green)
    (keybind green)
    (identifier magenta-faint)
    (fg-prompt cyan-cooler)

    (builtin green)
    (comment yellow-faint)
    (constant blue)
    (fnname green-warmer)
    (fnname-call green-faint)
    (keyword green-cooler)
    (preprocessor cyan-cooler)
    (docstring green-faint)
    (string magenta-cooler)
    (type cyan-warmer)
    (variable blue-warmer)
    (variable-use blue-faint)
    (rx-escape yellow-cooler) ; compare with `string'
    (rx-construct green)

    (accent-0 green-cooler)
    (accent-1 blue-warmer)
    (accent-2 magenta-warmer)
    (accent-3 green-warmer)

    (date-common cyan-cooler)
    (date-deadline red-cooler)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday magenta-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-cooler)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (prose-code blue-warmer)
    (prose-done green)
    (prose-macro magenta-warmer)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula warning)
    (prose-tag yellow-faint)
    (prose-todo red)
    (prose-verbatim green-cooler)

    (mail-cite-0 green-cooler)
    (mail-cite-1 blue-warmer)
    (mail-cite-2 green-warmer)
    (mail-cite-3 magenta-cooler)
    (mail-part green-faint)
    (mail-recipient green)
    (mail-subject blue)
    (mail-other green-warmer)

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
    (rainbow-1 green-warmer)
    (rainbow-2 cyan-cooler)
    (rainbow-3 magenta-cooler)
    (rainbow-4 cyan-warmer)
    (rainbow-5 yellow-cooler)
    (rainbow-6 blue)
    (rainbow-7 cyan)
    (rainbow-8 magenta))
  "Legible dark green-black theme with green, teal, blue, purple colors.")

(defcustom ef-bio-palette-overrides nil
  "Overrides for `ef-bio-palette'.

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

(defconst ef-bio-palette
  (append ef-themes-common-palette-overrides ef-bio-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-bio
 'ef-themes
 "Legible dark green-black theme with green, teal, blue, purple colors."
 'dark
 'modus-vivendi-palette
 'ef-bio-palette
 'ef-bio-palette-overrides
 'ef-themes-custom-faces)

;;; ef-bio-theme.el ends here
