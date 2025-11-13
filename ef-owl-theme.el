;;; ef-owl-theme.el --- Legible dark theme with blue, cyan, magenta and desaturated colors -*- lexical-binding:t -*-

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

(defconst ef-owl-palette-partial
  '((cursor "#afe6ef")
    (bg-main "#292c2f")
    (bg-dim "#373b3d")
    (bg-alt "#40474b")
    (fg-main "#d0d0d0")
    (fg-dim "#857f8f")
    (fg-alt "#aab9af")
    (bg-active "#60676b")
    (bg-inactive "#333539")
    (border "#4f5f66")

    (red "#d67869")
    (red-warmer "#df885f")
    (red-cooler "#e4959f")
    (red-faint "#eba0af")
    (green "#70bb70")
    (green-warmer "#98c06f")
    (green-cooler "#60bd90")
    (green-faint "#9fb3a7")
    (yellow "#c09f6f")
    (yellow-warmer "#d1a45f")
    (yellow-cooler "#cf9f90")
    (yellow-faint "#cbb0a0")
    (blue "#80a4e0")
    (blue-warmer "#a0a0ef")
    (blue-cooler "#72aff0")
    (blue-faint "#aab2df")
    (magenta "#e5a0ea")
    (magenta-warmer "#d389af")
    (magenta-cooler "#cfa0e8")
    (magenta-faint "#e5bbd7")
    (cyan "#8fb8ea")
    (cyan-warmer "#99bfd0")
    (cyan-cooler "#7ac0b9")
    (cyan-faint "#a2c5d8")

    (bg-red-intense "#a02f50")
    (bg-green-intense "#30682f")
    (bg-yellow-intense "#8f665f")
    (bg-blue-intense "#4f509f")
    (bg-magenta-intense "#885997")
    (bg-cyan-intense "#4f70aa")

    (bg-red-subtle "#6f2f2f")
    (bg-green-subtle "#2a533f")
    (bg-yellow-subtle "#60452f")
    (bg-blue-subtle "#3f4273")
    (bg-magenta-subtle "#66395a")
    (bg-cyan-subtle "#354f6f")

    (bg-added "#304a3f")
    (bg-added-faint "#1a3630")
    (bg-added-refine "#2f6757")
    (fg-added "#a0d0d0")

    (bg-changed "#51512f")
    (bg-changed-faint "#40332f")
    (bg-changed-refine "#64651f")
    (fg-changed "#dada90")

    (bg-removed "#5a3142")
    (bg-removed-faint "#4a2034")
    (bg-removed-refine "#782a4a")
    (fg-removed "#f0bfcf")

    (bg-mode-line-active "#5b637e")
    (fg-mode-line-active "#dadfe5")
    (bg-completion "#354864")
    (bg-hover "#8f7a7f")
    (bg-hover-secondary "#415960")
    (bg-hl-line "#344255")
    (bg-paren-match "#706069")
    (bg-region "#404f66")
    (bg-err "#4f231f") ; check with err
    (bg-warning "#3f3c2f") ; check with warning
    (bg-info "#104032") ; check with info

    (err red-warmer)
    (warning yellow-warmer)
    (info green)

    (link cyan-warmer)
    (link-alt yellow-cooler)
    (name blue)
    (keybind green-cooler)
    (identifier magenta-faint)
    (fg-prompt blue-cooler)

    (builtin blue)
    (comment blue-faint)
    (constant yellow-cooler)
    (fnname green-cooler)
    (fnname-call green-faint)
    (keyword cyan-warmer)
    (preprocessor green-warmer)
    (docstring green-faint)
    (string cyan-cooler)
    (type magenta-cooler)
    (variable blue-warmer)
    (variable-use blue-faint)
    (rx-escape yellow) ; compare with `string'
    (rx-construct red)

    (accent-0 cyan-cooler)
    (accent-1 yellow-cooler)
    (accent-2 red)
    (accent-3 green)

    (date-common cyan-cooler)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday red)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan-cooler)
    (date-weekend red-faint)

    (prose-code green-warmer)
    (prose-done green)
    (prose-macro green-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula err)
    (prose-tag cyan-faint)
    (prose-todo red-warmer)
    (prose-verbatim blue)

    (mail-cite-0 cyan)
    (mail-cite-1 green-cooler)
    (mail-cite-2 blue-warmer)
    (mail-cite-3 yellow-cooler)
    (mail-part magenta)
    (mail-recipient cyan-warmer)
    (mail-subject blue-cooler)
    (mail-other cyan-cooler)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-cyan-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 green-cooler)
    (rainbow-1 blue)
    (rainbow-2 cyan-cooler)
    (rainbow-3 magenta-cooler)
    (rainbow-4 yellow-cooler)
    (rainbow-5 green-warmer)
    (rainbow-6 magenta-warmer)
    (rainbow-7 cyan-warmer)
    (rainbow-8 yellow))
  "Legible dark grey theme with blue, cyan, magenta and desaturated colors.")

(defcustom ef-owl-palette-overrides nil
  "Overrides for `ef-owl-palette'.

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

(defconst ef-owl-palette
  (append ef-themes-common-palette-overrides ef-owl-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-owl
 'ef-themes
 "Legible dark grey theme with blue, cyan, magenta and desaturated colors."
 'dark
 'modus-vivendi-palette
 'ef-owl-palette
 'ef-owl-palette-overrides
 'ef-themes-custom-faces)

;;; ef-owl-theme.el ends here
