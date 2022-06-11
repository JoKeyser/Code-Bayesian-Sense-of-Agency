% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
%
% Objective: Plot the optimal baheviors used in the figures of the paper with
%            ERROR BARS displayed (figures 3 b-e and 5 c-d).

function lgnd = ...
    soa_plotErrorBars(experiment, arrAxes, arrBehavior, fontsize, flag, sizeBin)

markerSize = 27;
lineWidth = 0.1;

hold('all')

if experiment == 1
    % Haggard et al. 2002 (Nat Neurosci): Seminal intentional binding experiment
    %      Different keypress (i.e., the action) conditions.
    if flag == 1
        errorbar(mean(reshape(arrAxes(1, :), sizeBin, []), 1), ...
            mean(reshape(arrBehavior(1, :), sizeBin, []), 1), ...
            std(reshape(arrBehavior(1, :), sizeBin, []), 1), ...
            'b.', 'LineWidth', lineWidth, 'MarkerSize', markerSize);
        errorbar(mean(reshape(arrAxes(2, :), sizeBin, []), 1), ...
            mean(reshape(arrBehavior(2, :), sizeBin, []), 1), ...
            std(reshape(arrBehavior(2,:), sizeBin, []), 1), ...
            'r.', 'LineWidth', lineWidth, 'MarkerSize', markerSize);
        errorbar(mean(reshape(arrAxes(3, :), sizeBin, []), 1), ...
            mean(reshape(arrBehavior(3, :), sizeBin, []), 1), ...
            std(reshape(arrBehavior(3, :), sizeBin,[]), 1), ...
            'k.', 'LineWidth', lineWidth, 'MarkerSize', markerSize);
        lgnd = legend('Voluntary condition', 'Involuntary condition', ...
            'Sham condition', 'Location', 'northwest');
    elseif flag == 2
        errorbar(mean(reshape(arrAxes(2, :), sizeBin, []), 1), ...
            mean(reshape(arrBehavior(2, :), sizeBin, []), 1), ...
            std(reshape(arrBehavior(2, :), sizeBin, []), 1), ...
            'r.', 'LineWidth', lineWidth, 'MarkerSize', markerSize);
        errorbar(mean(reshape(arrAxes(1, :), sizeBin, []), 1), ...
            mean(reshape(arrBehavior(1, :),sizeBin, []), 1), ...
            std(reshape(arrBehavior(1, :), sizeBin, []), 1), ...
            'b.', 'LineWidth', lineWidth, 'MarkerSize', markerSize);
        lgnd = legend('Voluntary condition', 'Involuntary condition', ...
            'Location', 'northwest');
    end
elseif experiment == 2
    % Wolpe et al. 2013 (Exp Brain Res): Uncertainty is with the outcome.
    %       Different tone (i.e., the outcome) conditions.
    if flag == 1
        Colors = {[0, 0, 250]/255, [0, 140, 255]/255, [0, 240, 255]/255};
        errorbar(mean(reshape(arrAxes(1, :), sizeBin, []), 1), ...
            mean(reshape(arrBehavior(1, :), sizeBin, []), 1), ...
            std(reshape(arrBehavior(1, :), sizeBin, []), 1), ...
            'Color', Colors{1}, 'LineStyle', 'none', 'Marker', '.', ...
            'LineWidth', lineWidth, 'MarkerSize', markerSize);
        errorbar(mean(reshape(arrAxes(2, :), sizeBin, []), 1), ...
            mean(reshape(arrBehavior(2, :), sizeBin, []), 1), ...
            std(reshape(arrBehavior(2, :), sizeBin,[]), 1), ...
            'Color', Colors{2}, 'LineStyle', 'none', 'Marker', '.', ...
            'LineWidth', lineWidth, 'MarkerSize', markerSize);
        errorbar(mean(reshape(arrAxes(3, :), sizeBin, []), 1), ...
            mean(reshape(arrBehavior(3, :), sizeBin, []), 1), ...
            std(reshape(arrBehavior(3, :), sizeBin, []), 1), ...
            'Color', Colors{3}, 'LineStyle', 'none', 'Marker', '.', ...
            'LineWidth', lineWidth, 'MarkerSize', markerSize);
    end
    lgnd = legend('Low uncertainty', 'Intermediate uncertainty', ...
        'High uncertainty', 'Location', 'northwest');
end
set(lgnd.BoxFace, 'ColorType', 'truecoloralpha', ...
    'ColorData', uint8(255*[1; 1; 1; 0.8]));
set(gca(), 'Box', 'on');
hold('off')
set(gca(), 'FontSize', fontsize);
end