function out = a_prime(x0,parameters)

N=parameters.N;

aux=0;
for i=1:1:N
    aux=aux+lambda_i(x0,i,parameters)*a_prime_i(x0,i,parameters);
end

out=aux;

end

