--3d random walker block
function register_rwalker(nodegen, nodecopy)
	minetest.register_node("randomwalker:"..nodegen, {
		description = nodecopy.." random walker",
		tiles = {nodegen..".png"},
		groups = {randgen = 1},
	})
	minetest.register_abm({
		nodenames = {"randomwalker:"..nodegen},
		interval = 1,
		chance = 1,
		action = function(pos)
			local myaction = math.random(1, 6)
			local mypos
			if myaction == 1 then
				mypos = {x=pos.x+1,y=pos.y,z=pos.z}
			elseif myaction == 2 then
				mypos = {x=pos.x-1,y=pos.y,z=pos.z}
			elseif myaction == 3 then
				mypos = {x=pos.x,y=pos.y+1,z=pos.z}
			elseif myaction == 4 then
				mypos = {x=pos.x,y=pos.y-1,z=pos.z}
			elseif myaction == 5 then
				mypos = {x=pos.x,y=pos.y,z=pos.z+1}
			elseif myaction == 6 then
				mypos = {x=pos.x,y=pos.y,z=pos.z-1}
			end
			local myname = minetest.get_node(mypos).name
			if minetest.registered_nodes[myname].groups.randgen ~= 1 and myname ~= "ignore" and myname ~= nil then
				minetest.set_node(mypos, {name="randomwalker:"..nodegen})
				minetest.set_node(pos, {name=nodecopy})
			end
		end
	})
end
register_rwalker("default_grass", "default:dirt_with_grass")
register_rwalker("default_river_water", "default:river_water_source")
register_rwalker("default_water", "default:water_source")
register_rwalker("default_lava", "default:lava_source")
register_rwalker("default_brick", "default:brick")
register_rwalker("default_cactus_top", "default:cactus")
register_rwalker("default_tree", "default:tree")
register_rwalker("default_wood", "default:wood")
register_rwalker("default_glass", "default:glass")
register_rwalker("default_cobble", "default:cobble")
register_rwalker("default_mossycobble", "default:mossycobble")
register_rwalker("air", "air")
register_rwalker("default_meselamp", "default:meselamp")
register_rwalker("default_desert_stone", "default:desert_stone")
register_rwalker("default_stone", "default:stone")
register_rwalker("default_diamond_block", "default:diamondblock")
register_rwalker("default_obsidian", "default:obsidian")
register_rwalker("default_mese_block", "default:mese_block")
register_rwalker("default_jungletree", "default:jungletree")
register_rwalker("default_junglewood", "default:junglewood")
register_rwalker("default_ice", "default:ice")
register_rwalker("default_furnace_front", "default:furnace")
register_rwalker("default_chest_front", "default:chest")
register_rwalker("default_bookshelf", "default:bookshelf")


--stonkgen

minetest.register_node("randomwalker:stonkgen", {
	description = "Stonks Generator",
	tiles = {"randomwalker_stonks.png"}
})
minetest.register_node("randomwalker:stonkxplus", {
	description = "Stonks X+",
	tiles = {"randomwalker_stonks.png"}
})
minetest.register_node("randomwalker:stonkxminus", {
	description = "Stonks X-",
	tiles = {"randomwalker_stonks.png"}
})
minetest.register_node("randomwalker:stonkzplus", {
	description = "Stonks Z+",
	tiles = {"randomwalker_stonks.png"}
})
minetest.register_node("randomwalker:stonkzminus", {
	description = "Stonks Z-",
	tiles = {"randomwalker_stonks.png"}
})

