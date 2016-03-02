## What is it?

A “simple” `make` rule that allows pretty-printing short documentation for the
rules inside a Makefile:

![screenshot](http://i.imgur.com/42qlqxs.png)

## How does it work?

Easy: simply copy everything starting at `.DEFAULT_GOAL := show-help` to the end
of your own Makefile. Then document any rules by adding a single line starting
with `## ` *immediately before the rule*. E.g.:

```make
## Run unit tests
test:
    ./run-tests
```

Displaying the documentation is done by simply executing `make`. This overrides
any previously set default command — you may not wish to do so; in that case,
simply remove the line that sets the `.DEFAULT_GOAL`. You can then display the
help via `make show-help`. This makes it less discoverable, of course.

## Thanks

Based on [an idea](http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html)
by [@marmelab](https://twitter.com/marmelab).