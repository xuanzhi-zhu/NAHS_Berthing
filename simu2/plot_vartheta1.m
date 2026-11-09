clear all
close all
clc

rng('shuffle');
addpath('./myFcns/')

load data

time_length=numel(tout);

%%%CS1: safe hybrid
p_kappa2_vec=p_kappa2.signals.values;
q_kappa2_vec=q_kappa2.signals.values;
v_kappa2_vec=v_kappa2.signals.values;
o_kappa2_vec=o_kappa2.signals.values;
chi_kappa2_vec=chi_kappa2.signals.values;
theta_kappa2_vec=theta_kappa2.signals.values;
tau_u_kappa2_vec=tau_u_kappa2.signals.values;
tau_r_kappa2_vec=tau_r_kappa2.signals.values;
a_kappa2_vec=a_kappa2.signals.values;
vartheta1_kappa2_vec=vartheta1_kappa2.signals.values;
V0_kappa2_vec=V0_kappa2.signals.values;

p_kappa2_vec=reshape(p_kappa2_vec,[2 time_length]);
q_kappa2_vec=reshape(q_kappa2_vec,[2 time_length]);
v_kappa2_vec=reshape(v_kappa2_vec,[2 time_length]);
o_kappa2_vec=reshape(o_kappa2_vec,[1 time_length]);
chi_kappa2_vec=reshape(chi_kappa2_vec,[2 time_length]);
theta_kappa2_vec=reshape(theta_kappa2_vec,[1 time_length]);
tau_u_kappa2_vec=reshape(tau_u_kappa2_vec,[1 time_length]);
tau_r_kappa2_vec=reshape(tau_r_kappa2_vec,[1 time_length]);
a_kappa2_vec=reshape(a_kappa2_vec,[1 time_length]);
vartheta1_kappa2_vec=reshape(vartheta1_kappa2_vec,[1 time_length]);
V0_kappa2_vec=reshape(V0_kappa2_vec,[1 time_length]);

%%%CS2: nominal hybrid
p_kappa0_vec=p_kappa0.signals.values;
q_kappa0_vec=q_kappa0.signals.values;
v_kappa0_vec=v_kappa0.signals.values;
o_kappa0_vec=o_kappa0.signals.values;
chi_kappa0_vec=chi_kappa0.signals.values;
theta_kappa0_vec=theta_kappa0.signals.values;
tau_u_kappa0_vec=tau_u_kappa0.signals.values;
tau_r_kappa0_vec=tau_r_kappa0.signals.values;
a_kappa0_vec=a_kappa0.signals.values;
vartheta1_kappa0_vec=vartheta1_kappa0.signals.values;
V0_kappa0_vec=V0_kappa0.signals.values;

p_kappa0_vec=reshape(p_kappa0_vec,[2 time_length]);
q_kappa0_vec=reshape(q_kappa0_vec,[2 time_length]);
v_kappa0_vec=reshape(v_kappa0_vec,[2 time_length]);
o_kappa0_vec=reshape(o_kappa0_vec,[1 time_length]);
chi_kappa0_vec=reshape(chi_kappa0_vec,[2 time_length]);
theta_kappa0_vec=reshape(theta_kappa0_vec,[1 time_length]);
tau_u_kappa0_vec=reshape(tau_u_kappa0_vec,[1 time_length]);
tau_r_kappa0_vec=reshape(tau_r_kappa0_vec,[1 time_length]);
a_kappa0_vec=reshape(a_kappa0_vec,[1 time_length]);
vartheta1_kappa0_vec=reshape(vartheta1_kappa0_vec,[1 time_length]);
V0_kappa0_vec=reshape(V0_kappa0_vec,[1 time_length]);

%%%CS3: safe continuous
p_kappa3_vec=p_kappa3.signals.values;
q_kappa3_vec=q_kappa3.signals.values;
v_kappa3_vec=v_kappa3.signals.values;
o_kappa3_vec=o_kappa3.signals.values;
chi_kappa3_vec=chi_kappa3.signals.values;
theta_kappa3_vec=theta_kappa3.signals.values;
tau_u_kappa3_vec=tau_u_kappa3.signals.values;
tau_r_kappa3_vec=tau_r_kappa3.signals.values;
a_kappa3_vec=a_kappa3.signals.values;
vartheta1_kappa3_vec=vartheta1_kappa3.signals.values;
V0_kappa3_vec=V0_kappa3.signals.values;

