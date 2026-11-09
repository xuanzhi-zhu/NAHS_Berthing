clear all
close all
clc

rng('shuffle');
addpath('./myFcns/')

load data_3

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
p_kappa5_vec=p_kappa5.signals.values;
q_kappa5_vec=q_kappa5.signals.values;
v_kappa5_vec=v_kappa5.signals.values;
o_kappa5_vec=o_kappa5.signals.values;
chi_kappa5_vec=chi_kappa5.signals.values;
theta_kappa5_vec=theta_kappa5.signals.values;
tau_u_kappa5_vec=tau_u_kappa5.signals.values;
tau_r_kappa5_vec=tau_r_kappa5.signals.values;
a_kappa5_vec=a_kappa5.signals.values;
vartheta1_kappa5_vec=vartheta1_kappa5.signals.values;
V0_kappa5_vec=V0_kappa5.signals.values;

p_kappa5_vec=reshape(p_kappa5_vec,[2 time_length]);
q_kappa5_vec=reshape(q_kappa5_vec,[2 time_length]);
v_kappa5_vec=reshape(v_kappa5_vec,[2 time_length]);
o_kappa5_vec=reshape(o_kappa5_vec,[1 time_length]);
chi_kappa5_vec=reshape(chi_kappa5_vec,[2 time_length]);
theta_kappa5_vec=reshape(theta_kappa5_vec,[1 time_length]);
tau_u_kappa5_vec=reshape(tau_u_kappa5_vec,[1 time_length]);
tau_r_kappa5_vec=reshape(tau_r_kappa5_vec,[1 time_length]);
a_kappa5_vec=reshape(a_kappa5_vec,[1 time_length]);
vartheta1_kappa5_vec=reshape(vartheta1_kappa5_vec,[1 time_length]);
V0_kappa5_vec=reshape(V0_kappa5_vec,[1 time_length]);



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
lightyellow=[0.9 0.9 0.3];
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



RCS1=plot(tout,vartheta1_kappa2_vec,':','Color',[blue alpha_1],'LineWidth',1.5*lineWidth,'MarkerSize',markerSize);hold on
RCS2=plot(tout,vartheta1_kappa5_vec,'-','Color',[lightyellow alpha_1],'LineWidth',3*lineWidth,'MarkerSize',markerSize);hold on

grid on

xlim([0,300])
ylim([-51,5.1])

%shore
shore_face_vec=1:1:4;
shore_vertices_vec=[0 -51; ...
                                0 0; ...
                                300 0; ...
                                300 -51];

shore=patch('Faces',shore_face_vec,'Vertices',shore_vertices_vec, ...
          EdgeColor='none',FaceColor=[0.9 0.9 0.9],EdgeAlpha=0.5,LineWidth=2);hold on

ax = gca;
ax.Layer = 'top';   % <-- add this

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

x0 = 0.15;  y0 = 0.96;  dx = 0.4;  seg = 0.05;
c  = {blue,   lightyellow, green,  purple};
ls = {':',    '-',    '--',   '-.'};      % solid, solid, dashed, dash-dot
%    CS1     CS2     CS3     CS4
lb = {'\ref{RCS1}','\ref{RCS2}'};

for k = 1:2
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
uistack([RCS1 RCS2], 'top')  % then bottom-up as needed

text(50, -33, '$\Cmc[2]$', 'FontSize',12)
% ax = gca;
% ax.Children = [CS_ini;CS1;CS2;CS3;CS4;saturation_outline];%first on top

ax = gca; % current axes
ax.FontSize = 12;



%%%=========================================================
% create a new pair of axes inside current figure
axes('position',[.55 .62 .3 .25])
box on % put box around new pair of axes

RCS1=plot(tout,vartheta1_kappa2_vec,':','Color',[blue alpha_1],'LineWidth',1.5*lineWidth,'MarkerSize',markerSize);hold on
RCS2=plot(tout,vartheta1_kappa5_vec,'-','Color',[lightyellow alpha_1],'LineWidth',3*lineWidth,'MarkerSize',markerSize);hold on

grid on

xlim([4,14])
ylim([-0.017,0.003])

ax.YAxis.Exponent = 0;
% Optionally set custom tick labels
yticks([-0.017 -0.007 0.003]);
yticklabels({'-17\times10^{-3}','-7\times10^{-3}','3\times10^{-3}'});

%shore
shore_face_vec=1:1:4;
shore_vertices_vec=[4 -0.017; ...
                                4 0; ...
                                14 0; ...
                                14 -0.017];

shore=patch('Faces',shore_face_vec,'Vertices',shore_vertices_vec, ...
          EdgeColor='none',FaceColor=[0.9 0.9 0.9],EdgeAlpha=0.5,LineWidth=2);hold on

ax = gca;
ax.Layer = 'top';   % <-- add this

set(gca, 'YScale', 'linear')
% yticks = ([10^(-6) 10^(-4) 10^(-2) 10^0 10^2]);
% yticklabels({'10^{-6}','10^{-4}','10^{-2}','10^{0}','10^{2}'})



uistack([RCS1 RCS2], 'top')  % then bottom-up as needed


matlabfrag2('simu_subsection3_vartheta1_percentage3')