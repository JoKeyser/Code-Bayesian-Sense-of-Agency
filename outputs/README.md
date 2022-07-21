This log lists the output files, console output and figures on a specific machine.
The log is intended for you to compare it to your own execution of the code.

NOTE: Before running, Matlab's random seed was set with `rng(1,'twister');`, as suggested in a comment in `create_SimulationData.m`, to make results reproducible.

NOTE: The samples were generated with `randn()` instead of `normrnd()` from the Statistics Toolbox, by setting `Flag_Use_Statistics_Toolbox = false`.
You can compare the outputs here with those in branch `transcript` that used the Toolbox.

NOTE: The scripts were run twice: Once with setting `ExpR = 1` and once with `ExpR = 2`.

The generated data files are saved the in subfolder [generated_data](generated_data).
The resulting figures are saved in the subfolder [figures](figures).


## Settings

The scripts were executed on a machine running Ubuntu 20.04,
here the (slightly redacted) output of `ver()` in Matlab:

```
>> ver()
-----------------------------------------------------------------------------------------------------
MATLAB Version: 9.7.0.1737446 (R2019b) Update 9
Operating System: Linux 5.4.0-117-generic #132-Ubuntu SMP Thu Jun 2 00:39:06 UTC 2022 x86_64
Java Version: Java 1.8.0_202-b08 with Oracle Corporation Java HotSpot(TM) 64-Bit Server VM mixed mode
-----------------------------------------------------------------------------------------------------
MATLAB                                                Version 9.7         (R2019b)
```

The order of script execution was from top to bottom of this log.
(Which is the same order as in the project README.)


## Outputs with setting `ExpR = 1`

First, the output with setting `ExpR = 1` in every script.
Further below are the outputs with setting `ExpR = 2`.

### Output of `create_SimulationData.m`

The script generates 6 files that you can compare with your own run:

```
Exp1Cond1_Vec_tauA.csv
Exp1Cond1_Vec_tauO.csv
Exp1Cond2_Vec_tauA.csv
Exp1Cond2_Vec_tauO.csv
Exp1Cond3_Vec_tauA.csv
Exp1Cond3_Vec_tauO.csv
```

The Matlab console output was:

```
========= tau sample statistics, exp 1 cond 1 =========
ranges      tauA [-253.7, 257.3],  tauO [-10.9, 585.3]
means (SDs) tauA 6.1 (66.2),  tauO 265.2 (72.0)
sample size tauA 35000,  tauO 35000
=======================================================

========= tau sample statistics, exp 1 cond 2 =========
ranges      tauA [-266.4, 467.7],  tauO [-38.1, 559.5]
means (SDs) tauA 82.7 (83.5),  tauO 265.4 (72.3)
sample size tauA 35000,  tauO 35000
=======================================================

========= tau sample statistics, exp 1 cond 3 =========
ranges      tauA [-356.9, 383.4],  tauO [-23.2, 537.7]
means (SDs) tauA 32.9 (78.4),  tauO 264.6 (71.8)
sample size tauA 35000,  tauO 35000
=======================================================
```


### Output of `find_muAO.m`

The console output was:

```
Action + outcome perceptual shifts given muAO = 190 ms:
	Condition 1:	+31 (44) ms,	-37 (53) ms
	Condition 2:	 -4 (62) ms,	 +3 (47) ms
	Condition 3:	+22 (57) ms,	-19 (48) ms
Avg. model estimation error:	22.7.

Action + outcome perceptual shifts given muAO = 200 ms:
	Condition 1:	+27 (44) ms,	-32 (53) ms
	Condition 2:	-10 (62) ms,	 +7 (47) ms
	Condition 3:	+17 (57) ms,	-14 (48) ms
Avg. model estimation error:	17.7.

Action + outcome perceptual shifts given muAO = 210 ms:
	Condition 1:	+22 (44) ms,	-26 (53) ms
	Condition 2:	-15 (62) ms,	+12 (47) ms
	Condition 3:	+12 (57) ms,	-10 (48) ms
Avg. model estimation error:	12.7.

Action + outcome perceptual shifts given muAO = 220 ms:
	Condition 1:	+18 (44) ms,	-21 (53) ms
	Condition 2:	-21 (62) ms,	+16 (47) ms
	Condition 3:	 +6 (57) ms,	 -5 (48) ms
Avg. model estimation error:	7.3.

Action + outcome perceptual shifts given muAO = 230 ms:
	Condition 1:	+13 (44) ms,	-16 (53) ms
	Condition 2:	-27 (62) ms,	+20 (47) ms
	Condition 3:	 +1 (57) ms,	 -1 (48) ms
Avg. model estimation error:	3.3.

Action + outcome perceptual shifts given muAO = 240 ms:
	Condition 1:	 +9 (44) ms,	-10 (53) ms
	Condition 2:	-32 (62) ms,	+24 (47) ms
	Condition 3:	 -4 (57) ms,	 +4 (48) ms
Avg. model estimation error:	4.7.

Action + outcome perceptual shifts given muAO = 250 ms:
	Condition 1:	 +4 (44) ms,	 -5 (53) ms
	Condition 2:	-38 (62) ms,	+29 (47) ms
	Condition 3:	-10 (57) ms,	 +8 (48) ms
Avg. model estimation error:	8.3.

For ExpR = 1, optimal muAO is 230 ms.
```


