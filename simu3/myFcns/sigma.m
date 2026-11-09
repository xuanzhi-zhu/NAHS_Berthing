function out = sigma(x0,parameters)

m_u=parameters.m_u;
J=parameters.J;
e1=parameters.e1;
S=parameters.S;
N=parameters.N;
vertices=parameters.vertices;

%%%
xp=x0(1:7);
% xc=x0(8:10);

%%%
% p=xp(1:2);
q=xp(3:4);
% v=xp(5:6);
% o=xp(7);

% %%%
% chi=xc(1:2);
% theta=xc(3);

aux=zeros(2,1);
for i=1:1:N
    aux=aux+lambda_i(x0,i,parameters).*vertices(:,i);
end

out1=inv(m_u)*q(1);
out2=inv(J)*e1'*R(q)*S*aux;

out=[out1;out2];

end

