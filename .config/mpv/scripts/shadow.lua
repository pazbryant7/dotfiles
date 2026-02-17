local mp = require("mp")

---@class MpvTimer
---@field kill fun(self: MpvTimer)

local PLAY_TIME = 6
local PAUSE_TIME = 1

local enabled = false
---@type MpvTimer|nil
local active_timer = nil
local pause_start = 0

local function clear_timer()
	if active_timer ~= nil then
		active_timer:kill()
		active_timer = nil
	end
end

local function resume()
	mp.set_property_bool("pause", false)
end

local function pause()
	mp.set_property_bool("pause", true)
end

local function notify(msg)
	mp.osd_message("Shadow mode: " .. msg)
end

local cycle

local function on_pause_elapsed()
	if os.time() - pause_start >= PAUSE_TIME then
		clear_timer()
		cycle()
	end
end

cycle = function()
	if not enabled then
		return
	end
	resume()
	active_timer = mp.add_timeout(PLAY_TIME, function()
		if not enabled then
			return
		end
		pause()
		pause_start = os.time()
		active_timer = mp.add_periodic_timer(0.1, on_pause_elapsed)
	end)
end

local function start()
	enabled = true
	notify("ON")
	cycle()
end

local function stop()
	enabled = false
	clear_timer()
	resume()
	notify("OFF")
end

local function toggle()
	if enabled then
		stop()
	else
		start()
	end
end

mp.add_forced_key_binding("Ctrl+s", "toggle-shadow-mode", toggle)