### Output of `compute_PXisPrcShfts.m`

The script generated two data files and a plot:

```
Exp1_arrPrcShftA.csv
Exp1_arrPrcShftO.csv
Exp1_PXisPrcShftsAO.png
Exp1_PXisPrcShfts.png
```

<img src="figures/Exp1_PXisPrcShftsAO.png" width=300px />
<br />
<img src="figures/Exp1_PXisPrcShfts.png" width=300px />

The console output was:

```
Condition 1, P(Xi=1) = 1.0
 Model-predicted mean (SD) perceptual shifts:
 Action 13.2 (44.2) ms,  Outcome -15.7 (52.6) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 2 ms,  Outcome 30 ms.

Condition 1, P(Xi=1) = 0.9
 Model-predicted mean (SD) perceptual shifts:
 Action 12.7 (43.4) ms,  Outcome -15.1 (51.6) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 2 ms,  Outcome 31 ms.

Condition 1, P(Xi=1) = 0.8
 Model-predicted mean (SD) perceptual shifts:
 Action 12.2 (42.5) ms,  Outcome -14.6 (50.6) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 3 ms,  Outcome 31 ms.

Condition 1, P(Xi=1) = 0.7
 Model-predicted mean (SD) perceptual shifts:
 Action 11.8 (41.6) ms,  Outcome -14.0 (49.5) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 3 ms,  Outcome 32 ms.

Condition 1, P(Xi=1) = 0.6
 Model-predicted mean (SD) perceptual shifts:
 Action 11.2 (40.5) ms,  Outcome -13.3 (48.2) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 4 ms,  Outcome 33 ms.

Condition 1, P(Xi=1) = 0.5
 Model-predicted mean (SD) perceptual shifts:
 Action 10.4 (38.9) ms,  Outcome -12.3 (46.4) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 5 ms,  Outcome 34 ms.

Condition 1, P(Xi=1) = 0.4
 Model-predicted mean (SD) perceptual shifts:
 Action 9.3 (36.9) ms,  Outcome -11.1 (43.9) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 6 ms,  Outcome 35 ms.

Condition 1, P(Xi=1) = 0.3
 Model-predicted mean (SD) perceptual shifts:
 Action 7.8 (33.7) ms,  Outcome -9.3 (40.1) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 7 ms,  Outcome 37 ms.

Condition 1, P(Xi=1) = 0.2
 Model-predicted mean (SD) perceptual shifts:
 Action 5.2 (27.2) ms,  Outcome -6.1 (32.3) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 10 ms,  Outcome 40 ms.

Condition 1, P(Xi=1) = 0.1
 Model-predicted mean (SD) perceptual shifts:
 Action 0.3 (6.7) ms,  Outcome -0.4 (8.0) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 15 ms,  Outcome 46 ms.

Condition 1, P(Xi=1) = 0.0
 Model-predicted mean (SD) perceptual shifts:
 Action 0.0 (0.0) ms,  Outcome 0.0 (0.0) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 15 ms,  Outcome 46 ms.

--------------------------------------------------------

Condition 2, P(Xi=1) = 1.0
 Model-predicted mean (SD) perceptual shifts:
 Action -26.7 (62.4) ms,  Outcome 20.1 (47.0) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 0 ms,  Outcome 11 ms.

Condition 2, P(Xi=1) = 0.9
 Model-predicted mean (SD) perceptual shifts:
 Action -25.7 (60.8) ms,  Outcome 19.3 (45.8) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 1 ms,  Outcome 12 ms.

Condition 2, P(Xi=1) = 0.8
 Model-predicted mean (SD) perceptual shifts:
 Action -24.6 (59.4) ms,  Outcome 18.5 (44.7) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 2 ms,  Outcome 12 ms.

Condition 2, P(Xi=1) = 0.7
 Model-predicted mean (SD) perceptual shifts:
 Action -23.5 (58.1) ms,  Outcome 17.7 (43.7) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 3 ms,  Outcome 13 ms.

Condition 2, P(Xi=1) = 0.6
 Model-predicted mean (SD) perceptual shifts:
 Action -22.2 (56.3) ms,  Outcome 16.7 (42.3) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 5 ms,  Outcome 14 ms.

Condition 2, P(Xi=1) = 0.5
 Model-predicted mean (SD) perceptual shifts:
 Action -20.4 (54.1) ms,  Outcome 15.4 (40.7) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 7 ms,  Outcome 16 ms.

Condition 2, P(Xi=1) = 0.4
 Model-predicted mean (SD) perceptual shifts:
 Action -18.3 (51.2) ms,  Outcome 13.7 (38.6) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 9 ms,  Outcome 17 ms.

Condition 2, P(Xi=1) = 0.3
 Model-predicted mean (SD) perceptual shifts:
 Action -15.0 (46.7) ms,  Outcome 11.3 (35.1) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 12 ms,  Outcome 20 ms.

Condition 2, P(Xi=1) = 0.2
 Model-predicted mean (SD) perceptual shifts:
 Action -9.6 (37.9) ms,  Outcome 7.2 (28.5) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 17 ms,  Outcome 24 ms.

Condition 2, P(Xi=1) = 0.1
 Model-predicted mean (SD) perceptual shifts:
 Action -0.5 (9.2) ms,  Outcome 0.4 (6.9) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 27 ms,  Outcome 31 ms.

Condition 2, P(Xi=1) = 0.0
 Model-predicted mean (SD) perceptual shifts:
 Action 0.0 (0.0) ms,  Outcome 0.0 (0.0) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 27 ms,  Outcome 31 ms.

--------------------------------------------------------

Condition 3, P(Xi=1) = 1.0
 Model-predicted mean (SD) perceptual shifts:
 Action 0.9 (56.7) ms,  Outcome -0.8 (48.3) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 8 ms,  Outcome 7 ms.

Condition 3, P(Xi=1) = 0.9
 Model-predicted mean (SD) perceptual shifts:
 Action 1.0 (55.9) ms,  Outcome -0.8 (47.7) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 8 ms,  Outcome 7 ms.

Condition 3, P(Xi=1) = 0.8
 Model-predicted mean (SD) perceptual shifts:
 Action 1.0 (55.0) ms,  Outcome -0.8 (46.9) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 8 ms,  Outcome 7 ms.

Condition 3, P(Xi=1) = 0.7
 Model-predicted mean (SD) perceptual shifts:
 Action 0.9 (53.8) ms,  Outcome -0.8 (45.8) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 8 ms,  Outcome 7 ms.

Condition 3, P(Xi=1) = 0.6
 Model-predicted mean (SD) perceptual shifts:
 Action 0.8 (52.7) ms,  Outcome -0.7 (44.9) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 8 ms,  Outcome 7 ms.

Condition 3, P(Xi=1) = 0.5
 Model-predicted mean (SD) perceptual shifts:
 Action 0.7 (50.8) ms,  Outcome -0.6 (43.3) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 8 ms,  Outcome 7 ms.

Condition 3, P(Xi=1) = 0.4
 Model-predicted mean (SD) perceptual shifts:
 Action 0.5 (48.2) ms,  Outcome -0.4 (41.1) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 8 ms,  Outcome 8 ms.

Condition 3, P(Xi=1) = 0.3
 Model-predicted mean (SD) perceptual shifts:
 Action 0.5 (43.9) ms,  Outcome -0.4 (37.4) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 7 ms,  Outcome 8 ms.

Condition 3, P(Xi=1) = 0.2
 Model-predicted mean (SD) perceptual shifts:
 Action 0.4 (35.7) ms,  Outcome -0.4 (30.4) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 7 ms,  Outcome 8 ms.

Condition 3, P(Xi=1) = 0.1
 Model-predicted mean (SD) perceptual shifts:
 Action 0.0 (8.7) ms,  Outcome -0.0 (7.4) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 7 ms,  Outcome 8 ms.

Condition 3, P(Xi=1) = 0.0
 Model-predicted mean (SD) perceptual shifts:
 Action 0.0 (0.0) ms,  Outcome 0.0 (0.0) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 7 ms,  Outcome 8 ms.
```


