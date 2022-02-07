function [Spirals] = CreateSpirals(n,p)
%- Created by Carlos Soto
%- Creates spirals with approximately p number of turns. The radii of the
%spirals are randomly generated but on average the radius will be 1.

%- Input:
%- n                The number of spirals to generate
%- p                The average number of spins

if nargin == 1
    p = 2;
end

t = [0:0.01:1];
Spirals = cell(1,n);
a = rand(n,1)/2-0.25;           %- random noise on number of turns
p = p*2;                        

for i = 1:n
    r = normrnd(1,0.1);
    Spirals{i} = [r * sin((p + a(i))*pi*t); r * cos((p+a(i))*pi*t); 3*t];
end

end

