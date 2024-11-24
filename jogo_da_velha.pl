% Representa o tabuleiro inicial (vazio)
tabuleiro_inicial([_, _, _, _, _, _, _, _, _]).

% Exibe o tabuleiro no formato 3x3
exibe_tabuleiro([A, B, C, D, E, F, G, H, I]) :-
    (var(A) -> A = '_'; true),
    (var(B) -> B = '_'; true),
    (var(C) -> C = '_'; true),
    (var(D) -> D = '_'; true),
    (var(E) -> E = '_'; true),
    (var(F) -> F = '_'; true),
    (var(G) -> G = '_'; true),
    (var(H) -> H = '_'; true),
    (var(I) -> I = '_'; true),
    format('~w | ~w | ~w~n', [A, B, C]),
    writeln('--+---+--'),
    format('~w | ~w | ~w~n', [D, E, F]),
    writeln('--+---+--'),
    format('~w | ~w | ~w~n', [G, H, I]).

% Combinações vencedoras
vencedor([X, X, X, _, _, _, _, _, _], X). % Linha 1
vencedor([_, _, _, X, X, X, _, _, _], X). % Linha 2
vencedor([_, _, _, _, _, _, X, X, X], X). % Linha 3
vencedor([X, _, _, X, _, _, X, _, _], X). % Coluna 1
vencedor([_, X, _, _, X, _, _, X, _], X). % Coluna 2
vencedor([_, _, X, _, _, X, _, _, X], X). % Coluna 3
vencedor([X, _, _, _, X, _, _, _, X], X). % Diagonal 1
vencedor([_, _, X, _, X, _, X, _, _], X). % Diagonal 2

% Verifica se há vencedor ou empate
jogo(Tabuleiro, Jogador) :-
    exibe_tabuleiro(Tabuleiro),  % Exibe o tabuleiro a cada turno
    (vencedor(Tabuleiro, Jogador) -> 
        exibe_tabuleiro(Tabuleiro),  % Exibe o tabuleiro final
        format('Jogador ~w venceu! O jogo acabou!~n', [Jogador]), !;
     empate(Tabuleiro) -> 
        writeln('Empate!'), !;
     % Continua o jogo
     proximo_turno(Tabuleiro, Jogador)).

% Verifica se o tabuleiro está cheio (empate)
empate(Tabuleiro) :- \+ member('_', Tabuleiro).

% Executa o próximo turno
proximo_turno(Tabuleiro, JogadorAtual) :-
    format('Jogador ~w, escolha uma posicao (1-9): ', [JogadorAtual]),
    read(Posicao),
    (faz_jogada(Tabuleiro, Posicao, JogadorAtual, NovoTabuleiro) -> 
        (vencedor(NovoTabuleiro, JogadorAtual) -> 
            exibe_tabuleiro(NovoTabuleiro),  % Exibe o tabuleiro final antes de declarar a vitória
            format('Jogador ~w venceu! O jogo acabou!~n', [JogadorAtual]), !;
         alternar_jogador(JogadorAtual, ProximoJogador),
         jogo(NovoTabuleiro, ProximoJogador));
     writeln('Posicao inválida, tente novamente!'),
     proximo_turno(Tabuleiro, JogadorAtual)).

% Verifica se a posição está livre e a atualiza
faz_jogada(Tabuleiro, Posicao, Jogador, NovoTabuleiro) :-
    nth1(Posicao, Tabuleiro, '_'), % Checa se a posição está vazia ('_')
    set_elemento(Tabuleiro, Posicao, Jogador, NovoTabuleiro).

% Substitui um elemento na lista
set_elemento([_|T], 1, Elem, [Elem|T]).
set_elemento([H|T], Posicao, Elem, [H|NovoT]) :-
    Posicao > 1,
    Posicao1 is Posicao - 1,
    set_elemento(T, Posicao1, Elem, NovoT).

% Alterna entre os jogadores
alternar_jogador('x', 'o').
alternar_jogador('o', 'x').

% Inicializa o jogo
jogar :-
    tabuleiro_inicial(Tabuleiro),
    writeln('Bem-vindo ao Jogo da Velha!'),
    jogo(Tabuleiro, 'x').
