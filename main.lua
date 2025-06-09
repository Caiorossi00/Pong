WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

PADDLE_WIDTH = 10
PADDLE_HEIGHT = 100
BALL_SIZE = 10

playerY = (WINDOW_HEIGHT - PADDLE_HEIGHT) / 2
enemyY = (WINDOW_HEIGHT - PADDLE_HEIGHT) / 2

ballX = WINDOW_WIDTH / 2 - BALL_SIZE / 2
ballY = WINDOW_HEIGHT / 2 - BALL_SIZE / 2
ballDX = 500
ballDY = 500

scorePlayer = 0
scoreEnemy = 0


function love.load()
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.window.setTitle("Pong Game")
  love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
    resizable = false,
    vsync = true,
    fullscreen = false,
  })

end

function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
end

function love.update(dt)
  if love.keyboard.isDown("w") then
    playerY = math.max(0, playerY - 300 * dt)
  elseif love.keyboard.isDown("s") then
    playerY = math.min(WINDOW_HEIGHT - PADDLE_HEIGHT, playerY + 300 * dt)
  end

  if ballY < enemyY + PADDLE_HEIGHT / 2 then
    enemyY = enemyY - 200 * dt
  else
    enemyY = enemyY + 200 * dt
  end
  enemyY = math.max(0, math.min(WINDOW_HEIGHT - PADDLE_HEIGHT, enemyY))

  ballX = ballX + ballDX * dt
  ballY = ballY + ballDY * dt

  if ballY <= 0 or ballY + BALL_SIZE >= WINDOW_HEIGHT then
    ballDY = -ballDY
  end

  if ballX <= 20 and ballY + BALL_SIZE >= playerY and ballY <= playerY + PADDLE_HEIGHT then
    ballDX = -ballDX
    ballX = 20 
  end

  if ballX + BALL_SIZE >= WINDOW_WIDTH - 20 and ballY + BALL_SIZE >= enemyY and ballY <= enemyY + PADDLE_HEIGHT then
    ballDX = -ballDX
    ballX = WINDOW_WIDTH - 20 - BALL_SIZE
  end

  if ballX < 0 then
    scoreEnemy = scoreEnemy + 1
    resetBall()
  elseif ballX > WINDOW_WIDTH then
    scorePlayer = scorePlayer + 1
    resetBall()
  end
end


function resetBall()
  ballX = WINDOW_WIDTH / 2 - BALL_SIZE / 2
  ballY = WINDOW_HEIGHT / 2 - BALL_SIZE / 2
  ballDX = -ballDX
  ballDY = 200 * (math.random(2) == 1 and 1 or -1)
end

function love.draw()
  love.graphics.clear(0.1, 0.1, 0.1)

  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("fill", 10, playerY, PADDLE_WIDTH, PADDLE_HEIGHT)

  love.graphics.rectangle("fill", WINDOW_WIDTH - 20, enemyY, PADDLE_WIDTH, PADDLE_HEIGHT)

  love.graphics.rectangle("fill", ballX, ballY, BALL_SIZE, BALL_SIZE)

  love.graphics.print(scorePlayer .. " : " .. scoreEnemy, WINDOW_WIDTH / 2 - 30, 20)
end