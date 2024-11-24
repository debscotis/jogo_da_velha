JOGO DA VELHA EM PROLOG

DESCRIÇÃO

Jogo da Velha implementado em Prolog. Dois jogadores ('o' e 'x') podem jogar alternadamente, escolhendo posições no tabuleiro de 3x3 até que um deles vença a partida ou o jogo termine em empate.


FUNCIONALIDES

Tabuleiro interativo: o jogo exibe o tabuleiro atualizado a cada jogada.
Alternância de jogadores: o jogo alterna entre os jogadores 'o' e 'x'.
Verificação de vencedor: o jogo verifica se alguém ganhou após cada jogada.
Empate: se todas as posições forem preenchidas sem vencedor, o jogo termina em empate.


COMO JOGAR

1. Ao iniciar o jogo, o tabuleiro será exibido com posições vazias indicadas por '_'.
Bem-vindo ao Jogo da Velha!
_ | _ | _
--+---+--
_ | _ | _
--+---+--
_ | _ | _

Cada jogador escolhe uma posição no tabuleiro, de 1 a 9, conforme a numeração apresentada abaixo.
1 | 2 | 3
--+---+--
4 | 5 | 6
--+---+--
7 | 8 | 9

2. O  jogador 'x' faz a primeira jogada. A seguir, o jogador 'o' faz a jogada.

3. O jogo continua até que um jogador vença ou o jogo termine em empate.

4. Após cada jogada, o tabuleiro é reexibido.


EXEMPLO DE EXECUÇÃO DO JOGO

Bem-vindo ao Jogo da Velha!
_ | _ | _
--+---+--
_ | _ | _
--+---+--
_ | _ | _
Jogador x, escolha uma posição (1-9): 5.
_ | _ | _
--+---+--
_ | x | _
--+---+--
_ | _ | _
Jogador o, escolha uma posição (1-9): 4.
_ | _ | _
--+---+--
o | x | _
--+---+--
_ | _ | _
...


COMO RODAR O JOGO

1. Abra o console de Prolog (SWI-Prolog).

2. Define o diretório para o local onde o código foi salvo: 

 cd('C:\\caminho\\para\\seu\\diretorio').

3. Carregue o arquivo (.pl) contendo o código do jogo:

[jogo_da_velha].

4. Para iniciar o jogo, digite:

jogar.


ESTRUTURA DO CÓDIGO

tabuleiro_inicial/1: Representa o tabuleiro inicial com todas as posições vazias.
'tabuleiro_inicial([_, _, _, _, _, _, _, _, _]).'


exibe_tabuleiro/1: Exibe o tabuleiro no formato 3x3, substituindo posições vazias '_' por um caractere de marcador.

vencedor/1: Verifica as condições de vitória (linhas, colunas e diagonais).A função é usada para determinar o vencedor.

empate/1: Verifica se o jogo terminou em empate. Isso ocorre quando o tabuleiro está completamente preenchido sem nenhuma condição de vitória.

faz_jogada/4: Permite a jogada de um jogador, verificando se a posição escolhida está disponível (_) e atualizando o tabuleiro.
'faz_jogada(Tabuleiro, Posicao, Jogador, NovoTabuleiro) :-
    nth1(Posicao, Tabuleiro, '_'),
    set_elemento(Tabuleiro, Posicao, Jogador, NovoTabuleiro).'


alternar_jogador/2: Alterna entre os jogadores 'x' e 'o', determinando de quem será a próxima jogada.

jogo/2: Controla o fluxo principal do jogo, verificando após cada jogada se houve vitória, empate ou se o próximo turno será iniciado.


LICENÇA

Este jogo é de código aberto e pode ser utilizado e modificado de acordo com a licença que você preferir.





