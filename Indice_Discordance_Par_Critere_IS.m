%%%%% Fonction pour calculer l'indice de discordance pour chaque critère
%%%%% B : Matrice d'évaluation du problème (colonne spécéfique au critère
%%%%% étudié)
%%%%% Q : le seuil d'indifférence correpondant au critère
%%%%% V : le seuil de veto correspondant au critère
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