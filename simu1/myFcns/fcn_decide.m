function [inC,inD]=fcn_decide(state,xp,parameters)
delta=parameters.delta;

x0=[xp;state];

inC=(fcn_mu0(x0,parameters)<=delta);
inD=(fcn_mu0(x0,parameters)>=delta);

end

