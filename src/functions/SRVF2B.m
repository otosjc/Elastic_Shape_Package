function [p] = SRVF2B(q)
%- Carlos J. Soto cjs7363@psu.edu

%- This function takes in ONE q and returns its function
%- Input:
%- q    -   n x d matrix, curve in R^d

%- Output:
%- p    -   n x d matrix, int(q*norm(q)), curve in R^d

%- If using this code, please cite Functional and Shape Data Analysis by
%- Anuj Srivastava and Eric Klassen

[rows,cols] = size(q);
if cols > rows            
    q = q';
end
[T,d] = size(q);

qnorm = zeros(size(q,1),1);
for i = 1:T
    qnorm(i) = norm(q(i,:),'fro');
end

p = zeros(size(q));
for i = 1:d
    tmp = q(:,i).*qnorm';
    p(:,i) = cumtrapz( tmp/T);
end

end