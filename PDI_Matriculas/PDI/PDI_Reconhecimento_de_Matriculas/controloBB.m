%Esta fun��o determina a matriz com o indice do n� de caixas requeridas 
%para a extra��o de caracteres da matriz NR. A Matrix NR representa o
%n�mero total de regi�es extra�das da fun��o regionprops com a propriedade
%boundingbox.
%A ideia geral deste c�digo � obter os indices das boundingboxes cuja largura 
%ao longo da dimens�o y � quase a mesma. Se esta abordagem n�o funcionar,
%ent�o as boundingboxes com as mesmas coordenadas de y s�o obtidas.
function r=controloBB(NR)

%Histograma de com a largura de todas as boundingboxes na dimens�o Y
[Q,W]=hist(NR(:,4));

%Encontra indices de Q correspondentes � frequ�ncia 6. Isto porque em
%Portugal, as matriculas t�m 6 caracteres; Este valor teria de ser alterado
%conforme as regi�es;
%Q � uma linha de um vetor de frequ�ncia e W � uma linha de um vetor de
%todos os pontos centrais das boundingboxes.
ind=find(Q==6);

%Tira-se partido do comprimento e coordenada de NR na dimens�o Y 
for k=1:length(NR)            
    C_5(k)=NR(k,2) * NR(k,4);
end

%Adiciona-se a nova coluna � nossa matriz NR
NR2=cat(2,NR,C_5');
[E,R]=hist(NR2(:,5),20);

%Procura-se por 6 caracteres
Y=find(E==6);

if length(ind)==1 % Se 6 caixas de interesse forem encontradas
    MP=W(ind);    %  passamos o ponto central da caixa
    binsize=W(2)-W(1); % calculamos o tamanho do contentor
    container=[MP-(binsize/2) MP+(binsize/2)]; % calculamos o tamanho completo do contentor
    %Chamamos a nossa funcao takeboxes com os parametros NR(a nossa
    %matriz), o container (largura total do contentor que contem as nossas
    %6 areas de interesse). No terceiro parametro enviamos o valor 2 ou 1.
    %Vai devolver para r, o valor dos indices correspondentes das bounding
    %boxes
    r=retiraCaixas(NR,container,2);
elseif length(Y)==1 %Mesmo procedimento mas para a nossa matriz com nova coluna
    MP=R(Y);
    binsize=R(2)-R(1);
    container=[MP-(binsize/2) MP+(binsize/2)];
    r=retiraCaixas(NR2,container,2.5);
elseif isempty(ind) || length(ind)>1 % Se n�o tivermos um valor de 6 no vector Q
    [A,B]=hist(NR(:,2),20); % Abordamos apenas em rela��o �s coordenadas em Y
    ind2=find(A==6);
    if length(ind2)==1
        MP=B(ind2);
        binsize=B(2)-B(1);
        container=[MP-(binsize/2) MP+(binsize/2)];
        r=retiraCaixas(NR,container,1);
    else
        % Chama a fun��o adivinhaCaixas; Tenta adivinhar o contentor de 6
        % boudingboxes de interesse
        container=adivinhaCaixas(A,B,(B(2)-B(1)));
        
        if ~isempty(container) % Se nos foi devolvida uma matriz vazia
            r=retiraCaixas(NR,container,1);
        elseif isempty(container)
            container2=adivinhaCaixas(E,R,(R(2)-R(1)));
            if ~isempty(container2)
                r=retiraCaixas(NR2,container2,2.5);
            else
                r=[]; % Caso contrario assigna uma matriz vazia a r
            end
        end
    end
end
end