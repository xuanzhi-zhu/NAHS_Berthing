function out = a(x0,parameters)

N=parameters.N;
k=parameters.k;

aux=0;
for i=1:1:N
    aux=aux+exp(k*a_i(x0,i,parameters));
end

out=1/k*log(aux);

end

