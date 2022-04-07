# A Bayesian psychophysics model of sense of agency

Supplementary Source Codes

For the manuscript "A Bayesian psychophysics model of sense of agency"

by Roberto Legaspi & Taro Toyoizumi

Emails: `{roberto.legaspi, taro.toyoizumi}@riken.jp`

This supplementary information contains the MATLAB source codes that were used to generate the simulation data and plot the computation results for analyses.

Following is the order in which the main codes should be compiled and executed:

1. create_SimulationData.m.
2. find_muAO.m
3. compute_PXisPrcShfts.m.
   The plots that were generated here were shown in Figs. 2 and 5b.
4. compute_PerTrialPrcShfts.m.
   The plots were shown in Figs. 3b, 3c, 3d and 3e, as well as 4c and 4d.
5. compute_CCEPXi1.m.
   The plots that were generated from this were shown in Figs. 4a and 6a.
6. compute_PerTrialCCE.m.
   The plots were shown in Figs. 4b and 6b.

The descriptions and objectives of each of the above are written in their codes.
Note that to generate the results that correspond to the two intentional binding experiments that were studied, the variable `Expr` should be assigned the value `1` and `2` for Haggard et al.'s (Ref [3]) and Wolpe et al.'s (Ref [22]) studies, respectively.

Lastly, the following auxiliary source codes are called by the main codes described above:

1. soa_IBexperiment.m
2. soa_IBTargets.m
3. soa_InitMatrix.m
4. soa_sortMatrices.m
5. soa_plotPrcShfts.m
6. soa_plotErrorBars.m
7. soa_plotBehaviors.m


## Reference

- Legaspi, R., & Toyoizumi, T. (2019).
  A Bayesian psychophysics model of sense of agency.
  _Nature Communications, 10(1), 4250._
  <https://doi.org/10.1038/s41467-019-12170-0>

