;;; ef-spring-theme.el --- Legible light theme with cool, varied colors (green, cyan, red) -*- lexical-binding:t -*-

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

(defconst ef-spring-palette-partial
  '((cursor "#bf005f")
    (bg-main "#f6fff9")
    (bg-dim "#e8f0f0")
    (bg-alt "#e0e6e3")
    (fg-main "#34494a")
    (fg-dim "#777294")
    (fg-alt "#9d5e7a")
    (bg-active "#c0c6c3")
    (bg-inactive "#f0f8f4")
    (border "#b4c4c0")

    (red "#c42d2f")
    (red-warmer "#d03003")
    (red-cooler "#cf2f4f")
    (red-faint "#b64850")
    (green "#1a870f")
    (green-warmer "#4a7d00")
    (green-cooler "#007f68")
    (green-faint "#61756c")
    (yellow "#a45f22")
    (yellow-warmer "#b6540f")
    (yellow-cooler "#ae5a30")
    (yellow-faint "#876450")
    (blue "#375cc6")
    (blue-warmer "#5f5fdf")
    (blue-cooler "#265fbf")
    (blue-faint "#6a65bf")
    (magenta "#d5206f")
    (magenta-warmer "#cb26a0")
    (magenta-cooler "#9435b4")
    (magenta-faint "#a04360")
    (cyan "#1f6fbf")
    (cyan-warmer "#3f6faf")
    (cyan-cooler "#0f7b8f")
    (cyan-faint "#5f6abf")

    (bg-red-intense "#ff8f88")
    (bg-green-intense "#7fdda0")
    (bg-yellow-intense "#efcf00")
    (bg-blue-intense "#afdfff")
    (bg-magenta-intense "#df8fff")
    (bg-cyan-intense "#80caf0")

    (bg-red-subtle "#ffcfbf")
    (bg-green-subtle "#b2faa5")
    (bg-yellow-subtle "#f0f37f")
    (bg-blue-subtle "#ccdfff")
    (bg-magenta-subtle "#ffddff")
    (bg-cyan-subtle "#bfefff")

    (bg-added "#c9ffda")
    (bg-added-faint "#d7ffe5")
    (bg-added-refine "#b3efcf")
    (fg-added "#005000")

    (bg-changed "#f0e8bd")
    (bg-changed-faint "#f5efcb")
    (bg-changed-refine "#efd299")
    (fg-changed "#553d00")

    (bg-removed "#ffd6e0")
    (bg-removed-faint "#ffe9e6")
    (bg-removed-refine "#f5bfc8")
    (fg-removed "#8f1313")

    (bg-mode-line-active "#90e8b0")
    (fg-mode-line-active "#243228")
    (bg-completion "#ccedff")
    (bg-hover "#ffc09f")
    (bg-hover-secondary "#f0bfff")
    (bg-hl-line "#f9e0e5")
    (bg-paren-match "#7fddd0")
    (bg-region "#d0e6ff")
    (bg-err "#ffe8e0") ; check with err
    (bg-warning "#ffecba") ; check with warning
    (bg-info "#ccf5dd") ; check with info

    (err red-warmer)
    (warning yellow)
    (info green)

    (link cyan-cooler)
    (link-alt yellow-cooler)
    (name green-cooler)
    (keybind magenta-warmer)
    (identifier magenta-faint)
    (fg-prompt green)

    (builtin green)
    (comment yellow-faint)
    (constant red-warmer)
    (fnname green-warmer)
    (fnname-call green-faint)
    (keyword green-cooler)
    (preprocessor magenta-warmer)
    (docstring magenta-faint)
    (string yellow-warmer)
    (type magenta-cooler)
    (variable cyan)
    (variable-use cyan-faint)
    (rx-escape cyan) ; compare with `string'
    (rx-construct magenta-warmer)

    (accent-0 green)
    (accent-1 red-cooler)
    (accent-2 blue)
    (accent-3 yellow-warmer)

    (date-common cyan)
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

    (prose-code red-cooler)
    (prose-done green)
    (prose-macro blue)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag magenta-faint)
    (prose-todo red-warmer)
    (prose-verbatim green)

    (mail-cite-0 green)
    (mail-cite-1 yellow-cooler)
    (mail-cite-2 blue-warmer)
    (mail-cite-3 magenta-cooler)
    (mail-part green-warmer)
    (mail-recipient green-cooler)
    (mail-subject cyan)
    (mail-other cyan-cooler)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 red-cooler)
    (rainbow-1 green-cooler)
    (rainbow-2 magenta-warmer)
    (rainbow-3 blue-warmer)
    (rainbow-4 yellow-warmer)
    (rainbow-5 cyan)
    (rainbow-6 magenta)
    (rainbow-7 magenta-cooler)
    (rainbow-8 yellow-cooler))
  "Legible light floral theme with cool, varied colors (green, cyan, red).")

(defcustom ef-spring-palette-overrides nil
  "Overrides for `ef-spring-palette'.

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

(defconst ef-spring-palette
  (append ef-themes-common-palette-overrides ef-spring-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-spring
 'ef-themes
 "Legible light floral theme with cool, varied colors (green, cyan, red)."
 'light
 'modus-operandi-palette
 'ef-spring-palette
 'ef-spring-palette-overrides
 'ef-themes-custom-faces)

;;; ef-spring-theme.el ends here
