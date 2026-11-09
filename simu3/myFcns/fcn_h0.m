function out = fcn_h0(q,theta,parameters)
q_ast=parameters.q_ast;
r=parameters.r;

out=(1-theta)*(1-q'*q_ast) + theta*h_ast(q'*r,parameters);

end

