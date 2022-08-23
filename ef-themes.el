;;; ef-themes.el --- Colorful and legible themes -*- lexical-binding:t -*-

;; Copyright (C) 2022  Free Software Foundation, Inc.

;; Author: Protesilaos Stavrou <info@protesilaos.com>
;; Maintainer: Ef-Themes Development <~protesilaos/ef-themes@lists.sr.ht>
;; URL: https://git.sr.ht/~protesilaos/ef-themes
;; Mailing-List: https://lists.sr.ht/~protesilaos/ef-themes
;; Version: 0.3.4
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

(defconst ef-themes-collection
  '(ef-autumn
    ef-dark
    ef-day
    ef-deuteranopia-dark
    ef-deuteranopia-light
    ef-light
    ef-night
    ef-spring
    ef-summer
    ef-winter)
  "Symbols of all the Ef themes.")

(defconst ef-themes-light-themes
  '(ef-day ef-light ef-spring ef-summer ef-deuteranopia-light)
  "List of symbols with the light Ef themes.")

(defconst ef-themes-dark-themes
  '(ef-autumn ef-dark ef-night ef-winter ef-deuteranopia-dark)
  "List of symbols with the dark Ef themes.")

(defcustom ef-themes-post-load-hook nil
  "Hook that runs after loading an Ef theme.
This is used by the commands `ef-themes-select' and
`ef-themes-load-random'."
  :type 'hook
  :package-version '(ef-themes . "0.2.0")
  :group 'ef-themes)

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
  "Heading styles with optional list of values for levels 0-8.

This is an alist that accepts a (key . list-of-values)
combination.  The key is either a number, representing the
heading's level (0-8) or t, which pertains to the fallback style.

Level 0 is a special heading: it is used for what counts as a
document title or equivalent, such as the #+title construct we
find in Org files.  Levels 1-8 are regular headings.

The list of values covers symbols that refer to properties, as
described below.  Here is a complete sample, followed by a
presentation of all available properties:

    (setq ef-themes-headings
          (quote ((1 . (light variable-pitch 1.5))
                  (2 . (regular 1.3))
                  (3 . (1.1))
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
  :package-version '(ef-themes . "0.3.0")
  :type `(alist
          :options ,(mapcar (lambda (el)
                              (list el ef-themes--headings-choice))
                            '(0 1 2 3 4 5 6 7 8 t))
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

;;; Helpers for user options

(defun ef-themes--fixed-pitch ()
  "Conditional application of `fixed-pitch' inheritance."
  (when ef-themes-mixed-fonts
    (list :inherit 'fixed-pitch)))

(defun ef-themes--variable-pitch-ui ()
  "Conditional application of `variable-pitch' in the UI."
  (when ef-themes-variable-pitch-ui
    (list :inherit 'variable-pitch)))

(defun ef-themes--key-cdr (key alist)
  "Get cdr of KEY in ALIST."
  (cdr (assoc key alist)))

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
  (let* ((key (ef-themes--key-cdr level ef-themes-headings))
         (style (or key (ef-themes--key-cdr t ef-themes-headings)))
         (style-listp (listp style))
         (properties style)
         (var (when (memq 'variable-pitch properties) 'variable-pitch))
         (varbold (if var
                      (append (list 'bold) (list var))
                    'bold))
         (weight (when style-listp (ef-themes--weight style))))
    (list :inherit
          (cond
           (weight var)
           (varbold))
          :height
          (ef-themes--alist-or-seq properties 'height #'floatp 'unspecified)
          :weight
          (or weight 'unspecified))))

;;; Commands and their helper functions

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
  (when-let* ((theme (car custom-enabled-themes)))
    (if (memq theme (ef-themes--list-enabled-themes))
        theme
      (user-error "`%s' is not an Ef theme" theme))))

(defun ef-themes--palette (theme)
  "Return THEME palette as a symbol."
  (when theme
    (intern (format "%s-palette" theme))))

(defun ef-themes--current-theme-palette ()
  "Return palette of active Ef theme, else produce `user-error'."
  (if-let* ((palette (ef-themes--palette (ef-themes--current-theme))))
      (symbol-value palette)
    (user-error "No enabled Ef theme could be found")))

(defvar ef-themes--select-theme-history nil)

(defun ef-themes--select-prompt ()
  "Minibuffer prompt for `ef-themes-select'."
  (completing-read "Select Ef Theme: "
                   (ef-themes--list-known-themes)
                   nil t nil
                   'ef-themes--select-theme-history))

(defun ef-themes--load-theme (theme)
  "Load THEME while disabling other Ef themes.
Run `ef-themes-post-load-hook'."
  (mapc #'disable-theme (ef-themes--list-known-themes))
  (load-theme theme :no-confirm)
  (run-hooks 'ef-themes-post-load-hook))

;;;###autoload
(defun ef-themes-select (theme)
  "Load an Ef THEME using minibuffer completion.
When called from Lisp, THEME is a symbol."
  (interactive (list (intern (ef-themes--select-prompt))))
  (ef-themes--load-theme theme))

(defun ef-themes--toggle-theme-p ()
  "Return non-nil if `ef-themes-to-toggle' are valid."
  (mapc (lambda (theme)
          (if (memq theme ef-themes-collection)
              theme
            (user-error "`%s' is not part of `ef-themes-collection'" theme)))
        ef-themes-to-toggle))

;;;###autoload
(defun ef-themes-toggle ()
  "Toggle between the two `ef-themes-to-toggle'."
  (interactive)
  (when-let* ((themes (ef-themes--toggle-theme-p))
              (one (car themes))
              (two (cadr themes)))
    (unless (eq (length themes) 2)
      (user-error "Can only toggle between two themes"))
    (if (eq (car custom-enabled-themes) one)
        (ef-themes--load-theme two)
      (ef-themes--load-theme one))))

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
With optional VARIANT as either `light' or `dark', limit the set
to the relevant themes.

When called interactively, VARIANT is the prefix argument which
prompts with completion for either `light' or `dark'."
  (interactive
   (list
    (when current-prefix-arg
      (intern (completing-read "Random choice of Ef themes VARIANT: "
                               '(light dark) nil t)))))
  (let* ((themes (ef-themes--minus-current variant))
         (n (random (length themes)))
         (pick (nth n themes)))
    (if (null pick)
        (ef-themes--load-theme (car themes))
      (ef-themes--load-theme pick))))

(defun ef-themes--preview-colors-render (buffer theme &rest _)
  "Render colors in BUFFER from THEME.
Routine for `ef-themes-preview-colors'."
  (let ((palette (seq-remove (lambda (cell)
                               (symbolp (cadr cell)))
                             (symbol-value (ef-themes--palette theme))))
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
                 (color (cadr cell))
                 (fg (readable-foreground-color color))
                 (pad (make-string 5 ?\s)))
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
                      (ef-themes--preview-colors-render current-buffer current-theme)))))))

(defvar ef-themes--preview-colors-prompt-history '()
  "Minibuffer history for `ef-themes--preview-colors-prompt'.")

(defun ef-themes--preview-colors-prompt ()
  "Prompt for Ef theme.
Helper function for `ef-themes-preview-colors'."
  (let ((def (format "%s" (ef-themes--current-theme))))
    (completing-read
     (format "Use palette from theme [%s]: " def)
     (ef-themes--list-known-themes) nil t nil
     'ef-themes--preview-colors-prompt-history def)))

;;;###autoload
(defun ef-themes-preview-colors (theme)
  "Preview palette of the Ef THEME of choice."
  (interactive (list (intern (ef-themes--preview-colors-prompt))))
  (ef-themes--preview-colors-render
   (format "*%s-preview-colors*" theme)
   theme))

;;;###autoload
(defun ef-themes-preview-colors-current ()
  "Call `ef-themes-preview-colors' for the current Ef theme."
  (interactive)
  (ef-themes-preview-colors (ef-themes--current-theme)))

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
;;;; all basic faces
    `(default ((,c :background ,bg-main :foreground ,fg-main)))
    `(cursor ((,c :background ,cursor)))
    `(bold ((,c :weight bold)))
    `(italic ((,c :slant italic)))
    `(bold-italic ((,c :inherit (bold italic))))
    `(region ((,c :background ,bg-region)))
    `(comint-highlight-input ((,c :inherit bold)))
    `(comint-highlight-prompt ((,c :foreground ,accent-2)))
    `(minibuffer-prompt ((,c :foreground ,accent-2)))
    `(elisp-shorthand-font-lock-face ((,c :inherit italic)))
    `(escape-glyph ((,c :foreground ,warning)))
    `(error ((,c :inherit bold :foreground ,err)))
    `(success ((,c :inherit bold :foreground ,info)))
    `(warning ((,c :inherit bold :foreground ,warning)))
    `(fringe ((,c :background unspecified)))
    `(header-line ((,c :inherit ef-themes-ui-variable-pitch :background ,bg-dim)))
    `(header-line-highlight ((,c :inherit highlight)))
    `(help-argument-name ((,c :foreground ,accent-0)))
    `(help-key-binding ((,c :inherit bold :foreground ,keybind)))
    `(highlight ((,c :background ,bg-hover :foreground ,fg-intense)))
    `(secondary-selection ((,c :background ,bg-hover-alt :foreground ,fg-intense)))
    `(hl-line ((,c :background ,bg-hl-line)))
    `(button ((,c :foreground ,link :underline ,border)))
    `(link ((,c :foreground ,link :underline ,border)))
    `(link-visited ((,c :foreground ,link-alt :underline ,border)))
    `(pgtk-im-0 ((,c :inherit secondary-selection)))
    `(rectangle-preview ((,c :inherit secondary-selection)))
    `(shadow ((,c :foreground ,fg-dim)))
    `(trailing-whitespace ((,c :background ,bg-red :foreground ,fg-intense)))
    `(tooltip ((,c :background ,bg-alt :foreground ,fg-intense)))
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
;;;; bongo
    `(bongo-album-title (( )))
    `(bongo-artist ((,c :foreground ,rainbow-0)))
    `(bongo-currently-playing-track ((,c :inherit bold)))
    `(bongo-elapsed-track-part ((,c :background ,bg-alt :underline t)))
    `(bongo-filled-seek-bar ((,c :background ,bg-hover)))
    `(bongo-marked-track ((,c :inherit success :background ,bg-info)))
    `(bongo-marked-track-line ((,c :background ,bg-dim)))
    `(bongo-played-track ((,c :strike-through t)))
    `(bongo-track-length ((,c :inherit shadow)))
    `(bongo-track-title ((,c :foreground ,rainbow-1)))
    `(bongo-unfilled-seek-bar ((,c :background ,bg-dim)))
;;;; bookmark
    `(bookmark-face ((,c :foreground ,info)))
    `(bookmark-menu-bookmark ((,c :inherit bold)))
;;;; calendar and diary
    `(calendar-month-header ((,c :inherit bold)))
    `(calendar-today ((,c :inherit bold :underline t)))
    `(calendar-weekday-header ((,c :foreground ,fg-alt)))
    `(calendar-weekend-header ((,c :inherit calendar-weekday-header)))
    `(diary ((,c :background ,bg-dim :foreground ,accent-0)))
    `(diary-anniversary ((,c :foreground ,accent-1)))
    `(diary-time ((,c :foreground ,date)))
    `(holiday ((,c :background ,bg-dim :foreground ,accent-2)))
;;;; change-log and log-view (`vc-print-log' and `vc-print-root-log')
    `(change-log-acknowledgment ((,c :inherit shadow)))
    `(change-log-conditionals ((,c :foreground ,preprocessor)))
    `(change-log-date ((,c :foreground ,date)))
    `(change-log-email ((,c :foreground ,constant)))
    `(change-log-file ((,c :inherit bold)))
    `(change-log-function ((,c :foreground ,fnname)))
    `(change-log-list ((,c :inherit bold)))
    `(change-log-name ((,c :foreground ,name)))
    `(log-edit-header ((,c :inherit bold)))
    `(log-edit-summary ((,c :inherit bold :foreground ,accent-0)))
    `(log-edit-unknown-header ((,c :inherit shadow)))
    `(log-view-commit-body (( )))
    `(log-view-file ((,c :inherit bold)))
    `(log-view-message ((,c :foreground ,fg-dim)))
;;;; compilation
    `(compilation-column-number ((,c :inherit compilation-line-number)))
    `(compilation-error ((,c :inherit error)))
    `(compilation-info ((,c :inherit success)))
    `(compilation-line-number ((,c :inherit shadow)))
    `(compilation-mode-line-exit ((,c :inherit bold)))
    `(compilation-mode-line-fail ((,c :inherit error)))
    `(compilation-mode-line-run ((,c :inherit warning)))
    `(compilation-warning ((,c :inherit warning)))
;;;; completions
    `(completions-annotations ((,c :inherit italic :foreground ,docstring)))
    `(completions-common-part ((,c :inherit bold :foreground ,accent-0)))
    `(completions-first-difference ((,c :inherit bold :foreground ,accent-1)))
;;;; custom (M-x customize)
    `(custom-button ((,c :box ,fg-dim :background ,bg-active :foreground ,fg-intense)))
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
;;;; denote
    `(denote-faces-date ((,c :foreground ,date)))
    `(denote-faces-keywords ((,c :foreground ,name)))
;;;; dictionary
    `(dictionary-button-face ((,c :inherit bold)))
    `(dictionary-reference-face ((,c :inherit link)))
    `(dictionary-word-definition-face (( )))
    `(dictionary-word-entry-face ((,c :inherit font-lock-comment-face)))
;;;; diff-hl
    `(diff-hl-change ((,c :background ,bg-changed-refine)))
    `(diff-hl-delete ((,c :background ,bg-removed-refine)))
    `(diff-hl-dired-change ((,c :inherit diff-hl-change)))
    `(diff-hl-dired-delete ((,c :inherit diff-hl-delete)))
    `(diff-hl-dired-ignored ((,c :inherit dired-ignored)))
    `(diff-hl-dired-insert ((,c :inherit diff-hl-insert)))
    `(diff-hl-dired-unknown ((,c :inherit dired-ignored)))
    `(diff-hl-insert ((,c :background ,bg-added-refine)))
    `(diff-hl-reverted-hunk-highlight ((,c :background ,fg-main :foreground ,bg-main)))
;;;; diff-mode
    `(diff-added ((,c :background ,bg-added)))
    `(diff-changed ((,c :background ,bg-changed :extend t)))
    `(diff-removed ((,c :background ,bg-removed)))
    `(diff-refine-added ((,c :background ,bg-added-refine :foreground ,fg-intense)))
    `(diff-refine-changed ((,c :background ,bg-changed-refine :foreground ,fg-intense)))
    `(diff-refine-removed ((,c :background ,bg-removed-refine :foreground ,fg-intense)))
    `(diff-indicator-added ((,c :inherit success :background ,bg-added)))
    `(diff-indicator-changed ((,c :inherit warning :background ,bg-changed)))
    `(diff-indicator-removed ((,c :inherit error :background ,bg-removed)))
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
    `(dired-flagged ((,c :inherit error :background ,bg-err)))
    `(dired-header ((,c :inherit bold)))
    `(dired-ignored ((,c :inherit shadow)))
    `(dired-mark ((,c :foreground ,fg-intense)))
    `(dired-marked ((,c :inherit success :background ,bg-info)))
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
    `(diredfl-date-time ((,c :foreground ,date)))
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
;;;; doom-modeline
    ;; NOTE 2022-08-20: This is the only face that seems necessary.  All
    ;; others inherit from basic faces.
    `(doom-modeline-bar ((,c :background ,bg-accent)))
;;;; ediff
    `(ediff-current-diff-A ((,c :inherit diff-removed)))
    `(ediff-current-diff-Ancestor ((,c :background ,bg-region))) ; TODO 2022-08-14: Needs review
    `(ediff-current-diff-B ((,c :inherit diff-added)))
    `(ediff-current-diff-C ((,c :inherit diff-changed)))
    `(ediff-even-diff-A ((,c :background ,bg-dim)))
    `(ediff-even-diff-Ancestor ((,c :background ,bg-dim)))
    `(ediff-even-diff-B ((,c :background ,bg-dim)))
    `(ediff-even-diff-C ((,c :background ,bg-dim)))
    `(ediff-fine-diff-A ((,c :inherit diff-refine-removed)))
    `(ediff-fine-diff-Ancestor ((,c :inherit diff-refine-cyan)))
    `(ediff-fine-diff-B ((,c :inherit diff-refine-added)))
    `(ediff-fine-diff-C ((,c :inherit diff-refine-changed)))
    `(ediff-odd-diff-A ((,c :inherit ediff-even-diff-A)))
    `(ediff-odd-diff-Ancestor ((,c :inherit ediff-even-diff-Ancestor)))
    `(ediff-odd-diff-B ((,c :inherit ediff-even-diff-B)))
    `(ediff-odd-diff-C ((,c :inherit ediff-even-diff-C)))
;;;; eldoc
    ;; NOTE: see https://github.com/purcell/package-lint/issues/187
    (list 'eldoc-highlight-function-argument `((,c :inherit warning :background ,bg-warning)))
;;;; elfeed
    `(elfeed-log-date-face ((,c :inherit elfeed-search-date-face)))
    `(elfeed-log-debug-level-face ((,c :inherit elfeed-search-filter-face)))
    `(elfeed-log-error-level-face ((,c :inherit error)))
    `(elfeed-log-info-level-face ((,c :inherit success)))
    `(elfeed-log-warn-level-face ((,c :inherit warning)))
    `(elfeed-search-date-face ((,c :foreground ,date)))
    `(elfeed-search-feed-face ((,c :foreground ,accent-1)))
    `(elfeed-search-filter-face ((,c :inherit bold)))
    `(elfeed-search-last-update-face ((,c :inherit bold :foreground ,date)))
    `(elfeed-search-tag-face ((,c :foreground ,accent-0)))
    `(elfeed-search-title-face ((,c :foreground ,fg-dim)))
    `(elfeed-search-unread-count-face (( )))
    `(elfeed-search-unread-title-face ((,c :inherit bold :foreground ,fg-main)))
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
    `(eshell-ls-special ((,c :foreground ,magenta)))
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
    `(font-lock-regexp-grouping-backslash ((,c :inherit bold :foreground ,info)))
    `(font-lock-regexp-grouping-construct ((,c :inherit bold :foreground ,err)))
    `(font-lock-string-face ((,c :foreground ,string)))
    `(font-lock-type-face ((,c :foreground ,type)))
    `(font-lock-variable-name-face ((,c :foreground ,variable)))
    `(font-lock-warning-face ((,c :foreground ,warning)))
;;;; git-commit
    `(git-commit-comment-action ((,c :inherit font-lock-comment-face)))
    `(git-commit-comment-branch-local ((,c :inherit font-lock-comment-face :foreground ,accent-0)))
    `(git-commit-comment-heading ((,c :inherit (bold font-lock-comment-face))))
    `(git-commit-comment-file ((,c :inherit font-lock-comment-face :foreground ,name)))
    `(git-commit-keyword ((,c :foreground ,keyword)))
    `(git-commit-nonempty-second-line ((,c :background ,bg-err :foreground ,err)))
    `(git-commit-overlong-summary ((,c :background ,bg-warning :foreground ,warning)))
    `(git-commit-summary ((,c :inherit bold :foreground ,accent-0)))
;;;; git-rebase
    `(git-rebase-comment-hash ((,c :inherit font-lock-comment-face :foreground ,constant)))
    `(git-rebase-comment-heading  ((,c :inherit (bold font-lock-comment-face))))
    `(git-rebase-description ((,c :foreground ,fg-main)))
    `(git-rebase-hash ((,c :foreground ,constant)))
;;;; gnus WORK-IN-PROGRESS
    `(gnus-emphasis-highlight-words ((,c :background ,bg-alt :foreground ,warning)))
    `(gnus-header-content ((,c :inherit message-header-other)))
    `(gnus-header-from ((,c :inherit message-header-to :underline nil)))
    `(gnus-header-name ((,c :inherit message-header-name)))
    `(gnus-header-newsgroups ((,c :inherit message-header-newsgroups)))
    `(gnus-header-subject ((,c :inherit message-header-subject)))
;;;; info
    `(Info-quoted ((,c :inherit ef-themes-fixed-pitch :foreground ,accent-0))) ; the capitalization is canonical
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
    `(isearch ((,c :background ,bg-yellow :foreground ,fg-intense)))
    `(isearch-fail ((,c :background ,bg-red :foreground ,fg-intense)))
    `(isearch-group-1 ((,c :background ,bg-magenta :foreground ,fg-intense)))
    `(isearch-group-2 ((,c :background ,bg-green :foreground ,fg-intense)))
    `(lazy-highlight ((,c :background ,bg-blue :foreground ,fg-intense)))
    `(match ((,c :background ,bg-alt :foreground ,fg-intense)))
    `(query-replace ((,c :background ,bg-red :foreground ,fg-intense)))
;;;; keycast
    `(keycast-command ((,c :inherit bold)))
    `(keycast-key ((,c :background ,bg-accent :foreground ,fg-accent)))
;;;; line numbers (display-line-numbers-mode and global variant)
    ;; We need to fall back to `default' otherwise line numbers do not
    ;; scale when using `text-scale-adjust'.
    `(line-number ((,c :inherit (shadow default))))
    `(line-number-current-line ((,c :inherit (bold line-number) :foreground ,fg-intense)))
    `(line-number-major-tick ((,c :inherit line-number :background ,bg-alt :foreground ,info)))
    `(line-number-minor-tick ((,c :inherit line-number :background ,bg-dim :foreground ,warning)))
;;;; magit
    `(magit-bisect-bad ((,c :inherit error)))
    `(magit-bisect-good ((,c :inherit success)))
    `(magit-bisect-skip ((,c :inherit warning)))
    `(magit-blame-date (( )))
    `(magit-blame-dimmed ((,c :inherit shadow)))
    `(magit-blame-hash ((,c :inherit shadow)))
    `(magit-blame-heading ((,c :background ,bg-dim :extend t)))
    `(magit-blame-highlight ((,c :background ,bg-active :foreground ,fg-intense)))
    `(magit-blame-name (( )))
    `(magit-blame-summary (( )))
    `(magit-branch-local ((,c :foreground ,accent-0)))
    `(magit-branch-remote ((,c :foreground ,accent-1)))
    `(magit-branch-upstream ((,c :inherit italic)))
    `(magit-branch-warning ((,c :inherit warning)))
    `(magit-cherry-equivalent ((,c :foreground ,magenta)))
    `(magit-cherry-unmatched ((,c :foreground ,cyan)))
    `(magit-diff-added ((,c :background ,bg-added-faint)))
    `(magit-diff-added-highlight ((,c :background ,bg-added)))
    `(magit-diff-base ((,c :background ,bg-changed-faint)))
    `(magit-diff-base-highlight ((,c :background ,bg-changed)))
    `(magit-diff-context ((,c :inherit shadow)))
    `(magit-diff-context-highlight ((,c :background ,bg-dim)))
    `(magit-diff-file-heading ((,c :inherit bold :foreground ,accent-0)))
    `(magit-diff-file-heading-highlight ((,c :inherit magit-diff-file-heading :background ,bg-alt)))
    `(magit-diff-file-heading-selection ((,c :inherit bold :background ,bg-hover-alt :foreground ,fg-intense)))
    `(magit-diff-hunk-heading ((,c :inherit bold :background ,bg-dim)))
    `(magit-diff-hunk-heading-highlight ((,c :inherit bold :background ,bg-active :foreground ,fg-intense)))
    `(magit-diff-hunk-heading-selection ((,c :inherit bold :background ,bg-hover-alt :foreground ,fg-intense)))
    `(magit-diff-hunk-region ((,c :inherit bold)))
    `(magit-diff-lines-boundary ((,c :background ,fg-intense)))
    `(magit-diff-lines-heading ((,c :background ,fg-alt :foreground ,bg-alt)))
    `(magit-diff-removed ((,c :background ,bg-removed-faint)))
    `(magit-diff-removed-highlight ((,c :background ,bg-removed)))
    `(magit-diffstat-added ((,c :inherit success)))
    `(magit-diffstat-removed ((,c :inherit error)))
    `(magit-dimmed ((,c :inherit shadow)))
    `(magit-filename ((,c :foreground ,name)))
    `(magit-hash ((,c :inherit shadow)))
    `(magit-head ((,c :inherit magit-branch-local)))
    `(magit-header-line ((,c :inherit bold)))
    `(magit-header-line-key ((,c :inherit ef-themes-key-binding)))
    `(magit-header-line-log-select ((,c :inherit bold)))
    `(magit-keyword ((,c :foreground ,keyword)))
    `(magit-keyword-squash ((,c :inherit bold :foreground ,warning)))
    `(magit-log-author ((,c :foreground ,name)))
    `(magit-log-date ((,c :foreground ,date)))
    `(magit-log-graph ((,c :inherit shadow)))
    `(magit-mode-line-process ((,c :inherit bold)))
    `(magit-mode-line-process-error ((,c :inherit bold-italic)))
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
    `(magit-section-heading-selection ((,c :inherit bold :background ,bg-hover-alt :foreground ,fg-intense)))
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
    `(marginalia-date ((,c :foreground ,date)))
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
    `(markdown-inline-code-face ((,c :inherit ef-themes-fixed-pitch :foreground ,accent-1))) ; same as `org-code'
    `(markdown-italic-face ((,c :inherit italic)))
    `(markdown-language-keyword-face ((,c :inherit ef-themes-fixed-pitch :background ,bg-dim)))
    `(markdown-line-break-face ((,c :inherit nobreak-space)))
    `(markdown-link-face ((,c :inherit link)))
    `(markdown-markup-face ((,c :inherit shadow)))
    `(markdown-metadata-key-face ((,c :inherit bold)))
    `(markdown-metadata-value-face ((,c :foreground ,string)))
    `(markdown-missing-link-face ((,c :inherit warning)))
    `(markdown-pre-face ((,c :inherit markdown-code-face)))
    `(markdown-table-face ((,c :inherit ef-themes-fixed-pitch :foreground ,fg-alt))) ; same as `org-table'
    `(markdown-url-face ((,c :foreground ,fg-alt)))
;;;; messages
    `(message-cited-text-1 ((,c :foreground ,mail-0)))
    `(message-cited-text-2 ((,c :foreground ,mail-1)))
    `(message-cited-text-3 ((,c :foreground ,mail-2)))
    `(message-cited-text-4 ((,c :foreground ,mail-3)))
    `(message-header-name ((,c :inherit bold)))
    `(message-header-newsgroups ((,c :inherit message-header-other)))
    `(message-header-to ((,c :inherit bold :foreground ,mail-0)))
    `(message-header-cc ((,c :foreground ,mail-1)))
    `(message-header-subject ((,c :inherit bold :foreground ,mail-2)))
    `(message-header-xheader ((,c :foreground ,mail-3)))
    `(message-header-other ((,c :foreground ,mail-4)))
    `(message-mml ((,c :foreground ,info)))
    `(message-separator ((,c :background ,bg-alt)))
;;;; mode-line
    `(mode-line ((,c :inherit ef-themes-ui-variable-pitch :background ,bg-mode-line :foreground ,fg-mode-line)))
    `(mode-line-active ((,c :inherit mode-line)))
    `(mode-line-buffer-id ((,c :inherit bold)))
    `(mode-line-emphasis ((,c :inherit bold-italic)))
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
;;;; notmuch
    `(notmuch-crypto-decryption ((,c :inherit (shadow bold))))
    `(notmuch-crypto-part-header ((,c :foreground ,magenta-cooler)))
    `(notmuch-crypto-signature-bad ((,c :inherit error)))
    `(notmuch-crypto-signature-good ((,c :inherit success)))
    `(notmuch-crypto-signature-good-key ((,c :inherit success)))
    `(notmuch-crypto-signature-unknown ((,c :inherit warning)))
    `(notmuch-jump-key ((,c :inherit ef-themes-key-binding)))
    `(notmuch-message-summary-face ((,c :inherit bold :background ,bg-dim)))
    `(notmuch-search-count ((,c :foreground ,fg-dim)))
    `(notmuch-search-date ((,c :foreground ,date)))
    `(notmuch-search-flagged-face ((,c :foreground ,err)))
    `(notmuch-search-matching-authors ((,c :foreground ,name)))
    `(notmuch-search-non-matching-authors ((,c :inherit shadow)))
    `(notmuch-search-subject ((,c :foreground ,fg-main)))
    `(notmuch-search-unread-face ((,c :inherit bold)))
    `(notmuch-tag-added ((,c :underline t)))
    `(notmuch-tag-deleted ((,c :strike-through t)))
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
;;;; orderless
    `(orderless-match-face-0 ((,c :inherit bold :foreground ,accent-0)))
    `(orderless-match-face-1 ((,c :inherit bold :foreground ,accent-1)))
    `(orderless-match-face-2 ((,c :inherit bold :foreground ,accent-2)))
    `(orderless-match-face-3 ((,c :inherit bold :foreground ,accent-3)))
;;;; org
    `(org-agenda-calendar-event ((,c :foreground ,fg-alt)))
    `(org-agenda-calendar-sexp ((,c :inherit (italic org-agenda-calendar-event))))
    `(org-agenda-clocking ((,c :background ,bg-alt :foreground ,red-warmer)))
    `(org-agenda-column-dateline ((,c :background ,bg-alt)))
    `(org-agenda-current-time ((,c :foreground ,variable)))
    `(org-agenda-date ((,c :inherit ef-themes-heading-3)))
    `(org-agenda-date-today ((,c :inherit org-agenda-date :underline t)))
    `(org-agenda-date-weekend ((,c :inherit org-agenda-date)))
    `(org-agenda-date-weekend-today ((,c :inherit org-agenda-date-today)))
    `(org-agenda-diary ((,c :inherit org-agenda-calendar-sexp)))
    `(org-agenda-dimmed-todo-face ((,c :inherit shadow)))
    `(org-agenda-done ((,c :inherit success)))
    `(org-agenda-filter-category ((,c :inherit bold)))
    `(org-agenda-filter-effort ((,c :inherit bold)))
    `(org-agenda-filter-regexp ((,c :inherit bold)))
    `(org-agenda-filter-tags ((,c :inherit bold)))
    `(org-agenda-restriction-lock ((,c :background ,bg-dim :foreground ,fg-dim)))
    `(org-agenda-structure ((,c :inherit ef-themes-heading-0)))
    `(org-agenda-structure-filter ((,c :inherit (warning org-agenda-structure))))
    `(org-agenda-structure-secondary ((,c :foreground ,rainbow-1)))
    `(org-archived ((,c :background ,bg-alt :foreground ,fg-alt)))
    `(org-block ((,c :inherit ef-themes-fixed-pitch :background ,bg-inactive :extend t)))
    `(org-block-begin-line ((,c :inherit (shadow ef-themes-fixed-pitch) :background ,bg-dim :extend t)))
    `(org-block-end-line ((,c :inherit org-block-begin-line)))
    `(org-checkbox ((,c :foreground ,warning)))
    `(org-checkbox-statistics-done ((,c :inherit org-done)))
    `(org-checkbox-statistics-todo ((,c :inherit org-todo)))
    `(org-clock-overlay ((,c :background ,bg-alt :foreground ,red-cooler)))
    `(org-code ((,c :inherit ef-themes-fixed-pitch :foreground ,accent-1)))
    `(org-column ((,c :inherit default :background ,bg-alt)))
    `(org-column-title ((,c :inherit (bold default) :underline t :background ,bg-alt)))
    `(org-date ((,c :inherit ef-themes-fixed-pitch :foreground ,date)))
    `(org-date-selected ((,c :foreground ,date :inverse-video t)))
    `(org-dispatcher-highlight ((,c :inherit warning :background ,bg-warning)))
    `(org-document-info ((,c :foreground ,rainbow-1)))
    `(org-document-info-keyword ((,c :inherit shadow)))
    `(org-document-title ((,c :inherit ef-themes-heading-0)))
    `(org-done ((,c :foreground ,info)))
    `(org-drawer ((,c :inherit (shadow ef-themes-fixed-pitch))))
    `(org-ellipsis (( ))) ; inherits from the heading's color
    `(org-footnote ((,c :inherit link)))
    `(org-formula ((,c :inherit ef-themes-fixed-pitch :foreground ,fnname)))
    `(org-headline-done ((,c :inherit org-done)))
    `(org-headline-todo ((,c :inherit org-todo)))
    `(org-hide ((,c :foreground ,bg-main)))
    `(org-indent ((,c :inherit org-hide)))
    `(org-imminent-deadline ((,c :inherit bold :foreground ,err)))
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
    `(org-macro ((,c :inherit ef-themes-fixed-pitch :foreground ,accent-2)))
    `(org-meta-line ((,c :inherit (shadow ef-themes-fixed-pitch))))
    `(org-mode-line-clock (( )))
    `(org-mode-line-clock-overrun ((,c :inherit bold :foreground ,err)))
    `(org-priority ((,c :foreground ,magenta)))
    `(org-property-value ((,c :inherit ef-themes-fixed-pitch :foreground ,fg-alt)))
    `(org-quote ((,c :inherit org-block)))
    `(org-scheduled ((,c :foreground ,warning)))
    `(org-scheduled-previously ((,c :inherit org-scheduled)))
    `(org-scheduled-today ((,c :inherit (bold org-scheduled))))
    `(org-sexp-date ((,c :foreground ,date)))
    `(org-special-keyword ((,c :inherit (shadow ef-themes-fixed-pitch))))
    `(org-table ((,c :inherit ef-themes-fixed-pitch :foreground ,fg-alt)))
    `(org-table-header ((,c :inherit (bold org-table))))
    `(org-tag (( )))
    `(org-tag-group ((,c :inherit (bold org-tag))))
    `(org-target ((,c :underline t)))
    `(org-time-grid ((,c :foreground ,fg-dim)))
    `(org-todo ((,c :foreground ,err)))
    `(org-upcoming-deadline ((,c :foreground ,warning)))
    `(org-upcoming-distant-deadline ((,c :inherit org-upcoming-deadline)))
    `(org-verbatim ((,c :inherit ef-themes-fixed-pitch :foreground ,accent-0)))
    `(org-verse ((,c :inherit org-block)))
    `(org-warning ((,c :inherit warning)))
;;;; org-habit
    `(org-habit-alert-face ((,c :background ,yellow-graph-0-bg :foreground "black"))) ; special case
    `(org-habit-alert-future-face ((,c :background ,yellow-graph-1-bg)))
    `(org-habit-clear-face ((,c :background ,blue-graph-0-bg :foreground "black"))) ; special case
    `(org-habit-clear-future-face ((,c :background ,blue-graph-1-bg)))
    `(org-habit-overdue-face ((,c :background ,red-graph-0-bg)))
    `(org-habit-overdue-future-face ((,c :background ,red-graph-1-bg)))
    `(org-habit-ready-face ((,c :background ,green-graph-0-bg :foreground "black"))) ; special case
    `(org-habit-ready-future-face ((,c :background ,green-graph-1-bg)))
;;;; org-modern
    `(org-modern-date-active ((,c :inherit org-modern-label :background ,bg-alt)))
    `(org-modern-date-inactive ((,c :inherit org-modern-label :background ,bg-dim :foreground ,fg-dim)))
    `(org-modern-done ((,c :inherit org-modern-label :background ,bg-info :foreground ,info)))
    `(org-modern-label ((,c :height 0.9 :width condensed :weight regular :underline nil)))
    `(org-modern-priority ((,c :inherit (org-modern-label org-priority) :background ,bg-dim)))
    `(org-modern-statistics ((,c :inherit org-modern-label :background ,bg-dim)))
    `(org-modern-tag ((,c :inherit (org-modern-label org-tag) :background ,bg-dim)))
    `(org-modern-time-active ((,c :inherit org-modern-label :background ,bg-active :foreground ,fg-intense)))
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
    `(package-status-available ((,c :foreground ,date)))
    `(package-status-avail-obso ((,c :inherit error)))
    `(package-status-built-in ((,c :foreground ,builtin)))
    `(package-status-dependency ((,c :foreground ,warning)))
    `(package-status-disabled ((,c :inherit error :strike-through t)))
    `(package-status-held ((,c :foreground ,warning)))
    `(package-status-incompat ((,c :inherit warning)))
    `(package-status-installed ((,c :foreground ,fg-alt)))
    `(package-status-new ((,c :inherit success)))
    `(package-status-unsigned ((,c :inherit error)))
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
    `(rainbow-delimiters-mismatched-face ((,c :background ,bg-red :foreground ,fg-intense)))
    `(rainbow-delimiters-unmatched-face ((,c :inherit (bold rainbow-delimiters-mismatched-face))))
;;;; rcirc
    `(rcirc-bright-nick ((,c :inherit bold :foreground ,fg-intense)))
    `(rcirc-dim-nick ((,c :inherit shadow)))
    `(rcirc-monospace-text ((,c :inherit fixed-pitch)))
    `(rcirc-my-nick ((,c :inherit bold :foreground ,accent-1)))
    `(rcirc-nick-in-message ((,c :inherit warning)))
    `(rcirc-nick-in-message-full-line ((,c :inherit italic)))
    `(rcirc-other-nick ((,c :inherit bold :foreground ,accent-0)))
    `(rcirc-prompt ((,c :inherit minibuffer-prompt)))
    `(rcirc-server ((,c :inherit shadow)))
    `(rcirc-timestamp ((,c :foreground ,date)))
    `(rcirc-track-keyword ((,c :inherit bold)))
    `(rcirc-track-nick ((,c :inherit warning)))
    `(rcirc-url ((,c :inherit link)))
;;;; regexp-builder (re-builder)
    `(reb-match-0 ((,c :background ,bg-cyan :foreground ,fg-intense)))
    `(reb-match-1 ((,c :background ,bg-magenta :foreground ,fg-intense)))
    `(reb-match-2 ((,c :background ,bg-red :foreground ,fg-intense)))
    `(reb-match-3 ((,c :background ,bg-yellow :foreground ,fg-intense)))
    `(reb-regexp-grouping-backslash ((,c :inherit font-lock-regexp-grouping-backslash)))
    `(reb-regexp-grouping-construct ((,c :inherit font-lock-regexp-grouping-construct)))
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
    `(show-paren-mismatch ((,c :background ,bg-red :foreground ,fg-intense)))
;;;; shell-script-mode (sh-mode)
    `(sh-heredoc ((,c :inherit font-lock-doc-face)))
    `(sh-quoted-exec ((,c :inherit font-lock-builtin-face)))
;;;; shr
    `(shr-code ((,c :inherit ef-themes-fixed-pitch :foreground ,accent-1))) ; same as `org-code'
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
;;;; vc (vc-dir.el, vc-hooks.el)
    `(vc-dir-directory ((,c :foreground ,accent-0)))
    `(vc-dir-file ((,c :foreground ,name)))
    `(vc-dir-header ((,c :foreground ,accent-1)))
    `(vc-dir-header-value ((,c :foreground ,accent-2)))
    `(vc-dir-mark-indicator ((,c :inherit success)))
    `(vc-dir-status-edited ((,c :inherit warning)))
    `(vc-dir-status-ignored ((,c :inherit shadow)))
    `(vc-dir-status-up-to-date (( )))
    `(vc-dir-status-warning ((,c :inherit error)))
    `(vc-conflict-state ((,c :inherit error)))
    `(vc-edited-state ((,c :inherit italic)))
    `(vc-locally-added-state ((,c :inherit italic)))
    `(vc-locked-state ((,c :inherit success)))
    `(vc-missing-state ((,c :inherit error)))
    `(vc-needs-update-state ((,c :inherit error)))
    `(vc-removed-state ((,c :inherit error)))
    `(vc-state-base (( )))
    `(vc-up-to-date-state (( )))
;;;; vertico
    `(vertico-current ((,c :background ,bg-completion)))
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
    `(whitespace-space-before-tab ((,c :background ,bg-red)))
    `(whitespace-tab ((,c :inherit whitespace-indentation)))
    `(whitespace-trailing ((,c :inherit whitespace-space-before-tab)))
;;;; widget
    `(widget-button ((,c :inherit bold :foreground ,link)))
    `(widget-button-pressed ((,c :inherit widget-button :foreground ,link-alt)))
    `(widget-documentation ((,c :inherit font-lock-doc-face)))
    `(widget-field ((,c :background ,bg-alt :foreground ,fg-main :extend nil)))
    `(widget-inactive ((,c :inherit shadow :background ,bg-dim)))
    `(widget-single-line-field ((,c :inherit widget-field)))
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
      '( ,red-graph-0-bg ,green-graph-0-bg ,yellow-graph-0-bg ,blue-graph-0-bg ,magenta-graph-0-bg ,cyan-graph-0-bg
         ,red-graph-1-bg ,green-graph-1-bg ,yellow-graph-1-bg ,blue-graph-1-bg ,magenta-graph-1-bg ,cyan-graph-1-bg)))
  "Custom variables for `ef-themes-theme'.")

;;; Theme macros

;;;###autoload
(defmacro ef-themes-theme (name palette)
  "Bind NAME's color PALETTE around face specs and variables.
Face specifications are passed to `custom-theme-set-faces'.
While variables are handled by `custom-theme-set-variables'.
Those are stored in `ef-themes-faces' and
`ef-themes-custom-variables' respectively."
  (declare (indent 0))
  (let ((sym (gensym))
        (colors (mapcar #'car (symbol-value palette))))
    `(let* ((c '((class color) (min-colors 256)))
            (,sym ,palette)
            ,@(mapcar (lambda (color)
                        (list color
                              `(let* ((value (car (alist-get ',color ,sym))))
                                 (if (stringp value)
                                     value
                                   (car (alist-get value ,sym))))))
                      colors))
       (custom-theme-set-faces ',name ,@ef-themes-faces)
       (custom-theme-set-variables ',name ,@ef-themes-custom-variables))))

;;; Use theme colors

(defmacro ef-themes-with-colors (&rest body)
  "Evaluate BODY with colors from current palette bound."
  (declare (indent 0))
  (let* ((sym (gensym))
         ;; NOTE 2022-08-23: We just give it a sample palette at this
         ;; stage.  It only needs to collect each car.  Then we
         ;; instantiate the actual theme's palette.  We have to do this
         ;; otherwise the macro does not work properly when called from
         ;; inside a function.
         (colors (mapcar #'car (symbol-value 'ef-light-palette))))
    `(let* ((c '((class color) (min-colors 256)))
            (,sym (ef-themes--current-theme-palette))
            ,@(mapcar (lambda (color)
                        (list color
                              `(let* ((value (car (alist-get ',color ,sym))))
                                 (if (stringp value)
                                     value
                                   (car (alist-get value ,sym))))))
                      colors))
       (ignore c ,@colors)            ; Silence unused variable warnings
       ,@body)))

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (file-equal-p dir (expand-file-name "themes/" data-directory))
      (add-to-list 'custom-theme-load-path dir))))

(provide 'ef-themes)
;;; ef-themes.el ends here
