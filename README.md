 <h1>Pong em Lua</h1>

  <h2>Funções principais do código</h2>
  <ul>
    <li>
      <code>love.load()</code><br />
      Inicializa a janela do jogo, configurações iniciais e define a fonte para desenhar textos.
    </li>
    <li>
      <code>love.update(dt)</code><br />
      Atualiza a lógica do jogo a cada frame: movimenta a bola, detecta colisões, atualiza posições das raquetes (jogador e inimigo), e controla pontuação.
    </li>
    <li>
      <code>love.draw()</code><br />
      Desenha na tela os elementos do jogo: raquetes, bola, placar e mensagens.
    </li>
    <li>
      <code>checkCollision(x1, y1, w1, h1, x2, y2, w2, h2)</code><br />
      Função auxiliar que detecta colisão entre dois retângulos, usada para colisão da bola com as raquetes.
    </li>
  </ul>

  <hr />

  <h2>Aprendizados</h2>
  <ul>
    <li>Entendi como funciona o <strong>loop do jogo</strong>: o Love2D chama as funções <code>load</code>, <code>update</code> e <code>draw</code> em sequência para rodar o jogo.</li>
    <li>Aprendi a manipular a posição de objetos e a usar variáveis para controlar movimento e velocidade.</li>
    <li>Vi na prática como funciona a detecção simples de colisões por caixas (AABB collision).</li>
    <li>Implementei uma IA básica para a raquete inimiga que acompanha a bola.</li>
    <li>Conheci conceitos de sincronização do jogo com o tempo usando o parâmetro <code>dt</code> (delta time).</li>
    <li>Entendi o uso de constantes para configurar a janela, tamanhos e velocidades, mantendo o código organizado.</li>
  </ul>

  <img
    src="https://github.com/Caiorossi00/Pong/blob/main/Pong.png?raw=true"
    alt="Screenshot do Pong"
    class="center-image"
  />
