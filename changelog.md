# Changelog

## Purpose

This file documents a summary of the changes made to the
Supplementary Source Codes of the publication:

Legaspi, Roberto, & Toyoizumi, Toyoizumi (2019).  
A Bayesian psychophysics model of sense of agency.  
_Nature Communications, 10(1), 4250_.  
<https://doi.org/10.1038/s41467-019-12170-0>

The supplementary was retrieved on 7 April 2022 from
<https://static-content.springer.com/esm/art%3A10.1038%2Fs41467-019-12170-0/MediaObjects/41467_2019_12170_MOESM1_ESM.pdf>.

The unchanged supplementary PDF file is available in folder [publication](publication).

The overarching intent was to create executable code from the printed supplementary.

For an exhaustive set of all changes, you can inspect the Git log or compare Git commits.

## License

To the extent possible under the law, all changes are placed in the public domain.

All credit should go to the original authors, see their license terms in [README.md](README.md) and [license.txt](license.txt).

## Summary of changes

### Change summary for branch `transcript`

The purpose of branch `transcript` is to facilitate a direct visual comparison between the printed supplementary and the Matlab files in this repository.

The initial step was to use optical character recognition for bulk conversion of the printout.
The conversion script and its raw output is available in folder [ocr-conversion](ocr-conversion).

Subsequently, the following manual changes were made:

- Separation of text into Matlab files, as described in the printout.
- Matching the Matlab code with the printout by visual comparison.
    - There are two minor exceptions:
        1. Some comments are intended less than in the printout, to facilitate side-by-side comparison.
        2. Renamed all instances of function name `soa_plotPrcShts.m` with `soa_plotPrcShfts.m` for internal consistency; e.g. compare page 1 and 18 of the printout.
        
- FIXME: This branch requires the Statistics and Machine Learning Toolbox.

### Change summary for branch `main`

The purpose of branch `main` is to provide a slightly "more convenient" version of the code.

TODO.
