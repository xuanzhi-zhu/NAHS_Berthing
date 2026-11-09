function out=fcn_H(q,parameters)

h_p=parameters.h_p;
M=parameters.M;

out=[2.*h_p.*eye(2),            sqrt(h_p).*R(q)*M; ...
         sqrt(h_p).*M*(R(q))',  M*M];

end

