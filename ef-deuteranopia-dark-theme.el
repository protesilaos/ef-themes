;;; ef-deuteranopia-dark-theme.el --- Legible dark theme, optimized for red-green color deficiency -*- lexical-binding:t -*-

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

;; Most of the colors here, like the red and green hues, are defined
;; simply to preserve compatibility with the rest of the project.  We
;; don't actually rely on them for anything critical.
(defconst ef-deuteranopia-dark-palette-partial
  '((cursor "#ffff00")
    (bg-main "#000a1f")
    (bg-dim "#121f34")
    (bg-alt "#243145")
    (fg-main "#ddddee")
    (fg-dim "#7f8797")
    (fg-alt "#90afef")
    (bg-active "#445165")
    (bg-inactive "#0d1429")
    (border "#555a64")

    (red "#cf8560")
    (red-warmer "#e47360")
    (red-cooler "#cf7a7a")
    (red-faint "#b57f82")
    (green "#3faa26")
    (green-warmer "#7aad0f")
    (green-cooler "#3fa672")
    (green-faint "#61a06c")
    (yellow "#aa9f32")
    (yellow-warmer "#cfaf00")
    (yellow-cooler "#bfaf7a")
    (yellow-faint "#af9a6a")
    (blue "#3f90f0")
    (blue-warmer "#6a9fff")
    (blue-cooler "#009fff")
    (blue-faint "#7a94df")
    (magenta "#b379bf")
    (magenta-warmer "#af80ea")
    (magenta-cooler "#9f95ff")
    (magenta-faint "#c59fcf")
    (cyan "#5faaef")
    (cyan-warmer "#7fafff")
    (cyan-cooler "#0db0ff")
    (cyan-faint "#8aa0df")

    (bg-red-intense "#8d7f00")
    (bg-green-intense "#afcf20")
    (bg-yellow-intense "#5f5f00")
    (bg-blue-intense "#266fd0")
    (bg-magenta-intense "#6f60c0")
    (bg-cyan-intense "#007fae")

    (bg-red-subtle "#5d3f00")
    (bg-green-subtle "#345f20")
    (bg-yellow-subtle "#575700")
    (bg-blue-subtle "#264f70")
    (bg-magenta-subtle "#4a4670")
    (bg-cyan-subtle "#265560")

    (bg-added "#00234f")
    (bg-added-faint "#00143f")
    (bg-added-refine "#03395f")
    (fg-added "#c4d5ff")

    (bg-changed "#2f123f")
    (bg-changed-faint "#1f022f")
    (bg-changed-refine "#3f224f")
    (fg-changed "#e3cfff")

    (bg-removed "#323200")
    (bg-removed-faint "#281a00")
    (bg-removed-refine "#484800")
    (fg-removed "#d4d48f")

    (bg-mode-line-active "#003f8f")
    (fg-mode-line-active "#ffffff")
    (bg-completion "#343420")
    (bg-hover "#4f4f00")
    (bg-hover-secondary "#00405f")
    (bg-hl-line "#2e2e1b")
    (bg-paren-match "#0f4f9a")
    (bg-region "#223848")
    (bg-err "#442f00") ; check with err
    (bg-warning "#3a3a1f") ; check with warning
    (bg-info "#002b60") ; check with info

    (err yellow-warmer)
    (warning yellow-cooler)
    (info blue-cooler)

    (fg-link blue)
    (fg-link-alt yellow-cooler)
    (name blue-warmer)
    (keybind yellow-warmer)
    (identifier cyan-faint)
    (fg-prompt blue-cooler)

    (builtin blue-warmer)
    (comment yellow-faint)
    (constant blue-cooler)
    (fnname yellow-cooler)
    (fnname-call yellow-faint)
    (keyword yellow-warmer)
    (preprocessor yellow)
    (docstring cyan-faint)
    (string blue)
    (type magenta-cooler)
    (variable cyan-cooler)
    (variable-use cyan-faint)
    (rx-escape yellow-faint) ; compare with `string'
    (rx-construct yellow-warmer)

    (accent-0 blue-cooler)
    (accent-1 yellow-warmer)
    (accent-2 cyan-warmer)
    (accent-3 magenta-cooler)

    (date-common yellow-cooler)
    (date-deadline yellow-warmer)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday cyan-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-cooler)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend magenta-faint)

    (prose-code yellow-warmer)
    (prose-done blue-cooler)
    (prose-macro cyan-warmer)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag fg-alt)
    (prose-todo yellow-warmer)
    (prose-verbatim blue-cooler)

    (mail-cite-0 blue-warmer)
    (mail-cite-1 yellow)
    (mail-cite-2 blue-cooler)
    (mail-cite-3 yellow-cooler)
    (mail-part cyan-faint)
    (mail-recipient blue-warmer)
    (mail-subject cyan-cooler)
    (mail-other cyan)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-magenta-intense)

    (bg-search-rx-group-0 bg-cyan-intense)
    (bg-search-rx-group-1 bg-magenta-intense)
    (bg-search-rx-group-2 bg-blue-subtle)
    (bg-search-rx-group-3 bg-yellow-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 yellow-warmer)
    (rainbow-1 blue)
    (rainbow-2 yellow-cooler)
    (rainbow-3 blue-warmer)
    (rainbow-4 yellow)
    (rainbow-5 cyan-warmer)
    (rainbow-6 yellow-faint)
    (rainbow-7 blue-faint)
    (rainbow-8 magenta-faint))
  "Legible dark theme, optimized for red-green color deficiency.")

(defcustom ef-deuteranopia-dark-palette-overrides nil
  "Overrides for `ef-deuteranopia-dark-palette'.

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

(defconst ef-deuteranopia-dark-palette
  (append ef-themes-common-palette-overrides ef-deuteranopia-dark-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-deuteranopia-dark
 'ef-themes
 "Legible dark theme, optimized for red-green color deficiency."
 'dark
 'modus-vivendi-deuteranopia-palette
 'ef-deuteranopia-dark-palette
 'ef-deuteranopia-dark-palette-overrides
 'ef-themes-custom-faces)

;;; ef-deuteranopia-dark-theme.el ends here
