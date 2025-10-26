# NOTE: this is to refresh DNS cache. I have this because I have
# blocked all social media and manga websites to avoid get distracted
# while using my computer
function dnscache
    sudo systemd-resolve --flush-caches
end
