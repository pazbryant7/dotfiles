local CYCLE_KEY = "Ctrl+r"

local QUALITIES = {
  { label = "480p", height = 480, format = "bestvideo[height<=480]+bestaudio/best[height<=480]" },
  { label = "720p", height = 720, format = "bestvideo[height<=720]+bestaudio/best[height<=720]" },
  { label = "1080p", height = 1080, format = "bestvideo[height<=1080]+bestaudio/best[height<=1080]" },
}

local current_index = nil

local function get_current_url()
  return mp.get_property("path")
end

local function get_playback_position()
  return mp.get_property_number("time-pos") or 0
end

local function get_pause_state()
  return mp.get_property_bool("pause")
end

local function restore_pause_state(was_paused)
  if not was_paused then
    return
  end
  mp.add_timeout(0.1, function()
    mp.set_property_bool("pause", true)
  end)
end

local function notify(message)
  mp.osd_message(message)
end

local function find_tier_for_height(height)
  if not height then
    return 1
  end
  for i, q in ipairs(QUALITIES) do
    if height <= q.height then
      return i
    end
  end
  return #QUALITIES
end

local function next_quality_index()
  if current_index == nil then
    current_index = find_tier_for_height(mp.get_property_number("height"))
  end
  current_index = (current_index % #QUALITIES) + 1
  return current_index
end

local function apply_quality(format, url, pos)
  mp.set_property("ytdl-format", format)
  mp.commandv("loadfile", url, "replace", -1, string.format("start=%.2f", pos))
end

local function action_cycle_quality()
  local url = get_current_url()
  if not url then
    notify("Quality: no active URL")
    return
  end

  local pos = get_playback_position()
  local was_paused = get_pause_state()

  local idx = next_quality_index()
  local q = QUALITIES[idx]

  apply_quality(q.format, url, pos)
  restore_pause_state(was_paused)
  notify("Quality: switched to " .. q.label)
end

local function main()
  mp.add_forced_key_binding(CYCLE_KEY, "Quality-cycle", action_cycle_quality)
end

main()
