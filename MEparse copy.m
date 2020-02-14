

clear
close all;

%need to trim data!
%actually extending each dataset to match size
% two loops

filelist=dir('TrimThisFake*.txt'); %* = wildcard => just looking for beginning
percval = .1;
% Loop through file list to cut early data before threshold
figure(1); clf;
for filenow=1:length(filelist)
    datanow=load(filelist(filenow).name);
    threshvals(filenow)= percval*max(datanow);%decide theshold
    %find(datanow>threshvals(filenow))
    %firstcutindex = min(find(datanow>threshvals(filenow)))
    firstcutindex = find(datanow>threshvals(filenow),1);
    cuttempdata=datanow(firstcutindex:end);
    
    subplot(3,1,1); hold on
    plot(datanow)
    
    subplot(3,1,2); hold on
    plot(cuttempdata)
    
    cutdata{:,filenow}=cuttempdata;% saves data for next loop
    filelengths(filenow)=length(cuttempdata);
    %pause %neat and control c (command)
end

for filenow=1:length(filelist)
    cutarray=cutdata{:, filenow};
    lastdata=cutarray(end);
    extenddata=ones(max(filelengths),1)*lastdata; %makes a matrix of ones and scale it the value of last data
    extenddata(1:length(cutarray))=cutarray;
    
    subplot(3,1,3); hold on
    plot(extenddata)
end

%HW3 force vs time, CI intervals for all (pulses and/or static loads)
%really wants the CI plots.
%leaving out lots of data is okay...

%style guide for matlab code
%syllabus doc

