function out = kappa_2(x0,parameters)

aux=kappa_0(x0,parameters);

out=aux-max(0,vartheta2(x0,aux,parameters))*sigma(x0,parameters)*(norm(sigma(x0,parameters)))^(-2);

end

