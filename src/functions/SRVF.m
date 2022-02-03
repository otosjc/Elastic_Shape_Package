function [q] = SRVF(f)
%- Carlos J. Soto cjs7363@psu.edu
%- This functions takes in ONE curve and outputs its SRVF/SRSF

%- Input:
%- f    -   n x d matrix, in R^d.

%- Output:
%- q    -   n x d matrix, dot(f)/sqrt(norm(dot(f)))

%- If using this code, please cite Functional and Shape Data Analysis by
%- Anuj Srivastava and Eric Klassen

[rows,cols] = size(f);
if cols > rows
        f = f';
end

[t,d] = size(f);
v = zeros(size(f));
for i = 1:d
    v(:,i) = gradient(f(:,i),1/(t));
end

L = zeros(size(v,1),1);
q = zeros(size(f));
for i = 1:t
    L(i) = sqrt(norm(v(i,:),'fro'));
    if L(i) > 0.00001
        q(i,:) = v(i,:)/L(i);
    else
        q(i,:) = zeros(d,1);
    end
end

end