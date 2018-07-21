function [noyau]=Id_noyau(Mat,n)
solution=Mat;
 t=1;
 for i=1:n
     cpt=0; 
     for j=1:n
        if i~=j
            cpt=cpt+solution(j,i);
        end
     end
     
     
     if cpt==0
         noyau(t)=i;
         t=t+1;
     end
 end
 noyau;
%  [a,b]=size(noyau);
%  if b==0
%      disp('le noyau est vide')
%  end

end