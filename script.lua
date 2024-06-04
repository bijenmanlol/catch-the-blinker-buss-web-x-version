local player = {0, 0}
local pixels = document.get("display img")
local score = 0
local enemy = {5, 5}

function syncPlayer()
  for i = 1, #pixels do
    if tostring(pixels[i]:get_href()):gsub("%[", ""):gsub("%]", "") == tostring(player) then
      pixels[i].src = "assets/full.png"
    elseif tostring(pixels[i]:get_href()):gsub("%[", ""):gsub("%]", "") == tostring(enemy) then
    else
      pixels[i].set_src("assets/empty.png")
    end
  end
  if tostring(enemy) == tostring(player) then
    score = score + 1
    generateEnemy()
  end
  document.get("score p").set_content(score)
end

function syncEnemy()
  for i = 1, #pixels do
    if tostring(pixels[i]:get_href()):gsub("%[", ""):gsub("%]", "") == tostring(player) then
      pixels[i].set_src("assets/full.png")
    elseif tostring(pixels[i]:get_href()):gsub("%[", ""):gsub("%]", "") == tostring(enemy) then
      pixels[i].set_src("assets/enemy.gif")
    else
      pixels[i].set_src("assets/empty.png")
    end
  end
end

syncPlayer()

generateEnemy()

function up()
  if player[2] ~= 0 then
    player[2] = player[2] - 1
  end
  syncPlayer()
end

function right()
  if player[1] ~= 5 then
    player[1] = player[1] + 1
  end
  syncPlayer()
end

function left()
  if player[1] ~= 0 then
    player[1] = player[1] - 1
  end
  syncPlayer()
end

function down()
  if player[2] ~= 2 then
    player[2] = player[2] + 1
  end
  syncPlayer()
end

function generateEnemy()
  syncEnemy()
  enemy[1] = math.floor(math.random(0, 5))
  enemy[2] = math.floor(math.random(0, 2))
  if tostring(enemy) == tostring(player) then
    generateEnemy()
  else
    syncEnemy()
  end
end

--document.addEventListener("keydown", function(e)
--  if e.keyCode == 38 then
--    up()
--  end
--  if e.keyCode == 39 then
--    right()
--  end
--  if e.keyCode == 37 then
--    left()
--  end
--  if e.keyCode == 40 then
--    down()
--  end
--end)

get("up").on_click(function()
    up()
end)
get("right").on_click(function()
    right()
end)
get("left").on_click(function()
    left()
end)
get("down").on_click(function()
    down()
end)