<!--
SPDX-FileCopyrightText: 2022 Johannes Keyser

SPDX-License-Identifier: CC0-1.0
-->

# Executable code: A Bayesian psychophysics model of sense of agency

This repository provides executable Matlab code, derived from the Supplementary Source Codes of the publication:

Legaspi, Roberto, & Toyoizumi, Taro (2019).  
A Bayesian psychophysics model of sense of agency.  
_Nature Communications, 10(1), 4250_.  
<https://doi.org/10.1038/s41467-019-12170-0>

Emails: `{roberto.legaspi, taro.toyoizumi}@riken.jp`

Please note the following:

- This repository has 2 branches.
    - Branch `transcript` provides an unchanged transcript of the supplementary code.
    - Branch `main` provides a slightly refactored and generalized version of the code, typo fixes, etc.
- Any and all credit should go to the original authors.
  For license terms, please refer to [Licenses](#Licenses).

Please refer to [changelog.md](changelog.md) for a summary of differences between the files in this repository and the supplementary code of the publication.


## Usage

The Matlab scripts generate simulation data to plot the figures from the paper, and additional ones.
Each script lists its objectives in its header.

The scripts should be executed in the following order:

1. [create_SimulationData.m](create_SimulationData.m) draws sensory samples tauA, tauO for the subsequent scripts.
2. [find_muAO.m](find_muAO.m) performs a grid search for model parameter muAO.
3. [compute_PXisPrcShfts.m](compute_PXisPrcShfts.m) plots perceptual shifts as function of P(Xi=1), as in figures 2, 5b.
4. [compute_PerTrialPrcShfts.m](compute_PerTrialPrcShfts.m) plots perceptual shifts as function of difference (tauO − tauA), as in figures 3b-e, 4c-d.
5. [compute_CCEPXi1.m](compute_CCEPXi1.m) plots the confidence in causal estimate (CCE) as a function of P(Xi=1), as in figures 4a, 6a.
6. [compute_PerTrialCCE.m](compute_PerTrialCCE.m) plots the CCE as a function of the difference (tauO − tauA), as in figures 4b, 6b.

Note: To generate the results corresponding to the two temporal binding experiments, adjust the variable `Expr`:

- Value `Expr = 1` for Haggard et al. (2002), and
- Value `Expr = 2` for Wolpe et al. (2013).

The following helper scripts are called by the main scripts described above:

- [soa_IBexperiment.m](soa_IBexperiment.m)
- [soa_IBTargets.m](soa_IBTargets.m)
- [soa_IBoptimalPXi1.m](soa_IBoptimalPXi1.m)
- [soa_sortMatrices.m](soa_sortMatrices.m)
- [soa_plotPrcShfts.m](soa_plotPrcShfts.m)
- [soa_plotErrorBars.m](soa_plotErrorBars.m)
- [soa_plotBehaviors.m](soa_plotBehaviors.m)
- [soa_Sigmoid.m](soa_Sigmoid.m)
- [soa_computePrcShft.m](soa_computePrcShft.m)
- [soa_computeCCE.m](soa_computeCCE.m)
- [soa_getFileNames.m](soa_getFileNames.m)
- [soa_loadTauSamples.m](soa_loadTauSamples.m)

### References

- Legaspi, R., & Toyoizumi, T. (2019).
  A Bayesian psychophysics model of sense of agency.
  _Nature Communications, 10(1), 4250._
  <https://doi.org/10.1038/s41467-019-12170-0>
- Haggard, P., Clark, S. & Kalogeras, J. (2002).
  Voluntary action and conscious awareness.
  _Nat. Neurosci._ 5, 383–385.
- Wolpe, N., Haggard, P., Siebner, H. R. & Rowe, J. B. (2013).
  Cue integration and the perception of action in intentional binding.
  _Exp. Brain Res._ 229, 467–474.


## Licenses

Any and all credit should go to the original authors, see their license terms in [LICENSES/CC-BY-4.0.txt](LICENSES/CC-BY-4.0.txt).
A short summary of the license is provided on page 11 of the [paper](publication/LegaspiAndToyoizumi2019.pdf), and is available at <https://creativecommons.org/licenses/by/4.0/>.

To the extent possible under the law, all additions and changes are placed in the public domain under the CC0-1.0 license.
Please refer to [LICENSES/CC0-1.0.txt](LICENSES/CC0-1.0.txt) for the legal text.
You can also read a summary at <https://creativecommons.org/publicdomain/zero/1.0/>.

For all text files, the license is listed in its header.
All files in folder [publication](publication) are licensed under CC-BY-4.0.
All files in folder [outputs](outputs) are licensed under CC0-1.0.
This repository is [REUSE compliant](https://reuse.software/).
