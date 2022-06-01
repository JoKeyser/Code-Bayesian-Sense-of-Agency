This log lists the output files, console output and figures on a specific machine.
The log is intended for you to compare it to your own execution of the code.

NOTE: Before running, Matlab's random seed was set with `rng(1,'twister');`, as suggested in a comment in `create_SimulationData.m`, to make results reproducible.

NOTE: The scripts were run twice: Once with setting `ExpR = 1` and once with `ExpR = 2`.

The generated data files are saved the in subfolder [generated_data](generated_data).
The resulting figures are saved in the subfolder [figures](figures).

## Settings

The scripts were executed on a machine running Ubuntu 20.04,
here the (slightly redacted) output of `ver()` in Matlab:

```
>> ver()
-----------------------------------------------------------------------------------------------------
MATLAB Version: 9.11.0.1873467 (R2021b) Update 3
Operating System: Linux 5.4.0-113-generic #127-Ubuntu SMP Wed May 18 14:30:56 UTC 2022 x86_64
Java Version: Java 1.8.0_202-b08 with Oracle Corporation Java HotSpot(TM) 64-Bit Server VM mixed mode
-----------------------------------------------------------------------------------------------------
MATLAB                                                Version 9.11        (R2021b)
Optimization Toolbox                                  Version 9.2         (R2021b)
Signal Processing Toolbox                             Version 8.7         (R2021b)
Statistics and Machine Learning Toolbox               Version 12.2        (R2021b)
```

The order of script execution was from top to bottom of this log.
(Which is the same order as in the project README.)

## With setting `ExpR = 1`

### Output of `create_SimulationData.m`:

The script generates 6 files that you can compare with your own run:

```
Exp1Cond1_Vec_taoA.csv
Exp1Cond1_Vec_taoO.csv
Exp1Cond2_Vec_taoA.csv
Exp1Cond2_Vec_taoO.csv
Exp1Cond3_Vec_taoA.csv
Exp1Cond3_Vec_taoO.csv
```

The Matlab console output was:

```
============== tao DataSet Exp 1 Cond 1 ================
taoA [-253.70, 257.35] taoO [-10.93, 585.29]
tao statistics: 6.11 (66.17)	 265.21 (72.04)
taoA elements: 35000 taoO elements: 35000
==============================================

============== tao DataSet Exp 1 Cond 2 ================
taoA [-266.38, 467.69] taoO [-38.08, 559.54]
tao statistics: 82.68 (83.52)	 265.42 (72.30)
taoA elements: 35000 taoO elements: 35000
==============================================

============== tao DataSet Exp 1 Cond 3 ================
taoA [-356.94, 383.36] taoO [-23.22, 537.68]
tao statistics: 32.86 (78.38)	 264.61 (71.84)
taoA elements: 35000 taoO elements: 35000
==============================================
```


### Output of `find_muAO.m`

The console output was:

