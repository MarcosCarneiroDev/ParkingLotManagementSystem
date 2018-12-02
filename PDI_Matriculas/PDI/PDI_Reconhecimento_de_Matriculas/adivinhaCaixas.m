%Funcao tenta adivinhar o contentor de 6 boudingboxes de interesse,
%através da linha do vetor Q, a linha do vetor do ponto a meio das cixas em
%W e o tamanho da caixa em BSIZE
function container=adivinhaCaixas(Q,W,bsize)

for l=5:-1:2 % Condição tem de ser alterada se o nº de caixas tiver de ser diferente de 6
    val=find(Q==l); % Encontra os indices correspondentes ao valor de frequencia '1'
    var=length(val); % Verifica quantos indices foram encontrados
    if isempty(var) || var == 1 % Se nao for encontrado nenhum ou 1 index
        if val == 1
            index=val+1; % Porque 0 não é permitido em Matlab
        else
            index=val; % Assigna o valor de index
        end
        if length(Q)==val % No caso do ultimo valor do index ser alcançado
            index=[];     % entao index+1 vai estar fora de Q
        end
        if Q(index)+Q(index+1) == 6 % Se o somatorio de frequencias com a caixa seguinte equivale a 6
            container=[W(index)-(bsize/2) W(index+1)+(bsize/2)]; % Calcula o container e pára o loop
            break;                                               
        elseif Q(index)+Q(index-1) == 6 % Se o somatorio de frequencias com a caixa anterior equivale a 6
            container=[W(index-1)-(bsize/2) W(index)+(bsize/2)]; % Calcula o container e pára o loop
            break;                                           
        end
    else % Se forem encontrados mais de um index.
        for k=1:1:var % Repete a analise para cada valor da caixa e verifica as mesmas condiçoes
            if val(k)==1
                index=val(k)+1; % Porque 0 não é permitido em Matlab
            else
                index=val(k); % entao a soma das frequencias equivale a 6
            end
            if length(Q)==val(k) % No caso do ultimo valor do index ser alcançado
                index=[];        % entao index+1 vai estar fora de Q
            end
            if Q(index)+Q(index+1) == 6
                container=[W(index)-(bsize/2) W(index+1)+(bsize/2)]; % Calcula o container e pára o loop
                break;
            elseif Q(index)+Q(index-1) == 6
                container=[W(index-1)-(bsize/2) W(index)+(bsize/2)];
                break;
            end
        end
        if k~=var % Se para qualquer valor de index frequencias sumam seis então paramos
            break;
        end
    end
end
if l==2 % Se o loop esta feito e nenhuma frequencia somam 6, entao passamos ao contentos uma matriz vazia
    container=[];
end
end