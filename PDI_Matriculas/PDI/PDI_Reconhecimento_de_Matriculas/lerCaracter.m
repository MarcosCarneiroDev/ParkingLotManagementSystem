%Interpreta a imagem e compara com templates; Devolve caracter;
function letter=lerCaracter(snap)

load NovoTemplate % Carrega o template em memória
snap=imresize(snap,[42 24]); % redimensiona imagem para ser igual a dos templates
comp=[ ];
for n=1:length(NovoTemplate)
    sem=corr2(NovoTemplate{1,n},snap); % Faz a correlação entre a imagem de entrada e todas as imagens de template   comp=[comp sem]; % Record the value of correlation for each template's character.
    comp=[comp sem]; % Record the value of correlation for each template's character.
end
vd=find(comp==max(comp)); % Encontra o índice que corresponde ao caractere mais parecido
%*-*-*-*-*-*-*-*-*-*-*-*-*-
if vd==1 || vd==2
    letter='A';
elseif vd==3 || vd==4
    letter='B';
elseif vd==5
    letter='C';
elseif vd==6 || vd==7
    letter='D';
elseif vd==8
    letter='E';
elseif vd==9
    letter='F';
elseif vd==10
    letter='G';
elseif vd==11
    letter='H';
elseif vd==12
    letter='I';
elseif vd==13
    letter='J';
elseif vd==14
    letter='K';
elseif vd==15
    letter='L';
elseif vd==16
    letter='M';
elseif vd==17
    letter='N';
elseif vd==18 || vd==19
    letter='O';
elseif vd==20 || vd==21
    letter='P';
elseif vd==22 || vd==23
    letter='Q';
elseif vd==24 || vd==25
    letter='R';
elseif vd==26
    letter='S';
elseif vd==27
    letter='T';
elseif vd==28
    letter='U';
elseif vd==29
    letter='V';
elseif vd==30
    letter='W';
elseif vd==31
    letter='X';
elseif vd==32
    letter='Y';
elseif vd==33
    letter='Z';
    %*-*-*-*-*
% Listagem de numeros
elseif vd==34
    letter='1';
elseif vd==35
    letter='2';
elseif vd==36
    letter='3';
elseif vd==37 || vd==38
    letter='4';
elseif vd==39
    letter='5';
elseif vd==40 || vd==41 || vd==42
    letter='6';
elseif vd==43
    letter='7';
elseif vd==44 || vd==45
    letter='8';
elseif vd==46 || vd==47 || vd==48
    letter='9';
else
    letter='0';
end
end