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
Exp1_PXisPrcShfts.png
```

<img src="figures/Exp1_PXisPrcShfts.png" width=300px />

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
CCE        :	 3.29e-04(7.83e-17)
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
CCE        :	 2.94e-04(1.79e-16)
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
CCE        :	 3.02e-04(1.10e-16)
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

The script generated two data files and a plot:

```
Exp2_arrPrcShftA.csv
Exp2_arrPrcShftO.csv
Exp2_PXisPrcShfts.png
```

<img src="figures/Exp2_PXisPrcShfts.png" width=300px />

NOTE: The script generates 2 plots per run, but only stores the second, because the file name is repeated (compare lines 121 and 125 of the transcript, or page 6 of the supplementary code):

```matlab
fnamePrcShft = sprintf('Exp%d_PXisPrcShfts.png',ExpR);
```

The console output was:

```
Condition 1  	 P(Xi=1): 1.00
uPercShfts   :	 Error in action  perceptual shift: 1.00
Error in outcome perceptual shift: 26.00

Condition 1  	 P(Xi=1): 0.90
uPercShfts   :	 Error in action  perceptual shift: 3.00
Error in outcome perceptual shift: 27.00

Condition 1  	 P(Xi=1): 0.80
uPercShfts   :	 Error in action  perceptual shift: 5.00
Error in outcome perceptual shift: 28.00

Condition 1  	 P(Xi=1): 0.70
uPercShfts   :	 Error in action  perceptual shift: 7.00
Error in outcome perceptual shift: 30.00

Condition 1  	 P(Xi=1): 0.60
uPercShfts   :	 Error in action  perceptual shift: 9.00
Error in outcome perceptual shift: 31.00

Condition 1  	 P(Xi=1): 0.50
uPercShfts   :	 Error in action  perceptual shift: 11.00
Error in outcome perceptual shift: 32.00

Condition 1  	 P(Xi=1): 0.40
uPercShfts   :	 Error in action  perceptual shift: 14.00
Error in outcome perceptual shift: 35.00

Condition 1  	 P(Xi=1): 0.30
uPercShfts   :	 Error in action  perceptual shift: 19.00
Error in outcome perceptual shift: 38.00

Condition 1  	 P(Xi=1): 0.20
uPercShfts   :	 Error in action  perceptual shift: 26.00
Error in outcome perceptual shift: 43.00

Condition 1  	 P(Xi=1): 0.10
uPercShfts   :	 Error in action  perceptual shift: 38.00
Error in outcome perceptual shift: 50.00

Condition 1  	 P(Xi=1): 0.00
uPercShfts   :	 Error in action  perceptual shift: 39.00
Error in outcome perceptual shift: 51.00


Condition 2  	 P(Xi=1): 1.00
uPercShfts   :	 Error in action  perceptual shift: 11.00
Error in outcome perceptual shift: 33.00

Condition 2  	 P(Xi=1): 0.90
uPercShfts   :	 Error in action  perceptual shift: 9.00
Error in outcome perceptual shift: 34.00

Condition 2  	 P(Xi=1): 0.80
uPercShfts   :	 Error in action  perceptual shift: 7.00
Error in outcome perceptual shift: 36.00

Condition 2  	 P(Xi=1): 0.70
uPercShfts   :	 Error in action  perceptual shift: 5.00
Error in outcome perceptual shift: 37.00

Condition 2  	 P(Xi=1): 0.60
uPercShfts   :	 Error in action  perceptual shift: 2.00
Error in outcome perceptual shift: 39.00

Condition 2  	 P(Xi=1): 0.50
uPercShfts   :	 Error in action  perceptual shift: 1.00
Error in outcome perceptual shift: 41.00

Condition 2  	 P(Xi=1): 0.40
uPercShfts   :	 Error in action  perceptual shift: 4.00
Error in outcome perceptual shift: 44.00

Condition 2  	 P(Xi=1): 0.30
uPercShfts   :	 Error in action  perceptual shift: 10.00
Error in outcome perceptual shift: 48.00

Condition 2  	 P(Xi=1): 0.20
uPercShfts   :	 Error in action  perceptual shift: 18.00
Error in outcome perceptual shift: 55.00

Condition 2  	 P(Xi=1): 0.10
uPercShfts   :	 Error in action  perceptual shift: 30.00
Error in outcome perceptual shift: 64.00

Condition 2  	 P(Xi=1): 0.00
uPercShfts   :	 Error in action  perceptual shift: 31.00
Error in outcome perceptual shift: 65.00


Condition 3  	 P(Xi=1): 1.00
uPercShfts   :	 Error in action  perceptual shift: 18.00
Error in outcome perceptual shift: 34.00

Condition 3  	 P(Xi=1): 0.90
uPercShfts   :	 Error in action  perceptual shift: 14.00
Error in outcome perceptual shift: 39.00

Condition 3  	 P(Xi=1): 0.80
uPercShfts   :	 Error in action  perceptual shift: 11.00
Error in outcome perceptual shift: 44.00

