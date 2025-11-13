;;; ef-cherie-theme.el --- Legible dark theme with warm colors (mostly pink, magenta, gold) -*- lexical-binding:t -*-

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

(defconst ef-cherie-palette-partial
  '((cursor "#ff5aaf")
    (bg-main "#190a0f")
    (bg-dim "#291f26")
    (bg-alt "#392a2f")
    (fg-main "#d3cfcf")
    (fg-dim "#808898")
    (fg-alt "#bf9cdf")
    (bg-active "#594a4f")
    (bg-inactive "#1e1216")
    (border "#695960")

    (red "#ff7359")
    (red-warmer "#ff656f")
    (red-cooler "#ff78aa")
    (red-faint "#e47f72")
    (green "#60b444")
    (green-warmer "#80b25f")
    (green-cooler "#60bf88")
    (green-faint "#61a06c")
    (yellow "#e5b76f")
    (yellow-warmer "#ea9955")
    (yellow-cooler "#f59280")
    (yellow-faint "#bf9f8f")
    (blue "#8fa5f6")
    (blue-warmer "#a897ef")
    (blue-cooler "#7fa5ff")
    (blue-faint "#7f9ab4")
    (magenta "#ef80bf")
    (magenta-warmer "#f470df")
    (magenta-cooler "#df7fff")
    (magenta-faint "#cc9bcf")
    (cyan "#8fbaef")
    (cyan-warmer "#9ac0e4")
    (cyan-cooler "#8fcfdf")
    (cyan-faint "#aac0cf")

    (bg-red-intense "#b02930")
    (bg-green-intense "#2a7140")
    (bg-yellow-intense "#8f5040")
    (bg-blue-intense "#4648d0")
    (bg-magenta-intense "#804fd5")
    (bg-cyan-intense "#2270cf")

    (bg-red-subtle "#65102a")
    (bg-green-subtle "#0a422f")
    (bg-yellow-subtle "#523324")
    (bg-blue-subtle "#2a3463")
    (bg-magenta-subtle "#562654")
    (bg-cyan-subtle "#133d58")

    (bg-added "#00351f")
    (bg-added-faint "#002410")
    (bg-added-refine "#034d2f")
    (fg-added "#a0e0a0")

    (bg-changed "#363300")
    (bg-changed-faint "#2a1f00")
    (bg-changed-refine "#4a4a00")
    (fg-changed "#efef80")

    (bg-removed "#510c28")
    (bg-removed-faint "#340a14")
    (bg-removed-refine "#701a35")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#771a4f")
    (fg-mode-line-active "#ffcfdf")
    (bg-completion "#4a1937")
    (bg-hover "#303f6f")
    (bg-hover-secondary "#66364f")
    (bg-hl-line "#401f33")
    (bg-paren-match "#3f5f75")
    (bg-region "#232f3f")
    (bg-err "#461017") ; check with err
    (bg-warning "#3a3004") ; check with warning
    (bg-info "#00352a") ; check with info

    (err red-warmer)
    (warning yellow-warmer)
    (info green)

    (fg-link magenta-cooler)
    (fg-link-alt yellow)
    (name yellow-cooler)
    (keybind yellow-warmer)
    (identifier magenta-faint)
    (fg-prompt magenta-warmer)

    (builtin blue-warmer)
    (comment yellow-faint)
    (constant red-cooler)
    (fnname yellow-cooler)
    (fnname-call yellow-faint)
    (keyword magenta)
    (preprocessor cyan)
    (docstring magenta-faint)
    (string yellow)
    (type magenta-warmer)
    (variable magenta-cooler)
    (variable-use magenta-faint)
    (rx-escape cyan-warmer) ; compare with `string'
    (rx-construct red)

    (accent-0 magenta-warmer)
    (accent-1 yellow)
    (accent-2 blue-warmer)
    (accent-3 red)

    (date-common magenta)
    (date-deadline red-warmer)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday blue-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-warmer)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (prose-code yellow)
    (prose-done green)
    (prose-macro blue-warmer)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula warning)
    (prose-tag yellow-faint)
    (prose-todo red-warmer)
    (prose-verbatim magenta-warmer)

    (mail-cite-0 magenta)
    (mail-cite-1 yellow)
    (mail-cite-2 blue-warmer)
    (mail-cite-3 magenta-warmer)
    (mail-part magenta-cooler)
    (mail-recipient yellow-cooler)
    (mail-subject red)
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

    (rainbow-0 magenta-warmer)
    (rainbow-1 yellow)
    (rainbow-2 magenta)
    (rainbow-3 cyan)
    (rainbow-4 yellow-cooler)
    (rainbow-5 blue-warmer)
    (rainbow-6 red-cooler)
    (rainbow-7 cyan-warmer)
    (rainbow-8 magenta-cooler))
  "Legible dark purple-black theme with warm colors (mostly pink, magenta, gold).")

(defcustom ef-cherie-palette-overrides nil
  "Overrides for `ef-cherie-palette'.

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

(defconst ef-cherie-palette
  (append ef-themes-common-palette-overrides ef-cherie-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-cherie
 'ef-themes
 "Legible dark purple-black theme with warm colors (mostly pink, magenta, gold)."
 'dark
 'modus-vivendi-palette
 'ef-cherie-palette
 'ef-cherie-palette-overrides
 'ef-themes-custom-faces)

;;; ef-cherie-theme.el ends here
