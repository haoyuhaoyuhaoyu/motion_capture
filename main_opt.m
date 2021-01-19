%setup path
clear; close all; clc;
% 
% P(:,1) = [-0.7071;0.7071;3];
% P(:,2) = [-0.4472;0.8944;3.5];
% P(:,3) = [0.7071;0.7071;4];
% P(:,4) = [0.4472;0.8944;2];
% P(:,5) = [0.5477;0.8367;3];
% P(:,6) = [0.8367;-0.5477;9];
% P(:,7) = [-0.8944;-0.4472;5.5];
% P(:,8) = [-2;-0.4472;5.5];
% knee
P(:,1) = [-75.83822832; 72.80778638; 536.5989573];
P(:,2) = [-102.1975053; 63.39713638; 559.3958677];
P(:,3) = [-110.7011924; 34.03653886; 584.4585126];
P(:,4) = [-107.5956248; -6.720319277; 588.0156672];
P(:,5) = [-73.17714827; 17.13668512; 591.381229];

options = optimoptions('fmincon','Display','iter','Algorithm','interior-point');
   % 'StepTolerance',1e-15, 'ConstraintTolerance', 1e-10);
problem.options = options;
problem.solver = 'fmincon';
problem.nonlcon = @(x)Constraints(x,P,700);
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
show_soln(P, soln);
