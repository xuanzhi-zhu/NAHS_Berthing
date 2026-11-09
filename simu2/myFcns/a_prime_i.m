function out = a_prime_i(x0,i,parameters)

vertices=parameters.vertices;
e1=parameters.e1;
S=parameters.S;

%%%%%
xp=x0(1:7);
% state=x0(8:10);

%%%
% p=xp(1:2);
q=xp(3:4);
v=xp(5:6);
o=xp(7);

% %%
% chi=state(1:2);
% theta=state(3);
% 
% %%%

p_i=vertices(:,i);

out=e1'*R(q)*(v+S*p_i*o);

end