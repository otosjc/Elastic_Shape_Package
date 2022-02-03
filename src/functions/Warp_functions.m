function [gamma,q2align,f2] = Warp_functions(q1,q2,f2)
%- Carlos J. Soto cjs7363@psu.edu
% - This function finds the optimal reparameterization in R^d of q2 to q1. This
% function does not center or scale shapes which needs to be done to get
% the best reparameterization. 


%- Input:
%- f1                       - n x d matrix, curve in R^d. 
%- f2                       - n x d matrix, curve in R^d.

%- Output:
%- hamma                    - optimal reparameterization
%- f2                       - f2(gamma) f2 composed with gamma
%- q2algin                  - q2(gamma)*gamma_dot the action in the srvf
%space is not simple composition, so we instead do composition in the f
%space and transform into the srvf space.


[rows, cols] = size(q1);
if cols > rows
    q1 = q1';
end
[rows, cols] = size(q2);
if cols > rows
    q2 = q2';
end
[rows, cols] = size(f2);
if cols > rows
    f2 = f2';
end

gam0 = DynamicProgrammingQ_A(q2'/norm(q2),q1'/norm(q1),0,0); 
gamma = (gam0-gam0(1))/(gam0(end)-gam0(1));           
f2 = Group_Action_Gamma(f2,gamma);
q2align = SRVF(f2);
q2align = q2align/sqrt(InnerProd_Q(q2align,q2align));

end

