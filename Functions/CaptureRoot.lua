function userscript()
	local current = player.current()
	local root = current:partner()
	
	-- force the enemy root into a custom state, force normal helper
	root:ishelperset(1)
	root:helpertypeset(0)
	root:forcecustomstate(current, 11223344)
end

local status, err = pcall(userscript)
if not status then
	mugen.log("Failed to run user script: " .. err .. "\n")
end