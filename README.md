<!--
SPDX-FileCopyrightText: 2022 Johannes Keyser

SPDX-License-Identifier: CC0-1.0
-->

# Executable code: A Bayesian psychophysics model of sense of agency

The intent of this repository is to provide executable Matlab code, derived from the Supplementary Source Codes of the publication:

Legaspi, Roberto, & Toyoizumi, Taro (2019).  
A Bayesian psychophysics model of sense of agency.  
_Nature Communications, 10(1), 4250_.  
<https://doi.org/10.1038/s41467-019-12170-0>

Emails: `{roberto.legaspi, taro.toyoizumi}@riken.jp`

Please note the following:

- This repository has 2 branches.
    - Branch `transcript` aims to provide an unchanged transcript of the supplementary code.
    - Branch `main` aims to provide a more "convenient" version of the code, featuring shorter lines, fixed typos, etc.
- Any and all credit should go to the original authors.
  For legal terms, please refer to [LICENSES](LICENSES).

Please refer to to [changelog.md](changelog.md) for a summary of differences between the files in this repository and the supplementary code of the publication.


## Usage

These MATLAB scripts generates simulation data and plots the figures from the paper.
The scripts should be executed in the following order:

1. [create_SimulationData.m](create_SimulationData.m).
2. [find_muAO.m](find_muAO.m).
3. [compute_PXisPrcShfts.m](compute_PXisPrcShfts.m).
   The plots that were generated here were shown in Figs. 2 and 5b.
4. [compute_PerTrialPrcShfts.m](compute_PerTrialPrcShfts.m).
   The plots were shown in Figs. 3b, 3c, 3d and 3e, as well as 4c and 4d.
5. [compute_CCEPXi1.m](compute_CCEPXi1.m).
   The plots that were generated from this were shown in Figs. 4a and 6a.
6. [compute_PerTrialCCE.m](compute_PerTrialCCE.m).
   The plots were shown in Figs. 4b and 6b.

Each script contains a description and objectives in its header.

Note: To generate the results corresponding to the two intentional binding experiments, you should adjust the variable `Expr`:

- Value `Expr = 1` for Haggard et al. (2002), and
- Value `Expr = 2` for Wolpe et al. (2013).

The following auxiliary scripts are called by the main scripts described above:

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

Any and all credit should go to the original authors, see their license terms in [CC-BY-4.0.txt](CC-BY-4.0.txt).
A short summary is provided on page 11 of the publication.

To the extent possible under the law, all additions and changes are placed in the public domain under the CC0-1.0 license.
Please refer to [CC0-1.0.txt](CC0-1.0.txt) for the legal text.

This repository REUSE compliant, to clarify which parts are under which license.
For more information, visit <https://reuse.software/>.
