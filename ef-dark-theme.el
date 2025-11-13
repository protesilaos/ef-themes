;;; ef-dark-theme.el --- Legible dark theme with blue, magenta, cyan, purple colors -*- lexical-binding:t -*-

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

(defconst ef-dark-palette-partial
  '((cursor "#ff76ff")
    (bg-main "#000000")
    (bg-dim "#1a1a1a")
    (bg-alt "#2b2b2b")
    (fg-main "#d0d0d0")
    (fg-dim "#857f8f")
    (fg-alt "#89afef")
    (bg-active "#4b4b4b")
    (bg-inactive "#121212")
    (border "#4f4f5f")

    (red "#ef6560")
    (red-warmer "#f47360")
    (red-cooler "#ff5a7a")
    (red-faint "#d56f72")
    (green "#0faa26")
    (green-warmer "#6aad0f")
    (green-cooler "#00a692")
    (green-faint "#61a06c")
    (yellow "#bf9032")
    (yellow-warmer "#d1843f")
    (yellow-cooler "#df8a5a")
    (yellow-faint "#cf9f8f")
    (blue "#3f95f6")
    (blue-warmer "#6a9fff")
    (blue-cooler "#029fff")
    (blue-faint "#7a94df")
    (magenta "#d369af")
    (magenta-warmer "#e580ea")
    (magenta-cooler "#af85ff")
    (magenta-faint "#c58faf")
    (cyan "#4fbaef")
    (cyan-warmer "#6fafff")
    (cyan-cooler "#1dbfcf")
    (cyan-faint "#8aa0df")

    (bg-red-intense "#b02930")
    (bg-green-intense "#337133")
    (bg-yellow-intense "#8f5040")
    (bg-blue-intense "#4648d0")
    (bg-magenta-intense "#804fdd")
    (bg-cyan-intense "#2270cf")

    (bg-red-subtle "#72002a")
    (bg-green-subtle "#00422a")
    (bg-yellow-subtle "#603000")
    (bg-blue-subtle "#2f2f74")
    (bg-magenta-subtle "#572060")
    (bg-cyan-subtle "#004065")

    (bg-added "#00381f")
    (bg-added-faint "#002910")
    (bg-added-refine "#034f2f")
    (fg-added "#a0e0a0")

    (bg-changed "#363300")
    (bg-changed-faint "#2a1f00")
    (bg-changed-refine "#4a4a00")
    (fg-changed "#efef80")

    (bg-removed "#4f1119")
    (bg-removed-faint "#380a0f")
    (bg-removed-refine "#781a1f")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#2a2a75")
    (fg-mode-line-active "#e0e0ff")
    (bg-completion "#0f2d4a")
    (bg-hover "#004a5f")
    (bg-hover-secondary "#551f5a")
    (bg-hl-line "#002435")
    (bg-paren-match "#20577a")
    (bg-region "#2a234a")
    (bg-err "#461210") ; check with err
    (bg-warning "#3a3004") ; check with warning
    (bg-info "#10350a") ; check with info

    (err red-warmer)
    (warning yellow)
    (info green)

    (fg-link cyan)
    (fg-link-alt magenta)
    (name blue-warmer)
    (keybind blue-cooler)
    (identifier magenta-faint)
    (fg-prompt green-cooler)

    (builtin magenta)
    (comment yellow-faint)
    (constant blue-cooler)
    (fnname magenta-warmer)
    (fnname-call magenta-faint)
    (keyword magenta-cooler)
    (preprocessor red)
    (docstring cyan-faint)
    (string blue-warmer)
    (type green-cooler)
    (variable cyan-cooler)
    (variable-use cyan-faint)
    (rx-escape green-warmer) ; compare with `string'
    (rx-construct red)

    (accent-0 blue)
    (accent-1 magenta-warmer)
    (accent-2 green-cooler)
    (accent-3 red)

    (date-common green-cooler)
    (date-deadline red-warmer)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday magenta)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (prose-code magenta-warmer)
    (prose-done green)
    (prose-macro green-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag yellow-faint)
    (prose-todo red-warmer)
    (prose-verbatim blue)

    (mail-cite-0 blue)
    (mail-cite-1 magenta-warmer)
    (mail-cite-2 green-cooler)
    (mail-cite-3 yellow-cooler)
    (mail-part magenta-faint)
    (mail-recipient blue-warmer)
    (mail-subject blue-cooler)
    (mail-other cyan)

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
    (rainbow-1 blue)
    (rainbow-2 magenta-warmer)
    (rainbow-3 cyan-cooler)
    (rainbow-4 yellow-cooler)
    (rainbow-5 magenta-cooler)
    (rainbow-6 red-cooler)
    (rainbow-7 green-warmer)
    (rainbow-8 yellow))
  "Legible dark theme with blue, magenta, cyan, purple colors.")

(defcustom ef-dark-palette-overrides nil
  "Overrides for `ef-dark-palette'.

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

(defconst ef-dark-palette
  (append ef-themes-common-palette-overrides ef-dark-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-dark
 'ef-themes
 "Legible dark theme with blue, magenta, cyan, purple colors."
 'dark
 'modus-vivendi-palette
 'ef-dark-palette
 'ef-dark-palette-overrides
 'ef-themes-custom-faces)

;;; ef-dark-theme.el ends here
