function userscript()
	local current = player.current()
	
	local helper = nil
	for p in player.player_iter() do
		if p:helperid() == 11223344 and p:ishelper() and p:root():ishelper() and p:teamside() == current:teamside() then
			p:root():ishelperset(0)
		end
		
		if p:helperid() == 11223344 and p:teamside() == current:teamside() then
			p:forcecustomstate(current, 11223345)
		end
	end
end

local status, err = pcall(userscript)
if not status then
	mugen.log("Failed to run user script: " .. err .. "\n")
end