### Output of `compute_PerTrialPrcShfts.m`

The script generates four subplots in one figure:

```
Exp1_perTrialPrcShfts.png
```

<img src="figures/Exp1_perTrialPrcShfts.png" width=600px />


### Output of `compute_CCEPXi1.m`

The script saves one plot, `Exp1_CCEPXi.png`.

<img src="figures/Exp1_CCEPXi.png" width=300px />

The console output was:

```
Condition 1	 P(Xi=1): 1.00
Condition 1, P(Xi=1) = 1.0
 CCE mean (SD): 3.29e-04 (7.83e-17)
Condition 1, P(Xi=1) = 0.9
 CCE mean (SD): 2.71e-04 (4.46e-05)
Condition 1, P(Xi=1) = 0.8
 CCE mean (SD): 2.29e-04 (5.05e-05)
Condition 1, P(Xi=1) = 0.7
 CCE mean (SD): 1.92e-04 (5.01e-05)
Condition 1, P(Xi=1) = 0.6
 CCE mean (SD): 1.59e-04 (4.65e-05)
Condition 1, P(Xi=1) = 0.5
 CCE mean (SD): 1.29e-04 (4.11e-05)
Condition 1, P(Xi=1) = 0.4
 CCE mean (SD): 1.01e-04 (3.43e-05)
Condition 1, P(Xi=1) = 0.3
 CCE mean (SD): 7.37e-05 (2.67e-05)
Condition 1, P(Xi=1) = 0.2
 CCE mean (SD): 4.81e-05 (1.83e-05)
Condition 1, P(Xi=1) = 0.1
 CCE mean (SD): 2.36e-05 (9.37e-06)
Condition 1, P(Xi=1) = 0.0
 CCE mean (SD): 0.00e+00 (0.00e+00)
------------------------------------
Condition 2, P(Xi=1) = 1.0
 CCE mean (SD): 2.94e-04 (1.79e-16)
Condition 2, P(Xi=1) = 0.9
 CCE mean (SD): 2.35e-04 (4.45e-05)
Condition 2, P(Xi=1) = 0.8
 CCE mean (SD): 1.95e-04 (4.84e-05)
Condition 2, P(Xi=1) = 0.7
 CCE mean (SD): 1.61e-04 (4.66e-05)
Condition 2, P(Xi=1) = 0.6
 CCE mean (SD): 1.32e-04 (4.23e-05)
Condition 2, P(Xi=1) = 0.5
 CCE mean (SD): 1.06e-04 (3.65e-05)
Condition 2, P(Xi=1) = 0.4
 CCE mean (SD): 8.13e-05 (2.99e-05)
Condition 2, P(Xi=1) = 0.3
 CCE mean (SD): 5.89e-05 (2.28e-05)
Condition 2, P(Xi=1) = 0.2
 CCE mean (SD): 3.81e-05 (1.54e-05)
Condition 2, P(Xi=1) = 0.1
 CCE mean (SD): 1.85e-05 (7.77e-06)
Condition 2, P(Xi=1) = 0.0
 CCE mean (SD): 0.00e+00 (0.00e+00)
------------------------------------
Condition 3, P(Xi=1) = 1.0
 CCE mean (SD): 3.02e-04 (1.10e-16)
Condition 3, P(Xi=1) = 0.9
 CCE mean (SD): 2.48e-04 (3.81e-05)
Condition 3, P(Xi=1) = 0.8
 CCE mean (SD): 2.08e-04 (4.34e-05)
Condition 3, P(Xi=1) = 0.7
 CCE mean (SD): 1.74e-04 (4.30e-05)
Condition 3, P(Xi=1) = 0.6
 CCE mean (SD): 1.43e-04 (3.98e-05)
Condition 3, P(Xi=1) = 0.5
 CCE mean (SD): 1.15e-04 (3.49e-05)
Condition 3, P(Xi=1) = 0.4
 CCE mean (SD): 8.92e-05 (2.90e-05)
Condition 3, P(Xi=1) = 0.3
 CCE mean (SD): 6.50e-05 (2.24e-05)
Condition 3, P(Xi=1) = 0.2
 CCE mean (SD): 4.21e-05 (1.52e-05)
Condition 3, P(Xi=1) = 0.1
 CCE mean (SD): 2.05e-05 (7.74e-06)
Condition 3, P(Xi=1) = 0.0
 CCE mean (SD): 0.00e+00 (0.00e+00)
```


