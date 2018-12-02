%Esta funcao extrai os caracteres da imagem de entrada
function extracaoMatricula

%L� a imagem de entrada
f=imread('FICHEIROAQUI');

%Resize � imagem
f=imresize(f,[400 NaN]);

%Converte a imagem para tons de cinzento
g=rgb2gray(f);

%Filtro Mediano para reduzir ru�do
g=medfilt2(g,[3 3]);

%Processamento Morfol�gico - criado disco raio 1 
se=strel('disk',1);

%Dilata��o com o disco criado acima
gi=imdilate(g,se);

%Eros�o com o disco criado acima
ge=imerode(g,se);

%Subtra��o da imagem Dilatada com a de Eros�o - Melhoria das arestas
gdiff=imsubtract(gi,ge);

%Convers�o para double
gdiff=mat2gray(gdiff);

%Convolu��o da imagem para dar brilho �s arestas
gdiff=conv2(gdiff,[1 1;1 1]);

%Ajustamento de intensidade entre 0 e 1
gdiff=imadjust(gdiff,[0.5 0.7],[0 1],0.1);

%Convers�o para Bin�rio
B=logical(gdiff);

%Eliminar possiveis linhas horizontais da imagem
% Aplicamos uma segunda vez eros�o
er=imerode(B,strel('line',50,0));
out1=imsubtract(B,er);

% Preenche todas as regi�es da imagem
F=imfill(out1,'holes');

% Diminui a imagem e melhora (e torna mais fina) as arestas
H=bwmorph(F,'thin',1);
H=imerode(H,strel('line',3,90));

% Seleciona todas as regi�es em que a �rea � maior que 100 pixeis
final=bwareaopen(H,100);

% final=bwlabel(final);% Uncomment to make compitable with the previous versions of MATLAB�

%Adquirir as propriedades BoundingBox e Image
Iprops=regionprops(final,'BoundingBox','Image');

%Selecionamos todos as bounding boxes da matriz para a concatena��o de
%forma a ficar-mos com uma �nica matriz
NR=cat(1,Iprops.BoundingBox);

% Chamamos a nossa fun��o controlling, com o nosso argumento NR, que nos
% vai devolver um array com o indice de n� de caixas requeridas para a
% extra��o de caracteres
r=controloBB(NR);

%Se o numero de indices desejado for alcan�ado
if ~isempty(r)
    I={Iprops.Image}; % Conjunto de celulas de 'Image' (propriedade de regionprops)
    nMatricula=[]; % Inicializa uma variavel vazia onde iremos colocar a nossa matricula
    for v=1:length(r)
        N=I{1,r(v)}; % Extrai a imagem binaria correspondente ao numero de indices em 'r'.
         % Chama a nossa fun��o ler Caracter � imagem binaria 'N'.
        letter=lerCaracter(N);
        
        %Vao haver sempre problemas: 0 e O � um deles. Se na matricula
        %houver um padra (ex: primeiras 2 caracteres sao sempre letras)
        %seria facil de resolver a quest�o
%         while letter=='O' || letter=='0' 
%             if v<=2                  
%                 letter='O';             
%             else                       
%                 letter='0';            
%             end                        
%             break;                       
%         end
        
        nMatricula=[nMatricula letter]; % Vai adicionando cada caracter
    end
    fid = fopen('numeroMatricula.txt', 'wt'); % Abre documento
    fprintf(fid,'%s\n',nMatricula);      % escreve
    fclose(fid);                      % fecha documento
    
else % Se falhar ao extrair o numero de indexes em 'r', vao aparecer as mensagens abaixo
    fid = fopen('numeroMatricula.txt', 'wt'); % Abre documento
    fprintf(fid,'%s\n','Erro');      % escreve
    fclose(fid);                      % fecha documento
    %fprintf('N�o foi possivel extrair os caracteres da matricula.\n');
    %fprintf('Os caracteres podem nao estar legiveis ou muito proximos uns dos outros.\n');
end
end