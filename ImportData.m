function [D] = ImportData(filename)

A = importdata(filename);
D = A;
D(:,4) = A(:,4)/100;
D(:,5) = A(:,5)/100;
D(:,8) = A(:,8)/365;