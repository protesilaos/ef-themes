;;; ef-themes.el --- Colorful and legible themes -*- lexical-binding:t -*-

;; Copyright (C) 2022-2023  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Ef-Themes Development <~protesilaos/ef-themes@lists.sr.ht>
;; URL: https://git.sr.ht/~protesilaos/ef-themes
;; Mailing-List: https://lists.sr.ht/~protesilaos/ef-themes
;; Version: 1.0.2
;; Package-Requires: ((emacs "27.1"))
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
;;
;; "Ef" is a Greek word (ευ), commonly used as a prefix to denote
;; something good, nice, and/or easy.  For example, eftopia (ευτοπία)
;; is the opposite of dystopia (δυστοπία): a good place as opposed to
;; a bad place.
;;
;; The backronym of the `ef-themes' is: Eclectic Fashion in Themes
;; Hides Exaggerated Markings, Embellishments, and Sparkles.

;;; Code:



(require 'seq)
(eval-when-compile (require 'subr-x))

(defgroup ef-themes ()
  "Colorful and legible themes."
  :group 'faces
  :link '(info-link "(ef-themes) Top")
  :prefix "ef-themes-"
  :tag "Ef Themes")

;;; User options

(defconst ef-themes-light-themes
  '(ef-cyprus
    ef-day
    ef-deuteranopia-light
    ef-duo-light
    ef-frost
    ef-kassio
    ef-light
    ef-spring
    ef-summer
    ef-trio-light
    ef-tritanopia-light)
  "List of symbols with the light Ef themes.")

(defconst ef-themes-dark-themes
  '(ef-autumn
    ef-bio
    ef-cherie
    ef-dark
    ef-deuteranopia-dark
    ef-duo-dark
    ef-night
    ef-symbiosis
    ef-trio-dark
    ef-tritanopia-dark
    ef-winter)
  "List of symbols with the dark Ef themes.")

(defvaralias 'ef-themes-items 'ef-themes-collection
  "Alias of `ef-themes-collection'.")

(defconst ef-themes-collection
  (append ef-themes-light-themes ef-themes-dark-themes)
  "Symbols of all the Ef themes.")

