;;; ef-duo-light-theme.el --- Legible light theme with mostly blue and yellow colors -*- lexical-binding:t -*-

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

(defconst ef-duo-light-palette-partial
  '((cursor "#1144ff")
    (bg-main "#fff8f0")
    (bg-dim "#f6ece8")
    (bg-alt "#e7e0da")
    (fg-main "#222222")
    (fg-dim "#63728f")
    (fg-alt "#856f4a")
    (bg-active "#c7c0ba")
    (bg-inactive "#f9f2ef")
    (border "#baafba")

    (red "#cc3333")
    (red-warmer "#dd1100")
    (red-cooler "#c04440")
    (red-faint "#a2403f")
    (green "#217a3c")
    (green-warmer "#4a7d00")
    (green-cooler "#008058")
    (green-faint "#61756c")
    (yellow "#8a5d00")
    (yellow-warmer "#9f4a00")
    (yellow-cooler "#8f5a3a")
    (yellow-faint "#765640")
    (blue "#375cd8")
    (blue-warmer "#4250ef")
    (blue-cooler "#065fff")
    (blue-faint "#6060d0")
    (magenta "#ba35af")
    (magenta-warmer "#cf25aa")
    (magenta-cooler "#6052cf")
    (magenta-faint "#af569f")
    (cyan "#1f6fbf")
    (cyan-warmer "#3f70a0")
    (cyan-cooler "#1f77bb")
    (cyan-faint "#406f90")

    (bg-red-intense "#ff8f88")
    (bg-green-intense "#8adf80")
    (bg-yellow-intense "#fac200")
    (bg-blue-intense "#cbcfff")
    (bg-magenta-intense "#df8fff")
    (bg-cyan-intense "#88c8ff")

    (bg-red-subtle "#ffcfbf")
    (bg-green-subtle "#aff7c5")
    (bg-yellow-subtle "#f9f376")
    (bg-blue-subtle "#cfdff9")
    (bg-magenta-subtle "#f9ddf0")
    (bg-cyan-subtle "#bfeaf0")

    (bg-added "#ccefcf")
    (bg-added-faint "#e0f3e0")
    (bg-added-refine "#bae0c0")
    (fg-added "#005000")

    (bg-changed "#ffe5b9")
    (bg-changed-faint "#ffefc5")
    (bg-changed-refine "#ffd09f")
    (fg-changed "#553d00")

    (bg-removed "#ffd4d8")
    (bg-removed-faint "#ffe3e3")
    (bg-removed-refine "#ffc0ca")
    (fg-removed "#8f1313")

    (bg-mode-line-active "#f8cf8f")
    (fg-mode-line-active "#111133")
    (bg-completion "#fadacf")
    (bg-hover "#b4cfff")
    (bg-hover-secondary "#aaeccf")
    (bg-hl-line "#f9e8c0")
    (bg-paren-match "#afbfef")
    (bg-region "#caeafa")
    (bg-err "#ffdfe6") ; check with err
    (bg-warning "#ffe5ba") ; check with warning
    (bg-info "#cff5d0") ; check with info

    (err red)
    (warning yellow)
    (info green)

    (fg-link cyan)
    (fg-link-alt green-cooler)
    (name blue)
    (keybind blue-cooler)
    (identifier red-faint)
    (fg-prompt blue-warmer)

    (builtin cyan-cooler)
    (comment red-faint)
    (constant blue)
    (fnname cyan)
    (fnname-call cyan-faint)
    (keyword blue-warmer)
    (preprocessor cyan-warmer)
    (docstring cyan-faint)
    (string yellow-warmer)
    (type blue-cooler)
    (variable magenta-cooler)
    (variable-use magenta-faint)
    (rx-escape cyan) ; compare with `string'
    (rx-construct red-warmer)

    (accent-0 blue-warmer)
    (accent-1 yellow-warmer)
    (accent-2 green-cooler)
    (accent-3 red)

    (date-common cyan-cooler)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday magenta-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (prose-code yellow-warmer)
    (prose-done green)
    (prose-macro green-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag yellow-faint)
    (prose-todo red)
    (prose-verbatim blue-warmer)

    (mail-cite-0 blue)
    (mail-cite-1 yellow-cooler)
    (mail-cite-2 cyan-cooler)
    (mail-cite-3 red-cooler)
    (mail-part blue-faint)
    (mail-recipient blue)
    (mail-subject yellow-warmer)
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

    (rainbow-0 blue)
    (rainbow-1 yellow-warmer)
    (rainbow-2 blue-warmer)
    (rainbow-3 yellow-cooler)
    (rainbow-4 magenta-cooler)
    (rainbow-5 green-warmer)
    (rainbow-6 cyan-warmer)
    (rainbow-7 yellow)
    (rainbow-8 green-cooler))
  "Legible light theme with mostly blue and yellow colors.")

(defcustom ef-duo-light-palette-overrides nil
  "Overrides for `ef-duo-light-palette'.

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

(defconst ef-duo-light-palette
  (append ef-themes-common-palette-overrides ef-duo-light-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-duo-light
 'ef-themes
 "Legible light theme with mostly blue and yellow colors."
 'light
 'modus-operandi-palette
 'ef-duo-light-palette
 'ef-duo-light-palette-overrides
 'ef-themes-custom-faces)

;;; ef-duo-light-theme.el ends here
