% Objective: Load tau samples from files (saved by create_SimulationData.m).
%
% Published: August 14, 2019
% Copyright: Roberto Legaspi and Taro Toyoizumi
%            Lab for Neural Computation and Adaptation
%            RIKEN Center for Brain Science
% License: CC-BY-4.0
% Changes by: Johannes Keyser, please refer to changelog.md

function [samples_tauA, samples_tauO] ...
    = soa_loadTauSamples(experiment, condition)

[fnameTauA, fnameTauO] = soa_getFileNames(experiment, condition);
samples_tauA = dlmread(fnameTauA);
samples_tauO = dlmread(fnameTauO);

end