(defcustom ef-themes-post-load-hook nil
  "Hook that runs after loading an Ef theme.
This is used by the commands `ef-themes-select' and
`ef-themes-load-random'."
  :type 'hook
  :package-version '(ef-themes . "0.2.0")
  :group 'ef-themes)

(defcustom ef-themes-disable-other-themes t
  "Disable all other themes when loading a Ef theme.

When the value is non-nil, the commands `ef-themes-toggle' and
`ef-themes-select' will disable all other themes while loading
the specified Ef theme.  This is done to ensure that Emacs does
not blend two or more themes: such blends lead to awkward results
that undermine the work of the designer.

When the value is nil, the aforementioned commands will only
disable other themes within the Ef collection.

This option is provided because Emacs themes are not necessarily
limited to colors/faces: they can consist of an arbitrary set of
customizations.  Users who use such customization bundles must
set this variable to a nil value."
  :group 'ef-themes
  :package-version '(ef-themes . "0.11.0")
  :type 'boolean)

(defcustom ef-themes-to-toggle nil
  "Specify two `ef-themes' for `ef-themes-toggle' command.
The variable `ef-themes-collection' contains the symbols of all
themes that form part of this collection."
  :type `(choice
          (const :tag "No toggle (default)" nil)
          (list :tag "Pick two themes to toggle between"
                (choice :tag "Theme one of two"
                        ,@(mapcar (lambda (theme)
                                    (list 'const theme))
                                  ef-themes-collection))
                (choice :tag "Theme two of two"
                        ,@(mapcar (lambda (theme)
                                    (list 'const theme))
                                  ef-themes-collection))))
  :package-version '(ef-themes . "0.3.0")
  :group 'ef-themes)

(defconst ef-themes-weights
  '( thin ultralight extralight light semilight regular medium
     semibold bold heavy extrabold ultrabold)
  "List of font weights.")

(defconst ef-themes--headings-choice
  '(set :tag "Properties" :greedy t
        (const :tag "Proportionately spaced font (variable-pitch)" variable-pitch)
        (choice :tag "Font weight (must be supported by the typeface)"
                (const :tag "Bold (default)" nil)
                (const :tag "Thin" thin)
                (const :tag "Ultra-light" ultralight)
                (const :tag "Extra-light" extralight)
                (const :tag "Light" light)
                (const :tag "Semi-light" semilight)
                (const :tag "Regular" regular)
                (const :tag "Medium" medium)
                (const :tag "Semi-bold" semibold)
                (const :tag "Extra-bold" extrabold)
                (const :tag "Ultra-bold" ultrabold))
        (radio :tag "Height"
               (float :tag "Floating point to adjust height by")
               (cons :tag "Cons cell of `(height . FLOAT)'"
                     (const :tag "The `height' key (constant)" height)
                     (float :tag "Floating point"))))
  "Refer to the doc string of `ef-themes-headings'.
This is a helper variable intended for internal use.")

(defcustom ef-themes-headings nil
  "Heading styles with optional list of values per heading level.

This is an alist that accepts a (KEY . LIST-OF-VALUES)
combination.  The KEY is either a number, representing the
heading's level (0-8) or t, which pertains to the fallback style.
The named keys `agenda-date' and `agenda-structure' apply to the
Org agenda.

Level 0 is used for what counts as a document title or
equivalent, such as the #+title construct we find in Org files.
Levels 1-8 are regular headings.

The LIST-OF-VALUES covers symbols that refer to properties, as
described below.  Here is a complete sample with various
stylistic combinations, followed by a presentation of all
available properties:

    (setq ef-themes-headings
          (quote ((1 . (light variable-pitch 1.5))
                  (2 . (regular 1.3))
                  (3 . (1.1))
                  (agenda-date . (1.3))
                  (agenda-structure . (variable-pitch light 1.8))
                  (t . (variable-pitch)))))

By default (a nil value for this variable), all headings have a
bold typographic weight, a font family that is the same as the
`default' face (typically monospaced), and a height that is equal
to the `default' face's height.

- A `variable-pitch' property changes the font family of the
  heading to that of the `variable-pitch' face (normally a
  proportionately spaced typeface).  Also check the `fontaine'
  package (by Protesilaos) for tweaking fonts via faces.

- The symbol of a weight attribute adjusts the font of the
  heading accordingly, such as `light', `semibold', etc.  Valid
  symbols are defined in the variable `ef-themes-weights'.  The
  absence of a weight means that bold will be used by virtue of
  inheriting the `bold' face.

- A number, expressed as a floating point (e.g. 1.5), adjusts the
  height of the heading to that many times the base font size.
  The default height is the same as 1.0, though it need not be
  explicitly stated.  Instead of a floating point, an acceptable
  value can be in the form of a cons cell like (height . FLOAT)
  or (height FLOAT), where FLOAT is the given number.

Combinations of any of those properties are expressed as a list,
like in these examples:

    (semibold)
    (variable-pitch semibold)
    (variable-pitch semibold 1.3)
    (variable-pitch semibold (height 1.3))   ; same as above
    (variable-pitch semibold (height . 1.3)) ; same as above

The order in which the properties are set is not significant.

In user configuration files the form may look like this:

    (setq ef-themes-headings
          (quote ((1 . (light variable-pitch 1.5))
                  (2 . (regular 1.3))
                  (3 . (1.1))
                  (t . (variable-pitch)))))

When defining the styles per heading level, it is possible to
pass a non-nil value (t) instead of a list of properties.  This
will retain the original aesthetic for that level.  For example:

    (setq ef-themes-headings
          (quote ((1 . t)           ; keep the default style
                  (2 . (variable-pitch 1.2))
                  (t . (variable-pitch))))) ; style for all other headings

    (setq ef-themes-headings
          (quote ((1 . (variable-pitch 1.6))
                  (2 . (1.3))
                  (t . t)))) ; default style for all other levels"
  :group 'ef-themes
  :package-version '(ef-themes . "0.10.0")
  :type `(alist
          :options ,(mapcar (lambda (el)
                              (list el ef-themes--headings-choice))
                            '(0 1 2 3 4 5 6 7 8 t agenda-date agenda-structure))
          :key-type symbol
          :value-type ,ef-themes--headings-choice)
  :link '(info-link "(ef-themes) Option for headings"))

(defcustom ef-themes-mixed-fonts nil
  "Non-nil to enable inheritance from `fixed-pitch' in some faces.

This is done to allow spacing-sensitive constructs, such as Org
tables and code blocks, to remain monospaced when users opt for a
proportionately spaced font as their default or when they use
something like the command `variable-pitch-mode'.

Users may need to explicitly configure the font family of
`fixed-pitch' in order to get a consistent experience with their
typography (also check the `fontaine' package on GNU ELPA (by
Protesilaos))."
  :group 'ef-themes
  :package-version '(ef-themes . "0.4.0")
  :type 'boolean
  :link '(info-link "(ef-themes) Enable mixed fonts"))

(defcustom ef-themes-variable-pitch-ui nil
  "Use proportional fonts (`variable-pitch') in UI elements.
This includes the mode line, header line, tab bar, and tab line.

Users may need to explicitly configure the font family of
`variable-pitch' in order to get a consistent experience with
their typography (also check the `fontaine' package on GNU
ELPA (by Protesilaos))."
  :group 'ef-themes
  :package-version '(ef-themes . "0.4.0")
  :type 'boolean
  :link '(info-link "(ef-themes) UI typeface"))

(defcustom ef-themes-region nil
  "Control the appearance of the `region' face.

The value is a list of symbols.

If nil or an empty list (the default), use a subtle background
for the region and preserve the color of selected text.

The `no-extend' symbol limits the highlighted area to the end of
the line, so that it does not reach the edge of the window.

The `neutral' symbol makes the highlighted area's background
gray (or more gray, depending on the theme).

The `intense' symbol amplifies the intensity of the highlighted
area's background color.  It also overrides any text color to
keep it legible.

Combinations of those symbols are expressed in any order.

In user configuration files the form may look like this:

    (setq ef-themes-region \\='(intense no-extend))

Other examples:

    (setq ef-themes-region \\='(intense))
    (setq ef-themes-region \\='(intense no-extend neutral))"
  :group 'ef-themes
  :package-version '(ef-themes . "0.10.0")
  :type '(set :tag "Properties" :greedy t
              (const :tag "Do not extend to the edge of the window" no-extend)
              (const :tag "More neutral/gray background" neutral)
              (const :tag "More intense background (also override text color)" accented))
  :link '(info-link "(ef-themes) Style of region highlight"))

(defcustom ef-themes-common-palette-overrides nil
  "Set palette overrides for all the Ef themes.

Mirror the elements of a theme's palette, overriding their value.
The palette variables are named THEME-NAME-palette, while
individual theme overrides are THEME-NAME-palette-overrides.  The
THEME-NAME is one of the symbols in `ef-themes-collection'.

Individual theme overrides take precedence over these common
overrides.

To preview the palette entries, use `ef-themes-preview-colors' or
`ef-themes-preview-colors-current' (read the documentation for
further details)."
  :group 'ef-themes
  :package-version '(ef-themes . "1.0.0")
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(ef-themes) Palette overrides"))

;;; Helpers for user options

(defun ef-themes--warn (option)
  "Warn that OPTION has changed."
  (prog1 nil
    (display-warning
     'ef-themes
     (format "`%s' has changed; please read the updated documentation" option)
     :warning)))

(defun ef-themes--list-or-warn (option)
  "Return list or nil value of OPTION, else `ef-themes--warn'."
  (let* ((value (symbol-value option)))
    (if (or (null value) (listp value))
        value
      (ef-themes--warn option))))

(defun ef-themes--fixed-pitch ()
  "Conditional application of `fixed-pitch' inheritance."
  (when ef-themes-mixed-fonts
    (list :inherit 'fixed-pitch)))

(defun ef-themes--variable-pitch-ui ()
  "Conditional application of `variable-pitch' in the UI."
  (when ef-themes-variable-pitch-ui
    (list :inherit 'variable-pitch)))

(defun ef-themes--alist-or-seq (properties alist-key seq-pred seq-default)
  "Return value from alist or sequence.
Check PROPERTIES for an alist value that corresponds to
ALIST-KEY.  If no alist is present, search the PROPERTIES
sequence given SEQ-PRED, using SEQ-DEFAULT as a fallback."
  (if-let* ((val (or (alist-get alist-key properties)
                     (seq-find seq-pred properties seq-default)))
            ((listp val)))
      (car val)
    val))

(defun ef-themes--weight (list)
  "Search for `ef-themes--heading' weight in LIST."
  (catch 'found
    (dolist (elt list)
      (when (memq elt ef-themes-weights)
        (throw 'found elt)))))

(defun ef-themes--heading (level)
  "Conditional styles for `ef-themes-headings' per LEVEL heading."
  (let* ((key (alist-get level ef-themes-headings))
         (style (or key (alist-get t ef-themes-headings)))
         (style-listp (listp style))
         (properties style)
         (var (when (memq 'variable-pitch properties) 'variable-pitch))
         (weight (when style-listp (ef-themes--weight style))))
    (list :inherit
          (cond
           (weight var)
           (var (append (list 'bold) (list var)))
           ('bold))
          :height
          (ef-themes--alist-or-seq properties 'height #'floatp 'unspecified)
          :weight
          (or weight 'unspecified))))

(defun ef-themes--region (bg bgneutral bgintense bgintenseneutral fgintense)
  "Apply `ef-themes-region' styles.

BG is the default background.  BGNEUTRAL is its gray counterpart.
BGINTENSE is an amplified variant of BG, while BGINTENSENEUTRAL
is a more intense neutral background.  FGINTENSE is the
foreground that is used with any of the intense backgrounds."
  (let ((properties (ef-themes--list-or-warn 'ef-themes-region)))
    (list
     :background
     (cond
      ((and (memq 'intense properties) (memq 'neutral properties))
       bgintenseneutral)
      ((memq 'intense properties)
       bgintense)
      ((memq 'neutral properties)
       bgneutral)
      (bg))
     :foreground
     (if (memq 'intense properties)
         fgintense
       'unspecified)
     :extend
     (if (memq 'no-extend properties)
         nil
       t))))

;;; Commands and their helper functions

(defun ef-themes--retrieve-palette-value (color palette)
  "Return COLOR from PALETTE.
Use recursion until COLOR is retrieved as a string.  Refrain from
doing so if the value of COLOR is not a key in the PALETTE.

Return `unspecified' if the value of COLOR cannot be determined.
This symbol is accepted by faces and is thus harmless.

This function is used in the macros `ef-themes-theme',
`ef-themes-with-colors'."
  (let ((value (car (alist-get color palette))))
    (cond
     ((or (stringp value)
          (eq value 'unspecified))
      value)
     ((and (symbolp value)
           (memq value (mapcar #'car palette)))
      (ef-themes--retrieve-palette-value value palette))
     (t
      'unspecified))))

(defun ef-themes-get-color-value (color &optional overrides theme)
  "Return color value of named COLOR for current Ef theme.

COLOR is a symbol that represents a named color entry in the
palette.

If the value is the name of another color entry in the
palette (so a mapping), recur until you find the underlying color
value.

With optional OVERRIDES as a non-nil value, account for palette
overrides.  Else use the default palette.

With optional THEME as a symbol among `ef-themes-collection', use
the palette of that item.  Else use the current Ef theme.

If COLOR is not present in the palette, return the `unspecified'
symbol, which is safe when used as a face attribute's value."
  (if-let* ((palette (if theme
                         (ef-themes--palette-value theme overrides)
                       (ef-themes--current-theme-palette overrides)))
            (value (ef-themes--retrieve-palette-value color palette)))
      value
    'unspecified))

(defun ef-themes--list-enabled-themes ()
  "Return list of `custom-enabled-themes' with ef- prefix."
  (seq-filter
   (lambda (theme)
     (string-prefix-p "ef-" (symbol-name theme)))
   custom-enabled-themes))

(defun ef-themes--enable-themes ()
  "Enable all Ef themes."
  (mapc (lambda (theme)
          (unless (memq theme custom-known-themes)
            (load-theme theme :no-confirm :no-enable)))
        ef-themes-collection))

(defun ef-themes--list-known-themes ()
  "Return list of `custom-known-themes' with ef- prefix."
  (ef-themes--enable-themes)
  (seq-filter
   (lambda (theme)
     (string-prefix-p "ef-" (symbol-name theme)))
   custom-known-themes))

(defun ef-themes--current-theme ()
  "Return first enabled Ef theme."
  (car (or (ef-themes--list-enabled-themes)
           (ef-themes--list-known-themes))))

(defun ef-themes--palette-symbol (theme &optional overrides)
  "Return THEME palette as a symbol.
With optional OVERRIDES, return THEME palette overrides as a
symbol."
  (when-let ((suffix (cond
                      ((and theme overrides)
                       "palette-overrides")
                      (theme
                       "palette"))))
    (intern (format "%s-%s" theme suffix))))

(defun ef-themes--palette-value (theme &optional overrides)
  "Return palette value of THEME with optional OVERRIDES."
  (let ((base-value (symbol-value (ef-themes--palette-symbol theme))))
    (if overrides
        (append (symbol-value (ef-themes--palette-symbol theme :overrides))
                ef-themes-common-palette-overrides
                base-value)
      base-value)))

(defun ef-themes--current-theme-palette (&optional overrides)
  "Return palette value of active Ef theme, else produce `user-error'.
With optional OVERRIDES return palette value plus whatever
overrides."
  (if-let ((theme (ef-themes--current-theme)))
      (if overrides
          (ef-themes--palette-value theme :overrides)
        (ef-themes--palette-value theme))
    (user-error "No enabled Ef theme could be found")))

(defun ef-themes--choose-subset ()
  "Use `read-multiple-choice' to return `dark' or `light' variant."
  (intern
   (cadr
    (read-multiple-choice
     "Variant"
     '((?d "dark" "Load a random dark theme")
       (?l "light" "Load a random light theme"))
     "Limit to the dark or light subset of the Ef themes collection."))))

(defun ef-themes--annotate-theme (theme)
  "Return completion annotation for THEME."
  (format " -- %s" (car (split-string (get (intern theme) 'theme-documentation) "\\."))))

(defvar ef-themes--select-theme-history nil
  "Minibuffer history of `ef-themes--select-prompt'.")

(defun ef-themes--load-subset (subset)
  "Return the `light' or `dark' SUBSET of the Ef themes.
If SUBSET is neither `light' nor `dark', return all the known Ef themes."
  (pcase subset
    ('dark ef-themes-dark-themes)
    ('light ef-themes-light-themes)
    (_ (ef-themes--list-known-themes))))

(defun ef-themes--maybe-prompt-subset (variant)
  "Helper function for `ef-themes--select-prompt' VARIANT argument."
  (cond
   ((null variant))
   ((or (eq variant 'light) (eq variant 'dark)) variant)
   (t (ef-themes--choose-subset))))

(defun ef-themes--select-prompt (&optional prompt variant)
  "Minibuffer prompt for `ef-themes-select'.
With optional PROMPT string, use it.  Else use a generic prompt.

With optional VARIANT as a non-nil value, prompt for a subset of
themes divided into light and dark variants.  Then limit the
completion candidates accordingly.

If VARIANT is either `light' or `dark' then use it directly
instead of prompting the user for a choice.

When VARIANT is nil, all Ef themes are candidates for completion."
  (let* ((subset (ef-themes--maybe-prompt-subset variant))
         (themes (ef-themes--load-subset subset))
         (completion-extra-properties `(:annotation-function ,#'ef-themes--annotate-theme)))
    (intern
     (completing-read
      (or prompt "Select Ef Theme: ")
      themes
      nil t nil
      'ef-themes--select-theme-history))))

(defun ef-themes--disable-themes ()
  "Disable themes per `ef-themes-disable-other-themes'."
  (mapc #'disable-theme
        (if ef-themes-disable-other-themes
            custom-enabled-themes
          (ef-themes--list-known-themes))))

(defun ef-themes--load-theme (theme)
  "Load THEME while disabling other Ef themes.
Which themes are disabled is determined by the user option
`ef-themes-disable-other-themes'.

Run the `ef-themes-post-load-hook' as the final step after
loading the THEME."
  (ef-themes--disable-themes)
  (load-theme theme :no-confirm)
  (run-hooks 'ef-themes-post-load-hook))

;;;###autoload
(defun ef-themes-select (theme &optional _variant)
  "Load an Ef THEME using minibuffer completion.

With optional VARIANT as a prefix argument, prompt to limit the
set of themes to either dark or light variants.

Run `ef-themes-post-load-hook' after loading the theme.

When called from Lisp, THEME is the symbol of a theme.  VARIANT
is ignored in this scenario."
  (interactive (list (ef-themes--select-prompt nil current-prefix-arg)))
  (ef-themes--load-theme theme))

;;;###autoload
(defun ef-themes-select-light (theme)
  "Load a light Ef THEME.
Run `ef-themes-post-load-hook' after loading the theme.

Also see `ef-themes-select-dark'.

This command is the same as `ef-themes-select' except it only
prompts for light themes when called interactively.  Calling it
from Lisp behaves the same as `ef-themes-select' for the THEME
argument, meaning that it loads the Ef THEME regardless of
whether it is light or dark."
  (interactive
   (list
    (ef-themes--select-prompt "Select light Ef theme: " 'light)))
  (ef-themes--load-theme theme))

;;;###autoload
(defun ef-themes-select-dark (theme)
  "Load a dark Ef THEME.
Run `ef-themes-post-load-hook' after loading the theme.

Also see `ef-themes-select-light'.

This command is the same as `ef-themes-select' except it only
prompts for light themes when called interactively.  Calling it
from Lisp behaves the same as `ef-themes-select' for the THEME
argument, meaning that it loads the Ef THEME regardless of
whether it is light or dark."
  (interactive
   (list
    (ef-themes--select-prompt "Select light Ef theme: " 'dark)))
  (ef-themes--load-theme theme))

(defun ef-themes--toggle-theme-p ()
  "Return non-nil if `ef-themes-to-toggle' are valid."
  (mapc (lambda (theme)
          (if (or (memq theme ef-themes-collection)
                  (memq theme (ef-themes--list-known-themes)))
              theme
            (user-error "`%s' is not part of `ef-themes-collection'" theme)))
        ef-themes-to-toggle))

;;;###autoload
(defun ef-themes-toggle ()
  "Toggle between the two `ef-themes-to-toggle'.
If `ef-themes-to-toggle' does not specify two Ef themes, inform
the user about it while prompting with completion for a theme
among our collection (this is practically the same as the
`ef-themes-select' command).

Run `ef-themes-post-load-hook' after loading the theme."
  (interactive)
  (if-let* ((themes (ef-themes--toggle-theme-p))
            (one (car themes))
            (two (cadr themes)))
      (if (eq (car custom-enabled-themes) one)
          (ef-themes--load-theme two)
        (ef-themes--load-theme one))
    (ef-themes--load-theme
     (ef-themes--select-prompt
      (concat "Set two `ef-themes-to-toggle'; "
              "switching to theme selection for now: ")))))

(defun ef-themes--minus-current (&optional variant)
  "Return list of Ef themes minus the current one.
VARIANT is either `light' or `dark', which stand for
`ef-themes-light-themes' and `ef-themes-dark-themes',
respectively.  Else check against the return value of
`ef-themes--list-known-themes'."
  (let* ((list (when variant
                 (if (eq variant 'dark)
                     ef-themes-dark-themes
                   ef-themes-light-themes)))
         (sequence (or list (ef-themes--list-known-themes)))
         (themes (copy-sequence sequence)))
    (delete (ef-themes--current-theme) themes)))

;;;###autoload
(defun ef-themes-load-random (&optional variant)
  "Load an Ef theme at random, excluding the current one.

With optional VARIANT as a prefix argument, prompt to limit the
set of themes to either dark or light variants.

Run `ef-themes-post-load-hook' after loading the theme.

When called from Lisp, VARIANT is either the `dark' or `light'
symbol."
  (interactive (list (when current-prefix-arg (ef-themes--choose-subset))))
  (let* ((themes (ef-themes--minus-current variant))
         (n (random (length themes)))
         (pick (nth n themes))
         (loaded (if (null pick) (car themes) pick)))
    (ef-themes--load-theme loaded)
    (message "Loaded `%s'" loaded)))

(defun ef-themes--preview-colors-render (buffer theme &optional mappings &rest _)
  "Render colors in BUFFER from THEME for `ef-themes-preview-colors'.
Optional MAPPINGS changes the output to only list the semantic
color mappings of the palette, instead of its named colors."
  (let* ((current-palette (ef-themes--palette-value theme mappings))
         (palette (if mappings
                      (seq-remove (lambda (cell)
                                    (stringp (cadr cell)))
                                  current-palette)
                    current-palette))
         (current-buffer buffer)
         (current-theme theme))
    (with-help-window buffer
      (with-current-buffer standard-output
        (erase-buffer)
        (when (<= (display-color-cells) 256)
          (insert (concat "Your display terminal may not render all color previews!\n"
                          "It seems to only support <= 256 colors.\n\n"))
          (put-text-property (point-min) (point) 'face 'warning))
        ;; We need this to properly render the first line.
        (insert " ")
        (dolist (cell palette)
          (let* ((name (car cell))
                 (color (ef-themes-get-color-value name mappings theme))
                 (pad (make-string 10 ?\s))
                 (fg (if (eq color 'unspecified)
                         (progn
                           (readable-foreground-color (ef-themes-get-color-value 'bg-main nil theme))
                           (setq pad (make-string 6 ?\s)))
                       (readable-foreground-color color))))
            (let ((old-point (point)))
              (insert (format "%s %s" color pad))
              (put-text-property old-point (point) 'face `( :foreground ,color)))
            (let ((old-point (point)))
              (insert (format " %s %s %s\n" color pad name))
              (put-text-property old-point (point)
                                 'face `( :background ,color
                                          :foreground ,fg
                                          :extend t)))
            ;; We need this to properly render the last line.
            (insert " ")))
        (setq-local revert-buffer-function
                    (lambda (_ignore-auto _noconfirm)
                      (ef-themes--preview-colors-render current-buffer current-theme mappings)))))))

(defvar ef-themes--preview-colors-prompt-history '()
  "Minibuffer history for `ef-themes--preview-colors-prompt'.")

(defun ef-themes--preview-colors-prompt ()
  "Prompt for Ef theme.
Helper function for `ef-themes-preview-colors'."
  (let ((def (format "%s" (ef-themes--current-theme)))
        (completion-extra-properties `(:annotation-function ,#'ef-themes--annotate-theme)))
    (completing-read
     (format "Use palette from theme [%s]: " def)
     (ef-themes--list-known-themes) nil t nil
     'ef-themes--preview-colors-prompt-history def)))

(defun ef-themes-preview-colors (theme &optional mappings)
  "Preview named colors of the Ef THEME of choice.
With optional prefix argument for MAPPINGS preview the semantic
color mappings instead of the named colors."
  (interactive (list (intern (ef-themes--preview-colors-prompt)) current-prefix-arg))
  (ef-themes--preview-colors-render
   (format (if mappings "*%s-preview-mappings*" "*%s-preview-colors*") theme)
   theme
   mappings))

(defalias 'ef-themes-list-colors 'ef-themes-preview-colors
  "Alias of `ef-themes-preview-colors'.")

(defun ef-themes-preview-colors-current (&optional mappings)
  "Call `ef-themes-list-colors' for the current Ef theme.
Optional prefix argument MAPPINGS has the same meaning as for
`ef-themes-list-colors'."
  (interactive "P")
  (ef-themes-list-colors (ef-themes--current-theme) mappings))

(defalias 'ef-themes-list-colors-current 'ef-themes-preview-colors-current
  "Alias of `ef-themes-preview-colors-current'.")

;;; Faces and variables

(defgroup ef-themes-faces ()
  "Faces defined by the Ef themes."
  :group 'ef-themes
  :link '(info-link "(ef-themes) Top")
  :prefix "ef-themes-"
  :tag "Ef Themes Faces")

;; This produces `ef-themes-height-0' and the like.
(dotimes (n 9)
  (custom-declare-face
   (intern (format "ef-themes-heading-%d" n))
   nil (format "Used for level %d heading." n)
   :package-version '(ef-themes . "0.3.0")
   :group 'ef-themes-faces))

(defface ef-themes-key-binding nil
  "Face for key bindings."
  :package-version '(ef-themes . "0.3.0")
  :group 'ef-themes-faces)

(defface ef-themes-fixed-pitch nil
  "Face for `fixed-pitch' if `ef-themes-mixed-fonts' is non-nil."
  :package-version '(ef-themes . "0.4.0")
  :group 'ef-themes-faces)

(defface ef-themes-ui-variable-pitch nil
  "Face for `variable-pitch' if `ef-themes-variable-pitch-ui' is non-nil."
  :package-version '(ef-themes . "0.4.0")
  :group 'ef-themes-faces)

;; This produces `ef-themes-mark-delete' and the like.
(dolist (scope '(delete select other))
  (custom-declare-face
   (intern (format "ef-themes-mark-%s" scope))
   nil (format "Face for %s marks (e.g. `dired', `trashed')." scope)
   :package-version '(ef-themes . "0.9.0")
   :group 'ef-themes-faces))

;; This produces `ef-themes-underline-error' and the like
(dolist (scope '(info error warning))
  (custom-declare-face
   (intern (format "ef-themes-underline-%s" scope))
   nil (format "Face for %s underline (e.g. `flymake', `flyspell')." scope)
   :package-version '(ef-themes . "0.9.0")
   :group 'ef-themes-faces))

(defconst ef-themes-faces
  '(
;;;; internal faces
    `(ef-themes-fixed-pitch ((,c ,@(ef-themes--fixed-pitch))))
    `(ef-themes-heading-0 ((,c ,@(ef-themes--heading 0) :foreground ,rainbow-0)))
    `(ef-themes-heading-1 ((,c ,@(ef-themes--heading 1) :foreground ,rainbow-1)))
    `(ef-themes-heading-2 ((,c ,@(ef-themes--heading 2) :foreground ,rainbow-2)))
    `(ef-themes-heading-3 ((,c ,@(ef-themes--heading 3) :foreground ,rainbow-3)))
    `(ef-themes-heading-4 ((,c ,@(ef-themes--heading 4) :foreground ,rainbow-4)))
    `(ef-themes-heading-5 ((,c ,@(ef-themes--heading 5) :foreground ,rainbow-5)))
    `(ef-themes-heading-6 ((,c ,@(ef-themes--heading 6) :foreground ,rainbow-6)))
    `(ef-themes-heading-7 ((,c ,@(ef-themes--heading 7) :foreground ,rainbow-7)))
    `(ef-themes-heading-8 ((,c ,@(ef-themes--heading 8) :foreground ,rainbow-8)))
    `(ef-themes-key-binding ((,c :inherit (bold ef-themes-fixed-pitch) :foreground ,keybind)))
    `(ef-themes-ui-variable-pitch ((,c ,@(ef-themes--variable-pitch-ui))))
    `(ef-themes-mark-delete ((,c :inherit error :background ,bg-err)))
    `(ef-themes-mark-select ((,c :inherit success :background ,bg-info)))
    `(ef-themes-mark-other ((,c :inherit warning :background ,bg-warning)))
    `(ef-themes-underline-error ((,c :underline (:style wave :color ,underline-err))))
    `(ef-themes-underline-info ((,c :underline (:style wave :color ,underline-info))))
    `(ef-themes-underline-warning ((,c :underline (:style wave :color ,underline-warning))))
;;;; all basic faces
;;;;; absolute essentials
    `(bold ((,c :weight bold)))
    `(bold-italic ((,c :inherit (bold italic))))
    `(cursor ((,c :background ,cursor)))
    `(default ((,c :background ,bg-main :foreground ,fg-main)))
    `(italic ((,c :slant italic)))
    `(menu ((,c :background ,bg-dim :foreground ,fg-main)))
    `(region ((,c ,@(ef-themes--region bg-region bg-alt bg-region-intense bg-active fg-intense))))
    `(scroll-bar ((,c :background ,bg-dim :foreground ,fg-dim)))
    `(tool-bar ((,c :background ,bg-dim :foreground ,fg-main)))
    `(vertical-border ((,c :foreground ,border)))
;;;;; all other basic faces
    `(button ((,c :foreground ,link :underline ,border)))
    `(child-frame-border ((,c :background ,border)))
    `(comint-highlight-input ((,c :inherit bold)))
    `(comint-highlight-prompt ((,c :inherit minibuffer-prompt)))
    `(edmacro-label ((,c :inherit bold :foreground ,accent-0)))
    `(elisp-shorthand-font-lock-face ((,c :inherit italic)))
    `(error ((,c :inherit bold :foreground ,err)))
    `(escape-glyph ((,c :foreground ,warning)))
    `(fringe ((,c :background unspecified)))
    `(header-line ((,c :inherit ef-themes-ui-variable-pitch :background ,bg-dim)))
    `(header-line-highlight ((,c :inherit highlight)))
    `(help-argument-name ((,c :foreground ,accent-0)))
    `(help-key-binding ((,c :inherit (bold ef-themes-fixed-pitch) :foreground ,keybind)))
    `(highlight ((,c :background ,bg-hover :foreground ,fg-intense)))
    `(hl-line ((,c :background ,bg-hl-line)))
    `(icon-button ((,c :box ,fg-dim :background ,bg-active :foreground ,fg-intense))) ; same as `custom-button'
    `(link ((,c :foreground ,link :underline ,border)))
    `(link-visited ((,c :foreground ,link-alt :underline ,border)))
    `(minibuffer-prompt ((,c :foreground ,prompt)))
    `(mm-command-output ((,c :foreground ,mail-part)))
    `(mm-uu-extract ((,c :foreground ,mail-part)))
    `(pgtk-im-0 ((,c :inherit secondary-selection)))
    `(read-multiple-choice-face ((,c :inherit warning :background ,bg-warning)))
    `(rectangle-preview ((,c :inherit secondary-selection)))
    `(secondary-selection ((,c :background ,bg-hover-secondary :foreground ,fg-intense)))
    `(shadow ((,c :foreground ,fg-dim)))
    `(success ((,c :inherit bold :foreground ,info)))
    `(tooltip ((,c :background ,bg-alt :foreground ,fg-intense)))
    `(trailing-whitespace ((,c :background ,bg-red-intense :foreground ,fg-intense)))
    `(warning ((,c :inherit bold :foreground ,warning)))
;;;; all-the-icons
    `(all-the-icons-blue ((,c :foreground ,blue-cooler)))
    `(all-the-icons-blue-alt ((,c :foreground ,blue-warmer)))
    `(all-the-icons-cyan ((,c :foreground ,cyan)))
    `(all-the-icons-cyan-alt ((,c :foreground ,cyan-warmer)))
    `(all-the-icons-dblue ((,c :foreground ,blue-faint)))
    `(all-the-icons-dcyan ((,c :foreground ,cyan-faint)))
    `(all-the-icons-dgreen ((,c :foreground ,green-faint)))
    `(all-the-icons-dmaroon ((,c :foreground ,magenta-faint)))
    `(all-the-icons-dorange ((,c :foreground ,red-faint)))
    `(all-the-icons-dpink ((,c :foreground ,magenta-faint)))
    `(all-the-icons-dpurple ((,c :foreground ,blue-faint)))
    `(all-the-icons-dred ((,c :foreground ,red-faint)))
    `(all-the-icons-dsilver ((,c :foreground ,cyan-faint)))
    `(all-the-icons-dyellow ((,c :foreground ,yellow-faint)))
    `(all-the-icons-green ((,c :foreground ,green)))
    `(all-the-icons-lblue ((,c :foreground ,blue-cooler)))
    `(all-the-icons-lcyan ((,c :foreground ,cyan)))
    `(all-the-icons-lgreen ((,c :foreground ,green-warmer)))
    `(all-the-icons-lmaroon ((,c :foreground ,magenta-warmer)))
    `(all-the-icons-lorange ((,c :foreground ,red-warmer)))
    `(all-the-icons-lpink ((,c :foreground ,magenta)))
    `(all-the-icons-lpurple ((,c :foreground ,magenta-faint)))
    `(all-the-icons-lred ((,c :foreground ,red)))
    `(all-the-icons-lsilver ((,c :foreground ,fg-dim)))
    `(all-the-icons-lyellow ((,c :foreground ,yellow-warmer)))
    `(all-the-icons-maroon ((,c :foreground ,magenta)))
    `(all-the-icons-orange ((,c :foreground ,red-warmer)))
    `(all-the-icons-pink ((,c :foreground ,magenta)))
    `(all-the-icons-purple ((,c :foreground ,magenta-cooler)))
    `(all-the-icons-purple-alt ((,c :foreground ,magenta-cooler)))
    `(all-the-icons-red ((,c :foreground ,red-warmer)))
    `(all-the-icons-red-alt ((,c :foreground ,red-cooler)))
    `(all-the-icons-silver ((,c :foreground ,cyan-faint)))
    `(all-the-icons-yellow ((,c :foreground ,yellow)))
;;;; all-the-icons-dired
    `(all-the-icons-dired-dir-face ((,c :foreground ,accent-0)))
;;;; all-the-icons-ibuffer
    `(all-the-icons-ibuffer-dir-face ((,c :foreground ,accent-0)))
    `(all-the-icons-ibuffer-file-face ((,c :foreground ,name)))
    `(all-the-icons-ibuffer-mode-face ((,c :foreground ,constant)))
    `(all-the-icons-ibuffer-size-face ((,c :foreground ,variable)))
;;;; ansi-color
    `(ansi-color-black ((,c :background "black" :foreground "black")))
    `(ansi-color-blue ((,c :background ,blue :foreground ,blue)))
    `(ansi-color-bold ((,c :inherit bold)))
    `(ansi-color-bright-black ((,c :background "gray35" :foreground "gray35")))
    `(ansi-color-bright-blue ((,c :background ,blue-warmer :foreground ,blue-warmer)))
    `(ansi-color-bright-cyan ((,c :background ,cyan-cooler :foreground ,cyan-cooler)))
    `(ansi-color-bright-green ((,c :background ,green-cooler :foreground ,green-cooler)))
    `(ansi-color-bright-magenta ((,c :background ,magenta-cooler :foreground ,magenta-cooler)))
    `(ansi-color-bright-red ((,c :background ,red-warmer :foreground ,red-warmer)))
    `(ansi-color-bright-white ((,c :background "white" :foreground "white")))
    `(ansi-color-bright-yellow ((,c :background ,yellow-warmer :foreground ,yellow-warmer)))
    `(ansi-color-cyan ((,c :background ,cyan :foreground ,cyan)))
    `(ansi-color-green ((,c :background ,green :foreground ,green)))
    `(ansi-color-magenta ((,c :background ,magenta :foreground ,magenta)))
    `(ansi-color-red ((,c :background ,red :foreground ,red)))
    `(ansi-color-white ((,c :background "gray65" :foreground "gray65")))
    `(ansi-color-yellow ((,c :background ,yellow :foreground ,yellow)))
;;;; auctex and tex
    `(font-latex-bold-face ((,c :inherit bold)))
    `(font-latex-doctex-documentation-face ((,c :inherit font-lock-doc-face)))
    `(font-latex-doctex-preprocessor-face ((,c :inherit font-lock-preprocessor-face)))
    `(font-latex-italic-face ((,c :inherit italic)))
    `(font-latex-math-face ((,c :inherit font-lock-constant-face)))
    `(font-latex-script-char-face ((,c :inherit font-lock-builtin-face)))
    `(font-latex-sectioning-5-face ((,c :inherit (bold ef-themes-variable-pitch) :foreground ,fg-alt)))
    `(font-latex-sedate-face ((,c :inherit font-lock-keyword-face)))
    `(font-latex-slide-title-face ((,c :inherit ef-themes-heading-0)))
    `(font-latex-string-face ((,c :inherit font-lock-string-face)))
    `(font-latex-underline-face ((,c :inherit underline)))
    `(font-latex-verbatim-face ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-verbatim)))
    `(font-latex-warning-face ((,c :inherit font-lock-warning-face)))
    `(tex-verbatim ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-verbatim)))
    ;; `(texinfo-heading ((,c :foreground ,magenta)))
    `(TeX-error-description-error ((,c :inherit error)))
    `(TeX-error-description-help ((,c :inherit success)))
    `(TeX-error-description-tex-said ((,c :inherit success)))
    `(TeX-error-description-warning ((,c :inherit warning)))
;;;; auto-dim-other-buffers
    `(auto-dim-other-buffers-face ((,c :background ,bg-inactive)))
;;;; bongo
    `(bongo-album-title (( )))
    `(bongo-artist ((,c :foreground ,rainbow-0)))
    `(bongo-currently-playing-track ((,c :inherit bold)))
    `(bongo-elapsed-track-part ((,c :background ,bg-alt :underline t)))
    `(bongo-filled-seek-bar ((,c :background ,bg-hover)))
    `(bongo-marked-track ((,c :inherit ef-themes-mark-other)))
    `(bongo-marked-track-line ((,c :background ,bg-dim)))
    `(bongo-played-track ((,c :inherit shadow :strike-through t)))
    `(bongo-track-length ((,c :inherit shadow)))
    `(bongo-track-title ((,c :foreground ,rainbow-1)))
    `(bongo-unfilled-seek-bar ((,c :background ,bg-dim)))
;;;; bookmark
    `(bookmark-face ((,c :foreground ,info)))
    `(bookmark-menu-bookmark ((,c :inherit bold)))
;;;; calendar and diary
    `(calendar-month-header ((,c :inherit bold)))
    `(calendar-today ((,c :inherit bold :underline t)))
    `(calendar-weekday-header ((,c :foreground ,date-weekday)))
    `(calendar-weekend-header ((,c :foreground ,date-weekend)))
    `(diary ((,c :foreground ,date-common)))
    `(diary-anniversary ((,c :foreground ,date-holiday)))
    `(diary-time ((,c :foreground ,date-common)))
    `(holiday ((,c :foreground ,date-holiday)))
;;;; cider
    `(cider-deprecated-face ((,c :background ,bg-warning :foreground ,warning)))
    `(cider-enlightened-face ((,c :box ,warning)))
    `(cider-enlightened-local-face ((,c :inherit warning)))
    `(cider-error-highlight-face ((,c :inherit ef-themes-underline-error)))
    `(cider-fringe-good-face ((,c :inherit ef-themes-mark-select)))
    `(cider-instrumented-face ((,c :box ,err)))
    `(cider-reader-conditional-face ((,c :inherit font-lock-type-face)))
    `(cider-repl-prompt-face ((,c :inherit minibuffer-prompt)))
    `(cider-repl-stderr-face ((,c :foreground ,err)))
    `(cider-repl-stdout-face ((,c :foreground ,info)))
    `(cider-warning-highlight-face ((,c :inherit ef-themes-underline-warning)))
;;;; change-log and log-view (`vc-print-log' and `vc-print-root-log')
    `(change-log-acknowledgment ((,c :foreground ,identifier)))
    `(change-log-conditionals ((,c :inherit error)))
    `(change-log-date ((,c :foreground ,date-common)))
    `(change-log-email ((,c :foreground ,fg-alt)))
    `(change-log-file ((,c :inherit bold)))
    `(change-log-function ((,c :inherit warning)))
    `(change-log-list ((,c :inherit bold)))
    `(change-log-name ((,c :foreground ,name)))
    `(log-edit-header ((,c :inherit bold)))
    `(log-edit-headers-separator ((,c :height 1 :background ,border :extend t)))
    `(log-edit-summary ((,c :inherit bold :foreground ,accent-0)))
    `(log-edit-unknown-header ((,c :inherit shadow)))
    `(log-view-commit-body (( )))
    `(log-view-file ((,c :inherit bold)))
    `(log-view-message ((,c :foreground ,identifier)))
;;;; clojure-mode
    `(clojure-keyword-face ((,c :inherit font-lock-builtin-face)))
;;;; company-mode
    `(company-echo-common ((,c :inherit bold :foreground ,accent-0)))
    `(company-preview ((,c :background ,bg-dim :foreground ,fg-dim)))
    `(company-preview-common ((,c :inherit company-echo-common)))
    `(company-preview-search ((,c :background ,bg-yellow-intense :foreground ,fg-intense)))
    `(company-scrollbar-bg ((,c :background ,bg-active)))
    `(company-scrollbar-fg ((,c :background ,fg-main)))
    `(company-template-field ((,c :background ,bg-active :foreground ,fg-intense)))
    `(company-tooltip ((,c :background ,bg-inactive)))
    `(company-tooltip-annotation ((,c :inherit completions-annotations)))
    `(company-tooltip-common ((,c :inherit company-echo-common)))
    `(company-tooltip-deprecated ((,c :inherit company-tooltip :strike-through t)))
    `(company-tooltip-mouse ((,c :inherit highlight)))
    `(company-tooltip-scrollbar-thumb ((,c :background ,fg-alt)))
    `(company-tooltip-scrollbar-track ((,c :background ,bg-alt)))
    `(company-tooltip-search ((,c :inherit secondary-selection)))
    `(company-tooltip-search-selection ((,c :inherit secondary-selection :underline t)))
    `(company-tooltip-selection ((,c :background ,bg-completion)))
;;;; compilation
    `(compilation-column-number ((,c :inherit compilation-line-number)))
    `(compilation-error ((,c :inherit error)))
    `(compilation-info ((,c :inherit bold :foreground ,name)))
    `(compilation-line-number ((,c :inherit shadow)))
    `(compilation-mode-line-exit ((,c :inherit bold :foreground ,modeline-info)))
    `(compilation-mode-line-fail ((,c :inherit bold :foreground ,modeline-err)))
    `(compilation-mode-line-run ((,c :inherit bold :foreground ,modeline-warning)))
    `(compilation-warning ((,c :inherit warning)))
;;;; completions
    `(completions-annotations ((,c :inherit italic :foreground ,docstring)))
    `(completions-common-part ((,c :inherit bold :foreground ,accent-0)))
    `(completions-first-difference ((,c :inherit bold :foreground ,accent-1)))
    `(completions-group-title ((,c :inherit bold :foreground ,name)))
;;;; consult
    `(consult-async-split ((,c :inherit warning)))
    `(consult-file ((,c :foreground ,name)))
    `(consult-key ((,c :inherit ef-themes-key-binding)))
    `(consult-imenu-prefix ((,c :inherit shadow)))
    `(consult-line-number ((,c :inherit shadow)))
    `(consult-line-number-prefix ((,c :inherit shadow)))
    `(consult-separator ((,c :foreground ,border)))
;;;; corfu
    `(corfu-current ((,c :background ,bg-completion)))
    `(corfu-bar ((,c :background ,fg-main)))
    `(corfu-border ((,c :background ,bg-active)))
    `(corfu-default ((,c :background ,bg-inactive)))
;;;; custom (M-x customize)
    `(custom-button ((,c :box (:color ,border :style released-button)
                         :background ,bg-active :foreground ,fg-intense)))
    `(custom-button-mouse ((,c :inherit (highlight custom-button))))
    `(custom-button-pressed ((,c :inherit (secondary-selection custom-button))))
    `(custom-changed ((,c :background ,bg-changed)))
    `(custom-comment ((,c :inherit shadow)))
    `(custom-comment-tag ((,c :inherit (bold shadow))))
    `(custom-invalid ((,c :inherit error :strike-through t)))
    `(custom-modified ((,c :inherit custom-changed)))
    `(custom-rogue ((,c :inherit custom-invalid)))
    `(custom-set ((,c :inherit success)))
    `(custom-state ((,c :foreground ,fg-alt)))
    `(custom-themed ((,c :inherit custom-changed)))
    `(custom-variable-obsolete ((,c :inherit shadow)))
    `(custom-face-tag ((,c :inherit bold :foreground ,type)))
    `(custom-group-tag ((,c :inherit bold :foreground ,builtin)))
    `(custom-group-tag-1 ((,c :inherit bold :foreground ,constant)))
    `(custom-variable-tag ((,c :inherit bold :foreground ,variable)))
;;;;; dashboard
    `(dashboard-heading ((,c :foreground ,name)))
    `(dashboard-items-face (( ))) ; use the underlying style of all-the-icons
;;;; denote
    `(denote-faces-date ((,c :foreground ,date-common)))
    `(denote-faces-keywords ((,c :foreground ,name)))
;;;; dictionary
    `(dictionary-button-face ((,c :inherit bold)))
    `(dictionary-reference-face ((,c :inherit link)))
    `(dictionary-word-definition-face (( )))
    `(dictionary-word-entry-face ((,c :inherit font-lock-comment-face)))
;;;; diff-hl
    `(diff-hl-change ((,c :background ,bg-changed-refine)))
    `(diff-hl-delete ((,c :background ,bg-removed-refine)))
    `(diff-hl-insert ((,c :background ,bg-added-refine)))
    `(diff-hl-reverted-hunk-highlight ((,c :background ,fg-main :foreground ,bg-main)))
    `(diff-added ((,c :background ,bg-added :foreground ,fg-added)))
    `(diff-changed ((,c :background ,bg-changed :foreground ,fg-changed :extend t)))
    `(diff-changed-unspecified ((,c :inherit diff-changed)))
    `(diff-removed ((,c :background ,bg-removed :foreground ,fg-removed)))
    `(diff-refine-added ((,c :background ,bg-added-refine :foreground ,fg-added)))
    `(diff-refine-changed ((,c :background ,bg-changed-refine :foreground ,fg-changed)))
    `(diff-refine-removed ((,c :background ,bg-removed-refine :foreground ,fg-removed)))
    `(diff-indicator-added ((,c :inherit diff-added :foreground ,fg-added)))
    `(diff-indicator-changed ((,c :inherit diff-changed :foreground ,fg-changed)))
    `(diff-indicator-removed ((,c :inherit diff-removed :foreground ,fg-removed)))
    `(diff-context (( )))
    `(diff-error ((,c :inherit error)))
    `(diff-file-header ((,c :inherit bold)))
    `(diff-function ((,c :background ,bg-alt)))
    `(diff-header (( )))
    `(diff-hunk-header ((,c :inherit bold :background ,bg-alt)))
    `(diff-index ((,c :inherit italic)))
    `(diff-nonexistent ((,c :inherit bold)))
;;;; dired
    `(dired-broken-symlink ((,c :inherit (error link))))
    `(dired-directory ((,c :foreground ,accent-0)))
    `(dired-flagged ((,c :inherit ef-themes-mark-delete)))
    `(dired-header ((,c :inherit bold)))
    `(dired-ignored ((,c :inherit shadow)))
    `(dired-mark ((,c :foreground ,fg-intense)))
    `(dired-marked ((,c :inherit ef-themes-mark-select)))
    `(dired-symlink ((,c :inherit link)))
    `(dired-warning ((,c :inherit warning)))
;;;; dired-subtree
    ;; remove backgrounds from dired-subtree faces, else they break
    ;; dired-{flagged,marked} and any other face that sets a background
    ;; such as hl-line.  Also, denoting depth by varying shades of gray
    ;; does not look right.
    `(dired-subtree-depth-1-face (( )))
    `(dired-subtree-depth-2-face (( )))
    `(dired-subtree-depth-3-face (( )))
    `(dired-subtree-depth-4-face (( )))
    `(dired-subtree-depth-5-face (( )))
    `(dired-subtree-depth-6-face (( )))
;;;; diredfl
    `(diredfl-autofile-name ((,c :background ,bg-alt)))
    `(diredfl-compressed-file-name ((,c :foreground ,yellow-cooler)))
    `(diredfl-compressed-file-suffix ((,c :foreground ,red)))
    `(diredfl-date-time ((,c :foreground ,date-common)))
    `(diredfl-deletion ((,c :inherit dired-flagged)))
    `(diredfl-deletion-file-name ((,c :inherit diredfl-deletion)))
    `(diredfl-dir-heading ((,c :inherit bold)))
    `(diredfl-dir-name ((,c :inherit dired-directory)))
    `(diredfl-dir-priv ((,c :inherit dired-directory)))
    `(diredfl-exec-priv ((,c :foreground ,rainbow-3)))
    `(diredfl-executable-tag ((,c :inherit diredfl-exec-priv)))
    `(diredfl-file-name ((,c :foreground ,fg-main)))
    `(diredfl-file-suffix ((,c :foreground ,variable)))
    `(diredfl-flag-mark ((,c :inherit dired-marked)))
    `(diredfl-flag-mark-line ((,c :inherit dired-marked)))
    `(diredfl-ignored-file-name ((,c :inherit shadow)))
    `(diredfl-link-priv ((,c :foreground ,link)))
    `(diredfl-no-priv ((,c :inherit shadow)))
    `(diredfl-number ((,c :inherit shadow)))
    `(diredfl-other-priv ((,c :foreground ,rainbow-0)))
    `(diredfl-rare-priv ((,c :foreground ,rainbow-0)))
    `(diredfl-read-priv ((,c :foreground ,rainbow-1)))
    `(diredfl-symlink ((,c :inherit dired-symlink)))
    `(diredfl-tagged-autofile-name ((,c :inherit (diredfl-autofile-name dired-marked))))
    `(diredfl-write-priv ((,c :foreground ,rainbow-2)))
;;;; dirvish
    `(dirvish-hl-line ((,c :background ,bg-hl-line)))
;;;; display-fill-column-indicator-mode
    ;; NOTE 2022-09-14: We use the bg-alt mapping as the border mapping
    ;; is for the `vertical-border'.  We want this to be more subtle.
    `(fill-column-indicator ((,c :height 1 :background ,bg-alt :foreground ,bg-alt)))
;;;; doom-modeline
    `(doom-modeline-bar ((,c :background ,keybind)))
    `(doom-modeline-bar-inactive ((,c :background ,bg-alt)))
    `(doom-modeline-battery-charging ((,c :foreground ,modeline-info)))
    `(doom-modeline-battery-critical ((,c :underline t :foreground ,modeline-err)))
    `(doom-modeline-battery-error ((,c :underline t :foreground ,modeline-err)))
    `(doom-modeline-battery-full (( )))
    `(doom-modeline-battery-warning ((,c :inherit bold :foreground ,modeline-warning)))
    `(doom-modeline-buffer-file ((,c :inherit bold)))
    `(doom-modeline-buffer-major-mode (( )))
    `(doom-modeline-buffer-minor-mode (( )))
    `(doom-modeline-buffer-modified ((,c :foreground ,modeline-err)))
    `(doom-modeline-buffer-path (( )))
    `(doom-modeline-evil-emacs-state ((,c :inherit italic)))
    `(doom-modeline-evil-insert-state ((,c :foreground ,modeline-info)))
    `(doom-modeline-evil-motion-state (( )))
    `(doom-modeline-evil-normal-state (( )))
    `(doom-modeline-evil-operator-state ((,c :inherit bold)))
    `(doom-modeline-evil-replace-state ((,c :inherit bold :foreground ,modeline-err)))
    `(doom-modeline-evil-visual-state ((,c :inherit bold :foreground ,modeline-warning)))
    `(doom-modeline-info ((,c :inherit bold :foreground ,modeline-info)))
    `(doom-modeline-input-method (( )))
    `(doom-modeline-lsp-error ((,c :inherit bold-italic)))
    `(doom-modeline-lsp-running (( )))
    `(doom-modeline-lsp-success ((,c :inherit bold :foreground ,modeline-info)))
    `(doom-modeline-lsp-warning ((,c :inherit bold :foreground ,modeline-warning)))
    `(doom-modeline-notification ((,c :inherit mode-line-emphasis :foreground ,modeline-err)))
    `(doom-modeline-project-dir (( )))
    `(doom-modeline-project-parent-dir (( )))
    `(doom-modeline-project-root-dir (( )))
    `(doom-modeline-repl-success ((,c :inherit bold :foreground ,modeline-info)))
    `(doom-modeline-repl-warning ((,c :inherit bold :foreground ,modeline-warning)))
    `(doom-modeline-time (( )))
    `(doom-modeline-urgent ((,c :inherit bold-italic :foreground ,modeline-err)))
    `(doom-modeline-warning ((,c :inherit bold :foreground ,modeline-warning)))
;;;; ediff
    `(ediff-current-diff-A ((,c :background ,bg-removed :foreground ,fg-removed)))
    `(ediff-current-diff-Ancestor ((,c :background ,bg-region)))
    `(ediff-current-diff-B ((,c :background ,bg-added :foreground ,fg-added)))
    `(ediff-current-diff-C ((,c :background ,bg-changed :foreground ,fg-changed)))
    `(ediff-even-diff-A ((,c :background ,bg-dim)))
    `(ediff-even-diff-Ancestor ((,c :background ,bg-dim)))
    `(ediff-even-diff-B ((,c :background ,bg-dim)))
    `(ediff-even-diff-C ((,c :background ,bg-dim)))
    `(ediff-fine-diff-A ((,c :background ,bg-removed-refine :foreground ,fg-removed)))
    `(ediff-fine-diff-Ancestor ((,c :inherit modus-themes-subtle-cyan)))
    `(ediff-fine-diff-B ((,c :background ,bg-added-refine :foreground ,fg-added)))
    `(ediff-fine-diff-C ((,c :background ,bg-changed-refine :foreground ,fg-changed)))
    `(ediff-odd-diff-A ((,c :inherit ediff-even-diff-A)))
    `(ediff-odd-diff-Ancestor ((,c :inherit ediff-even-diff-Ancestor)))
    `(ediff-odd-diff-B ((,c :inherit ediff-even-diff-B)))
    `(ediff-odd-diff-C ((,c :inherit ediff-even-diff-C)))
;;;; eglot
    `(eglot-mode-line ((,c :inherit bold :foreground ,modeline-info)))
    `(eglot-diagnostic-tag-unnecessary-face ((,c :inherit ef-themes-underline-info)))
;;;; eldoc
    ;; NOTE: see https://github.com/purcell/package-lint/issues/187
    (list 'eldoc-highlight-function-argument `((,c :inherit warning :background ,bg-warning)))
;;;; elfeed
    `(elfeed-log-date-face ((,c :inherit elfeed-search-date-face)))
    `(elfeed-log-debug-level-face ((,c :inherit elfeed-search-filter-face)))
    `(elfeed-log-error-level-face ((,c :inherit error)))
    `(elfeed-log-info-level-face ((,c :inherit success)))
    `(elfeed-log-warn-level-face ((,c :inherit warning)))
    `(elfeed-search-date-face ((,c :foreground ,date-common)))
    `(elfeed-search-feed-face ((,c :foreground ,accent-1)))
    `(elfeed-search-filter-face ((,c :inherit bold)))
    `(elfeed-search-last-update-face ((,c :inherit bold :foreground ,date-common)))
    `(elfeed-search-tag-face ((,c :foreground ,accent-0)))
    `(elfeed-search-title-face ((,c :foreground ,fg-dim)))
    `(elfeed-search-unread-count-face (( )))
    `(elfeed-search-unread-title-face ((,c :inherit bold :foreground ,fg-main)))
;;;; embark
    `(embark-keybinding ((,c :inherit ef-themes-key-binding)))
    `(embark-keybinding-repeat ((,c :inherit bold)))
    `(embark-collect-marked ((,c :inherit ef-themes-mark-select)))
    `(embark-collect-group-title ((,c :inherit bold :foreground ,name)))
    `(embark-collect-zebra-highlight ((,c :background ,bg-alt)))
;;;; epa
    `(epa-field-body (( )))
    `(epa-field-name ((,c :inherit bold :foreground ,fg-dim)))
    `(epa-mark ((,c :inherit bold)))
    `(epa-string ((,c :foreground ,string)))
    `(epa-validity-disabled ((,c :foreground ,err)))
    `(epa-validity-high ((,c :inherit success)))
    `(epa-validity-low ((,c :inherit shadow)))
    `(epa-validity-medium ((,c :foreground ,info)))
;;;; eshell
    `(eshell-ls-archive ((,c :foreground ,accent-2)))
    `(eshell-ls-backup ((,c :inherit shadow)))
    `(eshell-ls-clutter ((,c :inherit shadow)))
    `(eshell-ls-directory ((,c :foreground ,accent-0)))
    `(eshell-ls-executable ((,c :foreground ,accent-1)))
    `(eshell-ls-missing ((,c :inherit error)))
    `(eshell-ls-product ((,c :inherit shadow)))
    `(eshell-ls-readonly ((,c :foreground ,warning)))
    `(eshell-ls-special ((,c :foreground ,accent-3)))
    `(eshell-ls-symlink ((,c :inherit link)))
    `(eshell-ls-unreadable ((,c :inherit shadow)))
    `(eshell-prompt ((,c :inherit minibuffer-prompt)))
;;;; eww
    `(eww-invalid-certificate ((,c :foreground ,err)))
    `(eww-valid-certificate ((,c :foreground ,info)))
    `(eww-form-checkbox ((,c :inherit eww-form-text)))
    `(eww-form-file ((,c :inherit eww-form-submit)))
    `(eww-form-select ((,c :inherit eww-form-submit)))
    `(eww-form-submit ((,c :box ,fg-dim :background ,bg-active :foreground ,fg-intense)))
    `(eww-form-text ((,c :inherit widget-field)))
    `(eww-form-textarea ((,c :inherit eww-form-text)))
;;;; flycheck
    `(flycheck-error ((,c :inherit ef-themes-underline-error)))
    `(flycheck-fringe-error ((,c :inherit ef-themes-mark-delete)))
    `(flycheck-fringe-info ((,c :inherit ef-themes-mark-select)))
    `(flycheck-fringe-warning ((,c :inherit ef-themes-mark-other)))
    `(flycheck-info ((,c :inherit ef-themes-underline-info)))
    `(flycheck-warning ((,c :inherit ef-themes-underline-warning)))
;;;; flymake
    `(flymake-end-of-line-diagnostics-face ((,c :inherit italic :height 0.85 :box ,border)))
    `(flymake-error ((,c :inherit ef-themes-underline-error)))
    `(flymake-error-echo ((,c :inherit error)))
    `(flymake-error-echo-at-eol ((,c :inherit flymake-end-of-line-diagnostics-face :foreground ,err)))
    `(flymake-note ((,c :inherit ef-themes-underline-info)))
    `(flymake-note-echo ((,c :inherit success)))
    `(flymake-note-echo-at-eol ((,c :inherit flymake-end-of-line-diagnostics-face :foreground ,info)))
    `(flymake-warning ((,c :inherit ef-themes-underline-warning)))
    `(flymake-warning-echo ((,c :inherit warning)))
    `(flymake-note-echo-at-eol ((,c :inherit flymake-end-of-line-diagnostics-face :foreground ,warning)))
;;;; flyspell
    `(flyspell-duplicate ((,c :inherit ef-themes-underline-warning)))
    `(flyspell-incorrect ((,c :inherit ef-themes-underline-error)))
;;;; font-lock
    `(font-lock-builtin-face ((,c :inherit bold :foreground ,builtin)))
    `(font-lock-comment-delimiter-face ((,c :inherit font-lock-comment-face)))
    `(font-lock-comment-face ((,c :inherit italic :foreground ,comment)))
    `(font-lock-constant-face ((,c :foreground ,constant)))
    `(font-lock-doc-face ((,c :inherit italic :foreground ,docstring)))
    `(font-lock-function-name-face ((,c :foreground ,fnname)))
    `(font-lock-keyword-face ((,c :inherit bold :foreground ,keyword)))
    `(font-lock-negation-char-face ((,c :inherit bold)))
    `(font-lock-preprocessor-face ((,c :foreground ,preprocessor)))
    `(font-lock-regexp-grouping-backslash ((,c :foreground ,rx-escape)))
    `(font-lock-regexp-grouping-construct ((,c :foreground ,rx-construct)))
    `(font-lock-string-face ((,c :foreground ,string)))
    `(font-lock-type-face ((,c :foreground ,type)))
    `(font-lock-variable-name-face ((,c :foreground ,variable)))
    `(font-lock-warning-face ((,c :foreground ,warning)))
;;;; git-commit
    `(git-commit-comment-action ((,c :inherit font-lock-comment-face)))
    `(git-commit-comment-branch-local ((,c :inherit font-lock-comment-face :foreground ,accent-0)))
    `(git-commit-comment-branch-remote ((,c :inherit font-lock-comment-face :foreground ,accent-1)))
    `(git-commit-comment-heading ((,c :inherit (bold font-lock-comment-face))))
    `(git-commit-comment-file ((,c :inherit font-lock-comment-face :foreground ,name)))
    `(git-commit-keyword ((,c :foreground ,keyword)))
    `(git-commit-nonempty-second-line ((,c :background ,bg-err :foreground ,err)))
    `(git-commit-overlong-summary ((,c :background ,bg-warning :foreground ,warning)))
    `(git-commit-summary ((,c :inherit bold :foreground ,accent-0)))
;;;; git-rebase
    `(git-rebase-comment-hash ((,c :inherit (bold font-lock-comment-face) :foreground ,identifier)))
    `(git-rebase-comment-heading  ((,c :inherit (bold font-lock-comment-face))))
    `(git-rebase-description ((,c :foreground ,fg-main)))
    `(git-rebase-hash ((,c :foreground ,identifier)))
;;;; gnus
    `(gnus-button ((,c :inherit button)))
    `(gnus-cite-1 ((,c :inherit message-cited-text-1)))
    `(gnus-cite-2 ((,c :inherit message-cited-text-2)))
    `(gnus-cite-3 ((,c :inherit message-cited-text-3)))
    `(gnus-cite-4 ((,c :inherit message-cited-text-4)))
    `(gnus-cite-5 ((,c :inherit message-cited-text-1)))
    `(gnus-cite-6 ((,c :inherit message-cited-text-2)))
    `(gnus-cite-7 ((,c :inherit message-cited-text-3)))
    `(gnus-cite-8 ((,c :inherit message-cited-text-4)))
    `(gnus-cite-9 ((,c :inherit message-cited-text-1)))
    `(gnus-cite-10 ((,c :inherit message-cited-text-2)))
    `(gnus-cite-11 ((,c :inherit message-cited-text-3)))
    `(gnus-cite-attribution ((,c :inherit italic)))
    `(gnus-emphasis-bold ((,c :inherit bold)))
    `(gnus-emphasis-bold-italic ((,c :inherit bold-italic)))
    `(gnus-emphasis-highlight-words ((,c :inherit warning)))
    `(gnus-emphasis-italic ((,c :inherit italic)))
    `(gnus-emphasis-underline-bold ((,c :inherit gnus-emphasis-bold :underline t)))
    `(gnus-emphasis-underline-bold-italic ((,c :inherit gnus-emphasis-bold-italic :underline t)))
    `(gnus-emphasis-underline-italic ((,c :inherit gnus-emphasis-italic :underline t)))
    `(gnus-group-mail-1 ((,c :inherit bold :foreground ,rainbow-1)))
    `(gnus-group-mail-1-empty ((,c :foreground ,rainbow-1)))
    `(gnus-group-mail-2 ((,c :inherit bold :foreground ,rainbow-2)))
    `(gnus-group-mail-2-empty ((,c :foreground ,rainbow-2)))
    `(gnus-group-mail-3 ((,c :inherit bold :foreground ,rainbow-3)))
    `(gnus-group-mail-3-empty ((,c :foreground ,rainbow-3)))
    `(gnus-group-mail-low ((,c :inherit bold :foreground ,fg-alt)))
    `(gnus-group-mail-low-empty ((,c :foreground ,fg-alt)))
    `(gnus-group-news-1 ((,c :inherit bold :foreground ,rainbow-1)))
    `(gnus-group-news-1-empty ((,c :foreground ,rainbow-1)))
    `(gnus-group-news-2 ((,c :inherit bold :foreground ,rainbow-2)))
    `(gnus-group-news-2-empty ((,c :foreground ,rainbow-2)))
    `(gnus-group-news-3 ((,c :inherit bold :foreground ,rainbow-3)))
    `(gnus-group-news-3-empty ((,c :foreground ,rainbow-3)))
    `(gnus-group-news-4 ((,c :inherit bold :foreground ,rainbow-4)))
    `(gnus-group-news-4-empty ((,c :foreground ,rainbow-4)))
    `(gnus-group-news-5 ((,c :inherit bold :foreground ,rainbow-5)))
    `(gnus-group-news-5-empty ((,c :foreground ,rainbow-5)))
    `(gnus-group-news-6 ((,c :inherit bold :foreground ,rainbow-6)))
    `(gnus-group-news-6-empty ((,c :foreground ,rainbow-6)))
    `(gnus-group-news-low ((,c :inherit bold :foreground ,fg-alt)))
    `(gnus-group-news-low-empty ((,c :foreground ,fg-alt)))
    `(gnus-header-content ((,c :inherit message-header-other)))
    `(gnus-header-from ((,c :inherit message-header-to :underline nil)))
    `(gnus-header-name ((,c :inherit message-header-name)))
    `(gnus-header-newsgroups ((,c :inherit message-header-newsgroups)))
    `(gnus-header-subject ((,c :inherit message-header-subject)))
    `(gnus-server-agent ((,c :inherit bold)))
    `(gnus-server-closed ((,c :inherit italic)))
    `(gnus-server-cloud ((,c :inherit bold :foreground ,fg-alt)))
    `(gnus-server-cloud-host ((,c :inherit bold :foreground ,fg-alt :underline t)))
    `(gnus-server-denied ((,c :inherit error)))
    `(gnus-server-offline ((,c :inherit shadow)))
    `(gnus-server-opened ((,c :inherit success)))
    `(gnus-summary-cancelled ((,c :background ,bg-warning :foreground ,warning :extend t)))
    `(gnus-summary-high-ancient ((,c :inherit bold :foreground ,fg-alt)))
    `(gnus-summary-high-read ((,c :inherit bold :foreground ,fg-dim)))
    `(gnus-summary-high-ticked ((,c :inherit bold :foreground ,err)))
    `(gnus-summary-high-undownloaded ((,c :inherit bold-italic :foreground ,warning)))
    `(gnus-summary-high-unread ((,c :inherit bold)))
    `(gnus-summary-low-ancient ((,c :inherit italic)))
    `(gnus-summary-low-read ((,c :inherit (shadow italic))))
    `(gnus-summary-low-ticked ((,c :inherit italic :foreground ,err)))
    `(gnus-summary-low-undownloaded ((,c :inherit italic :foreground ,warning)))
    `(gnus-summary-low-unread ((,c :inherit italic)))
    `(gnus-summary-normal-ancient (( )))
    `(gnus-summary-normal-read ((,c :inherit shadow)))
    `(gnus-summary-normal-ticked ((,c :foreground ,err)))
    `(gnus-summary-normal-undownloaded ((,c :foreground ,warning)))
    `(gnus-summary-normal-unread (( )))
    `(gnus-summary-selected ((,c :inherit highlight)))
;;;; hi-lock (M-x highlight-regexp)
    ;; NOTE 2022-10-16 We hardcode color values.  We have to do this
    ;; as the themes lack entries in their palette for such an edge
    ;; case.  Defining those entries is not appropriate.
    ;;
    ;; The use of :inverse-video here is to prevert `hl-line-mode' or
    ;; the active region from overriding those highlights.
    `(hi-aquamarine ((((class color) (min-colors 88) (background light))
                      :background "white" :foreground "#227f9f" :inverse-video t)
                     (((class color) (min-colors 88) (background dark))
                      :background "black" :foreground "#66cbdc" :inverse-video t)))
    `(hi-black-b ((,c :inverse-video t)))
    `(hi-black-hb ((,c :background ,bg-main :foreground ,fg-dim :inverse-video t)))
    `(hi-blue ((((class color) (min-colors 88) (background light))
                :background "white" :foreground "#3366dd" :inverse-video t)
               (((class color) (min-colors 88) (background dark))
                :background "black" :foreground "#aaccff" :inverse-video t)))
    `(hi-blue-b ((,c :inherit (bold hi-blue))))
    `(hi-green ((((class color) (min-colors 88) (background light))
                 :background "white" :foreground "#008a00" :inverse-video t)
                (((class color) (min-colors 88) (background dark))
                 :background "black" :foreground "#66dd66" :inverse-video t)))
    `(hi-green-b ((,c :inherit (bold hi-green))))
    `(hi-pink ((((class color) (min-colors 88) (background light))
                :background "white" :foreground "#bd30aa" :inverse-video t)
               (((class color) (min-colors 88) (background dark))
                :background "black" :foreground "#ff88ee" :inverse-video t)))
    `(hi-red-b ((((class color) (min-colors 88) (background light))
                 :background "white" :foreground "#dd0000" :inverse-video t)
                (((class color) (min-colors 88) (background dark))
                 :background "black" :foreground "#f06666" :inverse-video t)))
    `(hi-salmon ((((class color) (min-colors 88) (background light))
                  :background "white" :foreground "#af4f6f" :inverse-video t)
                 (((class color) (min-colors 88) (background dark))
                  :background "black" :foreground "#e08a50" :inverse-video t)))
    `(hi-yellow ((((class color) (min-colors 88) (background light))
                  :background "white" :foreground "#af6f00" :inverse-video t)
                 (((class color) (min-colors 88) (background dark))
                  :background "black" :foreground "#faea00" :inverse-video t)))
;;;; ibuffer
    `(ibuffer-locked-buffer ((,c :foreground ,warning)))
;;;; image-dired
    `(image-dired-thumb-flagged ((,c :background ,err :box (:line-width -3))))
    `(image-dired-thumb-header-file-name ((,c :inherit bold)))
    `(image-dired-thumb-header-file-size ((,c :foreground ,info)))
    `(image-dired-thumb-mark ((,c :background ,info :box (:line-width -3))))
;;;; info
    `(Info-quoted ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-verbatim))) ; the capitalization is canonical
    `(info-header-node ((,c :inherit (shadow bold))))
    `(info-index-match ((,c :inherit match)))
    `(info-menu-header ((,c :inherit bold)))
    `(info-menu-star ((,c :foreground ,red)))
    `(info-node ((,c :inherit bold)))
    `(info-title-1 ((,c :inherit ef-themes-heading-1)))
    `(info-title-2 ((,c :inherit ef-themes-heading-2)))
    `(info-title-3 ((,c :inherit ef-themes-heading-3)))
    `(info-title-4 ((,c :inherit ef-themes-heading-4)))
;;;; isearch, occur, and the like
    `(isearch ((,c :background ,bg-yellow-intense :foreground ,fg-intense)))
    `(isearch-fail ((,c :background ,bg-red-intense :foreground ,fg-intense)))
    `(isearch-group-1 ((,c :background ,bg-green-intense :foreground ,fg-intense)))
    `(isearch-group-2 ((,c :background ,bg-magenta-intense :foreground ,fg-intense)))
    `(lazy-highlight ((,c :background ,bg-blue-intense :foreground ,fg-intense)))
    `(match ((,c :background ,bg-warning)))
    `(query-replace ((,c :background ,bg-red-intense :foreground ,fg-intense)))
;;;; jit-spell
    `(jit-spell-misspelling ((,c :inherit ef-themes-underline-error)))
;;;;; jinx
    `(jinx-misspelled ((,c :inherit ef-themes-underline-warning)))
;;;; keycast
    `(keycast-command ((,c :inherit bold)))
    `(keycast-key ((,c :inherit bold :background ,bg-hover :foreground ,fg-intense :box (:line-width -1 :color ,fg-dim))))
;;;; lin
    `(lin-blue ((,c :background ,bg-blue-subtle)))
    `(lin-cyan ((,c :background ,bg-cyan-subtle)))
    `(lin-green ((,c :background ,bg-green-subtle)))
    `(lin-magenta ((,c :background ,bg-magenta-subtle)))
    `(lin-red ((,c :background ,bg-red-subtle)))
    `(lin-yellow ((,c :background ,bg-yellow-subtle)))
    `(lin-blue-override-fg ((,c :background ,bg-blue-subtle :foreground ,fg-intense)))
    `(lin-cyan-override-fg ((,c :background ,bg-cyan-subtle :foreground ,fg-intense)))
    `(lin-green-override-fg ((,c :background ,bg-green-subtle :foreground ,fg-intense)))
    `(lin-magenta-override-fg ((,c :background ,bg-magenta-subtle :foreground ,fg-intense)))
    `(lin-red-override-fg ((,c :background ,bg-red-subtle :foreground ,fg-intense)))
    `(lin-yellow-override-fg ((,c :background ,bg-yellow-subtle :foreground ,fg-intense)))
;;;; line numbers (display-line-numbers-mode and global variant)
    ;; We need to fall back to `default' otherwise line numbers do not
    ;; scale when using `text-scale-adjust'.
    `(line-number ((,c :inherit (ef-themes-fixed-pitch shadow default))))
    `(line-number-current-line ((,c :inherit (bold line-number) :foreground ,fg-intense)))
    `(line-number-major-tick ((,c :inherit (bold line-number) :foreground ,rainbow-0)))
    `(line-number-minor-tick ((,c :inherit (bold line-number))))
;;;; magit
    `(magit-bisect-bad ((,c :inherit error)))
    `(magit-bisect-good ((,c :inherit success)))
    `(magit-bisect-skip ((,c :inherit warning)))
    `(magit-blame-date (( )))
    `(magit-blame-dimmed ((,c :inherit shadow)))
    `(magit-blame-hash (( )))
    `(magit-blame-highlight ((,c :background ,bg-active :foreground ,fg-intense)))
    `(magit-blame-name (( )))
    `(magit-blame-summary ((  )))
    `(magit-branch-local ((,c :foreground ,accent-0)))
    `(magit-branch-remote ((,c :foreground ,accent-1)))
    `(magit-branch-upstream ((,c :inherit italic)))
    `(magit-branch-warning ((,c :inherit warning)))
    `(magit-cherry-equivalent ((,c :foreground ,magenta)))
    `(magit-cherry-unmatched ((,c :foreground ,cyan)))
    `(magit-diff-added ((,c :background ,bg-added-faint :foreground ,fg-added)))
    `(magit-diff-added-highlight ((,c :background ,bg-added :foreground ,fg-added)))
    `(magit-diff-base ((,c :background ,bg-changed-faint :foreground ,fg-changed)))
    `(magit-diff-base-highlight ((,c :background ,bg-changed :foreground ,fg-changed)))
    `(magit-diff-context ((,c :inherit shadow)))
    `(magit-diff-context-highlight ((,c :background ,bg-dim)))
    `(magit-diff-file-heading ((,c :inherit bold :foreground ,accent-0)))
    `(magit-diff-file-heading-highlight ((,c :inherit magit-diff-file-heading :background ,bg-alt)))
    `(magit-diff-file-heading-selection ((,c :inherit bold :background ,bg-hover-secondary :foreground ,fg-intense)))
    `(magit-diff-hunk-heading ((,c :background ,bg-alt)))
    `(magit-diff-hunk-heading-highlight ((,c :inherit bold :background ,bg-active :foreground ,fg-intense)))
    `(magit-diff-hunk-heading-selection ((,c :inherit bold :background ,bg-hover-secondary :foreground ,fg-intense)))
    `(magit-diff-hunk-region ((,c :inherit bold)))
    `(magit-diff-lines-boundary ((,c :background ,fg-intense)))
    `(magit-diff-lines-heading ((,c :background ,fg-alt :foreground ,bg-alt)))
    `(magit-diff-removed ((,c :background ,bg-removed-faint :foreground ,fg-removed)))
    `(magit-diff-removed-highlight ((,c :background ,bg-removed :foreground ,fg-removed)))
    `(magit-diffstat-added ((,c :inherit success)))
    `(magit-diffstat-removed ((,c :inherit error)))
    `(magit-dimmed ((,c :inherit shadow)))
    `(magit-filename ((,c :foreground ,name)))
    `(magit-hash ((,c :foreground ,identifier)))
    `(magit-head ((,c :inherit magit-branch-local)))
    `(magit-header-line ((,c :inherit bold)))
    `(magit-header-line-key ((,c :inherit ef-themes-key-binding)))
    `(magit-header-line-log-select ((,c :inherit bold)))
    `(magit-keyword ((,c :foreground ,keyword)))
    `(magit-keyword-squash ((,c :inherit bold :foreground ,warning)))
    `(magit-log-author ((,c :foreground ,name)))
    `(magit-log-date ((,c :foreground ,date-common)))
    `(magit-log-graph ((,c :inherit shadow)))
    `(magit-mode-line-process ((,c :inherit bold :foreground ,modeline-info)))
    `(magit-mode-line-process-error ((,c :inherit bold :foreground ,modeline-err)))
    `(magit-process-ng ((,c :inherit error)))
    `(magit-process-ok ((,c :inherit success)))
    `(magit-reflog-amend ((,c :inherit warning)))
    `(magit-reflog-checkout ((,c :inherit bold :foreground ,blue)))
    `(magit-reflog-cherry-pick ((,c :inherit success)))
    `(magit-reflog-commit ((,c :inherit bold)))
    `(magit-reflog-merge ((,c :inherit success)))
    `(magit-reflog-other ((,c :inherit bold :foreground ,cyan)))
    `(magit-reflog-rebase ((,c :inherit bold :foreground ,magenta)))
    `(magit-reflog-remote ((,c :inherit (bold magit-branch-remote))))
    `(magit-reflog-reset ((,c :inherit error)))
    `(magit-refname ((,c :inherit shadow)))
    `(magit-refname-pullreq ((,c :inherit shadow)))
    `(magit-refname-stash ((,c :inherit shadow)))
    `(magit-refname-wip ((,c :inherit shadow)))
    `(magit-section ((,c :background ,bg-dim :foreground ,fg-main)))
    `(magit-section-heading ((,c :inherit bold)))
    `(magit-section-heading-selection ((,c :inherit bold :background ,bg-hover-secondary :foreground ,fg-intense)))
    `(magit-section-highlight ((,c :background ,bg-dim)))
    `(magit-sequence-done ((,c :inherit success)))
    `(magit-sequence-drop ((,c :inherit error)))
    `(magit-sequence-exec ((,c :inherit bold :foreground ,magenta)))
    `(magit-sequence-head ((,c :inherit bold :foreground ,cyan)))
    `(magit-sequence-onto ((,c :inherit (bold shadow))))
    `(magit-sequence-part ((,c :inherit warning)))
    `(magit-sequence-pick ((,c :inherit bold)))
    `(magit-sequence-stop ((,c :inherit error)))
    `(magit-signature-bad ((,c :inherit error)))
    `(magit-signature-error ((,c :inherit error)))
    `(magit-signature-expired ((,c :inherit warning)))
    `(magit-signature-expired-key ((,c :foreground ,warning)))
    `(magit-signature-good ((,c :inherit success)))
    `(magit-signature-revoked ((,c :inherit bold :foreground ,warning)))
    `(magit-signature-untrusted ((,c :inherit (bold shadow))))
    `(magit-tag ((,c :foreground ,accent-3))) ; compare with branches
;;;; man
    `(Man-overstrike ((,c :inherit bold :foreground ,accent-0)))
    `(Man-underline ((,c :foreground ,accent-1 :underline t)))
;;;; marginalia
    `(marginalia-archive ((,c :foreground ,accent-0)))
    `(marginalia-char ((,c :foreground ,accent-2)))
    `(marginalia-date ((,c :foreground ,date-common)))
    `(marginalia-documentation ((,c :inherit italic :foreground ,docstring)))
    `(marginalia-file-name (( )))
    `(marginalia-file-owner ((,c :inherit shadow)))
    `(marginalia-file-priv-dir (( )))
    `(marginalia-file-priv-exec ((,c :foreground ,rainbow-3)))
    `(marginalia-file-priv-link ((,c :foreground ,link)))
    `(marginalia-file-priv-no ((,c :inherit shadow)))
    `(marginalia-file-priv-other ((,c :foreground ,rainbow-0)))
    `(marginalia-file-priv-rare ((,c :foreground ,rainbow-0)))
    `(marginalia-file-priv-read ((,c :foreground ,rainbow-1)))
    `(marginalia-file-priv-write ((,c :foreground ,rainbow-2)))
    `(marginalia-function ((,c :foreground ,fnname)))
    `(marginalia-key ((,c :inherit ef-themes-key-binding)))
    `(marginalia-lighter ((,c :inherit shadow)))
    `(marginalia-liqst ((,c :inherit shadow)))
    `(marginalia-mode ((,c :foreground ,constant)))
    `(marginalia-modified ((,c :inherit warning)))
    `(marginalia-null ((,c :inherit shadow)))
    `(marginalia-number ((,c :foreground ,constant)))
    `(marginalia-size ((,c :foreground ,variable)))
    `(marginalia-string ((,c :foreground ,string)))
    `(marginalia-symbol ((,c :foreground ,builtin)))
    `(marginalia-true (( )))
    `(marginalia-type ((,c :foreground ,type)))
    `(marginalia-value ((,c :inherit shadow)))
    `(marginalia-version ((,c :foreground ,accent-1)))
;;;; markdown-mode
    `(markdown-blockquote-face ((,c :inherit font-lock-doc-face)))
    `(markdown-bold-face ((,c :inherit bold)))
    `(markdown-code-face ((,c :inherit ef-themes-fixed-pitch :background ,bg-inactive :extend t)))
    `(markdown-gfm-checkbox-face ((,c :foreground ,warning)))
    `(markdown-header-face (( )))
    `(markdown-header-face-1 ((,c :inherit ef-themes-heading-1)))
    `(markdown-header-face-2 ((,c :inherit ef-themes-heading-2)))
    `(markdown-header-face-3 ((,c :inherit ef-themes-heading-3)))
    `(markdown-header-face-4 ((,c :inherit ef-themes-heading-4)))
    `(markdown-header-face-5 ((,c :inherit ef-themes-heading-5)))
    `(markdown-header-face-6 ((,c :inherit ef-themes-heading-6)))
    `(markdown-highlighting-face ((,c :background ,bg-info :foreground ,info)))
    `(markdown-inline-code-face ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-code)))
    `(markdown-italic-face ((,c :inherit italic)))
    `(markdown-language-keyword-face ((,c :inherit ef-themes-fixed-pitch :background ,bg-dim)))
    `(markdown-line-break-face ((,c :inherit nobreak-space)))
    `(markdown-link-face ((,c :inherit link)))
    `(markdown-markup-face ((,c :inherit shadow)))
    `(markdown-metadata-key-face ((,c :inherit bold)))
    `(markdown-metadata-value-face ((,c :foreground ,string)))
    `(markdown-missing-link-face ((,c :inherit warning)))
    `(markdown-pre-face ((,c :inherit markdown-code-face)))
    `(markdown-table-face ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-table)))
    `(markdown-url-face ((,c :foreground ,fg-alt)))
;;;; messages
    `(message-cited-text-1 ((,c :foreground ,mail-cite-0)))
    `(message-cited-text-2 ((,c :foreground ,mail-cite-1)))
    `(message-cited-text-3 ((,c :foreground ,mail-cite-2)))
    `(message-cited-text-4 ((,c :foreground ,mail-cite-3)))
    `(message-header-name ((,c :inherit bold)))
    `(message-header-newsgroups ((,c :inherit message-header-other)))
    `(message-header-to ((,c :inherit bold :foreground ,mail-recipient)))
    `(message-header-cc ((,c :foreground ,mail-recipient)))
    `(message-header-subject ((,c :inherit bold :foreground ,mail-subject)))
    `(message-header-xheader ((,c :inherit message-header-other)))
    `(message-header-other ((,c :foreground ,mail-other)))
    `(message-mml ((,c :foreground ,mail-part)))
    `(message-separator ((,c :background ,bg-active)))
;;;; mode-line
    `(mode-line ((,c :inherit ef-themes-ui-variable-pitch :background ,bg-mode-line :foreground ,fg-mode-line)))
    `(mode-line-active ((,c :inherit mode-line)))
    `(mode-line-buffer-id ((,c :inherit bold)))
    `(mode-line-emphasis ((,c :inherit bold :foreground ,modeline-info)))
    `(mode-line-highlight ((,c :inherit highlight)))
    `(mode-line-inactive ((,c :inherit ef-themes-ui-variable-pitch :background ,bg-alt :foreground ,fg-dim)))
;;;; mu4e
    `(mu4e-attach-number-face ((,c :inherit bold :foreground ,fg-dim)))
    `(mu4e-cited-1-face ((,c :inherit message-cited-text-1)))
    `(mu4e-cited-2-face ((,c :inherit message-cited-text-2)))
    `(mu4e-cited-3-face ((,c :inherit message-cited-text-3)))
    `(mu4e-cited-4-face ((,c :inherit message-cited-text-4)))
    `(mu4e-cited-5-face ((,c :inherit message-cited-text-1)))
    `(mu4e-cited-6-face ((,c :inherit message-cited-text-2)))
    `(mu4e-cited-7-face ((,c :inherit message-cited-text-3)))
    `(mu4e-compose-header-face ((,c :inherit mu4e-compose-separator-face)))
    `(mu4e-compose-separator-face ((,c :inherit message-separator)))
    `(mu4e-contact-face ((,c :inherit message-header-to)))
    `(mu4e-context-face ((,c :inherit bold)))
    `(mu4e-draft-face ((,c :foreground ,info)))
    `(mu4e-flagged-face ((,c :foreground ,err)))
    `(mu4e-footer-face ((,c :inherit italic :foreground ,fg-alt)))
    `(mu4e-forwarded-face ((,c :inherit italic :foreground ,info)))
    `(mu4e-header-face ((,c :inherit shadow)))
    `(mu4e-header-highlight-face ((,c :inherit hl-line)))
    `(mu4e-header-key-face ((,c :inherit message-header-name)))
    `(mu4e-header-marks-face ((,c :inherit mu4e-special-header-value-face)))
    `(mu4e-header-title-face ((,c :foreground ,rainbow-0)))
    `(mu4e-header-value-face ((,c :inherit message-header-other)))
    `(mu4e-highlight-face ((,c :inherit ef-themes-key-binding)))
    `(mu4e-link-face ((,c :inherit link)))
    `(mu4e-modeline-face (( )))
    `(mu4e-moved-face ((,c :inherit italic :foreground ,warning)))
    `(mu4e-ok-face ((,c :inherit success)))
    `(mu4e-region-code ((,c :foreground ,builtin)))
    `(mu4e-related-face ((,c :inherit (italic shadow))))
    `(mu4e-replied-face ((,c :foreground ,info)))
    `(mu4e-special-header-value-face ((,c :inherit message-header-subject)))
    `(mu4e-system-face ((,c :inherit italic)))
    `(mu4e-title-face (( )))
    `(mu4e-trashed-face ((,c :foreground ,err)))
    `(mu4e-unread-face ((,c :inherit bold)))
    `(mu4e-url-number-face ((,c :inherit shadow)))
    `(mu4e-view-body-face (( )))
    `(mu4e-warning-face ((,c :inherit warning)))
;;;; neotree
    `(neo-banner-face ((,c :foreground ,accent-0)))
    `(neo-button-face ((,c :inherit button)))
    `(neo-dir-link-face (( )))
    `(neo-expand-btn-face (( )))
    `(neo-file-link-face (( )))
    `(neo-header-face ((,c :inherit bold)))
    `(neo-root-dir-face ((,c :inherit bold :foreground ,accent-0)))
    `(neo-vc-added-face ((,c :inherit success)))
    `(neo-vc-conflict-face ((,c :inherit error)))
    `(neo-vc-default-face (( )))
    `(neo-vc-edited-face ((,c :inherit italic)))
    `(neo-vc-ignored-face ((,c :inherit shadow)))
    `(neo-vc-missing-face ((,c :inherit error)))
    `(neo-vc-needs-merge-face ((,c :inherit italic)))
    `(neo-vc-needs-update-face ((,c :underline t)))
    `(neo-vc-removed-face ((,c :strike-through t)))
    `(neo-vc-unlocked-changes-face ((,c :inherit success)))
    `(neo-vc-up-to-date-face (( )))
    `(neo-vc-user-face ((,c :inherit warning)))
;;;; notmuch
    `(notmuch-crypto-decryption ((,c :inherit bold)))
    `(notmuch-crypto-part-header ((,c :foreground ,mail-part))) ; like `message-mml'
    `(notmuch-crypto-signature-bad ((,c :inherit error)))
    `(notmuch-crypto-signature-good ((,c :inherit success)))
    `(notmuch-crypto-signature-good-key ((,c :inherit success)))
    `(notmuch-crypto-signature-unknown ((,c :inherit warning)))
    `(notmuch-jump-key ((,c :inherit ef-themes-key-binding)))
    `(notmuch-message-summary-face ((,c :inherit bold :background ,bg-alt)))
    `(notmuch-search-count ((,c :foreground ,fg-dim)))
    `(notmuch-search-date ((,c :foreground ,date-common)))
    `(notmuch-search-flagged-face ((,c :foreground ,err)))
    `(notmuch-search-matching-authors ((,c :foreground ,mail-recipient)))
    `(notmuch-search-non-matching-authors ((,c :inherit shadow)))
    `(notmuch-search-subject ((,c :foreground ,fg-main)))
    `(notmuch-search-unread-face ((,c :inherit bold)))
    `(notmuch-tag-added ((,c :underline ,underline-info)))
    `(notmuch-tag-deleted ((,c :strike-through ,underline-err)))
    `(notmuch-tag-face ((,c :foreground ,accent-0)))
    `(notmuch-tag-flagged ((,c :foreground ,err)))
    `(notmuch-tag-unread ((,c :foreground ,accent-1)))
    `(notmuch-tree-match-author-face ((,c :inherit notmuch-search-matching-authors)))
    `(notmuch-tree-match-date-face ((,c :inherit notmuch-search-date)))
    `(notmuch-tree-match-face ((,c :foreground ,fg-main)))
    `(notmuch-tree-match-tag-face ((,c :inherit notmuch-tag-face)))
    `(notmuch-tree-no-match-face ((,c :inherit shadow)))
    `(notmuch-tree-no-match-date-face ((,c :inherit shadow)))
    `(notmuch-wash-cited-text ((,c :inherit message-cited-text-1)))
    `(notmuch-wash-toggle-button ((,c :background ,bg-dim :foreground ,fg-alt)))
;;;; olivetti
    `(olivetti-fringe (( )))
;;;; orderless
    `(orderless-match-face-0 ((,c :inherit bold :foreground ,accent-0)))
    `(orderless-match-face-1 ((,c :inherit bold :foreground ,accent-1)))
    `(orderless-match-face-2 ((,c :inherit bold :foreground ,accent-2)))
    `(orderless-match-face-3 ((,c :inherit bold :foreground ,accent-3)))
;;;; org
    `(org-agenda-calendar-daterange ((,c :foreground ,date-range)))
    `(org-agenda-calendar-event ((,c :foreground ,date-event)))
    `(org-agenda-calendar-sexp ((,c :inherit (italic org-agenda-calendar-event))))
    `(org-agenda-clocking ((,c :background ,bg-warning :foreground ,warning)))
    `(org-agenda-column-dateline ((,c :background ,bg-alt)))
    `(org-agenda-current-time ((,c :foreground ,date-now)))
    `(org-agenda-date ((,c ,@(ef-themes--heading 'agenda-date) :foreground ,date-weekday)))
    `(org-agenda-date-today ((,c :inherit org-agenda-date :underline t)))
    `(org-agenda-date-weekend ((,c :inherit org-agenda-date :foreground ,date-weekend)))
    `(org-agenda-date-weekend-today ((,c :inherit org-agenda-date-today :foreground ,date-weekend)))
    `(org-agenda-diary ((,c :inherit org-agenda-calendar-sexp)))
    `(org-agenda-dimmed-todo-face ((,c :inherit shadow)))
    `(org-agenda-done ((,c :inherit org-done)))
    `(org-agenda-filter-category ((,c :inherit bold :foreground ,modeline-err)))
    `(org-agenda-filter-effort ((,c :inherit bold :foreground ,modeline-err)))
    `(org-agenda-filter-regexp ((,c :inherit bold :foreground ,modeline-err)))
    `(org-agenda-filter-tags ((,c :inherit bold :foreground ,modeline-err)))
    `(org-agenda-restriction-lock ((,c :background ,bg-dim :foreground ,fg-dim)))
    `(org-agenda-structure ((,c ,@(ef-themes--heading 'agenda-structure) :foreground ,fg-alt)))
    `(org-agenda-structure-filter ((,c :inherit org-agenda-structure :foreground ,warning)))
    `(org-agenda-structure-secondary ((,c :inherit font-lock-doc-face)))
    `(org-archived ((,c :background ,bg-alt :foreground ,fg-main)))
    `(org-block ((,c :inherit ef-themes-fixed-pitch :background ,bg-inactive :extend t)))
    `(org-block-begin-line ((,c :inherit (shadow ef-themes-fixed-pitch) :background ,bg-dim :extend t)))
    `(org-block-end-line ((,c :inherit org-block-begin-line)))
    `(org-checkbox ((,c :foreground ,warning)))
    `(org-checkbox-statistics-done ((,c :inherit org-done)))
    `(org-checkbox-statistics-todo ((,c :inherit org-todo)))
    `(org-clock-overlay ((,c :background ,bg-hover-secondary)))
    `(org-code ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-code)))
    `(org-column ((,c :inherit default :background ,bg-alt)))
    `(org-column-title ((,c :inherit (bold default) :underline t :background ,bg-alt)))
    `(org-date ((,c :inherit ef-themes-fixed-pitch :foreground ,date-common)))
    `(org-date-selected ((,c :foreground ,date-common :inverse-video t)))
    `(org-dispatcher-highlight ((,c :inherit warning :background ,bg-warning)))
    `(org-document-info ((,c :foreground ,prose-metadata-value)))
    `(org-document-info-keyword ((,c :foreground ,prose-metadata)))
    `(org-document-title ((,c :inherit ef-themes-heading-0)))
    `(org-done ((,c :foreground ,prose-done)))
    `(org-drawer ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-metadata)))
    `(org-ellipsis (( ))) ; inherits from the heading's color
    `(org-footnote ((,c :inherit link)))
    `(org-formula ((,c :inherit ef-themes-fixed-pitch :foreground ,fnname)))
    `(org-headline-done ((,c :inherit org-done)))
    `(org-headline-todo ((,c :inherit org-todo)))
    `(org-hide ((,c :foreground ,bg-main)))
    `(org-indent ((,c :inherit (fixed-pitch org-hide))))
    `(org-imminent-deadline ((,c :foreground ,date-deadline)))
    `(org-latex-and-related ((,c :foreground ,type)))
    `(org-level-1 ((,c :inherit ef-themes-heading-1)))
    `(org-level-2 ((,c :inherit ef-themes-heading-2)))
    `(org-level-3 ((,c :inherit ef-themes-heading-3)))
    `(org-level-4 ((,c :inherit ef-themes-heading-4)))
    `(org-level-5 ((,c :inherit ef-themes-heading-5)))
    `(org-level-6 ((,c :inherit ef-themes-heading-6)))
    `(org-level-7 ((,c :inherit ef-themes-heading-7)))
    `(org-level-8 ((,c :inherit ef-themes-heading-8)))
    `(org-link ((,c :inherit link)))
    `(org-list-dt ((,c :inherit bold)))
    `(org-macro ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-macro)))
    `(org-meta-line ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-metadata)))
    `(org-mode-line-clock (( )))
    `(org-mode-line-clock-overrun ((,c :inherit bold :foreground ,modeline-err)))
    `(org-priority ((,c :foreground ,prose-tag)))
    `(org-property-value ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-metadata-value)))
    `(org-quote ((,c :inherit org-block)))
    `(org-scheduled ((,c :foreground ,date-scheduled)))
    `(org-scheduled-previously ((,c :inherit org-scheduled)))
    `(org-scheduled-today ((,c :inherit org-scheduled)))
    `(org-sexp-date ((,c :foreground ,date-common)))
    `(org-special-keyword ((,c :inherit (shadow ef-themes-fixed-pitch))))
    `(org-table ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-table)))
    `(org-table-header ((,c :inherit (bold org-table))))
    `(org-tag ((,c :foreground ,prose-tag)))
    `(org-tag-group ((,c :inherit (bold org-tag))))
    `(org-target ((,c :underline t)))
    `(org-time-grid ((,c :foreground ,fg-dim)))
    `(org-todo ((,c :foreground ,prose-todo)))
    `(org-upcoming-deadline ((,c :foreground ,date-deadline)))
    `(org-upcoming-distant-deadline ((,c :inherit org-upcoming-deadline)))
    `(org-verbatim ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-verbatim)))
    `(org-verse ((,c :inherit org-block)))
    `(org-warning ((,c :inherit warning)))
;;;; org-habit
    `(org-habit-alert-face ((,c :background ,bg-graph-yellow-0 :foreground "black"))) ; special case
    `(org-habit-alert-future-face ((,c :background ,bg-graph-yellow-1)))
    `(org-habit-clear-face ((,c :background ,bg-graph-blue-0 :foreground "black"))) ; special case
    `(org-habit-clear-future-face ((,c :background ,bg-graph-blue-1)))
    `(org-habit-overdue-face ((,c :background ,bg-graph-red-0)))
    `(org-habit-overdue-future-face ((,c :background ,bg-graph-red-1)))
    `(org-habit-ready-face ((,c :background ,bg-graph-green-0 :foreground "black"))) ; special case
    `(org-habit-ready-future-face ((,c :background ,bg-graph-green-1)))
;;;; org-modern
    `(org-modern-date-active ((,c :inherit (ef-themes-fixed-pitch org-modern-label) :background ,bg-alt)))
    `(org-modern-date-inactive ((,c :inherit (ef-themes-fixed-pitch org-modern-label) :background ,bg-dim :foreground ,fg-dim)))
    `(org-modern-done ((,c :inherit org-modern-label :background ,bg-info :foreground ,info)))
    `(org-modern-priority ((,c :inherit (org-modern-label org-priority) :background ,bg-dim)))
    `(org-modern-statistics ((,c :inherit org-modern-label :background ,bg-dim)))
    `(org-modern-tag ((,c :inherit (org-modern-label org-tag) :background ,bg-dim)))
    `(org-modern-time-active ((,c :inherit (ef-themes-fixed-pitch org-modern-label) :background ,bg-active :foreground ,fg-intense)))
    `(org-modern-time-inactive ((,c :inherit (org-modern-label org-modern-date-inactive))))
    `(org-modern-todo ((,c :inherit org-modern-label :background ,bg-err :foreground ,err)))
;;;; outline-mode
    `(outline-1 ((,c :inherit ef-themes-heading-1)))
    `(outline-2 ((,c :inherit ef-themes-heading-2)))
    `(outline-3 ((,c :inherit ef-themes-heading-3)))
    `(outline-4 ((,c :inherit ef-themes-heading-4)))
    `(outline-5 ((,c :inherit ef-themes-heading-5)))
    `(outline-6 ((,c :inherit ef-themes-heading-6)))
    `(outline-7 ((,c :inherit ef-themes-heading-7)))
    `(outline-8 ((,c :inherit ef-themes-heading-8)))
;;;; outline-minor-faces
    `(outline-minor-0 (( )))
;;;; package (M-x list-packages)
    `(package-description ((,c :foreground ,docstring)))
    `(package-help-section-name ((,c :inherit bold)))
    `(package-name ((,c :inherit link)))
    `(package-status-available ((,c :foreground ,date-common)))
    `(package-status-avail-obso ((,c :inherit error)))
    `(package-status-built-in ((,c :foreground ,builtin)))
    `(package-status-dependency ((,c :foreground ,warning)))
    `(package-status-disabled ((,c :inherit error :strike-through t)))
    `(package-status-from-source ((,c :foreground ,type)))
    `(package-status-held ((,c :foreground ,warning)))
    `(package-status-incompat ((,c :inherit warning)))
    `(package-status-installed ((,c :foreground ,fg-alt)))
    `(package-status-new ((,c :inherit success)))
    `(package-status-unsigned ((,c :inherit error)))
;;;; perspective
    `(persp-selected-face ((,c :inherit mode-line-emphasis)))
;;;;; proced
    `(proced-cpu ((,c :foreground ,keyword)))
    `(proced-emacs-pid ((,c :foreground ,identifier :underline t)))
    `(proced-executable ((,c :foreground ,name)))
    `(proced-interruptible-sleep-status-code ((,c :inherit shadow)))
    `(proced-mem ((,c :foreground ,type)))
    `(proced-memory-high-usage ((,c :foreground ,err)))
    `(proced-memory-low-usage ((,c :foreground ,info)))
    `(proced-memory-medium-usage ((,c :foreground ,warning)))
    `(proced-pgrp ((,c :inherit proced-pid)))
    `(proced-pid ((,c :foreground ,identifier)))
    `(proced-ppid ((,c :inherit proced-pid)))
    `(proced-run-status-code ((,c :inherit success)))
    `(proced-sess ((,c :inherit proced-pid)))
    `(proced-session-leader-pid ((,c :inherit bold :foreground ,identifier)))
    `(proced-time-colon (( )))
    `(proced-uninterruptible-sleep-status-code ((,c :inherit error)))
    `(proced-user (( )))
;;;; powerline
    `(powerline-active0 ((,c :background ,fg-dim :foreground ,bg-main)))
    `(powerline-active1 ((,c :inherit mode-line)))
    `(powerline-active2 ((,c :inherit mode-line-inactive)))
    `(powerline-inactive0 ((,c :background ,bg-active :foreground ,fg-dim)))
    `(powerline-inactive1 ((,c :background ,bg-main :foreground ,fg-dim)))
    `(powerline-inactive2 ((,c :inherit mode-line-inactive)))
;;;; pulsar
    `(pulsar-blue ((,c :background ,bg-blue-subtle)))
    `(pulsar-cyan ((,c :background ,bg-cyan-subtle)))
    `(pulsar-green ((,c :background ,bg-green-subtle)))
    `(pulsar-magenta ((,c :background ,bg-magenta-subtle)))
    `(pulsar-red ((,c :background ,bg-red-subtle)))
    `(pulsar-yellow ((,c :background ,bg-yellow-subtle)))
;;;; pulse
    `(pulse-highlight-start-face ((,c :background ,bg-blue-subtle)))
;;;; rainbow-delimiters
    `(rainbow-delimiters-base-error-face ((,c :inherit (bold rainbow-delimiters-mismatched-face))))
    `(rainbow-delimiters-base-face    ((,c :foreground ,rainbow-0)))
    `(rainbow-delimiters-depth-1-face ((,c :foreground ,rainbow-0)))
    `(rainbow-delimiters-depth-2-face ((,c :foreground ,rainbow-1)))
    `(rainbow-delimiters-depth-3-face ((,c :foreground ,rainbow-2)))
    `(rainbow-delimiters-depth-4-face ((,c :foreground ,rainbow-3)))
    `(rainbow-delimiters-depth-5-face ((,c :foreground ,rainbow-4)))
    `(rainbow-delimiters-depth-6-face ((,c :foreground ,rainbow-5)))
    `(rainbow-delimiters-depth-7-face ((,c :foreground ,rainbow-6)))
    `(rainbow-delimiters-depth-8-face ((,c :foreground ,rainbow-7)))
    `(rainbow-delimiters-depth-9-face ((,c :foreground ,rainbow-8)))
    `(rainbow-delimiters-mismatched-face ((,c :background ,bg-red-intense :foreground ,fg-intense)))
    `(rainbow-delimiters-unmatched-face ((,c :inherit (bold rainbow-delimiters-mismatched-face))))
;;;; rcirc
    `(rcirc-bright-nick ((,c :inherit bold :foreground ,fg-intense)))
    `(rcirc-dim-nick ((,c :inherit shadow)))
    `(rcirc-monospace-text ((,c :inherit fixed-pitch)))
    `(rcirc-my-nick ((,c :inherit bold :foreground ,accent-1)))
    `(rcirc-nick-in-message ((,c :inherit rcirc-my-nick)))
    `(rcirc-nick-in-message-full-line ((,c :inherit rcirc-my-nick)))
    `(rcirc-other-nick ((,c :inherit bold :foreground ,accent-0)))
    `(rcirc-prompt ((,c :inherit minibuffer-prompt)))
    `(rcirc-server ((,c :inherit font-lock-comment-face)))
    `(rcirc-timestamp ((,c :foreground ,date-common)))
    `(rcirc-track-keyword ((,c :inherit bold :foreground ,modeline-warning)))
    `(rcirc-track-nick ((,c :inherit rcirc-my-nick)))
    `(rcirc-url ((,c :inherit link)))
;;;; recursion-indicator
    `(recursion-indicator-general ((,c :foreground ,modeline-err)))
    `(recursion-indicator-minibuffer ((,c :foreground ,modeline-info)))
;;;; regexp-builder (re-builder)
    `(reb-match-0 ((,c :background ,bg-cyan-intense :foreground ,fg-intense)))
    `(reb-match-1 ((,c :background ,bg-red-intense :foreground ,fg-intense)))
    `(reb-match-2 ((,c :background ,bg-magenta-intense :foreground ,fg-intense)))
    `(reb-match-3 ((,c :background ,bg-yellow-intense :foreground ,fg-intense)))
    `(reb-regexp-grouping-backslash ((,c :inherit font-lock-regexp-grouping-backslash)))
    `(reb-regexp-grouping-construct ((,c :inherit font-lock-regexp-grouping-construct)))
;;;;; rst-mode
    `(rst-level-1 ((,c :inherit ef-themes-heading-1)))
    `(rst-level-2 ((,c :inherit ef-themes-heading-2)))
    `(rst-level-3 ((,c :inherit ef-themes-heading-3)))
    `(rst-level-4 ((,c :inherit ef-themes-heading-4)))
    `(rst-level-5 ((,c :inherit ef-themes-heading-5)))
    `(rst-level-6 ((,c :inherit ef-themes-heading-6)))
;;;; ruler-mode
    `(ruler-mode-column-number ((,c :inherit ruler-mode-default)))
    `(ruler-mode-comment-column ((,c :inherit ruler-mode-default :foreground ,red)))
    `(ruler-mode-current-column ((,c :inherit ruler-mode-default :background ,bg-active :foreground ,fg-intense)))
    `(ruler-mode-default ((,c :inherit default :background ,bg-dim :foreground ,fg-dim)))
    `(ruler-mode-fill-column ((,c :inherit ruler-mode-default :foreground ,green)))
    `(ruler-mode-fringes ((,c :inherit ruler-mode-default :foreground ,cyan)))
    `(ruler-mode-goal-column ((,c :inherit ruler-mode-default :foreground ,blue)))
    `(ruler-mode-margins ((,c :inherit ruler-mode-default :foreground ,bg-main)))
    `(ruler-mode-pad ((,c :inherit ruler-mode-default :background ,bg-alt :foreground ,fg-dim)))
    `(ruler-mode-tab-stop ((,c :inherit ruler-mode-default :foreground ,yellow)))
;;;; show-paren-mode
    `(show-paren-match ((,c :background ,bg-paren :foreground ,fg-intense)))
    `(show-paren-match-expression ((,c :background ,bg-alt)))
    `(show-paren-mismatch ((,c :background ,bg-red-intense :foreground ,fg-intense)))
;;;; shell-script-mode (sh-mode)
    `(sh-heredoc ((,c :inherit font-lock-doc-face)))
    `(sh-quoted-exec ((,c :inherit font-lock-builtin-face)))
;;;; shr
    `(shr-code ((,c :inherit ef-themes-fixed-pitch :foreground ,prose-code)))
    `(shr-h1 ((,c :inherit ef-themes-heading-1)))
    `(shr-h2 ((,c :inherit ef-themes-heading-2)))
    `(shr-h3 ((,c :inherit ef-themes-heading-3)))
    `(shr-h4 ((,c :inherit ef-themes-heading-4)))
    `(shr-h5 ((,c :inherit ef-themes-heading-5)))
    `(shr-h6 ((,c :inherit ef-themes-heading-6)))
    `(shr-selected-link ((,c :inherit link :background ,bg-dim)))
;;;; smerge
    `(smerge-base ((,c :inherit diff-changed)))
    `(smerge-lower ((,c :inherit diff-added)))
    `(smerge-markers ((,c :inherit diff-header)))
    `(smerge-refined-added ((,c :inherit diff-refine-added)))
    `(smerge-refined-changed (( )))
    `(smerge-refined-removed ((,c :inherit diff-refine-removed)))
    `(smerge-upper ((,c :inherit diff-removed)))
;;;; tab-bar-mode
    `(tab-bar ((,c :inherit ef-themes-ui-variable-pitch :background ,bg-alt)))
    `(tab-bar-tab-group-current ((,c :inherit bold :background ,bg-main :box (:line-width -2 :color ,bg-main) :foreground ,fg-alt)))
    `(tab-bar-tab-group-inactive ((,c :background ,bg-alt :box (:line-width -2 :color ,bg-alt) :foreground ,fg-alt)))
    `(tab-bar-tab ((,c :inherit bold :box (:line-width -2 :color ,bg-main) :background ,bg-main)))
    `(tab-bar-tab-inactive ((,c :box (:line-width -2 :color ,bg-active) :background ,bg-active)))
    `(tab-bar-tab-ungrouped ((,c :inherit tab-bar-tab-inactive)))
;;;; tab-line-mode
    `(tab-line ((,c :inherit ef-themes-ui-variable-pitch :background ,bg-alt :height 0.95)))
    `(tab-line-close-highlight ((,c :foreground ,err)))
    `(tab-line-highlight ((,c :inherit highlight)))
    `(tab-line-tab (( )))
    `(tab-line-tab-current ((,c :inherit bold :box (:line-width -2 :color ,bg-main) :background ,bg-main)))
    `(tab-line-tab-inactive ((,c :box (:line-width -2 :color ,bg-active) :background ,bg-active)))
    `(tab-line-tab-inactive-alternate ((,c :inherit tab-line-tab-inactive :foreground ,fg-alt)))
    `(tab-line-tab-modified ((,c :foreground ,warning)))
;;;; tempel
    `(tempel-default ((,c :inherit italic :background ,bg-alt :foreground ,fg-alt)))
    `(tempel-field ((,c :background ,bg-info :foreground ,info)))
    `(tempel-form ((,c :background ,bg-err :foreground ,err)))
;;;; term
    `(term ((,c :background ,bg-main :foreground ,fg-main)))
    `(term-bold ((,c :inherit bold)))
    `(term-color-black ((,c :background "black" :foreground "black")))
    `(term-color-blue ((,c :background ,blue :foreground ,blue)))
    `(term-color-cyan ((,c :background ,cyan :foreground ,cyan)))
    `(term-color-green ((,c :background ,green :foreground ,green)))
    `(term-color-magenta ((,c :background ,magenta :foreground ,magenta)))
    `(term-color-red ((,c :background ,red :foreground ,red)))
    `(term-color-white ((,c :background "white" :foreground "white")))
    `(term-color-yellow ((,c :background ,yellow :foreground ,yellow)))
    `(term-underline ((,c :underline t)))
;;;; textsec
    `(textsec-suspicious (( )))
;;;; transient
    `(transient-active-infix ((,c :background ,bg-active :foreground ,fg-intense)))
    `(transient-amaranth ((,c :inherit bold :foreground ,yellow-warmer)))
    ;; Placate the compiler for what is a spurious warning.  We also
    ;; have to do this with `eldoc-highlight-function-argument'.
    (list 'transient-argument `((,c :inherit warning :background ,bg-warning)))
    `(transient-blue ((,c :inherit bold :foreground ,blue-cooler)))
    `(transient-disabled-suffix ((,c :strike-through t)))
    `(transient-enabled-suffix ((,c :inherit success :background ,bg-info)))
    `(transient-heading ((,c :inherit bold)))
    `(transient-inactive-argument ((,c :inherit shadow)))
    `(transient-inactive-value ((,c :inherit shadow)))
    `(transient-key ((,c :inherit ef-themes-key-binding)))
    `(transient-mismatched-key ((,c :underline t)))
    `(transient-nonstandard-key ((,c :underline t)))
    `(transient-pink ((,c :inherit bold :foreground ,magenta)))
    `(transient-purple ((,c :inherit bold :foreground ,magenta-cooler)))
    `(transient-red ((,c :inherit bold :foreground ,red)))
    `(transient-teal ((,c :inherit bold :foreground ,cyan-cooler)))
    `(transient-unreachable ((,c :inherit shadow)))
    `(transient-unreachable-key ((,c :inherit shadow)))
    `(transient-value ((,c :inherit success :background ,bg-info)))
;;;; trashed
    `(trashed-restored ((,c :inherit ef-themes-mark-other)))
;;;; tree-sitter
    `(tree-sitter-hl-face:attribute ((,c :inherit font-lock-variable-name-face)))
    `(tree-sitter-hl-face:constant.builtin ((,c :inherit tree-sitter-hl-face:constant)))
    `(tree-sitter-hl-face:escape ((,c :inherit font-lock-regexp-grouping-backslash)))
    `(tree-sitter-hl-face:function ((,c :inherit font-lock-function-name-face)))
    `(tree-sitter-hl-face:function.call ((,c :inherit tree-sitter-hl-face:function)))
    `(tree-sitter-hl-face:label (( )))
    `(tree-sitter-hl-face:method.call (( )))
    `(tree-sitter-hl-face:operator ((,c :inherit bold)))
    `(tree-sitter-hl-face:property (( )))
    `(tree-sitter-hl-face:property.definition ((,c :inherit font-lock-variable-name-face)))
    `(tree-sitter-hl-face:punctuation (( )))
    `(tree-sitter-hl-face:punctuation.bracket (( )))
    `(tree-sitter-hl-face:punctuation.delimiter (( )))
    `(tree-sitter-hl-face:punctuation.special ((,c :inherit font-lock-regexp-grouping-construct)))
    `(tree-sitter-hl-face:string.special ((,c :inherit tree-sitter-hl-face:string)))
    `(tree-sitter-hl-face:tag ((,c :inherit font-lock-function-name-face)))
    `(tree-sitter-hl-face:type.argument (( )))
;;;; tty-menu
    `(tty-menu-disabled-face ((,c :background ,bg-alt :foreground ,fg-dim)))
    `(tty-menu-enabled-face ((,c :background ,bg-alt :foreground ,fg-intense)))
    `(tty-menu-selected-face ((,c :inherit highlight)))
;;;; vc (vc-dir.el, vc-hooks.el)
    `(vc-dir-directory (( )))
    `(vc-dir-file ((,c :foreground ,name)))
    `(vc-dir-header ((,c :inherit bold)))
    `(vc-dir-header-value ((,c :foreground ,string)))
    `(vc-dir-mark-indicator ((,c :foreground ,fg-intense)))
    `(vc-dir-status-edited ((,c :inherit italic)))
    `(vc-dir-status-ignored ((,c :inherit shadow)))
    `(vc-dir-status-up-to-date ((,c :foreground ,info)))
    `(vc-dir-status-warning ((,c :inherit error)))
    `(vc-conflict-state ((,c :inherit error)))
    `(vc-edited-state ((,c :inherit italic)))
    `(vc-git-log-edit-summary-max-warning ((,c :background ,bg-err :foreground ,err)))
    `(vc-git-log-edit-summary-target-warning ((,c :background ,bg-warning :foreground ,warning)))
    `(vc-locally-added-state ((,c :inherit italic)))
    `(vc-locked-state ((,c :inherit success)))
    `(vc-missing-state ((,c :inherit error)))
    `(vc-needs-update-state ((,c :inherit error)))
    `(vc-removed-state ((,c :inherit error)))
    `(vc-state-base (( )))
    `(vc-up-to-date-state (( )))
;;;; vertico
    `(vertico-current ((,c :background ,bg-completion)))
    `(vertico-group-title ((,c :inherit bold :foreground ,name)))
;;;;; vterm
    `(vterm-color-black ((,c :background "gray35" :foreground "black")))
    `(vterm-color-blue ((,c :background ,blue-warmer :foreground ,blue)))
    `(vterm-color-cyan ((,c :background ,cyan-cooler :foreground ,cyan)))
    `(vterm-color-default ((,c :background ,bg-main :foreground ,fg-main)))
    `(vterm-color-green ((,c :background ,green-cooler :foreground ,green)))
    `(vterm-color-inverse-video ((,c :background ,bg-main :inverse-video t)))
    `(vterm-color-magenta ((,c :background ,magenta-cooler :foreground ,magenta)))
    `(vterm-color-red ((,c :background ,red-warmer :foreground ,red)))
    `(vterm-color-underline ((,c :underline t)))
    `(vterm-color-white ((,c :background "white" :foreground "gray65")))
    `(vterm-color-yellow ((,c :background ,yellow-warmer :foreground ,yellow)))
;;;; vundo
    `(vundo-default ((,c :inherit shadow)))
    `(vundo-highlight ((,c :inherit (bold vundo-node) :foreground ,err)))
    `(vundo-last-saved ((,c :inherit (bold vundo-node) :foreground ,fg-intense)))
    `(vundo-saved ((,c :inherit vundo-node :foreground ,fg-intense)))
;;;; wgrep
    `(wgrep-delete-face ((,c :inherit warning)))
    `(wgrep-done-face ((,c :background ,bg-info :foreground ,info)))
    `(wgrep-face ((,c :inherit bold)))
    `(wgrep-file-face ((,c :foreground ,fg-alt)))
    `(wgrep-reject-face ((,c :background ,bg-err :foreground ,err)))
;;;; which-function-mode
    `(which-func ((,c :inherit bold :foreground ,fg-intense)))
;;;; whitespace-mode
    `(whitespace-big-indent ((,c :background ,bg-err :foreground ,err)))
    `(whitespace-empty ((,c :inherit whitespace-big-indent)))
    `(whitespace-hspace ((,c :inherit whitespace-indentation)))
    `(whitespace-indentation ((,c :background ,bg-dim :foreground ,fg-dim)))
    `(whitespace-line ((,c :background ,bg-dim :foreground ,warning)))
    `(whitespace-newline ((,c :inherit whitespace-indentation)))
    `(whitespace-space ((,c :inherit whitespace-indentation)))
    `(whitespace-space-after-tab ((,c :inherit whitespace-space-before-tab)))
    `(whitespace-space-before-tab ((,c :background ,bg-red-intense)))
    `(whitespace-tab ((,c :inherit whitespace-indentation)))
    `(whitespace-trailing ((,c :inherit whitespace-space-before-tab)))
;;;; widget
    `(widget-button ((,c :inherit bold :foreground ,link)))
    `(widget-button-pressed ((,c :inherit widget-button :foreground ,link-alt)))
    `(widget-documentation ((,c :inherit font-lock-doc-face)))
    `(widget-field ((,c :background ,bg-alt :foreground ,fg-main :extend nil)))
    `(widget-inactive ((,c :inherit shadow :background ,bg-dim)))
    `(widget-single-line-field ((,c :inherit widget-field)))
;;;; writegood-mode
    `(writegood-duplicates-face ((,c :inherit ef-themes-underline-error)))
    `(writegood-passive-voice-face ((,c :inherit ef-themes-underline-info)))
    `(writegood-weasels-face ((,c :inherit ef-themes-underline-warning)))
;;;; woman
    `(woman-addition ((,c :foreground ,accent-2)))
    `(woman-bold ((,c :inherit bold :foreground ,accent-0)))
    `(woman-italic ((,c :inherit italic :foreground ,accent-1)))
    `(woman-unknown ((,c :foreground ,accent-3))))
  "Face specs for use with `ef-themes-theme'.")

(defconst ef-themes-custom-variables
  '(
;;;; chart
    `(chart-face-color-list
      '( ,bg-graph-red-0 ,bg-graph-green-0 ,bg-graph-yellow-0 ,bg-graph-blue-0 ,bg-graph-magenta-0 ,bg-graph-cyan-0
         ,bg-graph-red-1 ,bg-graph-green-1 ,bg-graph-yellow-1 ,bg-graph-blue-1 ,bg-graph-magenta-1 ,bg-graph-cyan-1))
;;;; flymake fringe indicators
    `(flymake-error-bitmap '(flymake-double-exclamation-mark ef-themes-mark-delete))
    `(flymake-warning-bitmap '(exclamation-mark ef-themes-mark-other))
    `(flymake-note-bitmap '(exclamation-mark ef-themes-mark-select))
;;;; ibuffer
    `(ibuffer-deletion-face 'ef-themes-mark-delete)
    `(ibuffer-filter-group-name-face 'bold)
    `(ibuffer-marked-face 'ef-themes-mark-select)
    `(ibuffer-title-face 'default))
  "Custom variables for `ef-themes-theme'.")

;;; Theme macros

;;;; Instantiate an Ef theme

;;;###autoload
(defmacro ef-themes-theme (name palette &optional overrides)
  "Bind NAME's color PALETTE around face specs and variables.
Face specifications are passed to `custom-theme-set-faces'.
While variables are handled by `custom-theme-set-variables'.
Those are stored in `ef-themes-faces' and
`ef-themes-custom-variables' respectively.

Optional OVERRIDES are appended to PALETTE, overriding
corresponding entries."
  (declare (indent 0))
  (let ((sym (gensym))
        (colors (mapcar #'car (symbol-value palette))))
    `(let* ((c '((class color) (min-colors 256)))
            (,sym (ef-themes--palette-value ',name ',overrides))
            ,@(mapcar (lambda (color)
                        (list color
                              `(ef-themes--retrieve-palette-value ',color ,sym)))
                      colors))
       (custom-theme-set-faces ',name ,@ef-themes-faces)
       (custom-theme-set-variables ',name ,@ef-themes-custom-variables))))

;;;; Use theme colors

(defmacro ef-themes-with-colors (&rest body)
  "Evaluate BODY with colors from current palette bound."
  (declare (indent 0))
  (let* ((sym (gensym))
         ;; NOTE 2022-08-23: We just give it a sample palette at this
         ;; stage.  It only needs to collect each car.  Then we
         ;; instantiate the actual theme's palette.  We have to do this
         ;; otherwise the macro does not work properly when called from
         ;; inside a function.
         (colors (mapcar #'car (ef-themes--current-theme-palette))))
    `(let* ((c '((class color) (min-colors 256)))
            (,sym (ef-themes--current-theme-palette :overrides))
            ,@(mapcar (lambda (color)
                        (list color
                              `(ef-themes--retrieve-palette-value ',color ,sym)))
                      colors))
       (ignore c ,@colors)            ; Silence unused variable warnings
       ,@body)))

;;;; Add themes from package to path

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (file-equal-p dir (expand-file-name "themes/" data-directory))
      (add-to-list 'custom-theme-load-path dir))))

(provide 'ef-themes)
;;; ef-themes.el ends here
