;;; ef-trio-dark-theme.el --- Legible dark theme with magenta, blue, teal colors -*- lexical-binding:t -*-

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

(defconst ef-trio-dark-palette-partial
  '((cursor "#ff99ff")
    (bg-main "#160f0f")
    (bg-dim "#2a2228")
    (bg-alt "#362f35")
    (fg-main "#d8cfd5")
    (fg-dim "#908890")
    (fg-alt "#afdacf")
    (bg-active "#564f55")
    (bg-inactive "#1c1719")
    (border "#605760")

    (red "#f48359")
    (red-warmer "#ff7560")
    (red-cooler "#ff85aa")
    (red-faint "#e07a9a")
    (green "#60b444")
    (green-warmer "#a0c27f")
    (green-cooler "#60bf88")
    (green-faint "#61a06c")
    (yellow "#d4a052")
    (yellow-warmer "#ef926f")
    (yellow-cooler "#ef9680")
    (yellow-faint "#c7a07f")
    (blue "#7fa5f6")
    (blue-warmer "#8895ff")
    (blue-cooler "#72afff")
    (blue-faint "#7a94df")
    (magenta "#d37faf")
    (magenta-warmer "#e772df")
    (magenta-cooler "#a698ef")
    (magenta-faint "#c9addf")
    (cyan "#8fbaff")
    (cyan-warmer "#9ac2ff")
    (cyan-cooler "#8fcfdf")
    (cyan-faint "#8ac0ef")

    (bg-red-intense "#b02930")
    (bg-green-intense "#2a7140")
    (bg-yellow-intense "#8f5040")
    (bg-blue-intense "#4648d0")
    (bg-magenta-intense "#804fd5")
    (bg-cyan-intense "#2270cf")

    (bg-red-subtle "#651f1a")
    (bg-green-subtle "#1a421f")
    (bg-yellow-subtle "#553320")
    (bg-blue-subtle "#283565")
    (bg-magenta-subtle "#562654")
    (bg-cyan-subtle "#133d58")

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

    (bg-mode-line-active "#6a294f")
    (fg-mode-line-active "#ffdfdf")
    (bg-completion "#2f335a")
    (bg-hover "#004f3f")
    (bg-hover-secondary "#452f5f")
    (bg-hl-line "#34223f")
    (bg-paren-match "#2f605e")
    (bg-region "#16304f")
    (bg-err "#461018") ; check with err
    (bg-warning "#3a330f") ; check with warning
    (bg-info "#103515") ; check with info

    (err red-warmer)
    (warning yellow)
    (info green)

    (link cyan)
    (link-alt green-warmer)
    (name blue)
    (keybind magenta-warmer)
    (identifier red-faint)
    (fg-prompt blue-cooler)

    (builtin magenta-cooler)
    (comment yellow-faint)
    (constant magenta-warmer)
    (fnname blue-warmer)
    (fnname-call blue-faint)
    (keyword magenta)
    (preprocessor red-cooler)
    (docstring magenta-faint)
    (string green-cooler)
    (type cyan-cooler)
    (variable cyan-warmer)
    (variable-use cyan-faint)
    (rx-escape blue-warmer) ; compare with `string'
    (rx-construct red)

    (accent-0 magenta-warmer)
    (accent-1 green-cooler)
    (accent-2 blue-warmer)
    (accent-3 yellow)

    (date-common cyan-cooler)
    (date-deadline red-warmer)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday magenta-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (prose-code green-cooler)
    (prose-done green)
    (prose-macro blue-warmer)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag magenta-faint)
    (prose-todo red-warmer)
    (prose-verbatim magenta-warmer)

    (mail-cite-0 blue-warmer)
    (mail-cite-1 magenta-warmer)
    (mail-cite-2 green-cooler)
    (mail-cite-3 magenta-cooler)
    (mail-part cyan-cooler)
    (mail-recipient blue)
    (mail-subject magenta)
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

    (rainbow-0 magenta-warmer)
    (rainbow-1 blue-warmer)
    (rainbow-2 green-cooler)
    (rainbow-3 magenta)
    (rainbow-4 cyan)
    (rainbow-5 green-warmer)
    (rainbow-6 magenta-cooler)
    (rainbow-7 cyan-warmer)
    (rainbow-8 yellow-cooler))
  "Legible dark purple grey theme with magenta, blue, teal colors.")

(defcustom ef-trio-dark-palette-overrides nil
  "Overrides for `ef-trio-dark-palette'.

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

(defconst ef-trio-dark-palette
  (append ef-themes-common-palette-overrides ef-trio-dark-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-trio-dark
 'ef-themes
 "Legible dark purple grey theme with magenta, blue, teal colors."
 'dark
 'modus-vivendi-palette
 'ef-trio-dark-palette
 'ef-trio-dark-palette-overrides
 'ef-themes-custom-faces)

;;; ef-trio-dark-theme.el ends here
