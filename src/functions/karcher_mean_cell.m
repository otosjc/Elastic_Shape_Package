function [muF, muQ] = karcher_mean_cell(data2)
%- Created by Carlos
%- Find the average of the curves with given indices
%- data 2 must be cells
%- ReSampNum is the number of points to resample with, increase run time
%exponentially 

%- Input:
%- data2                N functions in R^d with n points each

%- Output:
%- muF                  The mean in F space
%- muQ                  The mean in Q space


Niter = 20;                             %- number of iterations
vXit = 0.001;                           %- Exit Condition
AlignIter = 2;                          %- iterations to align
Epsilon = 0.4;                          %- Multiplied by vbar

delta = 100;                            %- norm of mu_n-mu, exit condit
n = size(data2,2);                      %- Number of curves being averaged
iter = 1;                               %- iterations counter (while loop)

%- The following does
%- Cells to Matrices
%- f->q
%- q-> q/|q|
for i = 1 : n
    if size(data2{i},1) < size(data2{i},2)
        data2{i} = data2{i}';
    end
end

data = zeros(n,size(data2{1},1),size(data2{1},2));
q = data;
for i = 1:n
    data(i,:,:) = squeeze(data2{i});
    q(i,:,:) = SRVF(squeeze(data(i,:,:)));
    q(i,:,:) = q(i,:,:)/sqrt(InnerProd_Q(squeeze(q(i,:,:)),squeeze(q(i,:,:))));
end

muQ = squeeze(q(1,:,:));                  %- initial guess
muF =  squeeze(data(1,:,:));
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
    vbar = sum(v,1)/size(v,1);              %- average direction
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