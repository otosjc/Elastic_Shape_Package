function betanew = ReSampleCurve(beta,N)

%- Re-sample a continuous curve beta so that it has N uniformly spaced 
%- sample points. 

% Inputs: 
%- beta             - An n x p curve in R^p
%- N                - A number of sample points for the output curve.
% Outputs: 
%- betanew          - An N x p resampled version of beta

[rows, cols] = size(beta);
if cols>rows
    beta = beta';
end

beta = beta';
n = length(beta);
d = beta(:,2:n)-beta(:,1:end-1);
w = [0 sqrt(sum(d.*d))];
gamma = cumsum(w)/sum(w);   
gammanew = linspace(0,1,N);
betanew = spline(gamma,beta,gammanew);
betanew = betanew';

end