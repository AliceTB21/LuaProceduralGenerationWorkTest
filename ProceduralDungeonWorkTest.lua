function GenerateRandomDungeon(dungeonWidth, dungeonHeight)
  
  local dungeonTiles = {}
  local wallTile = "#"
  
  for x = 1, dungeonWidth do
    dungeonTiles[x] = {}
    for y = 1, dungeonHeight do
      dungeonTiles[x][y] = wallTile
    end
  end
  
  return dungeonTiles
end

function GenerateRooms(dungeonTiles, dungeonWidth, dungeonHeight, roomWidth, roomHeight, roomAmount, randomWall)
  local floorTile = "."
  local doorTile = "+"
  
  
  math.randomseed(os.time())

  for r = 1, roomAmount do
    local success = true
      local roomSizeX = math.random(5, roomWidth) + 1
      local roomSizeY = math.random(5, roomHeight) + 1
      local x = math.random(1, dungeonWidth - roomSizeX)
      local y = math.random(1, dungeonHeight - roomSizeY)
        
      for px = x, (x + roomSizeX - 1), 1 do
        for py = y, (y + roomSizeY - 1), 1 do
          if dungeonTiles[px][py] ~= "#" or x + roomSizeX - 1 > dungeonWidth or y + roomSizeY - 1 > dungeonHeight then
            success = false;
          end
      end
    end

        if success == true then
          for rx = x, (x + roomSizeX - 1), 1 do
            for ry = y, (y + roomSizeY - 1), 1 do
              local replaceWithWall = math.random(1, 20)
              if rx == x or ry == y or rx == x + roomSizeX - 1 or ry == y + roomSizeY - 1 then
            else
                if(replaceWithWall > randomWall) then              
                dungeonTiles[rx][ry] = floorTile;
                end
              end
            end
          end
        end
  end
  
  return dungeonTiles
end



local dungeonSizeX = 50
local dungeonSizeY = 50
local maxRoomSizeX = 10
local maxRoomSizeY = 10
local randomWallChance = 3

local generatedDungeon = GenerateRandomDungeon(dungeonSizeX, dungeonSizeY)
local dungeon = GenerateRooms(generatedDungeon, dungeonSizeX, dungeonSizeY, maxRoomSizeX, maxRoomSizeY, 10, randomWallChance)

for x = 1, dungeonSizeX do
  for y = 1, dungeonSizeY do
    io.write(dungeon[x][y])
    end
    io.write("\n")
  end