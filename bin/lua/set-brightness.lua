function read_input(prompt)
	io.write(prompt)
	return io.read()
end

function set_brightness(brightness)
	if brightness == "2" then
		return "0.5"
	elseif brightness == "3" then
		return "0.4"
	elseif brightness == "4" then
		return "0.3"
	elseif brightness == "5" then
		return "0.2"
	else
		return brightness
	end
end

function main()
	local brightness = read_input("Enter brightness (0 to 1.0):")
	brightness = set_brightness(brightness)

	os.execute("xrandr --output HDMI-2 --brightness " .. brightness)
end
