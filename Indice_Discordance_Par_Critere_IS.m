%%%%% Fonction pour calculer l'indice de discordance pour chaque crit�re
%%%%% B : Matrice d'�valuation du probl�me (colonne sp�c�fique au crit�re
%%%%% �tudi�)
%%%%% Q : le seuil d'indiff�rence correpondant au crit�re
%%%%% V : le seuil de veto correspondant au crit�re
%%%%% n : le nombre d'actions
%%%%% IS
function [mat]=Indice_Discordance_Par_Critere_IS(ConcordGlobale,B,Q,V,n,c)
mat=zeros(n,n);

for i=1:n
    for j=1:n
        if i~=j
           result=B(j,1)-B(i,1);
            result1=V-(Q*(1-ConcordGlobale(i,j))/(1-c));
            if result<result1
                mat(i,j)=0;
            else
                mat(i,j)=1;
            end
         else
            mat(i,j)=-inf;
        end
    end
end
mat;

end