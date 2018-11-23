
# abcR

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

*abcR* is a wrapper for the *[abcjs](https://abcjs.net/%5D)* javascript
library.

## Status

*abcR* is currently in alpha and hence its functionality and interface
are subject to change. The package still needs to be documented.

## Installation

You can install *abcR* from Github by entering the following into your R
terminal:

``` r
if (!require(devtools)) install.packages("devtools")
devtools::install_github("pmcharrison/abcR")
```

## Example usage

Note: Github doesn’t allow README files to contain Javascript, so
examples can’t be shown directly here.

Displaying a pitch-class set within RStudio:

``` r
library(abcR)
view_pc_set(c(0, 4, 7))
```

Displaying a chord sequence (pitches are given in MIDI note numbers):

``` r
view_pi_chord_seq(list(c(48, 64, 67), c(47, 62, 67), c(48, 64, 67)))
```

Displaying a pitch-class set within an R markdown file:

``` r
html_from_pc_set(c(0, 4, 9))
```

Displaying an *abc* file:

``` r
html_from_abc_file(system.file("examples/example-song.abc",
                               package = "abcR"))
```

## Authors

  - *abcR*: Peter M. C. Harrison
  - *absjs*: Paul Rosen and Gregory Dyke

## License

Both *abcR* and *abcjs* are released under the MIT license.
