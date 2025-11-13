;;; ef-frost-theme.el --- Legible light theme with blue, cyan, teal, purple colors -*- lexical-binding:t -*-

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

(defconst ef-frost-palette-partial
  '((cursor "#0055bb")
    (bg-main "#fcffff")
    (bg-dim "#eaefef")
    (bg-alt "#d7dbdb")
    (fg-main "#232323")
    (fg-dim "#66657f")
    (fg-alt "#204f9a")
    (bg-active "#b5b8b8")
    (bg-inactive "#f7f9f9")
    (border "#b0b7c0")

    (red "#c42d2f")
    (red-warmer "#d03003")
    (red-cooler "#cf2f4f")
    (red-faint "#9a4366")
    (green "#008a00")
    (green-warmer "#468400")
    (green-cooler "#00845f")
    (green-faint "#517f3c")
    (yellow "#aa6100")
    (yellow-warmer "#b6532f")
    (yellow-cooler "#996c4f")
    (yellow-faint "#7a5f2f")
    (blue "#004fc0")
    (blue-warmer "#4244ef")
    (blue-cooler "#065fff")
    (blue-faint "#375cc8")
    (magenta "#aa44c5")
    (magenta-warmer "#c0469a")
    (magenta-cooler "#7f5ae0")
    (magenta-faint "#605f9f")
    (cyan "#1f6fbf")
    (cyan-warmer "#3a6dd2")
    (cyan-cooler "#007a85")
    (cyan-faint "#305f9f")

    (bg-red-intense "#ff8f88")
    (bg-green-intense "#8adf90")
    (bg-yellow-intense "#fac200")
    (bg-blue-intense "#cbcfff")
    (bg-magenta-intense "#df8fff")
    (bg-cyan-intense "#88c8ff")

    (bg-red-subtle "#ffcbdf")
    (bg-green-subtle "#b3f6d0")
    (bg-yellow-subtle "#f0f48f")
    (bg-blue-subtle "#baeeff")
    (bg-magenta-subtle "#f0ddff")
    (bg-cyan-subtle "#c2eff2")

    (bg-added "#c9ffea")
    (bg-added-faint "#d7fff5")
    (bg-added-refine "#b3efdf")
    (fg-added "#004840")

    (bg-changed "#f4e8bd")
    (bg-changed-faint "#f9efcb")
    (bg-changed-refine "#efd299")
    (fg-changed "#553d00")

    (bg-removed "#ffd6e0")
    (bg-removed-faint "#ffe9e6")
    (bg-removed-refine "#f5bfc8")
    (fg-removed "#8f1313")

    (bg-mode-line-active "#9ad0ff")
    (fg-mode-line-active "#051524")
    (bg-completion "#cceff5")
    (bg-hover "#eab5ff")
    (bg-hover-secondary "#aae0bf")
    (bg-hl-line "#dff6e4")
    (bg-paren-match "#cab0ef")
    (bg-region "#d4eaf3")
    (bg-err "#ffdfda") ; check with err
    (bg-warning "#ffe9bf") ; check with warning
    (bg-info "#ccefcf") ; check with info

    (err red)
    (warning yellow-cooler)
    (info green)

    (fg-link cyan)
    (fg-link-alt magenta)
    (name cyan-warmer)
    (keybind blue-cooler)
    (identifier magenta-faint)
    (fg-prompt cyan)

    (builtin cyan)
    (comment yellow-faint)
    (constant blue-cooler)
    (fnname green-cooler)
    (fnname-call green-faint)
    (keyword blue)
    (preprocessor magenta)
    (docstring magenta-faint)
    (string blue-warmer)
    (type magenta-cooler)
    (variable cyan-warmer)
    (variable-use cyan-faint)
    (rx-escape yellow-cooler) ; compare with `string'
    (rx-construct red-cooler)

    (accent-0 blue-warmer)
    (accent-1 green-cooler)
    (accent-2 magenta-warmer)
    (accent-3 blue-cooler)

    (date-common cyan-cooler)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday magenta-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-cooler)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (prose-code green-cooler)
    (prose-done green)
    (prose-macro magenta-warmer)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula warning)
    (prose-tag yellow-faint)
    (prose-todo red)
    (prose-verbatim blue-warmer)

    (mail-cite-0 blue)
    (mail-cite-1 cyan-cooler)
    (mail-cite-2 yellow-cooler)
    (mail-cite-3 magenta-cooler)
    (mail-part cyan)
    (mail-recipient cyan-warmer)
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

    (rainbow-0 cyan-cooler)
    (rainbow-1 blue)
    (rainbow-2 green-cooler)
    (rainbow-3 magenta-cooler)
    (rainbow-4 cyan)
    (rainbow-5 blue-warmer)
    (rainbow-6 green-warmer)
    (rainbow-7 magenta)
    (rainbow-8 cyan-warmer))
  "Legible light cool theme with blue, cyan, teal, purple colors.")

(defcustom ef-frost-palette-overrides nil
  "Overrides for `ef-frost-palette'.

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

(defconst ef-frost-palette
  (append ef-themes-common-palette-overrides ef-frost-palette-partial ef-themes-palette-common))

(modus-themes-theme
 'ef-frost
 'ef-themes
 "Legible light cool theme with blue, cyan, teal, purple colors."
 'light
 'modus-operandi-palette
 'ef-frost-palette
 'ef-frost-palette-overrides
 'ef-themes-custom-faces)

;;; ef-frost-theme.el ends here
