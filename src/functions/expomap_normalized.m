function q_new = expomap_normalized(q,v)
%- Carlos J. Soto cjs7363@psu.edu

%- Input:
%- q        - Starting Curve
%- v        - Shooting vector

%- Output:
%- q_new    - The point on M reached by moving q in the direction of v

%- Note: this assumes q is normalized ie on the Hilbert Sphere



[rows, cols] = size(q);
if cols > rows
        q = q';
end
[rows, cols] = size(v);
if cols > rows
        v = v';
end


vnorm = sqrt(InnerProd_Q(v,v));
q_new = cos(vnorm)*q + sin(vnorm)*v/vnorm;

end