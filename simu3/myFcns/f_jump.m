function nextstate=f_jump(state, xp, parameters)

%%%
chi=state(1:2);
theta=state(3);

%%%

nextchi=chi;
nexttheta=1-theta;

nextstate=[nextchi;nexttheta];

end

