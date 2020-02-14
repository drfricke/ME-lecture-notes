%ME-18 lecture
%assume the data is the same length!

clear
close all;
alpha = .05;
%reset the enviro

filelist=dir('FakeSubj*.txt');

datanow0=load(filelist(1).name);
datanow=zeros(length(datanow0),length(filelist));
figure(1); clf ; hold on;
for filenow=1:length(filelist)
datanow(:,filenow)= load(filelist(filenow).name); %: short fall all files
%red underline = code eff. need to intl... thats why datanow0 and datanow...
plot(datanow(:,filenow))
end


[numrows, numcols] = size(datanow);
% ; suppress result
% help file always great reff...

% 'help normfit' in relp
% check size of datanow => size(datanow)... 200 3

for tindex=1:length(datanow)
[MUHAT,SIGMAHAT,MUCI,SIGMACI] = normfit(datanow(tindex,:), alpha);
%SIGMAHAT = SD
CI_mins(tindex)=MUCI(1);
CI_pls(tindex)=MUCI(2);
end

%we getting data and making a bunch of CI for each data point.
greyregion_y = [CI_mins, CI_pls(end:-1:1)];
greyregion_x = [1:length(datanow), length(datanow):-1:1];

patch(greyregion_x, greyregion_y, 'k', 'facecolor', [0 0 0], 'facealpha', .5, 'edgecolor','none')
