;;; ef-tritanopia-dark-theme.el --- Legible dark theme, optimized for blue-yellow color deficiency -*- lexical-binding:t -*-

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
(defconst ef-tritanopia-dark-palette-partial
  '((cursor "#fd3333")
    (bg-main "#15050f")
    (bg-dim "#282026")
    (bg-alt "#352f2f")
    (fg-main "#dfd0d5")
    (fg-dim "#908890")
    (fg-alt "#afdaef")
    (bg-active "#554f4f")
    (bg-inactive "#1a1517")
    (border "#555564")

    (red "#cf4f5f")
    (red-warmer "#df4f4f")
    (red-cooler "#d24f7f")
    (red-faint "#b07f7f")
    (green "#2fa526")
    (green-warmer "#64aa0f")
    (green-cooler "#00b066")
    (green-faint "#5f9f6f")
    (yellow "#c48702")
    (yellow-warmer "#d0730f")
    (yellow-cooler "#df8f6f")
    (yellow-faint "#cf9f7f")
    (blue "#379cf6")
    (blue-warmer "#6a88ff")
    (blue-cooler "#029fff")
    (blue-faint "#6a84af")
    (magenta "#b0648f")
    (magenta-warmer "#c560aa")
    (magenta-cooler "#a6699f")
    (magenta-faint "#c590af")
    (cyan "#3fafcf")
    (cyan-warmer "#3f9aaf")
    (cyan-cooler "#4fafaf")
    (cyan-faint "#82a0af")

    (bg-red-intense "#aa0010")
    (bg-green-intense "#5f806f")
    (bg-yellow-intense "#950f4f")
    (bg-blue-intense "#165f70")
    (bg-magenta-intense "#a04f9f")
    (bg-cyan-intense "#007faa")

    (bg-red-subtle "#6e1b20")
    (bg-green-subtle "#054c38")
    (bg-yellow-subtle "#65302f")
    (bg-blue-subtle "#224360")
    (bg-magenta-subtle "#603256")
    (bg-cyan-subtle "#004a57")

    (bg-added "#002d3f")
    (bg-added-faint "#001f38")
    (bg-added-refine "#003b4f")
    (fg-added "#cbdfff")

    (bg-changed "#352354")
    (bg-changed-faint "#351444")
    (bg-changed-refine "#383964")
    (fg-changed "#e3cfff")

    (bg-removed "#4d091f")
    (bg-removed-faint "#37040f")
    (bg-removed-refine "#6b0f26")
    (fg-removed "#ffbfbf")

    (bg-mode-line-active "#671822")
    (fg-mode-line-active "#ffffff")
    (bg-completion "#441824")
    (bg-hover "#00405f")
    (bg-hover-secondary "#5e3e5b")
    (bg-hl-line "#3f1515")
    (bg-paren-match "#2f5f7a")
    (bg-region "#293140")
    (bg-err "#451212") ; check with err
    (bg-warning "#40173d") ; check with warning
    (bg-info "#00354f") ; check with info

    (err red-warmer)
    (warning magenta-warmer)
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
    (rx-escape cyan-cooler) ; compare with `string'
    (rx-construct red)

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
    (date-scheduled-subtle magenta-cooler)
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

    (mail-cite-0 cyan)
    (mail-cite-1 red-cooler)
    (mail-cite-2 cyan-cooler)
    (mail-cite-3 red-faint)
    (mail-part cyan-warmer)
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
  "Legible dark theme, optimized for blue-yellow color deficiency.")

(defcustom ef-tritanopia-dark-palette-overrides nil
  "Overrides for `ef-tritanopia-dark-palette'.

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

(defconst ef-tritanopia-dark-palette
  (append ef-themes-common-palette-overrides ef-tritanopia-dark-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-tritanopia-dark
 'ef-themes
 "Legible dark theme, optimized for blue-yellow color deficiency."
 'dark
 'modus-vivendi-tritanopia-palette
 'ef-tritanopia-dark-palette
 'ef-tritanopia-dark-palette-overrides
 'ef-themes-custom-faces)

;;; ef-tritanopia-dark-theme.el ends here