### Output of `compute_PerTrialCCE.m`

The script saved one plot, `Exp1_perTrialCCE.png`:

<img src="figures/Exp1_perTrialCCE.png" width=300px />


---


## Outputs with setting `ExpR = 2`

Below is the output with setting `ExpR = 2` in every script.

Remember to reset the random seed if you want to compare the output documented below with your own:

```matlab
rng(1,'twister');
```
	
### Output of `create_SimulationData.m`
	
The script generates 6 files that you can compare with your own run:

```
Exp2Cond1_Vec_tauA.csv
Exp2Cond1_Vec_tauO.csv
Exp2Cond2_Vec_tauA.csv
Exp2Cond2_Vec_tauO.csv
Exp2Cond3_Vec_tauA.csv
Exp2Cond3_Vec_tauO.csv
```

The Matlab console output was:

```
========= tau sample statistics, exp 2 cond 1 =========
ranges      tauA [-303.1, 277.6],  tauO [51.2, 556.4]
means (SDs) tauA -7.9 (75.2),  tauO 285.2 (61.0)
sample size tauA 35000,  tauO 35000
=======================================================

========= tau sample statistics, exp 2 cond 2 =========
ranges      tauA [-323.7, 339.6],  tauO [18.2, 566.0]
means (SDs) tauA -8.3 (75.5),  tauO 296.4 (66.3)
sample size tauA 35000,  tauO 35000
=======================================================

========= tau sample statistics, exp 2 cond 3 =========
ranges      tauA [-382.0, 329.8],  tauO [-15.3, 685.8]
means (SDs) tauA -7.2 (75.4),  tauO 344.5 (89.8)
sample size tauA 35000,  tauO 35000
=======================================================
```

