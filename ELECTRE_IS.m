function [noyau]=ELECTRE_IS(A,n,m,poids,q,p,v,c)
%%%%%% Trouver l'indice de concordance par critère
for j=1:m
    MatriceConcorCritere=Indice_Concordance_Par_Critere(A(:,j),p(j),q(j),n);
end

%%%%%% Calculer l'indice de concordance globale
ConcordGlobale=zeros(n,n);
for i=1:n
    for k=1:n
        if i~=k
            tab=zeros(1,m);
            for j=1:m
            MatriceConcorCritere=Indice_Concordance_Par_Critere(A(:,j),p(j),q(j),n);
            tab(j)=MatriceConcorCritere(i,k);
            end
            tab;
            resultat=0;
            for j=1:m
                resultat=resultat+(tab(j)*poids(j));
            end
            resultat;
            ConcordGlobale(i,k)=resultat/100;
        else
            ConcordGlobale(i,k)=-inf;
        end
    end
end

ConcordGlobale;

%%%%%%% Trouver l'indice de discordance par critère
for j=1:m
    MatriceDiscordCritere=Indice_Discordance_Par_Critere_IS(ConcordGlobale,A(:,j),q(j),v(j),n,c);
end

%%%%%% Trouver la matrice de discordance globale
DiscordGlobale=zeros(n,n);
for i=1:n
    for k=1:n
     cpt=0;
     if i~=k
     for j=1:m
         MatriceDiscordCritere=Indice_Discordance_Par_Critere(ConcordGlobale,A(:,j),q(j),v(j),n,c);
         if MatriceDiscordCritere(i,k)==0
             cpt=cpt+1;
         end
     end
     if cpt~=m
         DiscordGlobale(i,k)=1;
     end
     end
    end
end
DiscordGlobale;

%%%%% Relation de surclassement
Sur=zeros(n,n);
for i=1:n
    for j=1:n
        if i~=j
            if ConcordGlobale(i,j)>=c && DiscordGlobale(i,j)==0
                Sur(i,j)=1;
            end
        end
    end
end
Sur

%%%%% Elimination des circuits 
cycle=TrouverCircuits(Sur,n);

cyclefinal=cycles(cycle,n);

Mat_Sur=TrouverMatriceSansCycles(Sur,cyclefinal,n);

%%%%% Identication du noyau 
noyau=Id_noyau(Mat_Sur,n)

%%%%% Calcul des indicateurs
Cohesion=Taux_Cohesion(Sur,cyclefinal,n)
%Liaison=Taux_Liaison(Sur,cyclefinal,n)




end