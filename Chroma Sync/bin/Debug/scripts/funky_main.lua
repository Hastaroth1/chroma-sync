local Colore = clr.Corale.Colore.Core
local Thread = clr.System.Threading.Thread
local c = Colore.Color.Purple

local Colors = {
	Background = Colore.Color(255, 69, 0), 
	One = Colore.Color.Red,
	Two = Colore.Color.Red,
	Three = Colore.Color(255,140,0),
}


function play_anim(json)
local mousepadNumber = 0
	while true do
		-- set keyboard colour
		for x=0,5 do
			for y=0,21 do
				Keyboard[x,y] =  Colors.Background
			end
		end
		
		for x=0,5 do
			Keyboard[math.random(0,6), math.random(0,22)] =  Colors.One
			Keyboard[math.random(0,6), math.random(0,22)] =  Colors.Two
			Keyboard[math.random(0,6), math.random(0,22)] =  Colors.Three
		end
		
		-- set mousepad colour
		local custom = NewCustom("mousepad",Colors.Background)
		--[[
		custom.Colors[math.random(0,14)] = Colors.One
		custom.Colors[math.random(0,14)] = Colors.Two
		custom.Colors[math.random(0,14)] = Colors.Three
		]]
		
		custom.Colors[mousepadNumber] = Colors.One
		mousepadNumber = mousepadNumber + 1
		if mousepadNumber >= 15 then
			mousepadNumber = 0
		end
		
		Mousepad.SetCustom(custom)
		
		-- set mouse colour
		local mouseCustom = NewCustom("mouse",Colors.Background)		
		mouseCustom.Colors[math.random(0,17)] = Colors.One
		mouseCustom.Colors[math.random(0,17)] = Colors.Two
		mouseCustom.Colors[math.random(0,17)] = Colors.Three
		Mouse.SetCustom(mouseCustom)
		
		-- set keypad colour
		local keypadCustom = NewCustom("keypad",Colors.Background)
		keypadCustom[math.random(0,4),math.random(0,5)] = Colors.One
		keypadCustom[math.random(0,4),math.random(0,5)] = Colors.Two
		keypadCustom[math.random(0,4),math.random(0,5)] = Colors.Three
		-- WASD
		--keypadCustom[1,2] = c
		--keypadCustom[2,1] = c
		--keypadCustom[2,2] = c
		--keypadCustom[2,3] = c
		Keypad.SetCustom(keypadCustom)
		-- We don't want to spam the SDK, so throttle to 50ms
		Thread.Sleep(60)
	end
end

--play_anim()

function mouse_event(event)

		if event.e == "WM_MOUSEMOVE" then
			local screen= clr.System.Windows.Forms.Screen.PrimaryScreen.Bounds
			local posX = (math.ceil((100 / screen.Width) * event.pt.x))
			local posY = (math.ceil((100 / screen.Height) * event.pt.y))
			if posX > 50 then
				
			end
			-- Everthing should be white (strobe effect!!!!)
			
			
			-- set mousepad colour
			local custom = NewCustom("mousepad",Colore.Color.Black)
			local mpPosX = 10 - math.ceil((6 / 100) * posX)
			custom.Colors[mpPosX] = c
			Mousepad.SetCustom(custom)
			do return end
		end
		
		if event.e == "WM_LBUTTONDOWN" then
			Mouse.SetAll(c)
			Thread.Sleep(100)
			Mouse.Clear()
			do return end
		end
		--[[
		
		-- set keyboard colour
			Keyboard.SetPosition(math.random(0,5), math.random(1,18), c, true)
		
		-- set mouse colour
		local mouseCustom = NewCustom("mouse")		
		mouseCustom.Colors[math.random(0,17)] = c
		mouseCustom.Colors[math.random(0,17)] = c
		mouseCustom.Colors[math.random(0,17)] = c
		Colore.Mouse.Instance.SetCustom(mouseCustom)
		-- set keypad colour
		local keypadCustom = NewCustom("keypad")

		keypadCustom[math.random(0,4),math.random(0,5)] = c
		keypadCustom[math.random(0,4),math.random(0,5)] = c
		keypadCustom[math.random(0,4),math.random(0,5)] = c
		-- WASD
		--keypadCustom[1,2] = c
		--keypadCustom[2,1] = c
		--keypadCustom[2,2] = c
		--keypadCustom[2,3] = c
		Keypad.SetCustom(keypadCustom)
		-- We don't want to spam the SDK, so throttle to 50ms
		
		]]

end


--RegisterForEvents("MouseEvents", mouse_event)