### Output of `find_muAO.m`

The console output was:

```
Action + outcome perceptual shifts given muAO = 190 ms:
	Condition 1:	+61 (58) ms,	-41 (38) ms
	Condition 2:	+64 (56) ms,	-50 (43) ms
	Condition 3:	+66 (48) ms,	-95 (68) ms
Avg. model estimation error:	29.7.

Action + outcome perceptual shifts given muAO = 200 ms:
	Condition 1:	+55 (58) ms,	-37 (38) ms
	Condition 2:	+58 (56) ms,	-45 (43) ms
	Condition 3:	+62 (48) ms,	-89 (68) ms
Avg. model estimation error:	24.3.

Action + outcome perceptual shifts given muAO = 210 ms:
	Condition 1:	+49 (58) ms,	-33 (38) ms
	Condition 2:	+53 (56) ms,	-41 (43) ms
	Condition 3:	+58 (48) ms,	-83 (68) ms
Avg. model estimation error:	19.3.

Action + outcome perceptual shifts given muAO = 220 ms:
	Condition 1:	+44 (58) ms,	-29 (38) ms
	Condition 2:	+47 (56) ms,	-37 (43) ms
	Condition 3:	+54 (48) ms,	-77 (68) ms
Avg. model estimation error:	14.3.

Action + outcome perceptual shifts given muAO = 230 ms:
	Condition 1:	+38 (58) ms,	-25 (38) ms
	Condition 2:	+42 (56) ms,	-32 (43) ms
	Condition 3:	+50 (48) ms,	-71 (68) ms
Avg. model estimation error:	10.0.

Action + outcome perceptual shifts given muAO = 240 ms:
	Condition 1:	+32 (58) ms,	-21 (38) ms
	Condition 2:	+36 (56) ms,	-28 (43) ms
	Condition 3:	+45 (48) ms,	-65 (68) ms
Avg. model estimation error:	8.3.

Action + outcome perceptual shifts given muAO = 250 ms:
	Condition 1:	+26 (58) ms,	-17 (38) ms
	Condition 2:	+31 (56) ms,	-24 (43) ms
	Condition 3:	+41 (48) ms,	-60 (68) ms
Avg. model estimation error:	7.3.

For ExpR = 2, optimal muAO is 250 ms.
```


