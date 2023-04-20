local module = {}
local idsTable = {}

function module.generateId(obj: string)
	local id = {}
	idsTable[obj] = id

	local ret = {}
	ret.check = function(): boolean
		return idsTable[obj] == id
	end
	ret.remove = function()
		if ret.check() then
			idsTable[obj] = nil
		end
	end

	return ret
end

function module.check(obj: string, id: {}): boolean
	return idsTable[obj] == id
end

function module.remove(obj)
	idsTable[obj] = nil
end

function module.clear()
	idsTable = {}
end

return module
