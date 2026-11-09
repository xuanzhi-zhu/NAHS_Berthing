function out = eta(x0,parameters)

N=parameters.N;
k=parameters.k;

aux=0;
for i=1:1:N
    lambda_i_=lambda_i(x0,i,parameters);

    aux=aux ...
            + lambda_i_*ell_i(x0,i,parameters) ...
            + k*lambda_i_*( a_prime_i(x0,i,parameters) - a_prime(x0,parameters) )^2;
end

out=aux;

end