### Output of `compute_PXisPrcShfts.m`

The script generated two data files and two plots:

```
Exp2_arrPrcShftA.csv
Exp2_arrPrcShftO.csv
Exp2_PXisPrcShftsAO.png
Exp2_PXisPrcShfts.png
```

<img src="figures/Exp2_PXisPrcShftsAO.png" width=300px />
<br />
<img src="figures/Exp2_PXisPrcShfts.png" width=300px />

The console output was:

```
Condition 1, P(Xi=1) = 1.0
 Model-predicted mean (SD) perceptual shifts:
 Action 37.6 (57.7) ms,  Outcome -24.8 (38.2) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 1 ms,  Outcome 26 ms.

Condition 1, P(Xi=1) = 0.9
 Model-predicted mean (SD) perceptual shifts:
 Action 35.8 (55.7) ms,  Outcome -23.7 (36.9) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 3 ms,  Outcome 27 ms.

Condition 1, P(Xi=1) = 0.8
 Model-predicted mean (SD) perceptual shifts:
 Action 34.2 (54.2) ms,  Outcome -22.6 (35.9) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 5 ms,  Outcome 28 ms.

Condition 1, P(Xi=1) = 0.7
 Model-predicted mean (SD) perceptual shifts:
 Action 32.4 (52.7) ms,  Outcome -21.5 (34.8) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 7 ms,  Outcome 30 ms.

Condition 1, P(Xi=1) = 0.6
 Model-predicted mean (SD) perceptual shifts:
 Action 30.5 (50.9) ms,  Outcome -20.1 (33.7) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 9 ms,  Outcome 31 ms.

Condition 1, P(Xi=1) = 0.5
 Model-predicted mean (SD) perceptual shifts:
 Action 28.1 (48.9) ms,  Outcome -18.6 (32.4) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 11 ms,  Outcome 32 ms.

Condition 1, P(Xi=1) = 0.4
 Model-predicted mean (SD) perceptual shifts:
 Action 24.7 (46.0) ms,  Outcome -16.4 (30.4) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 14 ms,  Outcome 35 ms.

Condition 1, P(Xi=1) = 0.3
 Model-predicted mean (SD) perceptual shifts:
 Action 20.1 (41.6) ms,  Outcome -13.3 (27.5) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 19 ms,  Outcome 38 ms.

Condition 1, P(Xi=1) = 0.2
 Model-predicted mean (SD) perceptual shifts:
 Action 12.8 (33.6) ms,  Outcome -8.5 (22.3) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 26 ms,  Outcome 43 ms.

Condition 1, P(Xi=1) = 0.1
 Model-predicted mean (SD) perceptual shifts:
 Action 0.8 (8.0) ms,  Outcome -0.5 (5.3) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 38 ms,  Outcome 50 ms.

Condition 1, P(Xi=1) = 0.0
 Model-predicted mean (SD) perceptual shifts:
 Action 0.0 (0.0) ms,  Outcome 0.0 (0.0) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 39 ms,  Outcome 51 ms.

--------------------------------------------------------

Condition 2, P(Xi=1) = 1.0
 Model-predicted mean (SD) perceptual shifts:
 Action 41.7 (56.0) ms,  Outcome -32.3 (43.3) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 11 ms,  Outcome 33 ms.

Condition 2, P(Xi=1) = 0.9
 Model-predicted mean (SD) perceptual shifts:
 Action 39.6 (53.9) ms,  Outcome -30.7 (41.7) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 9 ms,  Outcome 34 ms.

Condition 2, P(Xi=1) = 0.8
 Model-predicted mean (SD) perceptual shifts:
 Action 37.8 (52.4) ms,  Outcome -29.3 (40.6) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 7 ms,  Outcome 36 ms.

Condition 2, P(Xi=1) = 0.7
 Model-predicted mean (SD) perceptual shifts:
 Action 35.8 (50.9) ms,  Outcome -27.7 (39.4) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 5 ms,  Outcome 37 ms.

Condition 2, P(Xi=1) = 0.6
 Model-predicted mean (SD) perceptual shifts:
 Action 33.3 (49.0) ms,  Outcome -25.8 (37.9) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 2 ms,  Outcome 39 ms.

Condition 2, P(Xi=1) = 0.5
 Model-predicted mean (SD) perceptual shifts:
 Action 30.4 (46.9) ms,  Outcome -23.6 (36.3) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 1 ms,  Outcome 41 ms.

Condition 2, P(Xi=1) = 0.4
 Model-predicted mean (SD) perceptual shifts:
 Action 26.6 (44.0) ms,  Outcome -20.6 (34.1) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 4 ms,  Outcome 44 ms.

Condition 2, P(Xi=1) = 0.3
 Model-predicted mean (SD) perceptual shifts:
 Action 21.4 (39.6) ms,  Outcome -16.6 (30.7) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 10 ms,  Outcome 48 ms.

Condition 2, P(Xi=1) = 0.2
 Model-predicted mean (SD) perceptual shifts:
 Action 13.3 (31.7) ms,  Outcome -10.3 (24.5) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 18 ms,  Outcome 55 ms.

Condition 2, P(Xi=1) = 0.1
 Model-predicted mean (SD) perceptual shifts:
 Action 0.8 (7.5) ms,  Outcome -0.6 (5.8) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 30 ms,  Outcome 64 ms.

Condition 2, P(Xi=1) = 0.0
 Model-predicted mean (SD) perceptual shifts:
 Action 0.0 (0.0) ms,  Outcome 0.0 (0.0) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 31 ms,  Outcome 65 ms.

--------------------------------------------------------

Condition 3, P(Xi=1) = 1.0
 Model-predicted mean (SD) perceptual shifts:
 Action 49.5 (47.6) ms,  Outcome -71.3 (68.5) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 18 ms,  Outcome 34 ms.

Condition 3, P(Xi=1) = 0.9
 Model-predicted mean (SD) perceptual shifts:
 Action 45.5 (44.6) ms,  Outcome -65.5 (64.3) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 14 ms,  Outcome 39 ms.

Condition 3, P(Xi=1) = 0.8
 Model-predicted mean (SD) perceptual shifts:
 Action 42.7 (43.1) ms,  Outcome -61.5 (62.0) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 11 ms,  Outcome 44 ms.

Condition 3, P(Xi=1) = 0.7
 Model-predicted mean (SD) perceptual shifts:
 Action 39.8 (41.6) ms,  Outcome -57.3 (59.9) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 8 ms,  Outcome 48 ms.

Condition 3, P(Xi=1) = 0.6
 Model-predicted mean (SD) perceptual shifts:
 Action 36.6 (40.0) ms,  Outcome -52.6 (57.6) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 5 ms,  Outcome 52 ms.

Condition 3, P(Xi=1) = 0.5
 Model-predicted mean (SD) perceptual shifts:
 Action 32.8 (38.0) ms,  Outcome -47.3 (54.7) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 1 ms,  Outcome 58 ms.

Condition 3, P(Xi=1) = 0.4
 Model-predicted mean (SD) perceptual shifts:
 Action 28.2 (35.5) ms,  Outcome -40.7 (51.1) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 4 ms,  Outcome 64 ms.

Condition 3, P(Xi=1) = 0.3
 Model-predicted mean (SD) perceptual shifts:
 Action 22.3 (31.9) ms,  Outcome -32.2 (46.0) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 10 ms,  Outcome 73 ms.

Condition 3, P(Xi=1) = 0.2
 Model-predicted mean (SD) perceptual shifts:
 Action 13.7 (25.4) ms,  Outcome -19.8 (36.5) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 18 ms,  Outcome 85 ms.

Condition 3, P(Xi=1) = 0.1
 Model-predicted mean (SD) perceptual shifts:
 Action 0.6 (5.6) ms,  Outcome -0.9 (8.1) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 31 ms,  Outcome 104 ms.

Condition 3, P(Xi=1) = 0.0
 Model-predicted mean (SD) perceptual shifts:
 Action 0.0 (0.0) ms,  Outcome 0.0 (0.0) ms.
 Abs. error of modeled versus reported perceptual shifts:
 Action 32 ms,  Outcome 105 ms.
```


