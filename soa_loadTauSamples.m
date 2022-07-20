% Objective: Load tau samples from files (saved by create_SimulationData.m).
%
% Published: August 14, 2019
% Copyright: Roberto Legaspi and Taro Toyoizumi
%            Lab for Neural Computation and Adaptation
%            RIKEN Center for Brain Science
% License: CC-BY-4.0
% Changes by: Johannes Keyser, please refer to changelog.md
%
% SPDX-FileCopyrightText: 2019 Roberto Legaspi and Taro Toyoizumi
%
% SPDX-License-Identifier: CC-BY-4.0

function [samples_tauA, samples_tauO, sample_size] ...
    = soa_loadTauSamples(experiment, condition)

[fnameTauA, fnameTauO] = soa_getFileNames(experiment, condition);
samples_tauA = dlmread(fnameTauA);
samples_tauO = dlmread(fnameTauO);

assert(isvector(samples_tauA) && isvector(samples_tauO), ...
    'Saved samples are expected to be vectors.')

sample_sizeA = numel(samples_tauA);
sample_sizeO = numel(samples_tauO);

assert(sample_sizeA == sample_sizeO, ...
    'Sample sizes of tauA and tauO must be the same.')

sample_size = sample_sizeA;

end