function [u,t] = entree(D,A,Delta,Te)
[u,t] = gensig('square',Delta,D,Te);
u = -A/2*(2*u-1);
end