### Output of `compute_PerTrialPrcShfts.m`

The script generates four subplots in one figure:

```
Exp2_perTrialPrcShfts.png
```

<img src="figures/Exp2_perTrialPrcShfts.png" width=600px />


### Output of `compute_CCEPXi1.m`

The script saves one plot, `Exp2_CCEPXi.png`.

<img src="figures/Exp2_CCEPXi.png" width=300px />

The console output was:

```
Condition 1, P(Xi=1) = 1.0
 CCE mean (SD): 3.38e-04 (1.30e-16)
Condition 1, P(Xi=1) = 0.9
 CCE mean (SD): 2.69e-04 (5.74e-05)
Condition 1, P(Xi=1) = 0.8
 CCE mean (SD): 2.25e-04 (6.22e-05)
Condition 1, P(Xi=1) = 0.7
 CCE mean (SD): 1.87e-04 (6.01e-05)
Condition 1, P(Xi=1) = 0.6
 CCE mean (SD): 1.55e-04 (5.49e-05)
Condition 1, P(Xi=1) = 0.5
 CCE mean (SD): 1.25e-04 (4.79e-05)
Condition 1, P(Xi=1) = 0.4
 CCE mean (SD): 9.68e-05 (3.97e-05)
Condition 1, P(Xi=1) = 0.3
 CCE mean (SD): 7.08e-05 (3.06e-05)
Condition 1, P(Xi=1) = 0.2
 CCE mean (SD): 4.61e-05 (2.08e-05)
Condition 1, P(Xi=1) = 0.1
 CCE mean (SD): 2.26e-05 (1.06e-05)
Condition 1, P(Xi=1) = 0.0
 CCE mean (SD): 0.00e+00 (0.00e+00)
------------------------------------
Condition 2, P(Xi=1) = 1.0
 CCE mean (SD): 3.23e-04 (2.70e-16)
Condition 2, P(Xi=1) = 0.9
 CCE mean (SD): 2.51e-04 (5.85e-05)
Condition 2, P(Xi=1) = 0.8
 CCE mean (SD): 2.08e-04 (6.25e-05)
Condition 2, P(Xi=1) = 0.7
 CCE mean (SD): 1.72e-04 (5.98e-05)
Condition 2, P(Xi=1) = 0.6
 CCE mean (SD): 1.41e-04 (5.41e-05)
Condition 2, P(Xi=1) = 0.5
 CCE mean (SD): 1.13e-04 (4.68e-05)
Condition 2, P(Xi=1) = 0.4
 CCE mean (SD): 8.77e-05 (3.85e-05)
Condition 2, P(Xi=1) = 0.3
 CCE mean (SD): 6.38e-05 (2.95e-05)
Condition 2, P(Xi=1) = 0.2
 CCE mean (SD): 4.14e-05 (2.00e-05)
Condition 2, P(Xi=1) = 0.1
 CCE mean (SD): 2.02e-05 (1.01e-05)
Condition 2, P(Xi=1) = 0.0
 CCE mean (SD): 0.00e+00 (0.00e+00)
------------------------------------
Condition 3, P(Xi=1) = 1.0
 CCE mean (SD): 2.77e-04 (7.10e-17)
Condition 3, P(Xi=1) = 0.9
 CCE mean (SD): 1.97e-04 (6.17e-05)
Condition 3, P(Xi=1) = 0.8
 CCE mean (SD): 1.57e-04 (6.12e-05)
Condition 3, P(Xi=1) = 0.7
 CCE mean (SD): 1.26e-04 (5.58e-05)
Condition 3, P(Xi=1) = 0.6
 CCE mean (SD): 1.01e-04 (4.86e-05)
Condition 3, P(Xi=1) = 0.5
 CCE mean (SD): 7.96e-05 (4.07e-05)
Condition 3, P(Xi=1) = 0.4
 CCE mean (SD): 6.04e-05 (3.25e-05)
Condition 3, P(Xi=1) = 0.3
 CCE mean (SD): 4.32e-05 (2.42e-05)
Condition 3, P(Xi=1) = 0.2
 CCE mean (SD): 2.76e-05 (1.60e-05)
Condition 3, P(Xi=1) = 0.1
 CCE mean (SD): 1.32e-05 (7.92e-06)
Condition 3, P(Xi=1) = 0.0
 CCE mean (SD): 0.00e+00 (0.00e+00)
```


### Output of `compute_PerTrialCCE.m`

The script saved one plot, `Exp2_perTrialCCE.png`:

<img src="figures/Exp2_perTrialCCE.png" width=300px />

