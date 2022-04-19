8/15/19 10:28 AM                         /Users/roberto/Documents/MATLAB/soa_plotBehaviors.m                                   1 of 2
% Function to graph the SoA related measures
% Added 09/06/2017
function F = soa_plotBehaviors(experiment, arrBehavior, arrPXi1, fontsize, behavior)
F = figure;
linewidth = 2;
if experiment == 1
if behavior == 1
plot( arrPXil,arrBehavior(1,:)}b', arrPXil,arrBehavior(2,:),'r', arrPXil,arrBehavior(3,:),'k', ‘Linewidth', linewidth) ;
%{
hold all
plot(arrPXil1,arrBehavior(1,:),'b', 'Linewidth',3);
plot(arrPXil,arrBehavior(2,:),'r','Linewidth',3);
plot(arrPXil,arrBehavior(3,:),'Color', [0 0 0]+0.05x*13, 'Linewidth',3);
hold off
%}
elseif behavior == 3
plot( arrPXil,arrBehavior(2,:),r', arrPXil,arrBehavior(1,:),'b', arrPXil,arrBehavior(3,:),'k', '‘Linewidth', linewidth) ;
elseif behavior == 0
plot( arrPXil,arrBehavior(1,:),b', arrPXil,arrBehavior(2,:),'r', ‘Linewidth', linewidth) ;
elseif behavior == 2
ylim([@.@ 1.0]);
plot( arrPXil,arrBehavior(1,:),b', arrPXil,arrBehavior(2,:),'r', ‘Linewidth', linewidth) ;
end
elseif experiment == 2
hold on;
plot(arrPXil,arrBehavior(1,:),;Color', [0 @ 250/255],       ‘LineStyle', '-', 'Linewidth', linewidth) ;
plot(arrPXil,arrBehavior(2,:);Color', [@ 140/255 255/255], ‘LineStyle','-', ‘Linewidth', Linewidth) ;
plot(arrPXi1,arrBehavior(3,:),Color', [@ 240/255 255/255], ‘LineStyle','-',‘Linewidth', Linewidth) ;
hold off;
elseif experiment == 3
hold on;
plot(arrPXil,arrBehavior(1,:),;Color', [0 @ 250/255],       ‘LineStyle','-', 'Linewidth', linewidth) ;
plot(arrPXil,arrBehavior(2,:);Color', [@ 140/255 255/255], 'LineStyle','-',‘'Linewidth', linewidth) ;
hold off;
end
%{
xlabel('P(\xi=1) of Prior');
if behavior == 1
ylabel('Feeling of Agency');
elseif behavior == 2
ylabel('Judgment of Agency');
elseif behavior == 3
ylabel('Bias in Action Estimates');
elseif behavior == 4
ylabel('Bias in Outcome Estimates');
end
%}
if experiment == 1
if behavior == 1
lgnd = legend('Voluntary condition’, 'Involuntary condition','Sham condition’, ‘Location’, 'northwest');
elseif behavior ==3
lgnd = legend('Voluntary condition','Involuntary condition','Sham condition’, ‘Location’, 'northwest');
else
8/15/19 10:28 AM                         /Users/roberto/Documents/MATLAB/soa_plotBehaviors.m                                   2 of 2
lgnd = legend(‘Voluntary condition','Involuntary condition','Sham condition’, ‘Location’, 'northwest');
end
elseif experiment == 2
lgnd = legend('Low uncertainty condition’, ‘Intermediate uncertainty condition, ‘High uncertainty condition’ ‘Location', 'northeast');
elseif experiment == 3
lgnd = legend('Active, Instructed', ‘Passive, Instructed', 'Location', 'northeast');
end
set(gca,'FontSize', fontsize);
set(gca, 'Box', ‘on');
%set(lgnd, 'Color', 'none');
set(gca,'color', 'white');
set(lgnd.BoxFace, ‘ColorType', ‘truecoloralpha', ‘ColorData', uint8(255*[1; 1; 1; @.8]));
% If you want to bold
%ylabel('Feeling of Agency', 'FontWeight', ‘bold');
