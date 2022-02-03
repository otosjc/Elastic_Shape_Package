function [D, q2_aligned] = dist_elastic_wo_reflection(f1,f2)
%- Carlos J. Soto cjs7363@psu.edu
%- The elastic shape distance between two curves f1, f2. This code
%considers reflections which is not necessarily standard. 

%- Input:
%- f1                       - n x d matrix, curve in R^d. 
%- f2                       - n x d matrix, curve in R^d. 

%- Output:
%- D                        - Elastic Shape Distance
%- q2_aligned               - q2 := SRVF(f2) elastically aligned to q1


%- If using this code, please cite Functional and Shape Data Analysis by
%- Anuj Srivastava and Eric Klassen

[rows, cols] = size(f2);
if cols > rows
    f2 = f2';
end
[rows, cols] = size(f1);
if cols > rows
    f1 = f1';
end
%- If need not consider reflections need to change the following
[~,f2] = Procrustes_Align(f1,f2);

%- Change F to q:=SRVF
q1 = SRVF(f1);
q2 = SRVF(f2);

%- Unit Norm which is unit length of curve
q1s = q1/sqrt(InnerProd_Q(q1,q1));
q2s = q2/sqrt(InnerProd_Q(q2,q2));

%- Alignment step
for i = 1:2           
    [~,q2s,f2] = Warp_functions(q1s,q2s,f2);
    [~,q2s] = Procrustes_Align(q1s,q2s); 
end
q2_aligned = q2s/sqrt(InnerProd_Q(q2s,q2s));

D = acos(InnerProd_Q(q2_aligned,q1s));            



end
