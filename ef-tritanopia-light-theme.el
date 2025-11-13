;;; ef-tritanopia-light-theme.el --- Legible light theme, optimized for blue-yellow color deficiency -*- lexical-binding:t -*-

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

;; Most of the colors here, like the blue and green hues, are defined
;; simply to preserve compatibility with the rest of the project.  We
;; don't actually rely on them for anything critical.
(defconst ef-tritanopia-light-palette-partial
  '((cursor "#bb0000")
    (bg-main "#fff9f9")
    (bg-dim "#efecec")
    (bg-alt "#ddd9d9")
    (fg-main "#1a1a1a")
    (fg-dim "#756275")
    (fg-alt "#194f90")
    (bg-active "#bdb9b9")
    (bg-inactive "#f7f2f2")
    (border "#adadad")

    (red "#aa0010")
    (red-warmer "#dd0000")
    (red-cooler "#c50f4f")
    (red-faint "#92454f")
    (green "#217a3c")
    (green-warmer "#4a7d00")
    (green-cooler "#008058")
    (green-faint "#61756c")
    (yellow "#805d00")
    (yellow-warmer "#965000")
    (yellow-cooler "#765040")
    (yellow-faint "#776d6a")
    (blue "#375cd8")
    (blue-warmer "#4250ef")
    (blue-cooler "#065fff")
    (blue-faint "#6060d0")
    (magenta "#aa357f")
    (magenta-warmer "#bf256a")
    (magenta-cooler "#af40af")
    (magenta-faint "#7f4580")
    (cyan "#2070af")
    (cyan-warmer "#2f5faf")
    (cyan-cooler "#007faa")
    (cyan-faint "#5f6a90")

    (bg-red-intense "#ffa2a0")
    (bg-green-intense "#8aefef")
    (bg-yellow-intense "#ff7f78")
    (bg-blue-intense "#a8c8ef")
    (bg-magenta-intense "#e09fc0")
    (bg-cyan-intense "#7bcfcf")

    (bg-red-subtle "#ffc4bf")
    (bg-green-subtle "#baeecf")
    (bg-yellow-subtle "#f5d8a8")
    (bg-blue-subtle "#c8e6f7")
    (bg-magenta-subtle "#ffcfe0")
    (bg-cyan-subtle "#bbeff2")

    (bg-added "#c9efea")
    (bg-added-faint "#d7eff5")
    (bg-added-refine "#b3dfdf")
    (fg-added "#004840")

    (bg-changed "#dbdbff")
    (bg-changed-faint "#e4e4ff")
    (bg-changed-refine "#c0c0ef")
    (fg-changed "#333399")

    (bg-removed "#ffd6e0")
    (bg-removed-faint "#ffe9e6")
    (bg-removed-refine "#f5bfc8")
    (fg-removed "#8f1313")

    (bg-mode-line-active "#ff99aa")
    (fg-mode-line-active "#1a0a0f")
    (bg-completion "#ffcada")
    (bg-hover "#8fcfff")
    (bg-hover-secondary "#eda9dc")
    (bg-hl-line "#ffdadf")
    (bg-paren-match "#8fc0cf")
    (bg-region "#dadadf")
    (bg-err "#ffbfca") ; check with err
    (bg-warning "#efcae6") ; check with warning
    (bg-info "#cfdfef") ; check with info

    (err red-warmer)
    (warning magenta)
    (info cyan)

    (link cyan)
    (link-alt magenta-cooler)
    (name magenta)
    (keybind red-cooler)
    (identifier magenta-faint)
    (fg-prompt cyan)

    (builtin magenta)
    (comment red-faint)
    (constant red-cooler)
    (fnname magenta-cooler)
    (fnname-call magenta-faint)
    (keyword red)
    (preprocessor magenta-cooler)
    (docstring cyan-faint)
    (string cyan)
    (type cyan-warmer)
    (variable cyan-cooler)
    (variable-use cyan-faint)
    (rx-escape cyan-warmer) ; compare with `string'
    (rx-construct red-warmer)

    (accent-0 cyan)
    (accent-1 red)
    (accent-2 cyan-warmer)
    (accent-3 magenta)

    (date-common cyan-cooler)
    (date-deadline red-warmer)
    (date-deadline-subtle red-cooler)
    (date-event fg-alt)
    (date-holiday red-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled magenta)
    (date-scheduled-subtle magenta-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (prose-code red)
    (prose-done cyan)
    (prose-macro cyan-warmer)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag fg-alt)
    (prose-todo red-warmer)
    (prose-verbatim cyan)

    (mail-cite-0 cyan-cooler)
    (mail-cite-1 red-cooler)
    (mail-cite-2 cyan-warmer)
    (mail-cite-3 red-faint)
    (mail-part cyan)
    (mail-recipient magenta)
    (mail-subject red-warmer)
    (mail-other magenta-cooler)

    (bg-search-static bg-warning)
    (bg-search-current bg-red-intense)
    (bg-search-lazy bg-cyan-intense)
    (bg-search-replace bg-magenta-intense)

    (bg-search-rx-group-0 bg-blue-intense)
    (bg-search-rx-group-1 bg-magenta-intense)
    (bg-search-rx-group-2 bg-cyan-subtle)
    (bg-search-rx-group-3 bg-red-subtle)

    (bg-space-err bg-red-intense)

    (rainbow-0 cyan)
    (rainbow-1 red)
    (rainbow-2 cyan-warmer)
    (rainbow-3 red-cooler)
    (rainbow-4 cyan-cooler)
    (rainbow-5 magenta)
    (rainbow-6 cyan-faint)
    (rainbow-7 magenta-faint)
    (rainbow-8 red-faint))
  "Legible light theme, optimized for blue-yellow color deficiency.")

(defcustom ef-tritanopia-light-palette-overrides nil
  "Overrides for `ef-tritanopia-light-palette'.

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

(defconst ef-tritanopia-light-palette
  (append ef-themes-common-palette-overrides ef-tritanopia-light-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-tritanopia-light
 'ef-themes
 "Legible light theme, optimized for blue-yellow color deficiency."
 'light
 'modus-operandi-tritanopia-palette
 'ef-tritanopia-light-palette
 'ef-tritanopia-light-palette-overrides
 'ef-themes-custom-faces)

;;; ef-tritanopia-light-theme.el ends here
