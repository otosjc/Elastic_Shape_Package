function f_centered = center_curve(f)
% Translate a point set f to have its center of mass at the origin.

% Inputs: 
%- f               - n x p matrix, i.e., an n-tuple in R^p. 

% Outputs: 
%- f_centered  - n x p matrix. A centered version of X.

[rows,cols] = size(f);
if cols > rows
    f = f';
end

[n,~] = size(f);
f_centered = f-repmat(mean(f),n,1);
end