function out = lambda_i(x0,i,parameters)

N=parameters.N;
k=parameters.k;

aux=0;
for ind=1:1:N
    aux=aux+exp(k*a_i(x0,ind,parameters));
end

out=exp(k*a_i(x0,i,parameters))/aux;

end

