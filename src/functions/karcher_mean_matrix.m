function [muF, muQ] = karcher_mean_matrix(dat)
%- Carlos J. Soto cjs7363@psu.edu

%- Input:
%- data2                size = nxdxN. N functions in R^d with n points each
%- In other functions I fix f vs f' issue. Here I do not since there are 6
%- permuations of how the data can be organized. The data must be exactly
%in the shown format or this will crash and/or produce terrible results.

%- Output:
%- muF                  The mean in F space
%- muQ                  The mean in Q space


Niter = 20;                             %- number of iterations
vXit = 0.001;                           %- Exit Condition
Epsilon = 0.5;                          %- Multiplied by vbar (stepsize)

delta = 100;                            %- norm of mu_n-mu, exit condit
n = size(dat,3);                        %- Number of curves being averaged
iter = 1;                               %- iterations counter (while loop)

%- The following does
%- f->q
%- q-> q/|q|

data = zeros(n,size(dat,1),size(dat,2));
q = data;

for i = 1:n
    data(i,:,:) = squeeze(dat(:,:,i));
    q(i,:,:) = SRVF(squeeze(data(i,:,:)));
    q(i,:,:) = q(i,:,:)/sqrt(InnerProd_Q(squeeze(q(i,:,:)),squeeze(q(i,:,:))));
end

muQ = squeeze(q(1,:,:));                            %- initial guess
muF = squeeze(data(1,:,:));
while (delta > 0.0001 && iter < Niter)
   
    for i = 1:n
        [th ,qAlign]= dist_elastic_and_alignment(muF,squeeze(data(i,:,:)));
        if th < 0.001
            v(i,:,:) = zeros(size(q,2),size(q,3));
        else
            FAlign = SRVF2B(qAlign);
            v(i,:,:) = InvExpoFns_normalized( muF, FAlign);
        end
    end
    vbar = sum(v,1)/size(v,1);                  %- average direction
    vbar = squeeze(vbar);
    thn = norm(vbar);
    if thn < vXit                       
        mu_n = muQ;
    else
        UpdateDirection = Epsilon*vbar;
        mu_n = expomap_normalized( muQ , UpdateDirection);
    end

    delta = norm(mu_n - muQ);
    muQ = mu_n;
    muF = SRVF2B(muQ);
    iter = iter + 1; 
end


end