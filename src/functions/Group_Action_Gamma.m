function f_warped = Group_Action_Gamma(f,gamma)
%- This function warps f by gamma, that is f -> f(g)


%- Input:
%- f                - function f, must not be SRVF(f)
%- gamma            - A warping function

%- Output:
%- f_warped         - f\circ gamma

[rows, cols]=size(f);
if cols>rows
    f = f';
end
[n,d] = size(f);

f_warped = zeros(size(f,1),size(f,2));
t = linspace(0,1,n);
for i=1:d
    f_warped(:,i) = interp1(t,f(:,i),gamma);
%     f_warped(:,i) = interp1(linspace(0,1,n),f(:,i),gamma);
end


end