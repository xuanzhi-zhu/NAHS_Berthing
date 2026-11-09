function out = a_i(x0,i,parameters)

e1=parameters.e1;
vertices=parameters.vertices;
bar_x=parameters.bar_x;
Delta=parameters.Delta;

%%%%%
xp=x0(1:7);
% state=x0(8:10);

%%%
p=xp(1:2);
q=xp(3:4);
% v=xp(5:6);
% o=xp(7);

%%%
% chi=state(1:2);
% theta=state(3);

%%%

p_i=vertices(:,i);

out=p(1) + e1'*R(q)*p_i - bar_x - Delta;

end