Condition 3  	 P(Xi=1): 0.70
uPercShfts   :	 Error in action  perceptual shift: 8.00
Error in outcome perceptual shift: 48.00

Condition 3  	 P(Xi=1): 0.60
uPercShfts   :	 Error in action  perceptual shift: 5.00
Error in outcome perceptual shift: 52.00

Condition 3  	 P(Xi=1): 0.50
uPercShfts   :	 Error in action  perceptual shift: 1.00
Error in outcome perceptual shift: 58.00

Condition 3  	 P(Xi=1): 0.40
uPercShfts   :	 Error in action  perceptual shift: 4.00
Error in outcome perceptual shift: 64.00

Condition 3  	 P(Xi=1): 0.30
uPercShfts   :	 Error in action  perceptual shift: 10.00
Error in outcome perceptual shift: 73.00

Condition 3  	 P(Xi=1): 0.20
uPercShfts   :	 Error in action  perceptual shift: 18.00
Error in outcome perceptual shift: 85.00

Condition 3  	 P(Xi=1): 0.10
uPercShfts   :	 Error in action  perceptual shift: 31.00
Error in outcome perceptual shift: 104.00

Condition 3  	 P(Xi=1): 0.00
uPercShfts   :	 Error in action  perceptual shift: 32.00
Error in outcome perceptual shift: 105.00
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
Condition 1	 P(Xi=1): 1.00
CCE        :	 3.38e-04(1.30e-16)
Condition 1	 P(Xi=1): 0.90
CCE        :	 2.69e-04(5.74e-05)
Condition 1	 P(Xi=1): 0.80
CCE        :	 2.25e-04(6.22e-05)
Condition 1	 P(Xi=1): 0.70
CCE        :	 1.87e-04(6.01e-05)
Condition 1	 P(Xi=1): 0.60
CCE        :	 1.55e-04(5.49e-05)
Condition 1	 P(Xi=1): 0.50
CCE        :	 1.25e-04(4.79e-05)
Condition 1	 P(Xi=1): 0.40
CCE        :	 9.68e-05(3.97e-05)
Condition 1	 P(Xi=1): 0.30
CCE        :	 7.08e-05(3.06e-05)
Condition 1	 P(Xi=1): 0.20
CCE        :	 4.61e-05(2.08e-05)
Condition 1	 P(Xi=1): 0.10
CCE        :	 2.26e-05(1.06e-05)
Condition 1	 P(Xi=1): 0.00
CCE        :	 0.00e+00(0.00e+00)
Condition 2	 P(Xi=1): 1.00
CCE        :	 3.23e-04(2.70e-16)
Condition 2	 P(Xi=1): 0.90
CCE        :	 2.51e-04(5.85e-05)
Condition 2	 P(Xi=1): 0.80
CCE        :	 2.08e-04(6.25e-05)
Condition 2	 P(Xi=1): 0.70
CCE        :	 1.72e-04(5.98e-05)
Condition 2	 P(Xi=1): 0.60
CCE        :	 1.41e-04(5.41e-05)
Condition 2	 P(Xi=1): 0.50
CCE        :	 1.13e-04(4.68e-05)
Condition 2	 P(Xi=1): 0.40
CCE        :	 8.77e-05(3.85e-05)
Condition 2	 P(Xi=1): 0.30
CCE        :	 6.38e-05(2.95e-05)
Condition 2	 P(Xi=1): 0.20
CCE        :	 4.14e-05(2.00e-05)
Condition 2	 P(Xi=1): 0.10
CCE        :	 2.02e-05(1.01e-05)
Condition 2	 P(Xi=1): 0.00
CCE        :	 0.00e+00(0.00e+00)
Condition 3	 P(Xi=1): 1.00
CCE        :	 2.77e-04(7.10e-17)
Condition 3	 P(Xi=1): 0.90
CCE        :	 1.97e-04(6.17e-05)
Condition 3	 P(Xi=1): 0.80
CCE        :	 1.57e-04(6.12e-05)
Condition 3	 P(Xi=1): 0.70
CCE        :	 1.26e-04(5.58e-05)
Condition 3	 P(Xi=1): 0.60
CCE        :	 1.01e-04(4.86e-05)
Condition 3	 P(Xi=1): 0.50
CCE        :	 7.96e-05(4.07e-05)
Condition 3	 P(Xi=1): 0.40
CCE        :	 6.04e-05(3.25e-05)
Condition 3	 P(Xi=1): 0.30
CCE        :	 4.32e-05(2.42e-05)
Condition 3	 P(Xi=1): 0.20
CCE        :	 2.76e-05(1.60e-05)
Condition 3	 P(Xi=1): 0.10
CCE        :	 1.32e-05(7.92e-06)
Condition 3	 P(Xi=1): 0.00
CCE        :	 0.00e+00(0.00e+00)
```


### Output of `compute_PerTrialCCE.m`

The script saved one plot, `Exp2_perTrialCCE.png`:

<img src="figures/Exp2_perTrialCCE.png" width=300px />

