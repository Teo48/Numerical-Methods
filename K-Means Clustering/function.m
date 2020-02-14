myDir = '/cls/';  %last backspace is important!
dirInfo = dir([myDir,'*.param']);
filenames = {dirInfo.name};
N = numel(filenames);
data=cell(N,1);  %need to use cell, you are not  100% sure all files has same lengths etc.
for i=1:N
    fid = fopen([myDir,filenames{i}] );
    data{i} = textscan(fid,'%s ');
    fclose(fid);
end
