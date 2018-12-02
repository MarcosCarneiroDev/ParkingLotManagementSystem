%Esta função determina a matriz com o indice do nº de caixas requeridas 
%para a extração de caracteres da matriz NR. A Matrix NR representa o
%número total de regiões extraídas da função regionprops com a propriedade
%boundingbox.
%A ideia geral deste código é obter os indices das boundingboxes cuja largura 
%ao longo da dimensão y é quase a mesma. Se esta abordagem não funcionar,
%então as boundingboxes com as mesmas coordenadas de y são obtidas.
function r=controloBB(NR)

%Histograma de com a largura de todas as boundingboxes na dimensão Y
[Q,W]=hist(NR(:,4));

%Encontra indices de Q correspondentes à frequência 6. Isto porque em
%Portugal, as matriculas têm 6 caracteres; Este valor teria de ser alterado
%conforme as regiões;
%Q é uma linha de um vetor de frequência e W é uma linha de um vetor de
%todos os pontos centrais das boundingboxes.
ind=find(Q==6);

%Tira-se partido do comprimento e coordenada de NR na dimensão Y 
for k=1:length(NR)            
    C_5(k)=NR(k,2) * NR(k,4);
end

%Adiciona-se a nova coluna à nossa matriz NR
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
elseif isempty(ind) || length(ind)>1 % Se não tivermos um valor de 6 no vector Q
    [A,B]=hist(NR(:,2),20); % Abordamos apenas em relação às coordenadas em Y
    ind2=find(A==6);
    if length(ind2)==1
        MP=B(ind2);
        binsize=B(2)-B(1);
        container=[MP-(binsize/2) MP+(binsize/2)];
        r=retiraCaixas(NR,container,1);
    else
        % Chama a função adivinhaCaixas; Tenta adivinhar o contentor de 6
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