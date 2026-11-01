;;; ef-halloween-light-theme.el --- Legible light theme with a Holloween style -*- lexical-binding:t -*-

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

(defconst ef-halloween-light-palette-partial
  '((cursor "#c04f00")
    (bg-main "#f2f0c4")
    (bg-dim "#efe5b4")
    (bg-alt "#e7d5b6")
    (fg-main "#684431")
    (fg-dim "#706381")
    (fg-alt "#8f497a")
    (bg-active "#dbc5a0")
    (bg-inactive "#ead8b0")
    (border "#c0b0a6")

    (red "#ba2d2f")
    (red-warmer "#c04000")
    (red-cooler "#c02945")
    (red-faint "#b04950")
    (green "#007a0a")
    (green-warmer "#5a7400")
    (green-cooler "#007850")
    (green-faint "#61704c")
    (yellow "#a05a22")
    (yellow-warmer "#b05000")
    (yellow-cooler "#a04f40")
    (yellow-faint "#935b42")
    (blue "#375cc6")
    (blue-warmer "#5953c0")
    (blue-cooler "#265fbf")
    (blue-faint "#4a659f")
    (magenta "#a05074")
    (magenta-warmer "#b02f80")
    (magenta-cooler "#8450ca")
    (magenta-faint "#705e90")
    (cyan "#3f60af")
    (cyan-warmer "#4060a0")
    (cyan-cooler "#0f708a")
    (cyan-faint "#4f6f8f")

    (bg-red-intense "#f3a058")
    (bg-green-intense "#a6df70")
    (bg-yellow-intense "#efcf00")
    (bg-blue-intense "#90b5e0")
    (bg-magenta-intense "#ef9fbf")
    (bg-cyan-intense "#98cfc0")

    (bg-red-subtle "#ffceb0")
    (bg-green-subtle "#cbf09f")
    (bg-yellow-subtle "#f4ed7e")
    (bg-blue-subtle "#cce4f2")
    (bg-magenta-subtle "#fad6ef")
    (bg-cyan-subtle "#bfefef")

    (bg-added "#d7e890")
    (bg-added-faint "#e2eba6")
    (bg-added-refine "#c2d580")
    (bg-added-fringe "#b6cd66")
    (fg-added "#2f6500")

    (bg-changed "#f5e690")
    (bg-changed-faint "#f5edaf")
    (bg-changed-refine "#edd482")
    (bg-changed-fringe "#e9c06f")
    (fg-changed "#553d00")

    (bg-removed "#ffd090")
    (bg-removed-faint "#f5de9f")
    (bg-removed-refine "#f0b972")
    (bg-removed-fringe "#ef9052")
    (fg-removed "#9f2f00")

    (bg-mode-line-active "#f3a362")
    (fg-mode-line-active "#702328")
    (bg-completion "#f4cf88")
    (bg-popup "#f0ecb0")
    (bg-hover "#deb9d3")
    (bg-hover-secondary "#f3d37a")
    (bg-hl-line "#e4dbbb")
    (bg-paren-match "#b3d17f")
    (bg-err "#f3d4b5") ; check with err
    (bg-warning "#fee28f") ; check with warning
    (bg-info "#d0ebac") ; check with info
    (bg-region "#f5c778")))

(defconst ef-halloween-light-palette-mappings-partial
  '((err red)
    (warning yellow-warmer)
    (info green-warmer)

    (fg-link blue-warmer)
    (fg-link-visited green-faint)
    (name yellow-warmer)
    (keybind red-warmer)
    (identifier green-faint)
    (fg-prompt red)

    (builtin yellow-warmer)
    (comment magenta-faint)
    (constant magenta-cooler)
    (fnname yellow-cooler)
    (fnname-call red-faint)
    (keyword red-warmer)
    (preprocessor red)
    (docstring yellow-faint)
    (string yellow)
    (type red-cooler)
    (variable green-warmer)
    (variable-use green-faint)
    (rx-backslash magenta-cooler) ; compare with `string'
    (rx-construct red)

    (accent-0 red-warmer)
    (accent-1 magenta-cooler)
    (accent-2 yellow)
    (accent-3 green-warmer)

    (date-common magenta)
    (date-deadline magenta-warmer)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday green-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-cooler)
    (date-scheduled-subtle yellow-faint)
    (date-weekday magenta-cooler)
    (date-weekend red)

    (fg-prose-code red-warmer)
    (prose-done green-cooler)
    (fg-prose-macro magenta-warmer)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag yellow-faint)
    (prose-todo red-warmer)
    (fg-prose-verbatim yellow-warmer)

    (mail-cite-0 yellow)
    (mail-cite-1 green-warmer)
    (mail-cite-2 red-faint)
    (mail-cite-3 yellow-faint)
    (mail-part magenta-faint)
    (mail-recipient red-cooler)
    (mail-subject magenta-cooler)
    (mail-other yellow-warmer)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 red-warmer)
    (rainbow-1 yellow)
    (rainbow-2 red)
    (rainbow-3 magenta-cooler)
    (rainbow-4 green-warmer)
    (rainbow-5 red-cooler)
    (rainbow-6 blue-warmer)
    (rainbow-7 yellow-cooler)
    (rainbow-8 green-faint)))

(defcustom ef-halloween-light-palette-overrides nil
  "Overrides for `ef-halloween-light-palette'.

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

(defconst ef-halloween-light-palette
  (modus-themes-generate-palette
   ef-halloween-light-palette-partial
   nil
   nil
   (append ef-halloween-light-palette-mappings-partial ef-themes-palette-common)))

;;;###theme-autoload
(modus-themes-theme
 'ef-halloween-light
 'ef-themes
 "Legible light theme with a Holloween style."
 'light
 'ef-halloween-light-palette
 nil
 'ef-halloween-light-palette-overrides)

(provide 'ef-halloween-light-theme)

;;; ef-halloween-light-theme.el ends here
