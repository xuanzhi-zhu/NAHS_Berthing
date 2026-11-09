function out = a_prime_prime(x0,tau,parameters)

out=eta(x0,parameters) + transpose(sigma(x0,parameters))*tau;

end

