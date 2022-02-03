function val = InnerProd_Q(q1,q2)
%- Carlos J. Soto cjs7363@psu.edu
%- Function innerproduct

%- Input:
%- q1           -   n x d matrix, curve in R^d.
%- q2           -   n x d matrix, curve in R^d.

%- Output:
%- val          -   int q1(t)*q2(t) dt

[rows, cols] = size(q1);
if cols > rows
        q1 = q1';
end

[rows, cols] = size(q2);
if cols > rows
        q2 = q2';
end

[T,~] = size(q1);
val = trapz(linspace(0,1,T),sum(q1.*q2,2));

end