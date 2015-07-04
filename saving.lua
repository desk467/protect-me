local saving = {}


function saving.load()
	-- get a save file
	local score = {}
	local saveDir = love.filesystem.getSaveDirectory()

	love.filesystem.createDirectory('')

	local saveFile = io.open(saveDir .. '/save.txt', 'r')
	local loaded = saveFile ~= nil

	if not loaded then
		-- no save file, so create new save with best = 0 
		saving.save(0)
		return 0
	end

	local bestValue = saveFile:read('*number')
	saveFile:close()

	return bestValue
end

function saving.save(score)
	-- get a save file
	-- will create a new file, or overwrite current one
	love.filesystem.createDirectory('')
	
	local saveDir = love.filesystem.getSaveDirectory()
	local saveFile = io.open(saveDir .. '/save.txt', 'w')

	saveFile:write(tostring(score))

	saveFile:close()
end

function saving.reset()
	save(0)
end

return saving