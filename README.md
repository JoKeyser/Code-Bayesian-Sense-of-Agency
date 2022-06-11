# Executable code: A Bayesian psychophysics model of sense of agency

The intent of this repository is to provide executable Matlab code, derived from the Supplementary Source Codes of the publication:

Legaspi, Roberto, & Toyoizumi, Toyoizumi (2019).  
A Bayesian psychophysics model of sense of agency.  
_Nature Communications, 10(1), 4250_.  
<https://doi.org/10.1038/s41467-019-12170-0>


Please note the following:

- This repository has 2 branches.
    - Branch `transcript` aims to provide an unchanged transcript of the supplementary code.
    - Branch `main` aims to provide a more "convenient" version of the code, featuring shorter lines, fixed typos, etc.
- Any and all credit should go to the original authors, see their license terms in [license.txt](license.txt) and page 11 of the publication.

Please refer to to [changelog.md](changelog.md) for a summary of differences between the files in this repository and the supplementary code of the publication.

---

*Below is a transcript of the first supplementary page, with some minor changes*:_
*i) file names are linked to their content, ii) references 3 and 22 were added, iii) removed function `soa_InitMatrix.m` (which only wrapped `zeros()`), iv) add function `soa_Sigmoid.m`.*

## Supplementary Source Codes

For the manuscript "A Bayesian psychophysics model of sense of agency"

by Roberto Legaspi & Taro Toyoizumi

Emails: `{roberto.legaspi, taro.toyoizumi}@riken.jp`

This supplementary information contains the MATLAB source codes that were used to generate the simulation data and plot the computation results for analyses.

Following is the order in which the main codes should be compiled and executed:

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

The descriptions and objectives of each of the above are written in their codes.
Note that to generate the results that correspond to the two intentional binding experiments that were studied, the variable `Expr` should be assigned the value `1` and `2` for Haggard et al.'s (Ref 3) and Wolpe et al.'s (Ref 22) studies, respectively.

Lastly, the following auxiliary source codes are called by the main codes described above:

- [soa_IBexperiment.m](soa_IBexperiment.m)
- [soa_IBTargets.m](soa_IBTargets.m)
- [soa_sortMatrices.m](soa_sortMatrices.m)
- [soa_plotPrcShfts.m](soa_plotPrcShfts.m)
- [soa_plotErrorBars.m](soa_plotErrorBars.m)
- [soa_plotBehaviors.m](soa_plotBehaviors.m)
- [soa_Sigmoid.m](soa_Sigmoid.m)


### References

- Legaspi, R., & Toyoizumi, T. (2019).
  A Bayesian psychophysics model of sense of agency.
  _Nature Communications, 10(1), 4250._
  <https://doi.org/10.1038/s41467-019-12170-0>
- Ref 3:
  Haggard, P., Clark, S. & Kalogeras, J. (2002).
  Voluntary action and conscious awareness.
  _Nat. Neurosci._ 5, 383–385.
- Ref 22:
  Wolpe, N., Haggard, P., Siebner, H. R. & Rowe, J. B. (2013).
  Cue integration and the perception of action in intentional binding.
  _Exp. Brain Res._ 229, 467–474.
