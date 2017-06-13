function lmfit = regress(x, y, model, xname, yname)
if nargin < 5
    yname = 'y';
end
if nargin < 4
    xname = 'x';
end
if nargin < 3
    model = 'y~x';
end
df = table(x, y, 'VariableNames', {xname, yname});
lmfit = fitlm(df, model);
