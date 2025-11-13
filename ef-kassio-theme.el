;;; ef-kassio-theme.el --- Legible light theme with blue, red, magenta, and earthly colors -*- lexical-binding:t -*-

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

(defconst ef-kassio-palette-partial
  '((cursor "#d06f30")
    (bg-main "#fff7f7")
    (bg-dim "#efe7e7")
    (bg-alt "#e0dbdb")
    (fg-main "#201f36")
    (fg-dim "#776f79")
    (fg-alt "#af4988")
    (bg-active "#c0bbbb")
    (bg-inactive "#f9eff3")
    (border "#bab7bc")

    (red "#b00234")
    (red-warmer "#e00033")
    (red-cooler "#d5305f")
    (red-faint "#af3f5f")
    (green "#217a3c")
    (green-warmer "#4a7d00")
    (green-cooler "#008358")
    (green-faint "#61756c")
    (yellow "#9a6012")
    (yellow-warmer "#b6530f")
    (yellow-cooler "#a04646")
    (yellow-faint "#a65d6a")
    (blue "#3c3bbe")
    (blue-warmer "#4250ef")
    (blue-cooler "#065fff")
    (blue-faint "#6060d0")
    (magenta "#a01f64")
    (magenta-warmer "#9f248a")
    (magenta-cooler "#7022bf")
    (magenta-faint "#954f90")
    (cyan "#2f5f9f")
    (cyan-warmer "#3f6faf")
    (cyan-cooler "#1077ab")
    (cyan-faint "#506fa0")

    (bg-red-intense "#ff8f88")
    (bg-green-intense "#8adf80")
    (bg-yellow-intense "#fac200")
    (bg-blue-intense "#cbcfff")
    (bg-magenta-intense "#df8fff")
    (bg-cyan-intense "#88c8ff")

    (bg-red-subtle "#facfbf")
    (bg-green-subtle "#ccf0af")
    (bg-yellow-subtle "#faf182")
    (bg-blue-subtle "#cfdfff")
    (bg-magenta-subtle "#ffd6f2")
    (bg-cyan-subtle "#c2f2f4")

    (bg-added "#c2efcf")
    (bg-added-faint "#e0f3e0")
    (bg-added-refine "#bae0c8")
    (fg-added "#005000")

    (bg-changed "#ffe5b9")
    (bg-changed-faint "#ffefc5")
    (bg-changed-refine "#ffd09f")
    (fg-changed "#553d00")

    (bg-removed "#ffcfda")
    (bg-removed-faint "#ffe3e3")
    (bg-removed-refine "#ffb9c9")
    (fg-removed "#8f1313")

    (bg-mode-line-active "#e0bfba")
    (fg-mode-line-active "#151515")
    (bg-completion "#f2d5c9")
    (bg-hover "#c0d0ff")
    (bg-hover-secondary "#efd5ff")
    (bg-hl-line "#f2e5d9")
    (bg-paren-match "#b0dffa")
    (bg-region "#dfe4f4")
    (bg-err "#ffdde5") ; check with err
    (bg-warning "#ffe0aa") ; check with warning
    (bg-info "#ddf5cc") ; check with info

    (err red-warmer)
    (warning yellow-warmer)
    (info green)

    (fg-link blue)
    (fg-link-alt magenta)
    (name magenta)
    (keybind red)
    (identifier yellow-cooler)
    (fg-prompt blue-warmer)

    (builtin magenta)
    (comment cyan-faint)
    (constant magenta-cooler)
    (fnname magenta-warmer)
    (fnname-call magenta-faint)
    (keyword blue)
    (preprocessor cyan-warmer)
    (docstring magenta-faint)
    (string yellow-cooler)
    (type red)
    (variable blue-warmer)
    (variable-use blue-faint)
    (rx-escape cyan-cooler) ; compare with `string'
    (rx-construct red-cooler)

    (accent-0 blue)
    (accent-1 red)
    (accent-2 cyan-cooler)
    (accent-3 yellow-warmer)

    (date-common cyan-cooler)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday red-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-warmer)
    (date-scheduled-subtle yellow-faint)
    (date-weekday blue)
    (date-weekend red)

    (prose-code magenta-warmer)
    (prose-done green-warmer)
    (prose-macro magenta-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table yellow-faint)
    (prose-table-formula info)
    (prose-tag magenta-faint)
    (prose-todo red-warmer)
    (prose-verbatim blue-warmer)

    (mail-cite-0 yellow-cooler)
    (mail-cite-1 magenta-warmer)
    (mail-cite-2 cyan-cooler)
    (mail-cite-3 blue-warmer)
    (mail-part cyan)
    (mail-recipient magenta)
    (mail-subject blue)
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

    (rainbow-0 blue)
    (rainbow-1 magenta)
    (rainbow-2 cyan)
    (rainbow-3 yellow-cooler)
    (rainbow-4 magenta-cooler)
    (rainbow-5 magenta-warmer)
    (rainbow-6 red-cooler)
    (rainbow-7 cyan-cooler)
    (rainbow-8 green-cooler))
  "Legible light grey theme with blue, red, magenta, and earthly colors.")

(defcustom ef-kassio-palette-overrides nil
  "Overrides for `ef-kassio-palette'.

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

(defconst ef-kassio-palette
  (append ef-themes-common-palette-overrides ef-kassio-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-kassio
 'ef-themes
 "Legible light grey theme with blue, red, magenta, and earthly colors."
 'light
 'modus-operandi-palette
 'ef-kassio-palette
 'ef-kassio-palette-overrides
 'ef-themes-custom-faces)

;;; ef-kassio-theme.el ends here
