% Objective: Plot histograms of samples tauA, tauO, and their differences.
%
% Copyright: Johannes Keyser <johannes.keyser@sport.uni-giessen.de>
% License: CC0-1.0 public domain dedication, see
%          <https://creativecommons.org/share-your-work/public-domain/cc0/>.
%
% SPDX-FileCopyrightText: 2022 Johannes Keyser
%
% SPDX-License-Identifier: CC0-1.0

function soa_plotTauSamples(ExpR, numCond)

fontsize = 12;
num_bins = 35;

figure()

for CondBO = 1:numCond

    % Read samples tauA, tauO from files generated by create_SimulationData.m.
    fnametauA = sprintf('Exp%dCond%d_Vec_tauA.csv', ExpR, CondBO);
    fnametauO = sprintf('Exp%dCond%d_Vec_tauO.csv', ExpR, CondBO);
    Vec_tauA = dlmread(fnametauA);
    Vec_tauO = dlmread(fnametauO);

    % Plot distributions of tauA and tauO.
    ha = subplot(numCond, 2, sub2ind([2, numCond], 1, CondBO));
    hold('on')
    hhA = histogram(Vec_tauA);
    hhO = histogram(Vec_tauO);
    hhA.set('NumBins', num_bins, 'FaceColor', [0, 0.7, 0])
    hhO.set('NumBins', num_bins, 'FaceColor', [0.7, 0.7, 0])
    set(ha, 'YTick', [], 'Fontsize', fontsize, 'XGrid', 'on')
    title(sprintf('Experiment %d, condition %d', ExpR, CondBO))

    if CondBO == 1
        legend([hhA, hhO], {'\tau_A', '\tau_O'}, 'Fontsize', fontsize)
    end

    if CondBO == numCond
        xlabel('Time (ms)')
    end

    % Plot distribution of differences tauO - tauA.
    ha = subplot(numCond, 2, sub2ind([2, numCond], 2, CondBO));
    hhD = histogram(Vec_tauO - Vec_tauA);
    hhD.set('NumBins', num_bins, 'FaceColor', [0.5, 0.5, 0.5])
    set(ha, 'YTick', [], 'Fontsize', fontsize, 'XGrid', 'on')
    if CondBO == numCond, xlabel('Difference \tau_O - \tau_A (ms)'), end
end

sameaxes()

end