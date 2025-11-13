;;; ef-cyprus-theme.el --- Legible light theme with green, yellow, teal, red colors -*- lexical-binding:t -*-

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

(defconst ef-cyprus-palette-partial
  '((cursor "#007f00")
    (bg-main "#fcf7ef")
    (bg-dim "#f0ece0")
    (bg-alt "#e5e3d8")
    (fg-main "#242521")
    (fg-dim "#59786f")
    (fg-alt "#7f475a")
    (bg-active "#c5c3b8")
    (bg-inactive "#f8f3ea")
    (border "#c4c0b6")

    (red "#9f0d0f")
    (red-warmer "#dd0020")
    (red-cooler "#ca3400")
    (red-faint "#b05350")
    (green "#006f00")
    (green-warmer "#557400")
    (green-cooler "#00824f")
    (green-faint "#3a6f48")
    (yellow "#a7601f")
    (yellow-warmer "#bf4400")
    (yellow-cooler "#a2604f")
    (yellow-faint "#8f6f4a")
    (blue "#375cc6")
    (blue-warmer "#444fcf")
    (blue-cooler "#065fbf")
    (blue-faint "#4a659f")
    (magenta "#9a456f")
    (magenta-warmer "#bf456a")
    (magenta-cooler "#8448aa")
    (magenta-faint "#804f60")
    (cyan "#1f70af")
    (cyan-warmer "#3f6faf")
    (cyan-cooler "#007a9f")
    (cyan-faint "#4f677f")

    (bg-red-intense "#ff8f88")
    (bg-green-intense "#96df80")
    (bg-yellow-intense "#efbf00")
    (bg-blue-intense "#cfceff")
    (bg-magenta-intense "#df9fff")
    (bg-cyan-intense "#88cfd0")

    (bg-red-subtle "#ffc6bf")
    (bg-green-subtle "#c4f2af")
    (bg-yellow-subtle "#f0f07f")
    (bg-blue-subtle "#ccdfff")
    (bg-magenta-subtle "#fad3ff")
    (bg-cyan-subtle "#bfefff")

    (bg-added "#c1f2d1")
    (bg-added-faint "#d8f8e1")
    (bg-added-refine "#b1e4c1")
    (fg-added "#005000")

    (bg-changed "#ffdfb9")
    (bg-changed-faint "#ffefcb")
    (bg-changed-refine "#ffcfa0")
    (fg-changed "#553d00")

    (bg-removed "#ffd3d4")
    (bg-removed-faint "#ffe6e1")
    (bg-removed-refine "#f6c0c9")
    (fg-removed "#8f1313")

    (bg-mode-line-active "#c0df6f")
    (fg-mode-line-active "#142010")
    (bg-completion "#e6e4bf")
    (bg-hover "#efc26f")
    (bg-hover-secondary "#afc0f0")
    (bg-hl-line "#f0e0d4")
    (bg-paren-match "#9fcfdf")
    (bg-region "#e0e7e5")
    (bg-err "#ffd4bf") ; check with err
    (bg-warning "#f0e8ba") ; check with warning
    (bg-info "#d0efbf") ; check with info

    (err red-warmer)
    (warning yellow)
    (info green)

    (fg-link yellow)
    (fg-link-alt cyan)
    (name green-warmer)
    (keybind red)
    (identifier green-faint)
    (fg-prompt green)

    (builtin green-warmer)
    (comment yellow-faint)
    (constant green-cooler)
    (fnname yellow)
    (fnname-call yellow-faint)
    (keyword green)
    (preprocessor red)
    (docstring cyan-faint)
    (string red-cooler)
    (type blue-warmer)
    (variable cyan-cooler)
    (variable-use cyan-faint)
    (rx-escape magenta-cooler) ; compare with `string'
    (rx-construct cyan-cooler)

    (accent-0 green)
    (accent-1 red-cooler)
    (accent-2 cyan-cooler)
    (accent-3 yellow)

    (date-common yellow-cooler)
    (date-deadline red-cooler)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday blue-cooler)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (prose-code red-cooler)
    (prose-done green)
    (prose-macro cyan-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag yellow-faint)
    (prose-todo red-warmer)
    (prose-verbatim green)

    (mail-cite-0 green-warmer)
    (mail-cite-1 yellow-cooler)
    (mail-cite-2 cyan)
    (mail-cite-3 green-cooler)
    (mail-part blue-faint)
    (mail-recipient green-warmer)
    (mail-subject yellow-warmer)
    (mail-other green)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 yellow)
    (rainbow-1 green-warmer)
    (rainbow-2 yellow-warmer)
    (rainbow-3 cyan-warmer)
    (rainbow-4 green-cooler)
    (rainbow-5 magenta)
    (rainbow-6 yellow-cooler)
    (rainbow-7 cyan-cooler)
    (rainbow-8 red))
  "Legible light ochre theme with green, yellow, teal, red colors.")

(defcustom ef-cyprus-palette-overrides nil
  "Overrides for `ef-cyprus-palette'.

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

(defconst ef-cyprus-palette
  (append ef-themes-common-palette-overrides ef-cyprus-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-cyprus
 'ef-themes
 "Legible light ochre theme with green, yellow, teal, red colors."
 'light
 'modus-operandi-palette
 'ef-cyprus-palette
 'ef-cyprus-palette-overrides
 'ef-themes-custom-faces)

;;; ef-cyprus-theme.el ends here
