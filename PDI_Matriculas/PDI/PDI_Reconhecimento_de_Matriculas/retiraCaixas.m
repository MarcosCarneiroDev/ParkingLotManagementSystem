%Função que devolve o valor dos indices correspondentes das bounding
%boxes. NR é o n de regiões da matriz de indices correspondentes às
%boundingboxes, Container é largura total do contentor que contem as nossas
%6 areas de interesse. CHK=2 considera a largura da dimensão em Y e CHK=1
%considera a coordenada em Y do agrupamento.
function r=retiraCaixas(NR,container,chk)

%Inicializa uma variavel com uma matriz vazia
takethisbox=[];

for i=1:size(NR,1)
    if NR(i,(2*chk))>=container(1) && NR(i,(2*chk))<=container(2) % Se a bounding box está no contentor (com alguma tolerancia)
        takethisbox=cat(1,takethisbox,NR(i,:)); % Pega nessa caixa e concatena juntamente com a primeira dimensao
    end
end
r=[];
for k=1:size(takethisbox,1)
    var=find(takethisbox(k,1)==reshape(NR(:,1),1,[])); %Encontra os indices das caixas de interesse dentro de NR
    if length(var)==1                                  % coordenada de x das caixas vai ser unica 
        r=[r var];                                     
    else                                               % caso nao seja unica 
        for v=1:length(var)                            % entao verifica qual caixa se encaixa dentro da condiçao do contentor 
            M(v)=NR(var(v),(2*chk))>=container(1) && NR(var(v),(2*chk))<=container(2);
        end
        var=var(M);
        r=[r var];
    end
end
end
