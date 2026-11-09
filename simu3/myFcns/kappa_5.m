function out = kappa_5(x0,parameters)

bar_b_ext=parameters.bar_b_ext;

aux=kappa_0(x0,parameters);

out=aux-max(0, bar_b_ext + vartheta2(x0,aux,parameters))*sigma(x0,parameters)*(norm(sigma(x0,parameters)))^(-2);

end

