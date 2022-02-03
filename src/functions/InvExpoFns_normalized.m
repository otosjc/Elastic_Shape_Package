function [v]= InvExpoFns_normalized(f1,f2)
%- Carlos J. Soto cjs7363@psu.edu

%- This computes the shooting vector from f1 to f2 in shape space

%- Input:
%- f1       -   n x d matrix, curve in R^d.
%- f2       -   n x d matrix, curve in R^d.

%- Output:
%- v        - shooting vector from q1 to q2
% where q1 = SRVF(f1) and q2 = SRVF(f2)

%- If using this code, please cite Functional and Shape Data Analysis by
%- Anuj Srivastava and Eric Klassen

%- Note: this normalizes the SRVFs to be on the Hilbert Sphere

%- Need this first condition because can't divide by zero in calculation
if isequal(f1,f2)
    v = zeros(size(f1,1));
else
    [theta, q2_aligned] = dist_elastic_and_alignment(f1,f2);
    q1 = SRVF(f1);
    q1n = q1/sqrt(InnerProd_Q(q1,q1));
    v = theta/(sin(theta)) * (q2_aligned-(cos(theta)*q1n));
end

end