```
Action and outcome perceptual shifts per condition given muAO=190
Condition 1:	 1.0(1.00)	 -1.0(1.00)
Condition 2:	 -0.0(2.00)	 0.0(1.00)
Condition 3:	 1.0(1.00)	 -1.0(1.00)
model estimation error:	16.33:

Action and outcome perceptual shifts per condition given muAO=200
Condition 1:	 1.0(1.00)	 -1.0(1.00)
Condition 2:	 -0.0(2.00)	 0.0(1.00)
Condition 3:	 0.0(1.00)	 -0.0(1.00)
model estimation error:	16.00:

Action and outcome perceptual shifts per condition given muAO=210
Condition 1:	 1.0(1.00)	 -1.0(1.00)
Condition 2:	 -0.0(2.00)	 0.0(1.00)
Condition 3:	 0.0(1.00)	 -0.0(1.00)
model estimation error:	16.00:

Action and outcome perceptual shifts per condition given muAO=220
Condition 1:	 1.0(1.00)	 -1.0(1.00)
Condition 2:	 -1.0(2.00)	 0.0(1.00)
Condition 3:	 0.0(1.00)	 -0.0(1.00)
model estimation error:	15.67:

Action and outcome perceptual shifts per condition given muAO=230
Condition 1:	 0.0(1.00)	 -0.0(1.00)
Condition 2:	 -1.0(2.00)	 1.0(1.00)
Condition 3:	 0.0(1.00)	 -0.0(1.00)
model estimation error:	16.00:

Action and outcome perceptual shifts per condition given muAO=240
Condition 1:	 0.0(1.00)	 -0.0(1.00)
Condition 2:	 -1.0(2.00)	 1.0(1.00)
Condition 3:	 -0.0(1.00)	 0.0(1.00)
model estimation error:	16.00:

Action and outcome perceptual shifts per condition given muAO=250
Condition 1:	 0.0(1.00)	 -0.0(1.00)
Condition 2:	 -1.0(2.00)	 1.0(1.00)
Condition 3:	 -0.0(1.00)	 0.0(1.00)
model estimation error:	16.00:

Optimal muAO is 220 ms.
```


### Output of `compute_PXisPrcShfts.m`:

The script generated two data files and a plot:

```
Exp1_arrPrcShftA.csv
Exp1_arrPrcShftO.csv
Exp1_PXisPrcShfts.png
```

![](figures/Exp1_PXisPrcShfts.png)

NOTE: The script generates 2 plots per run, but only stores the second, because the file name is repeated (compare lines 121 and 125 of the transcript, or page 6 of the supplementary code):

```matlab
fnamePrcShft = sprintf('Exp%d_PXisPrcShfts.png',ExpR);
```

The console output was:

