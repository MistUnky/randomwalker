function register_rwalker(nodegen, nodecopy)
	minetest.register_node("randomwalker:"..nodegen, {
		description = nodecopy.." random walker",
		tiles = {nodegen..".png"}
	})
	minetest.register_abm({
		nodenames={"randomwalker:"..nodegen},
		interval = 1,
		chance = 1,
		action = function(pos)
			myaction = math.random(1, 6)
			if myaction == 1 then
				minetest.set_node({x=pos.x+1,y=pos.y,z=pos.z}, {name="randomwalker:"..nodegen})
			elseif myaction == 2 then
				minetest.set_node({x=pos.x-1,y=pos.y,z=pos.z}, {name="randomwalker:"..nodegen})
			elseif myaction == 3 then
				minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z}, {name="randomwalker:"..nodegen})
			elseif myaction == 4 then
				minetest.set_node({x=pos.x,y=pos.y-1,z=pos.z}, {name="randomwalker:"..nodegen})
			elseif myaction == 5 then
				minetest.set_node({x=pos.x,y=pos.y,z=pos.z+1}, {name="randomwalker:"..nodegen})
			elseif myaction == 6 then
				minetest.set_node({x=pos.x,y=pos.y,z=pos.z-1}, {name="randomwalker:"..nodegen})
			end
			minetest.set_node(pos, {name=nodecopy})
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