p_kappa3_vec=reshape(p_kappa3_vec,[2 time_length]);
q_kappa3_vec=reshape(q_kappa3_vec,[2 time_length]);
v_kappa3_vec=reshape(v_kappa3_vec,[2 time_length]);
o_kappa3_vec=reshape(o_kappa3_vec,[1 time_length]);
chi_kappa3_vec=reshape(chi_kappa3_vec,[2 time_length]);
theta_kappa3_vec=reshape(theta_kappa3_vec,[1 time_length]);
tau_u_kappa3_vec=reshape(tau_u_kappa3_vec,[1 time_length]);
tau_r_kappa3_vec=reshape(tau_r_kappa3_vec,[1 time_length]);
a_kappa3_vec=reshape(a_kappa3_vec,[1 time_length]);
vartheta1_kappa3_vec=reshape(vartheta1_kappa3_vec,[1 time_length]);
V0_kappa3_vec=reshape(V0_kappa3_vec,[1 time_length]);

%%%CS4: nominal continuous
p_kappa4_vec=p_kappa4.signals.values;
q_kappa4_vec=q_kappa4.signals.values;
v_kappa4_vec=v_kappa4.signals.values;
o_kappa4_vec=o_kappa4.signals.values;
chi_kappa4_vec=chi_kappa4.signals.values;
theta_kappa4_vec=theta_kappa4.signals.values;
tau_u_kappa4_vec=tau_u_kappa4.signals.values;
tau_r_kappa4_vec=tau_r_kappa4.signals.values;
a_kappa4_vec=a_kappa4.signals.values;
vartheta1_kappa4_vec=vartheta1_kappa4.signals.values;
V0_kappa4_vec=V0_kappa4.signals.values;

p_kappa4_vec=reshape(p_kappa4_vec,[2 time_length]);
q_kappa4_vec=reshape(q_kappa4_vec,[2 time_length]);
v_kappa4_vec=reshape(v_kappa4_vec,[2 time_length]);
o_kappa4_vec=reshape(o_kappa4_vec,[1 time_length]);
chi_kappa4_vec=reshape(chi_kappa4_vec,[2 time_length]);
theta_kappa4_vec=reshape(theta_kappa4_vec,[1 time_length]);
tau_u_kappa4_vec=reshape(tau_u_kappa4_vec,[1 time_length]);
tau_r_kappa4_vec=reshape(tau_r_kappa4_vec,[1 time_length]);
a_kappa4_vec=reshape(a_kappa4_vec,[1 time_length]);
vartheta1_kappa4_vec=reshape(vartheta1_kappa4_vec,[1 time_length]);
V0_kappa4_vec=reshape(V0_kappa4_vec,[1 time_length]);




layout = [1;1;1;1]*ones(1,9);
h=create_axis(layout,16,...
    'innerymargin',0.1,...
    'botmargin',0,...
    'innerxmargin',0.1,...
    'leftmargin',0.05);
colors = get(gca,'colororder');
% blue=1/256.*[108 142 191];
blue=[0 0.6 1];
red=1/256.*[185 84 80];
% yellow=1/256.*[215 154 2];
yellow=[1 0.6 0];
% purple=1/256.*[151 115 166];
purple=[0.5 0.3 0.6];
% green=1/256.*[129 179 101];
green=[0.3 0.6 0.3];
grey=[0.5 0.5 0.5];
black=[0 0 0];

lineWidth = 2;
markerSize = 6;

alpha_1 = 1; % 0 = fully transparent, 1 = fully opaque
alpha_2 = 0.5;
alpha_3 = 0.4;
alpha_4 = 0.3;
alpha_5 = 0.2;



