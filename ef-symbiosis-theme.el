;;; ef-symbiosis-theme.el --- Legible dark theme with blue, green, cyan, gold colors -*- lexical-binding:t -*-

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

(defconst ef-symbiosis-palette-partial
  '((cursor "#f0af7f")
    (bg-main "#130911")
    (bg-dim "#221920")
    (bg-alt "#372d32")
    (fg-main "#d0d0d0")
    (fg-dim "#857f8f")
    (fg-alt "#89afef")
    (bg-active "#4b3f47")
    (bg-inactive "#191317")
    (border "#4d4a4b")

    (red "#ef6360")
    (red-warmer "#ff7355")
    (red-cooler "#fe5a7a")
    (red-faint "#d56f72")
    (green "#0faa26")
    (green-warmer "#6aad0f")
    (green-cooler "#00a692")
    (green-faint "#61a06c")
    (yellow "#bf9032")
    (yellow-warmer "#d1843f")
    (yellow-cooler "#df8a5a")
    (yellow-faint "#cf9f8f")
    (blue "#3f95f6")
    (blue-warmer "#6a9fff")
    (blue-cooler "#029fff")
    (blue-faint "#7a94df")
    (magenta "#d369af")
    (magenta-warmer "#e580ea")
    (magenta-cooler "#af85ff")
    (magenta-faint "#c58faf")
    (cyan "#4fbaef")
    (cyan-warmer "#6fafff")
    (cyan-cooler "#1dbfcf")
    (cyan-faint "#8aa0df")

    (bg-red-intense "#b02930")
    (bg-green-intense "#4a7100")
    (bg-yellow-intense "#8f5040")
    (bg-blue-intense "#4648d0")
    (bg-magenta-intense "#804fdf")
    (bg-cyan-intense "#2270cf")

    (bg-red-subtle "#6f1f2a")
    (bg-green-subtle "#1f462f")
    (bg-yellow-subtle "#5a372f")
    (bg-blue-subtle "#2f366a")
    (bg-magenta-subtle "#582650")
    (bg-cyan-subtle "#1c4256")

    (bg-added "#233b0f")
    (bg-added-faint "#102a00")
    (bg-added-refine "#2f512f")
    (fg-added "#a0e0a0")

    (bg-changed "#363300")
    (bg-changed-faint "#2a1f00")
    (bg-changed-refine "#4a4a00")
    (fg-changed "#efef80")

    (bg-removed "#4e111f")
    (bg-removed-faint "#380a0f")
    (bg-removed-refine "#751a1f")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#583435")
    (fg-mode-line-active "#ffe5f0")
    (bg-completion "#1f334f")
    (bg-hover "#304477")
    (bg-hover-secondary "#5f3f3a")
    (bg-hl-line "#1f2f3f")
    (bg-paren-match "#005f4a")
    (bg-region "#3f2f40")
    (bg-err "#461309") ; check with err
    (bg-warning "#3a3104") ; check with warning
    (bg-info "#163505") ; check with info

    (err red-warmer)
    (warning yellow)
    (info green)

    (link cyan)
    (link-alt magenta-cooler)
    (name blue)
    (keybind yellow-cooler)
    (identifier yellow-faint)
    (fg-prompt cyan)

    (builtin blue)
    (comment fg-dim)
    (constant cyan-cooler)
    (fnname magenta-cooler)
    (fnname-call magenta-faint)
    (keyword green-warmer)
    (preprocessor red)
    (docstring yellow-faint)
    (string yellow-cooler)
    (type green-cooler)
    (variable blue-warmer)
    (variable-use blue-faint)
    (rx-escape green-cooler) ; compare with `string'
    (rx-construct red)

    (accent-0 cyan)
    (accent-1 yellow-warmer)
    (accent-2 green-warmer)
    (accent-3 magenta-cooler)

    (date-common green-cooler)
    (date-deadline red-warmer)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday yellow-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow)
    (date-scheduled-subtle yellow-faint)
    (date-weekday yellow-cooler)
    (date-weekend blue)

    (prose-code cyan-cooler)
    (prose-done green)
    (prose-macro green-warmer)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula warning)
    (prose-tag magenta-faint)
    (prose-todo red)
    (prose-verbatim blue-warmer)

    (mail-cite-0 yellow-cooler)
    (mail-cite-1 blue-faint)
    (mail-cite-2 green-faint)
    (mail-cite-3 fg-dim)
    (mail-part cyan)
    (mail-recipient cyan-warmer)
    (mail-subject magenta-cooler)
    (mail-other blue-warmer)

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
    (rainbow-1 blue-warmer)
    (rainbow-2 magenta-cooler)
    (rainbow-3 cyan)
    (rainbow-4 magenta)
    (rainbow-5 green-cooler)
    (rainbow-6 red-faint)
    (rainbow-7 yellow)
    (rainbow-8 cyan-warmer))
  "Legible dark brown-black theme with blue, green, cyan, gold colors.")

(defcustom ef-symbiosis-palette-overrides nil
  "Overrides for `ef-symbiosis-palette'.

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

(defconst ef-symbiosis-palette
  (append ef-themes-common-palette-overrides ef-symbiosis-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-symbiosis
 'ef-themes
 "Legible dark brown-black theme with blue, green, cyan, gold colors."
 'dark
 'modus-vivendi-palette
 'ef-symbiosis-palette
 'ef-symbiosis-palette-overrides
 'ef-themes-custom-faces)

;;; ef-symbiosis-theme.el ends here
