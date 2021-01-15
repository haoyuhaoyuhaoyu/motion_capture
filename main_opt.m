%setup path
clear; close all; clc;

P(:,1) = [-0.7071;0.7071;3];
P(:,2) = [-0.4472;0.8944;3.5];
P(:,3) = [0.7071;0.7071;4];
P(:,4) = [0.4472;0.8944;2];
P(:,5) = [0.5477;0.8367;3];
P(:,6) = [0.8367;-0.5477;9];
P(:,7) = [-0.8944;-0.4472;5.5];
P(:,8) = [-2;-0.4472;5.5];

options = optimoptions('fmincon','Display','iter','Algorithm','interior-point');
   % 'StepTolerance',1e-15, 'ConstraintTolerance', 1e-10);
problem.options = options;
problem.solver = 'fmincon';
problem.nonlcon = @(x)Constraints(x,P);
problem.objective = @(x)Obj_minErr(x,P);
problem.x0 = zeros(1,7);

soln = fmincon(problem);
% %%
% x = soln;
% P0 = x(1:3)';
% Vd = x(4:6)';
% r  = x(7);
% error = zeros(7,1);
% for i = 1:1:7
%        Pt = P(:,i);
%        k(:,i) = (Pt-P0)'*Vd*Vd;
%        m(:,i) = (Pt-P0);
%        %disp((Pt-P0))
%        s(:,i) = (Pt-P0)-(Pt-P0)'*Vd*Vd;
%        error(i) = norm((Pt-P0)-(Pt-P0)'*Vd*Vd) - r;
% end
%%
scatter3(P(1,:),P(2,:),P(3,:),...
    'filled')
axis equal
hold on
P0 = soln(1:3)';
Nor_Vec = soln(4:6)';
r = soln(7);
Vec(:,1) = P0;
Vec(:,2) = P0 + 20*Nor_Vec;
plot3(Vec(1,:),Vec(2,:),Vec(3,:),'LineWidth',1.5);
hold on
plot3(Vec(1,2),Vec(2,2),Vec(3,2),'--r^','LineWidth',1.5);
hold on
POrg = P0 - 20*Nor_Vec;
PEnd = P0 + 10*Nor_Vec;
cylinder3(POrg,PEnd,r,60,'g',0,1);