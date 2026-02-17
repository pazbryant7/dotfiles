local mp = require("mp")
local input = require("mp.input")

local function seconds_to_timestamp(seconds)
	local h = math.floor(seconds / 3600)
	local m = math.floor((seconds % 3600) / 60)
	local s = seconds % 60
	return string.format("%d:%02d:%02d", h, m, s)
end

local function parse_timestamp(str)
	str = str:match("^%s*(.-)%s*$")

	if str:match("^%d+%.?%d*$") then
		return tonumber(str)
	end

	local parts = {}
	for part in str:gmatch("[^:]+") do
		local n = tonumber(part)
		if not n then
			return nil
		end
		table.insert(parts, n)
	end

	if #parts == 3 then
		return parts[1] * 3600 + parts[2] * 60 + parts[3]
	elseif #parts == 2 then
		return parts[1] * 60 + parts[2]
	elseif #parts == 1 then
		return parts[1]
	end

	return nil
end

local function seek(seconds)
	mp.commandv("seek", seconds, "absolute")
	mp.osd_message("Jumped to " .. seconds_to_timestamp(seconds), 2)
end

local function validate_and_seek(str)
	if not str or str == "" then
		return
	end

	local seconds = parse_timestamp(str)
	if not seconds then
		mp.osd_message("Invalid format. Use HH:MM:SS, MM:SS, or seconds.", 3)
		return
	end

	local duration = mp.get_property_number("duration")

	if duration and seconds > duration then
		mp.osd_message("Time exceeds duration (" .. seconds_to_timestamp(duration) .. ")", 3)
		return
	end

	seek(seconds)
end

local function get_duration_label()
	local duration = mp.get_property_number("duration")
	if not duration then
		return nil
	end
	return seconds_to_timestamp(math.floor(duration))
end

local function open_seek_prompt()
	local duration_label = get_duration_label()
	if not duration_label then
		mp.osd_message("No media loaded", 2)
		return
	end

	input.get({
		prompt = string.format("Seek (duration %s):", duration_label),
		submit = validate_and_seek,
	})
end

mp.add_forced_key_binding("Ctrl+g", "seek-to-time", open_seek_prompt)
mp.register_script_message("seek-input", validate_and_seek)
