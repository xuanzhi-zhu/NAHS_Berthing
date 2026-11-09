function out = vartheta1_prime(x0,tau,parameters)

out=a_prime_prime(x0,tau,parameters) + Dalpha1(-a(x0,parameters),parameters)*a_prime(x0,parameters);

end

