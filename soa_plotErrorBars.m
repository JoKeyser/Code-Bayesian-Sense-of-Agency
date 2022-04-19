8/15/19 10:27 AM                         /Users/roberto/Documents/MATLAB/soa_plotErrorBars.m                                   1 of 2
% Published: August 14, 2019
% Copyright
%   Lab for Neural Computation and Adaptation
%   RIKEN Center for Brain Science
% Objective: Plot the optimal baheviors used in the figures of the paper with ERROR BARS displayed
function F = soa_plotErrorBars(experiment, arrAxes, arrBehavior, fontsize, flag, sizeBin)
F = figure;
markerSize = 27;
lineWidth = @.1;
if experiment == 1
% Haggard et al., 2002 (Nat Neurosci): Seminal intentional binding experiment
%      Different keypress (i.e., the action) conditions
hold all
if flag == 1
errorbar(mean(reshape(arrAxes(1,:),sizeBin,[]),1), mean(reshape(arrBehavior(1,:),sizeBin,[]),1), std(reshape(arrBehavior(1,:),sizeBin,[]),2b,', ‘LineWidth', LineWidth,'MarkerSize', ¥
markerSize);
errorbar(mean(reshape(arrAxes(2,:),SsizeBin,[]),1), mean(reshape(arrBehavior(2,:),sizeBin,[]),1), std(reshape(arrBehavior(2,:),sizeBin,[]),1},', ‘LineWidth', LineWidth,'MarkerSize',”
markerSize) ;
errorbar(mean(reshape(arrAxes(3,:),SsizeBin,[]),1), mean(reshape(arrBehavior(3,:),sizeBin,[]),1), std(reshape(arrBehavior(3,:),sizeBin,[]),1k,', ‘LineWidth', LineWidth,'MarkerSize',¥”
markerSize) ;
lgnd = legend('Voluntary condition','Involuntary condition','Sham condition', ‘Location’, 'northwest');
elseif flag == 2
errorbar(mean(reshape(arrAxes(2,:),sizeBin, []),1), mean(reshape(arrBehavior(2,:),sizeBin,[]),1), std(reshape(arrBehavior(2,:),sizeBin,[]),1}),', ‘LineWidth', LineWidth,'MarkerSize',”
markerSize) ;
errorbar(mean(reshape(arrAxes(1,:),sizeBin,[]),1), mean(reshape(arrBehavior(1,:),sizeBin, []),1), std(reshape(arrBehavior(1,:),sizeBin,[]),1b,', ‘LineWidth', LineWidth,'MarkerSize', ¥
markerSize);
Ugnd = legend('Voluntary condition','Involuntary condition’, 'Location', 'northwest');
end
set(lgnd.BoxFace, ‘ColorType', ‘truecoloralpha', ‘ColorData', uint8(255*[1; 1; 1; @.8]));
set(gca, ‘Box', ‘on');
hold off
elseif experiment == 2
% Wolpe et al. 2013 (Exp Brain Res): Uncertainty is with the outcome
%       Different tone (i.e., the outcome) conditions
hold all
if flag == 1
errorbar(mean(reshape(arrAxes(1,:),SsizeBin, []),1), mean(reshape(arrBehavior(1,:),sizeBin,[]),1), std(reshape(arrBehavior(1,:),sizeBin,[]),2x¢plor', [@ @ 250/255] ,”
‘LineStyle','none','Marker', '.', ‘LineWidth', LineWidth,'MarkerSize', markerSize);
errorbar(mean(reshape(arrAxes(2,:),SizeBin, []),1), mean(reshape(arrBehavior(2,:),sizeBin,[]),1), std(reshape(arrBehavior(2,:),sizeBin,[]),1IXplor', [0 140/255 255/255] ”
‘LineStyle','none','Marker', ‘.', ‘LineWidth', LineWidth, '‘MarkerSize',markerSize) ;
errorbar(mean(reshape(arrAxes(3,:),SizeBin,[]),1), mean(reshape(arrBehavior(3,:),sizeBin, []),1), std(reshape(arrBehavior(3,:),sizeBin,[]),1¥plor', [0 240/255 255/255] ”
‘LineStyle','none','Marker', '.', ‘LineWidth', LineWidth, '‘MarkerSize',markerSize) ;
end
lgnd = legend('Low uncertainty’, ‘Intermediate uncertainty’, 'High uncertainty', 'Location', 'northwest');
set(lgnd.BoxFace, 'ColorType', ‘truecoloralpha', 'ColorData', uint8(255*[1; 1; 1; @.8]));
set(gca, ‘Box', ‘on');
hold of f
8/15/19 10:27 AM                         /Users/roberto/Documents/MATLAB/soa_plotErrorBars.m                                   2 of 2
end
set(gca,'FontSize', fontsize);