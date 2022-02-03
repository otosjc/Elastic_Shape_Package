function D = dist_L2_wo_reflection(f1,f2)
%- Created by Carlos Soto cjs7363@psu.edu


%- Input:
%- f1                       - n x d matrix, curve in R^d. 
%- f2                       - n x d matrix, curve in R^d. 

%- Output:
%- D                        - L2 Distance


[rows, cols] = size(f2);
if cols > rows
    f2 = f2';
end
[rows, cols] = size(f1);
if cols > rows
    f1 = f1';
end

%- Center The curves at the origin
f1 = center_curve(f1);
f2 = center_curve(f2);


[n1,~]=size(f1);
[n2,~]=size(f2);

%- Resample here if necessary
if n1 ~= n2
    m = max(n1,n2);
    if n1 == m
        f2 = ReSampleCurve(f2,m);
    else
        f1 = ReSampleCurve(f1,m);
    end
end
%- Rigid Rotation
[~,f2] = Procrustes_Align(f1,f2);


%- L2 Distance = \int (f2-f1)^2 dt
D = sqrt(InnerProd_Q(f2-f1,f2-f1));


end
