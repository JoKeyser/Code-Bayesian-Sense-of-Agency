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
MATLAB Version: 9.11.0.1769968 (R2021b)
Operating System: Linux 5.4.0-104-generic #118-Ubuntu SMP Wed Mar 2 19:02:41 UTC 2022 x86_64
Java Version: Java 1.8.0_202-b08 with Oracle Corporation Java HotSpot(TM) 64-Bit Server VM mixed mode
-----------------------------------------------------------------------------------------------------
MATLAB                                                Version 9.11        (R2021b)
Optimization Toolbox                                  Version 9.2         (R2021b)
Signal Processing Toolbox                             Version 8.7         (R2021b)
Statistics and Machine Learning Toolbox               Version 12.2        (R2021b)
```

The order of script execution was from top to bottom of this log.
(Which is the same order as in the project README.)

## With setting ExpR = 1

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

The script generated the following files:

```
Exp1_PXisPrcShfts.png
Exp1_arrPrcShftA.csv
Exp1_arrPrcShftO.csv
```

NOTE: The script generates 2 plots per run, but only stores the second, because the file name is repeated (compare lines 121 and 125 of the transcript, or page 6 of the supplementary code):

```matlab
fnamePrcShft = sprintf('Exp%d_PXisPrcShfts.png',ExpR);
```

### FIXME: Add remaining scripts.
