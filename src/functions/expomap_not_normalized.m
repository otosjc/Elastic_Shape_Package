function q_new = expomap_not_normalized(q,v)
%- Carlos J. Soto cjs7363@psu.edu

%- This exponential map is just addition, so for R^n

%- Input:
%- q        - Starting Curve
%- v        - Shooting vector

%- Output:
%- q_new    - The point on M reached by moving q in the direction of v

%- Note: this assumes q is not normalized ie on a linear space

[rows, cols] = size(q);
if cols > rows
        q = q';
end
[rows, cols] = size(v);
if cols > rows
        v = v';
end

q_new = q + v;

end