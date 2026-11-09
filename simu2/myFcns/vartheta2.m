function out = vartheta2(x0,tau,parameters)

out=vartheta1_prime(x0,tau,parameters) - alpha2(-vartheta1(x0,parameters),parameters);

end