minetest.register_abm({
	nodenames = {"randomwalker:stonkxplus"},
	interval = 1,
	chance = 2, ---add some delay
	catch_up = false,
	action = function(pos)
		if math.random(0,1) == 1 then
			minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name="randomwalker:stonkxplus"})
			minetest.set_node(pos, {name="default:cloud"})
		else
			--if not pos.y == 0 then --0 is minimum for stocks because why not right
				minetest.set_node({x=pos.x+1,y=pos.y-1,z=pos.z}, {name="randomwalker:stonkxplus"})
				minetest.set_node(pos, {name="default:cloud"})
			--end
		end
	end
})
minetest.register_abm({
	nodenames = {"randomwalker:stonkxminus"},
	interval = 1,
	chance = 2,
	catch_up = false,
	action = function(pos)
		if math.random(0,1) == 1 then
			minetest.set_node({x=pos.x-1,y=pos.y+1,z=pos.z}, {name="randomwalker:stonkxminus"})
			minetest.set_node(pos, {name="default:cloud"})
		else
			--if not pos.y == 0 then --0 is minimum for stocks because why not right
				minetest.set_node({x=pos.x-1,y=pos.y-1,z=pos.z}, {name="randomwalker:stonkxminus"})
				minetest.set_node(pos, {name="default:cloud"})
			--end
		end
	end
})
minetest.register_abm({
	nodenames = {"randomwalker:stonkzplus"},
	interval = 1,
	chance = 2,
	catch_up = false,
	action = function(pos)
		if math.random(0,1) == 1 then
			minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z+1}, {name="randomwalker:stonkzplus"})
			minetest.set_node(pos, {name="default:cloud"})
		else
			--if not pos.y == 0 then --0 is minimum for stocks because why not right
				minetest.set_node({x=pos.x,y=pos.y-1,z=pos.z+1}, {name="randomwalker:stonkzplus"})
				minetest.set_node(pos, {name="default:cloud"})
			--end
		end
	end
})
minetest.register_abm({
	nodenames = {"randomwalker:stonkzminus"},
	interval = 1,
	chance = 2,
	catch_up = false,
	action = function(pos)
		if math.random(0,1) == 1 then
			minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z-1}, {name="randomwalker:stonkzminus"})
			minetest.set_node(pos, {name="default:cloud"})
		else
			--if not pos.y == 0 then --0 is minimum for stocks because why not right
				minetest.set_node({x=pos.x,y=pos.y-1,z=pos.z-1}, {name="randomwalker:stonkzminus"})
				minetest.set_node(pos, {name="default:cloud"})
			--end
		end
	end
})
minetest.register_abm({
	nodenames = {"randomwalker:stonkgen"},
	interval = 1,
	chance = 2,
	catch_up = false,
	action = function(pos)
		minetest.set_node(pos, {name="default:cloud"})
		minetest.set_node({x=pos.x+1,y=pos.y,z=pos.z}, {name="randomwalker:stonkxplus"})
		minetest.set_node({x=pos.x-1,y=pos.y,z=pos.z}, {name="randomwalker:stonkxminus"})
		minetest.set_node({x=pos.x,y=pos.y,z=pos.z+1}, {name="randomwalker:stonkzplus"})
		minetest.set_node({x=pos.x,y=pos.y,z=pos.z-1}, {name="randomwalker:stonkzminus"})
	end
})


--bubble economy

minetest.register_node("randomwalker:bubble", {
	description = "Economic Bubble Stonk (biased randwalk like btc) X+ only",
	tiles = {"bubble.png"}
})
minetest.register_abm({
	nodenames = {"randomwalker:bubble"},
	interval = 1,
	chance = 2,
	catch_up = false,
	action = function(pos)
		if math.random(0,2) == 0 then --1/3 down
			minetest.set_node({x=pos.x+1,y=pos.y-1,z=pos.z}, {name="randomwalker:bubble"})
			minetest.set_node(pos, {name="default:cloud"})
		else --2/3 up
			--if not pos.y == 0 then --0 is minimum for stocks because why not right
				minetest.set_node({x=pos.x+1,y=pos.y+1,z=pos.z}, {name="randomwalker:bubble"})
				minetest.set_node(pos, {name="default:cloud"})
			--end
		end
	end
})
