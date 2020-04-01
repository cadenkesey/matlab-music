function [] = visualize(ogSound,sound)
figure('units','normalized','outerposition',[0 0 1 1]);
TotalTime = length(sound)./44100;
t = 0:TotalTime/(length(sound)):TotalTime-TotalTime/length(sound);
plot1 = plot(t,sound, 'red', 'Linewidth', 3);
%plot1.Color(4) = 0.2;
hold on;
plot2 = plot(t,ogSound, 'blue', 'Linewidth', 3);
plot2.Color(4) = 0.1;
xlabel('Time', 'FontWeight', 'bold', 'FontSize', 30);
ylabel('Amplitude', 'FontWeight', 'bold', 'FontSize', 30);
set(gca,'FontWeight','bold','FontSize',30);
end