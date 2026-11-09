function out = Dh0_Dy(q,theta,parameters)

q_ast=parameters.q_ast;
r=parameters.r;

out=-(1-theta).*q_ast' + theta.*Dh_ast(q'*r,parameters).*r';

end