```
Condition 1  	 P(Xi=1): 1.00
uPercShfts   :	 Error in action  perceptual shift: 2.00
Error in outcome perceptual shift: 30.00

Condition 1  	 P(Xi=1): 0.90
uPercShfts   :	 Error in action  perceptual shift: 2.00
Error in outcome perceptual shift: 31.00

Condition 1  	 P(Xi=1): 0.80
uPercShfts   :	 Error in action  perceptual shift: 3.00
Error in outcome perceptual shift: 31.00

Condition 1  	 P(Xi=1): 0.70
uPercShfts   :	 Error in action  perceptual shift: 3.00
Error in outcome perceptual shift: 32.00

Condition 1  	 P(Xi=1): 0.60
uPercShfts   :	 Error in action  perceptual shift: 4.00
Error in outcome perceptual shift: 33.00

Condition 1  	 P(Xi=1): 0.50
uPercShfts   :	 Error in action  perceptual shift: 5.00
Error in outcome perceptual shift: 34.00

Condition 1  	 P(Xi=1): 0.40
uPercShfts   :	 Error in action  perceptual shift: 6.00
Error in outcome perceptual shift: 35.00

Condition 1  	 P(Xi=1): 0.30
uPercShfts   :	 Error in action  perceptual shift: 7.00
Error in outcome perceptual shift: 37.00

Condition 1  	 P(Xi=1): 0.20
uPercShfts   :	 Error in action  perceptual shift: 10.00
Error in outcome perceptual shift: 40.00

Condition 1  	 P(Xi=1): 0.10
uPercShfts   :	 Error in action  perceptual shift: 15.00
Error in outcome perceptual shift: 46.00

Condition 1  	 P(Xi=1): 0.00
uPercShfts   :	 Error in action  perceptual shift: 15.00
Error in outcome perceptual shift: 46.00


Condition 2  	 P(Xi=1): 1.00
uPercShfts   :	 Error in action  perceptual shift: 0.00
Error in outcome perceptual shift: 11.00

Condition 2  	 P(Xi=1): 0.90
uPercShfts   :	 Error in action  perceptual shift: 1.00
Error in outcome perceptual shift: 12.00

Condition 2  	 P(Xi=1): 0.80
uPercShfts   :	 Error in action  perceptual shift: 2.00
Error in outcome perceptual shift: 12.00

Condition 2  	 P(Xi=1): 0.70
uPercShfts   :	 Error in action  perceptual shift: 3.00
Error in outcome perceptual shift: 13.00

Condition 2  	 P(Xi=1): 0.60
uPercShfts   :	 Error in action  perceptual shift: 5.00
Error in outcome perceptual shift: 14.00

Condition 2  	 P(Xi=1): 0.50
uPercShfts   :	 Error in action  perceptual shift: 7.00
Error in outcome perceptual shift: 16.00

Condition 2  	 P(Xi=1): 0.40
uPercShfts   :	 Error in action  perceptual shift: 9.00
Error in outcome perceptual shift: 17.00

Condition 2  	 P(Xi=1): 0.30
uPercShfts   :	 Error in action  perceptual shift: 12.00
Error in outcome perceptual shift: 20.00

Condition 2  	 P(Xi=1): 0.20
uPercShfts   :	 Error in action  perceptual shift: 17.00
Error in outcome perceptual shift: 24.00

Condition 2  	 P(Xi=1): 0.10
uPercShfts   :	 Error in action  perceptual shift: 27.00
Error in outcome perceptual shift: 31.00

Condition 2  	 P(Xi=1): 0.00
uPercShfts   :	 Error in action  perceptual shift: 27.00
Error in outcome perceptual shift: 31.00


Condition 3  	 P(Xi=1): 1.00
uPercShfts   :	 Error in action  perceptual shift: 8.00
Error in outcome perceptual shift: 7.00

Condition 3  	 P(Xi=1): 0.90
uPercShfts   :	 Error in action  perceptual shift: 8.00
Error in outcome perceptual shift: 7.00

Condition 3  	 P(Xi=1): 0.80
uPercShfts   :	 Error in action  perceptual shift: 8.00
Error in outcome perceptual shift: 7.00

Condition 3  	 P(Xi=1): 0.70
uPercShfts   :	 Error in action  perceptual shift: 8.00
Error in outcome perceptual shift: 7.00

Condition 3  	 P(Xi=1): 0.60
uPercShfts   :	 Error in action  perceptual shift: 8.00
Error in outcome perceptual shift: 7.00

Condition 3  	 P(Xi=1): 0.50
uPercShfts   :	 Error in action  perceptual shift: 8.00
Error in outcome perceptual shift: 7.00

Condition 3  	 P(Xi=1): 0.40
uPercShfts   :	 Error in action  perceptual shift: 8.00
Error in outcome perceptual shift: 8.00

Condition 3  	 P(Xi=1): 0.30
uPercShfts   :	 Error in action  perceptual shift: 7.00
Error in outcome perceptual shift: 8.00

Condition 3  	 P(Xi=1): 0.20
uPercShfts   :	 Error in action  perceptual shift: 7.00
Error in outcome perceptual shift: 8.00

Condition 3  	 P(Xi=1): 0.10
uPercShfts   :	 Error in action  perceptual shift: 7.00
Error in outcome perceptual shift: 8.00

Condition 3  	 P(Xi=1): 0.00
uPercShfts   :	 Error in action  perceptual shift: 7.00
Error in outcome perceptual shift: 8.00
```


### Output of `compute_PerTrialPrcShfts.m`

The script generates four plots:

```
Exp1_perTrialBaselinePrcShfts.png
Exp1_perTrialOperantPrcShfts.png
Exp1_perTrialPrcShftA.png
Exp1_perTrialPrcShftO.png
```

![](figures/Exp1_perTrialBaselinePrcShfts.png)
![](figures/EExp1_perTrialOperantPrcShfts.png)
![](figures/EExp1_perTrialPrcShftA.png)
![](figures/EExp1_perTrialPrcShftO.png)


