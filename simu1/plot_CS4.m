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

%vessel polygon
vertices_vec=vertices';
face_vec=1:1:N;

alphas = linspace(0.01, 0.1, time_length)';%transparency vector


intersect=bar_x+Delta;

xlims=[-1.66 1];
ylims=[-5.66 0.873];


%initial location
ini_p=plot(p_kappa0_vec(1,1),p_kappa0_vec(2,1),'s','Color',[0 0 0],'MarkerSize',8,'LineWidth',2);hold on;
%desired location
desired_p=plot(p_d(1),p_d(2),'d','Color',[0 0 0],'MarkerSize',8,'LineWidth',2);hold on;
%shore
shore_face_vec=1:1:4;
shore_vertices_vec=[intersect ylims(1); ...
                                intersect ylims(2); ...
                                xlims(2) ylims(2); ...
                                xlims(2) ylims(1)];

shore=patch('Faces',shore_face_vec,'Vertices',shore_vertices_vec, ...
          EdgeColor='none',FaceColor=[0.9 0.9 0.9],EdgeAlpha=0.8,LineWidth=2);hold on

% Boundary line x = intersect
xshore=xline(intersect, 'k-', 'LineWidth', 1.5);hold on

 %%%CS3: safe continuous controller: kappa3
 INDEX=[1;201;401;601;1001;1601;2401;30001];%index of chosen frames
 for ind=1:1:numel(INDEX)
     i=INDEX(ind);
    %current and past location
    scatter(p_kappa4_vec(1,i), p_kappa4_vec(2,i), ...
        'o', ...                    % marker shape
        'SizeData', 30, ...        % corresponds to plot's LineWidth effect (adjust as needed)
        'MarkerEdgeColor', [0.5 0.5 0.5], ... % edge color (RGB, no alpha here)
        'MarkerEdgeAlpha', (ind/numel(INDEX)), ... % key: edge transparency
        'LineWidth', 2);hold on            % edge line width
    %current and past vessel polygon
    R_=R(q_kappa4_vec(:,i));
    vertices_position_vec=zeros(size(vertices_vec));
    for ind_=1:1:N
        vertices_position_vec(ind_,:)=transpose( R_*transpose(vertices_vec(ind_,:)) + p_kappa4_vec(:,i) );
    end

    patch('Faces',face_vec,'Vertices',vertices_position_vec, ...
              EdgeColor=purple,FaceColor="none",EdgeAlpha=(ind/numel(INDEX)),LineWidth=2);hold on

    % text(p_kappa2_vec(1,i)-0.2, p_kappa2_vec(2,i), sprintf('$t=%0.f\\,\\mathrm{s}$', tout(i)))
 end

grid on
axis equal
% set(gca, 'YScale', 'linear')


xh=xlabel('$y_I\,[\mathrm{m}]$','fontsize',12);
yh=ylabel('$x_I\,[\mathrm{m}]$','fontsize',12);

% Adjust position - negative values move left, positive move right
% Format: [x, y, z] in normalized units
set(xh, 'Units', 'normalized');
currentPos = get(xh, 'Position');
set(xh, 'Position', [currentPos(1), currentPos(2)-0.05, currentPos(3)]);  % Move down

set(yh, 'Units', 'normalized');
currentPos = get(yh, 'Position');
set(yh, 'Position', [currentPos(1)-0.05, currentPos(2), currentPos(3)]);  % Move left


xh.Rotation = 0;
yh.Rotation = 90;

% leg=legend([saturation_outline CS1 CS2 CS3 CS4 CS_ini], ...
%                   {'bounds as per~\eqref{eqn:input constraint}', ...
%                    '\ref{CS1}', ...
%                    '\ref{CS2}', ...
%                    '\ref{CS3}', ...
%                    '\ref{CS4}', ...
%                    '$\tau(0,0)$'},'fontsize',12);
% legend('boxoff')
% leg.Orientation='vertical';
% set(leg,...
%     'Location','best')
% pos = leg.Position;
% set(leg,...
%     'Position',pos+[-0.3 0.05 0 0.15])

% Reorder children
% uistack([CS_ini CS1 CS2 CS3 CS4 saturation_outline], 'top')  % then bottom-up as needed
% ax = gca;
% ax.Children = [CS_ini;CS1;CS2;CS3;CS4;saturation_outline];%first on top

ax = gca; % current axes
ax.FontSize = 12;


xlim(xlims)
ylim(ylims)

ax.XAxisLocation = 'top';
ax.TickDir  = 'out';            % ticks point outward
ax.TickLength = [0.05 0.02];    % longer = labels sit further out

camroll(ax, -90)


uistack(xshore, 'bottom');
uistack(shore, 'bottom');

uistack(ini_p, 'top');
uistack(desired_p, 'top');
text(p_kappa0_vec(1,1)+0.7,p_kappa0_vec(2,1)-0.3, '$p(0,0)$','fontsize',12)
% text(p_d(1)-0.25,p_d(2)-1,'$p_d$','fontsize',12)

text(p_kappa0_vec(1,1)+1.7,p_kappa0_vec(2,1)-0.3, '$\text{shore}$','fontsize',12)

% ax.XAxisLocation = 'bottom';


%%%=========================================================
% % create a new pair of axes inside current figure
% axes('position',[.72 .3 .15 .55])
% box on % put box around new pair of axes
% 
% 
% grid on
% set(gca, 'YScale', 'linear')
% axis tight


% xlim([-0.25,0.25])
% ylim([-1.5,1.5])

matlabfrag2('simu_subsection1_CS4')