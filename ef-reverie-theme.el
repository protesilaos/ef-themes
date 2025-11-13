;;; ef-reverie-theme.el --- Legible light theme with gold and nuanced colors -*- lexical-binding:t -*-

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

(defconst ef-reverie-palette-partial
  '((cursor "#9d5744")
    (bg-main "#f3eddf")
    (bg-dim "#e5d6d4")
    (bg-alt "#d9cac8")
    (fg-main "#4f204f")
    (fg-dim "#6f6877")
    (fg-alt "#55447f")
    (bg-active "#b9aaa8")
    (bg-inactive "#ede4da")
    (border "#c5afb6")

    (red "#ba2d2f")
    (red-warmer "#b21f00")
    (red-cooler "#a83058")
    (red-faint "#a04650")
    (green "#007a0a")
    (green-warmer "#5a7400")
    (green-cooler "#008250")
    (green-faint "#426340")
    (yellow "#87591f")
    (yellow-warmer "#a05900")
    (yellow-cooler "#906045")
    (yellow-faint "#7a5c50")
    (blue "#375cc6")
    (blue-warmer "#5059c0")
    (blue-cooler "#265fbf")
    (blue-faint "#475d80")
    (magenta "#9f4e74")
    (magenta-warmer "#a73080")
    (magenta-cooler "#7755b4")
    (magenta-faint "#97508f")
    (cyan "#3060af")
    (cyan-warmer "#4f60a0")
    (cyan-cooler "#0b6e8a")
    (cyan-faint "#456b82")

    (bg-red-intense "#ed899f")
    (bg-green-intense "#96d080")
    (bg-yellow-intense "#e2b270")
    (bg-blue-intense "#c0c0f0")
    (bg-magenta-intense "#daaaf0")
    (bg-cyan-intense "#8fc6d0")

    (bg-red-subtle "#f0c0b0")
    (bg-green-subtle "#b9e0b4")
    (bg-yellow-subtle "#ebe08f")
    (bg-blue-subtle "#ccd0f4")
    (bg-magenta-subtle "#edc9ea")
    (bg-cyan-subtle "#bae5e0")

    (bg-added "#b4e9d0")
    (bg-added-faint "#c9edd7")
    (bg-added-refine "#a4d4c4")
    (fg-added "#0f443f")

    (bg-changed "#f5e690")
    (bg-changed-faint "#f5edaf")
    (bg-changed-refine "#eed284")
    (fg-changed "#553d00")

    (bg-removed "#f8c3bf")
    (bg-removed-faint "#f4d8d0")
    (bg-removed-refine "#f9a8bd")
    (fg-removed "#801530")

    (bg-mode-line-active "#d1b0df")
    (fg-mode-line-active "#523044")
    (bg-completion "#e9cedd")
    (bg-hover "#ddc97f")
    (bg-hover-secondary "#d0c4e4")
    (bg-hl-line "#e7d9e0")
    (bg-paren-match "#bf9fbf")
    (bg-region "#e0d0ba")
    (bg-err "#ffc4d4") ; check with err
    (bg-warning "#f0e0a4") ; check with warning
    (bg-info "#dddef0") ; check with info

    (err magenta-warmer)
    (warning yellow-warmer)
    (info cyan)

    (link yellow-cooler)
    (link-alt cyan-warmer)
    (name cyan-warmer)
    (keybind cyan)
    (identifier yellow-cooler)
    (fg-prompt magenta)

    (builtin magenta-faint)
    (comment blue-faint)
    (constant blue-warmer)
    (fnname cyan-warmer)
    (fnname-call cyan-faint)
    (keyword yellow-cooler)
    (preprocessor cyan-cooler)
    (docstring yellow-faint)
    (string red-faint)
    (type green-faint)
    (variable magenta)
    (variable-use magenta-faint)
    (rx-escape cyan-cooler) ; compare with `string'
    (rx-construct red-warmer)

    (accent-0 yellow)
    (accent-1 red)
    (accent-2 magenta-warmer)
    (accent-3 blue-warmer)

    (date-common magenta-faint)
    (date-deadline red-cooler)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday red-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-cooler)
    (date-scheduled-subtle yellow-faint)
    (date-weekday magenta)
    (date-weekend blue-faint)

    (prose-code blue-warmer)
    (prose-done cyan-cooler)
    (prose-macro green-cooler)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag yellow-faint)
    (prose-todo yellow-warmer)
    (prose-verbatim magenta-warmer)

    (mail-cite-0 yellow-cooler)
    (mail-cite-1 red-cooler)
    (mail-cite-2 cyan-faint)
    (mail-cite-3 green-faint)
    (mail-part red-faint)
    (mail-recipient cyan-faint)
    (mail-subject magenta-warmer)
    (mail-other magenta-faint)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 yellow-cooler)
    (rainbow-1 magenta)
    (rainbow-2 blue-warmer)
    (rainbow-3 red-cooler)
    (rainbow-4 magenta-cooler)
    (rainbow-5 green-cooler)
    (rainbow-6 cyan)
    (rainbow-7 yellow)
    (rainbow-8 red-faint))
  "Legible light cream theme with gold and nuanced colors.")

(defcustom ef-reverie-palette-overrides nil
  "Overrides for `ef-reverie-palette'.

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

(defconst ef-reverie-palette
  (append ef-themes-common-palette-overrides ef-reverie-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-reverie
 'ef-themes
 "Legible light cream theme with gold and nuanced colors."
 'light
 'modus-operandi-palette
 'ef-reverie-palette
 'ef-reverie-palette-overrides
 'ef-themes-custom-faces)

;;; ef-reverie-theme.el ends here