### Output of `compute_CCEPXi1.m`:

The script saves one plot, `Exp1_CCEPXi.png`.

![](figures/Exp1_CCEPXi.png)

The console output was:

```
Condition 1	 P(Xi=1): 1.00
CCE        :	 3.29e-04(6.84e-17)
Condition 1	 P(Xi=1): 0.90
CCE        :	 2.71e-04(4.46e-05)
Condition 1	 P(Xi=1): 0.80
CCE        :	 2.29e-04(5.05e-05)
Condition 1	 P(Xi=1): 0.70
CCE        :	 1.92e-04(5.01e-05)
Condition 1	 P(Xi=1): 0.60
CCE        :	 1.59e-04(4.65e-05)
Condition 1	 P(Xi=1): 0.50
CCE        :	 1.29e-04(4.11e-05)
Condition 1	 P(Xi=1): 0.40
CCE        :	 1.01e-04(3.43e-05)
Condition 1	 P(Xi=1): 0.30
CCE        :	 7.37e-05(2.67e-05)
Condition 1	 P(Xi=1): 0.20
CCE        :	 4.81e-05(1.83e-05)
Condition 1	 P(Xi=1): 0.10
CCE        :	 2.36e-05(9.37e-06)
Condition 1	 P(Xi=1): 0.00
CCE        :	 0.00e+00(0.00e+00)
Condition 2	 P(Xi=1): 1.00
CCE        :	 2.94e-04(5.99e-17)
Condition 2	 P(Xi=1): 0.90
CCE        :	 2.35e-04(4.45e-05)
Condition 2	 P(Xi=1): 0.80
CCE        :	 1.95e-04(4.84e-05)
Condition 2	 P(Xi=1): 0.70
CCE        :	 1.61e-04(4.66e-05)
Condition 2	 P(Xi=1): 0.60
CCE        :	 1.32e-04(4.23e-05)
Condition 2	 P(Xi=1): 0.50
CCE        :	 1.06e-04(3.65e-05)
Condition 2	 P(Xi=1): 0.40
CCE        :	 8.13e-05(2.99e-05)
Condition 2	 P(Xi=1): 0.30
CCE        :	 5.89e-05(2.28e-05)
Condition 2	 P(Xi=1): 0.20
CCE        :	 3.81e-05(1.54e-05)
Condition 2	 P(Xi=1): 0.10
CCE        :	 1.85e-05(7.77e-06)
Condition 2	 P(Xi=1): 0.00
CCE        :	 0.00e+00(0.00e+00)
Condition 3	 P(Xi=1): 1.00
CCE        :	 3.02e-04(4.14e-17)
Condition 3	 P(Xi=1): 0.90
CCE        :	 2.48e-04(3.81e-05)
Condition 3	 P(Xi=1): 0.80
CCE        :	 2.08e-04(4.34e-05)
Condition 3	 P(Xi=1): 0.70
CCE        :	 1.74e-04(4.30e-05)
Condition 3	 P(Xi=1): 0.60
CCE        :	 1.43e-04(3.98e-05)
Condition 3	 P(Xi=1): 0.50
CCE        :	 1.15e-04(3.49e-05)
Condition 3	 P(Xi=1): 0.40
CCE        :	 8.92e-05(2.90e-05)
Condition 3	 P(Xi=1): 0.30
CCE        :	 6.50e-05(2.24e-05)
Condition 3	 P(Xi=1): 0.20
CCE        :	 4.21e-05(1.52e-05)
Condition 3	 P(Xi=1): 0.10
CCE        :	 2.05e-05(7.74e-06)
Condition 3	 P(Xi=1): 0.00
CCE        :	 0.00e+00(0.00e+00)
```

### Output of `compute_PerTrialCCE.m`

The script saves one plot, `Exp1_perTrialCCE.png`:

![](figures/Exp1_perTrialCCE.png)


## FIXME: Add outputs with ExpR = 2.
