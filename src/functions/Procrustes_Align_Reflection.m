function [O,f2_new] = Procrustes_Align_Reflection(f1,f2)
%- Carlos J. Soto cjs7363@psu.edu
% - This function finds the optimal rotation/reflection in R^d of f2 to f1. This
% function does not center or scale shapes which needs to be done to get
% the best rotation/reflection. 

%- Input:
%- f1                       - n x d matrix, curve in R^d. 
%- f2                       - n x d matrix, curve in R^d.

%- Output:
%- O                        - optimal rotation/relfection
%- f2_new                   - O*f2


[rows,cols] = size(f1);
if cols > rows
    f1 = f1';
end
[rows,cols] = size(f2);
if cols > rows
    f2 = f2';
end
[~, d] = size(f1);

A = f1'*f2;
[U, ~, V] = svd(A);                 
S = eye(d);
O = U*S*(V');        

f2_new = O*(f2');
f2_new = f2_new';



end

