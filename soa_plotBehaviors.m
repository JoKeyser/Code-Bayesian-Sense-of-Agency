% Function to graph the SoA-related measures
% Added 09/06/2017

function lgnd = ...
    soa_plotBehaviors(experiment, arrBehavior, arrPXi1, fontsize, behavior)

linewidth = 2;

if experiment == 1
    if behavior == 1
        plot(arrPXi1, arrBehavior(1, :), 'b', ...
             arrPXi1, arrBehavior(2, :), 'r', ...
             arrPXi1, arrBehavior(3, :), 'k', 'Linewidth', linewidth);
%         hold('all')
%         plot(arrPXi1, arrBehavior(1, :), 'b', 'Linewidth', 3);
%         plot(arrPXi1, arrBehavior(2, :), 'r', 'Linewidth', 3);
%         plot(arrPXi1, arrBehavior(3, :), 'Linewidth', 3, ...
%             'Color', [0 0 0] + 0.05 * 13);
%         hold('off')
    elseif behavior == 3
        plot(arrPXi1, arrBehavior(2, :), 'r', ...
             arrPXi1, arrBehavior(1, :), 'b', ...
             arrPXi1, arrBehavior(3, :), 'k', 'Linewidth', linewidth);
    elseif behavior == 0
        plot(arrPXi1, arrBehavior(1, :), 'b', ...
             arrPXi1, arrBehavior(2, :), 'r', 'Linewidth', linewidth);
    elseif behavior == 2
        ylim([0, 1]);
        plot(arrPXi1, arrBehavior(1, :), 'b', ...
             arrPXi1, arrBehavior(2, :), 'r', 'Linewidth', linewidth);
    end
elseif experiment == 2
    hold('on')
    Colors = {[0, 0, 250]/255, [0, 140, 255]/255, [0, 240, 255]/255};
    plot(arrPXi1, arrBehavior(1, :), 'Color', Colors{1}, 'Linewidth', linewidth);
    plot(arrPXi1, arrBehavior(2, :), 'Color', Colors{2}, 'Linewidth', linewidth);
    plot(arrPXi1, arrBehavior(3, :), 'Color', Colors{3}, 'Linewidth', linewidth);
    hold('off')
elseif experiment == 3
    hold('on')
    plot(arrPXi1, arrBehavior(1, :), 'Color', [0, 0, 250]/255, ...
        'LineStyle', '-', 'Linewidth', linewidth);
    plot(arrPXi1, arrBehavior(2, :), 'Color', [0, 140, 255]/255, ...
        'LineStyle', '-', 'Linewidth', linewidth);
    hold('off')
end

xlabel('P(\xi=1)')

% xlabel('P(\xi=1) of Prior')
% if behavior == 1
%     ylabel('Feeling of Agency')
% elseif behavior == 2
%     ylabel('Judgment of Agency')
% elseif behavior == 3
%     ylabel('Bias in Action Estimates')
% elseif behavior == 4
%     ylabel('Bias in Outcome Estimates')
% end

if experiment == 1
    lgnd = legend('Voluntary condition', 'Involuntary condition', ...
        'Sham condition', 'Location', 'NorthWest');
elseif experiment == 2
    lgnd = legend('Low uncertainty condition', ...
        'Intermediate uncertainty condition', ...
        'High uncertainty condition', 'Location', 'NorthWest');
elseif experiment == 3
    lgnd = legend('Active, Instructed', 'Passive, Instructed', ...
        'Location', 'northeast');
end

set(gca(),'FontSize', fontsize);
set(gca(), 'Box', 'on');
% set(lgnd, 'Color', 'none');
set(gca(), 'color', 'white');
set(lgnd.BoxFace, 'ColorType', 'truecoloralpha', ...
    'ColorData', uint8(255*[1; 1; 1; 0.8]));
% If you want to bold
% ylabel('Feeling of Agency', 'FontWeight', 'bold');
end