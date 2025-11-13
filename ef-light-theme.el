;;; ef-light-theme.el --- Legible light theme with blue, magenta, cyan, purple colors -*- lexical-binding:t -*-

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

(defconst ef-light-palette-partial
  '((cursor "#0033cc")
    (bg-main "#ffffff")
    (bg-dim "#efefef")
    (bg-alt "#dbdbdb")
    (fg-main "#202020")
    (fg-dim "#68759f")
    (fg-alt "#397a70")
    (bg-active "#b3b3b3")
    (bg-inactive "#f9f9f9")
    (border "#bfc4da")

    (red "#d3303a")
    (red-warmer "#e00033")
    (red-cooler "#d51272")
    (red-faint "#c24552")
    (green "#217a3c")
    (green-warmer "#4a7d00")
    (green-cooler "#008858")
    (green-faint "#61756c")
    (yellow "#a45f22")
    (yellow-warmer "#b6532f")
    (yellow-cooler "#b65050")
    (yellow-faint "#a65f6a")
    (blue "#3740cf")
    (blue-warmer "#4250ef")
    (blue-cooler "#065fff")
    (blue-faint "#4f54aa")
    (magenta "#ba35af")
    (magenta-warmer "#cf25aa")
    (magenta-cooler "#6052cf")
    (magenta-faint "#af5a80")
    (cyan "#1f6fbf")
    (cyan-warmer "#3f6faf")
    (cyan-cooler "#1f77bb")
    (cyan-faint "#506fa0")

    (bg-red-intense "#ff8f88")
    (bg-green-intense "#9adf90")
    (bg-yellow-intense "#fac200")
    (bg-blue-intense "#cbcfff")
    (bg-magenta-intense "#df8fff")
    (bg-cyan-intense "#88c8ff")

    (bg-red-subtle "#ffcfbf")
    (bg-green-subtle "#b3fabf")
    (bg-yellow-subtle "#fff576")
    (bg-blue-subtle "#ccdfff")
    (bg-magenta-subtle "#ffddff")
    (bg-cyan-subtle "#bfefff")

    (bg-added "#d0f0d0")
    (bg-added-faint "#e5ffe5")
    (bg-added-refine "#b2e8be")
    (fg-added "#005000")

    (bg-changed "#f4e8bd")
    (bg-changed-faint "#f9efcb")
    (bg-changed-refine "#efd299")
    (fg-changed "#553d00")

    (bg-removed "#ffd8d5")
    (bg-removed-faint "#ffe9e9")
    (bg-removed-refine "#f3b5af")
    (fg-removed "#8f1313")

    (bg-mode-line-active "#b7c7ff")
    (fg-mode-line-active "#151515")
    (bg-completion "#bfe8ff")
    (bg-hover "#aaeccf")
    (bg-hover-secondary "#ccbfff")
    (bg-hl-line "#e4efd8")
    (bg-paren-match "#dfa0f3")
    (bg-region "#bfefff")
    (bg-err "#ffd5ea") ; check with err
    (bg-warning "#ffeabb") ; check with warning
    (bg-info "#d0efda") ; check with info

    (err red-warmer)
    (warning yellow-warmer)
    (info green)

    (fg-link blue-warmer)
    (fg-link-alt magenta)
    (name magenta-cooler)
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
    (rx-escape green-cooler) ; compare with `string'
    (rx-construct magenta)

    (accent-0 blue-warmer)
    (accent-1 magenta-warmer)
    (accent-2 green-cooler)
    (accent-3 yellow-warmer)

    (date-common cyan-cooler)
    (date-deadline red)
    (date-deadline-subtle red-cooler)
    (date-event fg-alt)
    (date-holiday magenta-warmer)
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
    (prose-tag green-faint)
    (prose-todo red-warmer)
    (prose-verbatim blue-warmer)

    (mail-cite-0 blue-warmer)
    (mail-cite-1 magenta)
    (mail-cite-2 cyan-cooler)
    (mail-cite-3 yellow-cooler)
    (mail-part cyan-warmer)
    (mail-recipient magenta-cooler)
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
    (rainbow-1 blue-faint)
    (rainbow-2 magenta)
    (rainbow-3 cyan-cooler)
    (rainbow-4 yellow-cooler)
    (rainbow-5 magenta-cooler)
    (rainbow-6 red-cooler)
    (rainbow-7 green-cooler)
    (rainbow-8 yellow))
  "Legible light theme with blue, magenta, cyan, purple colors.")

(defcustom ef-light-palette-overrides nil
  "Overrides for `ef-light-palette'.

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

(defconst ef-light-palette
  (append ef-themes-common-palette-overrides ef-light-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-light
 'ef-themes
 "Legible light theme with blue, magenta, cyan, purple colors."
 'light
 'modus-operandi-palette
 'ef-light-palette
 'ef-light-palette-overrides
 'ef-themes-custom-faces)

;;; ef-light-theme.el ends here
