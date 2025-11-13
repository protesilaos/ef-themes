;;; ef-deuteranopia-light-theme.el --- Legible light theme, optimized for red-green color deficiency -*- lexical-binding:t -*-

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
(defconst ef-deuteranopia-light-palette-partial
  '((cursor "#0000bb")
    (bg-main "#f5f5ff")
    (bg-dim "#e8e8ea")
    (bg-alt "#d3d3e0")
    (fg-main "#1a1a2f")
    (fg-dim "#70627f")
    (fg-alt "#196f70")
    (bg-active "#b3b3c0")
    (bg-inactive "#efeff5")
    (border "#bcbcd0")

    (red "#d3303a")
    (red-warmer "#e00033")
    (red-cooler "#d50f7f")
    (red-faint "#a04852")
    (green "#217a3c")
    (green-warmer "#4a7d00")
    (green-cooler "#008058")
    (green-faint "#61756c")
    (yellow "#805d00")
    (yellow-warmer "#965000")
    (yellow-cooler "#765040")
    (yellow-faint "#77604a")
    (blue "#375cd8")
    (blue-warmer "#4250ef")
    (blue-cooler "#065fff")
    (blue-faint "#6060d0")
    (magenta "#ba35af")
    (magenta-warmer "#cf25aa")
    (magenta-cooler "#6052cf")
    (magenta-faint "#9f5080")
    (cyan "#1f6fbf")
    (cyan-warmer "#3f6faf")
    (cyan-cooler "#1477b2")
    (cyan-faint "#506fa0")

    (bg-red-intense "#cac200")
    (bg-green-intense "#9aaf80")
    (bg-yellow-intense "#fac200")
    (bg-blue-intense "#cbcfff")
    (bg-magenta-intense "#3fbfff")
    (bg-cyan-intense "#98e8ff")

    (bg-red-subtle "#ead270")
    (bg-green-subtle "#bae0a0")
    (bg-yellow-subtle "#e6f270")
    (bg-blue-subtle "#c0dfff")
    (bg-magenta-subtle "#ccc8ff")
    (bg-cyan-subtle "#afecf0")

    (bg-added "#dbdbff")
    (bg-added-faint "#e4e4ff")
    (bg-added-refine "#c0c0ef")
    (fg-added "#333399")

    (bg-changed "#eecfdf")
    (bg-changed-faint "#f0dde5")
    (bg-changed-refine "#e0b0d0")
    (fg-changed "#6f1343")

    (bg-removed "#fff0af")
    (bg-removed-faint "#efefcb")
    (bg-removed-refine "#f0da88")
    (fg-removed "#553d00")

    (bg-mode-line-active "#99c7ff")
    (fg-mode-line-active "#0a0a1f")
    (bg-completion "#f0dacf")
    (bg-hover "#eebb20")
    (bg-hover-secondary "#afafef")
    (bg-hl-line "#f3e0d5")
    (bg-paren-match "#8fc0cf")
    (bg-region "#dadadf")
    (bg-err "#f0e0a0") ; check with err
    (bg-warning "#e3ea9a") ; check with warning
    (bg-info "#d0dfff") ; check with info

    (err yellow-warmer)
    (warning yellow-cooler)
    (info blue-cooler)

    (fg-link blue)
    (fg-link-alt yellow-cooler)
    (name blue-warmer)
    (keybind yellow-warmer)
    (identifier cyan-faint)
    (fg-prompt blue)

    (builtin cyan)
    (comment yellow-faint)
    (constant yellow-cooler)
    (fnname blue-cooler)
    (fnname-call blue-faint)
    (keyword blue-warmer)
    (preprocessor magenta-cooler)
    (docstring cyan-faint)
    (string yellow-warmer)
    (type yellow)
    (variable cyan-cooler)
    (variable-use cyan-faint)
    (rx-escape cyan-faint) ; compare with `string'
    (rx-construct blue-warmer)

    (accent-0 blue-cooler)
    (accent-1 yellow-warmer)
    (accent-2 cyan)
    (accent-3 yellow-cooler)

    (date-common yellow-cooler)
    (date-deadline yellow-warmer)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday cyan)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-cooler)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend magenta-faint)

    (prose-code yellow-warmer)
    (prose-done blue-cooler)
    (prose-macro cyan)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag green-faint)
    (prose-todo yellow-warmer)
    (prose-verbatim blue-cooler)

    (mail-cite-0 blue-warmer)
    (mail-cite-1 yellow-cooler)
    (mail-cite-2 cyan-cooler)
    (mail-cite-3 yellow)
    (mail-part blue-faint)
    (mail-recipient blue-warmer)
    (mail-subject blue-cooler)
    (mail-other cyan)

    (bg-space-err bg-yellow-intense)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-magenta-intense)

    (bg-search-rx-group-0 bg-cyan-intense)
    (bg-search-rx-group-1 bg-magenta-intense)
    (bg-search-rx-group-2 bg-blue-subtle)
    (bg-search-rx-group-3 bg-yellow-subtle)

    (rainbow-0 blue)
    (rainbow-1 yellow)
    (rainbow-2 blue-warmer)
    (rainbow-3 yellow-cooler)
    (rainbow-4 blue-cooler)
    (rainbow-5 yellow-warmer)
    (rainbow-6 blue-faint)
    (rainbow-7 yellow-faint)
    (rainbow-8 cyan))
  "Legible light theme, optimized for red-green color deficiency.")

(defcustom ef-deuteranopia-light-palette-overrides nil
  "Overrides for `ef-deuteranopia-light-palette'.

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

(defconst ef-deuteranopia-light-palette
  (append ef-themes-common-palette-overrides ef-deuteranopia-light-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-deuteranopia-light
 'ef-themes
 "Legible light theme, optimized for red-green color deficiency."
 'light
 'modus-operandi-deuteranopia-palette
 'ef-deuteranopia-light-palette
 'ef-deuteranopia-light-palette-overrides
 'ef-themes-custom-faces)

;;; ef-deuteranopia-light-theme.el ends here
