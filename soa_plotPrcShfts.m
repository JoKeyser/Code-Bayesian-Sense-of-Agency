% Objective: Plot the action and outcome perceptual shifts as functions of
%            the strength of the causal prior.
%
% Copyright: Roberto Legaspi and Taro Toyoizumi
%            Lab for Neural Computation and Adaptation
%            RIKEN Center for Brain Science
% License: CC-BY-4.0
% Changes by: Johannes Keyser, please refer to changelog.md
%
% SPDX-FileCopyrightText: 2019 Roberto Legaspi and Taro Toyoizumi
%
% SPDX-License-Identifier: CC-BY-4.0

function lgnd = ...
    soa_plotPrcShfts(experiment, arrPrcShftA, arrPrcShftO, arrPXi1, fontsize)

linewidth = 2;

if experiment == 1
    % Haggard et al. 2002 (Nat Neurosci): Seminal intentional binding experiment
    %      Different keypress (i.e., the action) conditions.
    plot(arrPXi1, arrPrcShftA(1,:), 'b-', arrPXi1, arrPrcShftO(1,:), 'b--', ...
         arrPXi1, arrPrcShftA(2,:), 'r-', arrPXi1, arrPrcShftO(2,:), 'r--', ...
         arrPXi1, arrPrcShftA(3,:), 'k-', arrPXi1, arrPrcShftO(3,:), 'k--', ...
         'Linewidth', linewidth);
    % legend('Voluntary Action', '    Tone', 'Involuntary MEP','    Tone', ...
    %     'Sham TMS','    Tone', 'Location', 'northwest');
    lgnd = legend('Voluntary action', ' and tone', ...
        'Involuntary action', ' and tone', 'Sham',' and tone', ...
        'Location', 'northwest', 'Orientation', 'vertical');
elseif experiment == 2
    % Wolpe et al. 2013 (Exp Brain Res): Uncertainty is with the outcome.
    %       Different tone (i.e., the outcome) conditions.
    hold('on');
    plot(arrPXi1, arrPrcShftA(1, :), 'Color', [0, 0, 250]/255, ...
        'LineStyle', '-', 'Linewidth', linewidth);
    plot(arrPXi1, arrPrcShftO(1, :), 'Color', [0, 0, 250]/255, ...
        'LineStyle', '--', 'Linewidth', linewidth);
    plot(arrPXi1, arrPrcShftA(2, :), 'Color', [0, 140, 255]/255, ...
        'LineStyle', '-', 'Linewidth', linewidth);
    plot(arrPXi1, arrPrcShftO(2, :), 'Color', [0, 140, 255]/255, ...
        'LineStyle', '--', 'Linewidth', linewidth);
    plot(arrPXi1, arrPrcShftA(3, :), 'Color', [0, 240, 255]/255, ...
        'LineStyle', '-', 'Linewidth', linewidth);
    plot(arrPXi1, arrPrcShftO(3, :), 'Color', [0, 240, 255]/255, ...
        'LineStyle', '--', 'Linewidth', linewidth);
    lgnd = legend('Action', ' and low uncertainty tone', ...
        'Action', ' and intermediate uncertainty tone', ...
        'Action', ' and high uncertainty tone', 'Location', 'northwest');
end

lgnd.FontSize = fontsize;
set(lgnd.BoxFace, 'ColorType', 'truecoloralpha', ...
    'ColorData', uint8(255*[1; 1; 1; 0.8]));
set(gca(),'FontSize', fontsize);
set(gca(), 'Box', 'on');
set(lgnd, 'Color', 'none');
set(gca(),'color', 'white');
set(gca(),'FontSize', fontsize);
end