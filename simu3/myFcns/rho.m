function out = rho(s,parameters)
%twice continuously differentiable
%rho(0)=0
%rho(s)>0 for s\neq 0

k_rho=0.1;

out=k_rho.*s'*s;

end

