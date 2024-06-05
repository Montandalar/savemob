local function usefunc(itemstack, user, pointed_thing, persist)
    if not (pointed_thing and pointed_thing.type and pointed_thing.type == "object") then
        return
    end

    local obj = pointed_thing.ref
    local ent = obj:get_luaentity()
    --ent.lifetimer = (persist and 20001) or 180
    obj:set_properties({static_save = persist})
    -- magic number for no despawning is 20000; 180 is the default
    -- FIXME: get definition of mob if possible to use custom amount
end

minetest.register_craftitem("savemob:saver", {
    description = "Mob Saver\nPunch: Do not keep mob on unload\nUse: Keep mob indefinitely",
    inventory_image = "savemob_diskette.png",
    on_use = function(itemstack, user, pointed_thing)
        return usefunc(itemstack, user, pointed_thing, false)
    end,
    on_secondary_use = function(itemstack, user, pointed_thing)
        return usefunc(itemstack, user, pointed_thing, true)
    end,
})

--[[minetest.register_craftitem("savemob:inspector", {
    on_use = function(itemstack, user, pointed_thing)
        local obj = pointed_thing.ref
        print("OBJ="..dump(obj))
        print("PROPS="..dump(obj:get_properties()))
        print("ENT="..dump(obj:get_luaentity()))
        print("STATIC_SAVE="..dump(obj:get_properties().static_save))
    end
})--]]
