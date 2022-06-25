function userscript()
	local current = player.current()
	local partner = current:partner()

	-- no partner? don't run this
	if current == nil then return end
	
	-- map ourselves to match the partner
	current:lifemaxset(partner:lifemax())
	current:lifeset(partner:life())
	current:posset(partner:pos())
	
	-- sketchy - ASM patch to ScreenBound reset requires us to set number of ticks to apply effect for in player+0x5C (which is an unused Const)
	if mugen.random(1000) > 50 then
		mll.WriteInteger(partner:getplayeraddress() + 0x5C, 1)
		partner:screenbound({value = 0, movecamera = {x = 0, y = 0}})
	end
	
	-- below parts are ripped directly from Sad Claps and converted
	if partner:time() > 250 and partner:pos().y > 16 and partner:vel().y > 0 then
		partner:changestate({value = 52, ctrl = true, anim = 0})
	end
	if partner:time() > 360 then
		partner:changestate({value = 52, ctrl = true, anim = 0})
	end
	if partner:stateno() >= 5000 and partner:stateno() <= 5500 and partner:time() > 30 then
		partner:changestate({value = 52, ctrl = true, anim = 0})
	end
	
	if mugen.random(1000) > 750 then
		partner:assertspecial({flag = "NoShadow", flag2 = "NoKOSlow", flag3 = "TimerFreeze"})
	end
	
	if mugen.random(1000) < 50 then
		local animno = mugen.random(7000) + 1
		if partner:selfanimexist(animno) then
			partner:changeanim({value = animno})
		end
	end
	
	if partner:stateowner():id() ~= partner:id() and partner:time() > 100 then
		partner:selfstate({value = 52, ctrl = 1, anim = 0})
	end
	
	if partner:stateno() >= 200 and partner:stateno() <= 999 then
		local x = (math.ceil(partner:lifemax() + 50 - partner:life()) * -0.1) + (mugen.random(1000) % math.ceil(math.ceil(partner:lifemax() + 50 - partner:life()) * 0.2))
		partner:velset({x = x})
	end
	
	if partner:stateno() >= 200 and partner:stateno() <= 3999 and partner:life() < (partner:lifemax() * 0.2) then
		local x = (math.ceil(partner:lifemax() + 50 - partner:life()) * -0.1) + (mugen.random(1000) % math.ceil(math.ceil(partner:lifemax() + 50 - partner:life()) * 0.2))
		partner:velset({x = x})
	end
	
	partner:posset({x = partner:vel().x + partner:pos().x, y = partner:vel().y + partner:pos().y})
	
	if mugen.random(1000) > 950 then partner:velmul({x = 2, y = 0.25}) end
	if mugen.random(1000) < 50 then partner:velmul({x = 0.25, y = 2}) end
	
	if partner:pos().x < (1.2 * mugen.leftedge()) then
		partner:posset({x = 1.1 * mugen.rightedge()})
	end
	
	if partner:pos().x > (1.2 * mugen.rightedge()) then
		partner:posset({x = 1.1 * mugen.leftedge()})
	end
	
	if partner:pos().y < (1.2 * mugen.topedge()) then
		partner:posset({y = 1.1 * mugen.bottomedge()})
	end
	
	if partner:pos().y > (1.2 * mugen.bottomedge()) then
		partner:posset({y = 1.1 * mugen.topedge()})
	end
	
	if partner:movetype() == 'H' and (mugen.gametime() % 3) == 1 then
		partner:trans({trans = 'sub'})
	end
	
	if partner:movetype() == 'H' and (mugen.gametime() % 3) == 0 then
		partner:trans({trans = 'add'})
	end
end

local status, err = pcall(userscript)
if not status then
	mugen.log("Failed to run user script: " .. err .. "\n")
end