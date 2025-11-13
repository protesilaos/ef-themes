;;; ef-arbutus-theme.el --- Legible light theme with red and green colors -*- lexical-binding:t -*-

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

(defconst ef-arbutus-palette-partial
  '((cursor "#208f10")
    (bg-main "#ffead8")
    (bg-dim "#f0d8cf")
    (bg-alt "#e7d2cb")
    (fg-main "#393330")
    (fg-dim "#6e678f")
    (fg-alt "#8a5f4a")
    (bg-active "#c7b2ab")
    (bg-inactive "#f7e2d2")
    (border "#c0b4a6")

    (red "#b0000f")
    (red-warmer "#b20f00")
    (red-cooler "#aa184f")
    (red-faint "#8f2f30")
    (green "#007000")
    (green-warmer "#557000")
    (green-cooler "#00704f")
    (green-faint "#3f712f")
    (yellow "#906200")
    (yellow-warmer "#b44405")
    (yellow-cooler "#8a6340")
    (yellow-faint "#8d6068")
    (blue "#375cc6")
    (blue-warmer "#5f55df")
    (blue-cooler "#265fbf")
    (blue-faint "#4a659f")
    (magenta "#a23ea4")
    (magenta-warmer "#bf2c90")
    (magenta-cooler "#6448ca")
    (magenta-faint "#845592")
    (cyan "#3f69af")
    (cyan-warmer "#4060a0")
    (cyan-cooler "#0f7688")
    (cyan-faint "#546f70")

    (bg-red-intense "#ff8f88")
    (bg-green-intense "#96df80")
    (bg-yellow-intense "#efbf00")
    (bg-blue-intense "#afbeff")
    (bg-magenta-intense "#bf9fff")
    (bg-cyan-intense "#88d4f0")

    (bg-red-subtle "#f9c2bf")
    (bg-green-subtle "#c4eda0")
    (bg-yellow-subtle "#efe76f")
    (bg-blue-subtle "#cfdff0")
    (bg-magenta-subtle "#f0d0f0")
    (bg-cyan-subtle "#bfe8eb")

    (bg-added "#d0e6b0")
    (bg-added-faint "#e2efc0")
    (bg-added-refine "#bbd799")
    (fg-added "#005000")

    (bg-changed "#f5e690")
    (bg-changed-faint "#f5edaf")
    (bg-changed-refine "#edd482")
    (fg-changed "#553d00")

    (bg-removed "#f8c6b6")
    (bg-removed-faint "#f5d0b0")
    (bg-removed-refine "#f0aaa9")
    (fg-removed "#8f1313")

    (bg-mode-line-active "#e9a0a0")
    (fg-mode-line-active "#40231f")
    (bg-completion "#f3c4c4")
    (bg-hover "#afdeaf")
    (bg-hover-secondary "#f5bfc5")
    (bg-hl-line "#fad8bf")
    (bg-paren-match "#efafbf")
    (bg-region "#dbe0c0")
    (bg-err "#ffd4b5") ; check with err
    (bg-warning "#efe48f") ; check with warning
    (bg-info "#d0f0bc") ; check with info

    (err red-warmer)
    (warning yellow)
    (info green)

    (fg-link green-cooler)
    (fg-link-alt magenta-cooler)
    (name red-cooler)
    (keybind red)
    (identifier magenta-faint)
    (fg-prompt red-faint)

    (builtin green-cooler)
    (comment fg-dim)
    (constant magenta)
    (fnname green)
    (fnname-call green-faint)
    (keyword red-faint)
    (preprocessor cyan-cooler)
    (docstring yellow-faint)
    (string green-warmer)
    (type red)
    (variable red-cooler)
    (variable-use red-faint)
    (rx-escape yellow-warmer) ; compare with `string'
    (rx-construct cyan-cooler)

    (accent-0 green)
    (accent-1 red)
    (accent-2 cyan)
    (accent-3 yellow-warmer)

    (date-common green-faint)
    (date-deadline red-cooler)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday yellow-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday green-cooler)
    (date-weekend red)

    (prose-code magenta-warmer)
    (prose-done green)
    (prose-macro yellow-warmer)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag cyan-faint)
    (prose-todo yellow-warmer)
    (prose-verbatim blue-cooler)

    (mail-cite-0 green-cooler)
    (mail-cite-1 green-warmer)
    (mail-cite-2 red-cooler)
    (mail-cite-3 yellow)
    (mail-part green)
    (mail-recipient red-faint)
    (mail-subject red)
    (mail-other red-warmer)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 green)
    (rainbow-1 red-faint)
    (rainbow-2 green-cooler)
    (rainbow-3 yellow)
    (rainbow-4 green-warmer)
    (rainbow-5 cyan-cooler)
    (rainbow-6 yellow-cooler)
    (rainbow-7 red-cooler)
    (rainbow-8 cyan))
  "Legible light pink theme with red and green colors.")

(defcustom ef-arbutus-palette-overrides nil
  "Overrides for `ef-arbutus-palette'.

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

(defconst ef-arbutus-palette
  (append ef-themes-common-palette-overrides ef-arbutus-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-arbutus
 'ef-themes
 "Legible light pink theme with red and green colors."
 'light
 'modus-operandi-palette
 'ef-arbutus-palette
 'ef-arbutus-palette-overrides
 'ef-themes-custom-faces)

;;; ef-arbutus-theme.el ends here
