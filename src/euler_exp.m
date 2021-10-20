function [temps, y] = euler_exp(fct, tspan, Y0, nb_pas)
		
t0 = tspan(1);
tf = tspan(2);
h = (tf-t0)/nb_pas;		
Y0_col = reshape(Y0,[],1);
nb_comp = length(Y0_col);	
temps = reshape(linspace(t0,tf,nb_pas+1),1,nb_pas+1);
y = nan(nb_comp, nb_pas + 1);
y(:,1) = Y0_col;
	
for t=1:nb_pas
    yt = y(:,t);
    y(:,t+1) = yt + h*reshape(fct(temps(t),yt),nb_comp,1);
end
end