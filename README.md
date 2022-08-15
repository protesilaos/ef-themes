# Ef (εὖ) themes for GNU Emacs

WORK-IN-PROGRESS

Colourful light and dark themes.

## Screenshots (PRE-RELEASE and WORK-IN-PROGRESS)

**Those will be removed from the repo before the actual package is
released.**

The themes in order:

- `ef-spring`
- `ef-summer`
- `ef-day`
- `ef-night`
- `ef-winter`
- `ef-autumn`

![Ef Spring PRE-RELEASE DEMO](./screnshots/pre-release-ef-themes-demo-spring.png)

![Ef Summer PRE-RELEASE DEMO](./screnshots/pre-release-ef-themes-demo-summer.png)

![Ef Day PRE-RELEASE DEMO](./screnshots/pre-release-ef-themes-demo-day.png)

![Ef Night PRE-RELEASE DEMO](./screnshots/pre-release-ef-themes-demo-night.png)

![Ef Winter PRE-RELEASE DEMO](./screnshots/pre-release-ef-themes-demo-winter.png)

![Ef Autumn PRE-RELEASE DEMO](./screnshots/pre-release-ef-themes-demo-autumn.png)

## Principles

* No customisation options!  Either you like them or you don't.

* Curated list of supported packages.  I will only cover what I use
  and/or know is in a well-maintained state.

* Minimum contrast ratio of 4.5:1 against the main background (WCAG AA
  standard).  Use my `modus-themes` package (also built into Emacs 28 or
  higher) if you need top-class accessibility.

## Minimal VS maximal scope

The `ef-themes` are meant to be minimal in scope, as opposed to my
`modus-themes` whose accessibility requirements make them maximalist _by
necessity_.  The `modus-themes` are such because:

1. Accessibility is not a one-size-fits-all.  Customisation options are
   necessary to empower users.
2. Accessibility is as good as its weakest link.  If the user spends all
   day using FOO package, it needs to be perfectly legible, otherwise
   the whole theme fails to deliver on its promise.

The `ef-themes` can afford to be minimal because they do not have such a
lofty accessibility target.

## FAQ

### Will you stop using the modus-themes?

No.  For my workflow, accessibility is the most important quality.  The
`modus-themes` will remain my default choice.

### Then why develop the ef-themes?

Because I think that users deserve "pretty" themes that (i) do make some
considerations for legibility, and (ii) are not designed on a whimsy.

In other words, the `ef-themes` are my answer to those who like my
`modus-themes` but want something with a bit more flair.
