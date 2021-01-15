function obj = Obj_minErr(x,P)
    [~, Num] = size(P);
    error = zeros(Num,1);
    P0 = x(1:3)'; % 3*1
    Vd = x(4:6)';
    r  = x(7);
    for i = 1:1:Num
       Pt = P(:,i);
       error(i) = (norm((Pt-P0)-(Pt-P0)'*Vd*Vd) - r)^2;
    end
%     obj = 1;
    obj = sum(error);
end