CS1=plot(tout,vartheta1_kappa2_vec,':','Color',[blue alpha_1],'LineWidth',1.5*lineWidth,'MarkerSize',markerSize);hold on
CS2=plot(tout,vartheta1_kappa0_vec,'-','Color',[yellow alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
CS3=plot(tout,vartheta1_kappa3_vec,'--','Color',[green alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
CS4=plot(tout,vartheta1_kappa4_vec,'-.','Color',[purple alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on

grid on

xlim([0,300])
ylim([-5.5,5])

%shore
shore_face_vec=1:1:4;
shore_vertices_vec=[0 -23; ...
                                0 0; ...
                                300 0; ...
                                300 -23];

shore=patch('Faces',shore_face_vec,'Vertices',shore_vertices_vec, ...
          EdgeColor='none',FaceColor=[0.9 0.9 0.9],EdgeAlpha=0.5,LineWidth=2);hold on

set(gca, 'YScale', 'linear')
% yticks = ([10^(-6) 10^(-4) 10^(-2) 10^0 10^2]);
% yticklabels({'10^{-6}','10^{-4}','10^{-2}','10^{0}','10^{2}'})


xh=xlabel('$t\,[\mathrm{s}]$','fontsize',12);
yh=ylabel('$\vartheta[1]$','fontsize',12);

% Adjust position - negative values move left, positive move right
% Format: [x, y, z] in normalized units
set(xh, 'Units', 'normalized');
currentPos = get(xh, 'Position');
set(xh, 'Position', [currentPos(1), currentPos(2)-0.08, currentPos(3)]);  % Move down

set(yh, 'Units', 'normalized');
currentPos = get(yh, 'Position');
set(yh, 'Position', [currentPos(1)-0.09, currentPos(2), currentPos(3)]);  % Move left



ax = gca;
ap = ax.Position; xl = ax.XLim; yl = ax.YLim;
fig2data = @(xf,yf) deal( xl(1)+(xf-ap(1))/ap(3)*diff(xl), ...
                          yl(1)+(yf-ap(2))/ap(4)*diff(yl) );

x0 = 0.15;  y0 = 0.96;  dx = 0.2;  seg = 0.05;
c  = {blue,   yellow, green,  purple};
ls = {':',    '-',    '--',   '-.'};      % solid, solid, dashed, dash-dot
%    CS1     CS2     CS3     CS4
lb = {'\ref{CS1}','\ref{CS2}','\ref{CS3}','\ref{CS4}'};

for k = 1:4
    xk = x0 + (k-1)*dx;
    annotation('line', [xk xk+seg], [y0 y0], ...
               'Color', c{k}, 'LineWidth', lineWidth, ...
               'LineStyle', ls{k});
    [xd,yd] = fig2data(xk+seg+0.01, y0);
    text(xd, yd, lb{k}, 'FontSize',12, ...
         'VerticalAlignment','middle', 'Rotation',0);
end

% 
% leg=legend([CS1 CS2 CS3 CS4], ...
%                   {'\ref{CS1}', ...
%                    '\ref{CS2}', ...
%                    '\ref{CS3}', ...
%                    '\ref{CS4}'},'FontSize',12);
% legend('boxoff')
% leg.Orientation='horizontal';
% set(leg,...
%     'Location','best')
% pos = leg.Position;
% set(leg,...
%     'Position',pos+[-0 0.49 0.25 0.15])

% Reorder children
uistack([CS1 CS2 CS3 CS4 shore], 'top')  % then bottom-up as needed

text(150, -4.5, '$\Cmc[2]$', 'FontSize',12)
% ax = gca;
% ax.Children = [CS_ini;CS1;CS2;CS3;CS4;saturation_outline];%first on top

ax = gca; % current axes
ax.FontSize = 12;



% %%%=========================================================
% % create a new pair of axes inside current figure
% axes('position',[.6 .39 .25 .45])
% box on % put box around new pair of axes
% 
% CS1_mini=plot(tout,q2_kappa2_vec,'-','Color',[blue alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
% CS2_mini=plot(tout,q2_kappa0_vec,'-','Color',[yellow alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
% CS3_mini=plot(tout,q2_kappa3_vec,'-','Color',[green alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
% CS4_mini=plot(tout,q2_kappa4_vec,'-','Color',[purple alpha_1],'LineWidth',lineWidth,'MarkerSize',markerSize);hold on
% 
% grid on
% set(gca, 'YScale', 'linear')
% % axis tight
% 
% 
% xlim([100,300])
% ylim([-0.01,0.1])


matlabfrag2('simu_subsection2_vartheta1')