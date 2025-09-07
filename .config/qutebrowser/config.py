import subprocess

c.fonts.default_size = "10.5pt"
c.fonts.web.size.default = 15
c.fonts.default_family = "Overpass Medium"

c.fonts.web.family.serif = "default_family"
c.fonts.web.family.standard = "default_family"
c.fonts.web.family.sans_serif = "default_family"
c.fonts.web.family.fixed = "monospace"
c.fonts.web.family.fantasy = "monospace"
c.fonts.web.family.cursive = "monospace"

# set dark mode as a default
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = "lightness-cielab"
c.colors.webpage.darkmode.policy.images = "never"

c.auto_save.session = True  # save tabs on quit/restart

# toggle dark mode
config.bind("<Ctrl+Shift+d>", "config-cycle colors.webpage.darkmode.enabled")

# yank url to clipboard in obsidian format
config.bind("<y><o>", "yank inline [{title}]({url})")

# set in insert mode emacs key binds
config.bind("<Ctrl-p>", "fake-key <Up>", "insert")
config.bind("<Ctrl-e>", "fake-key <End>", "insert")
config.bind("<Ctrl-a>", "fake-key <Home>", "insert")
config.bind("<Ctrl-n>", "fake-key <Down>", "insert")
config.bind("<Ctrl-b>", "fake-key <Left>", "insert")
config.bind("<Ctrl-f>", "fake-key <Right>", "insert")
config.bind("<Ctrl-y>", "fake-key <Ctrl-v>", "insert")
config.bind("<Ctrl-d>", "fake-key <Delete>", "insert")
config.bind("<Ctrl-x><Ctrl-e>", "open-editor", "insert")
config.bind("<Mod1-b>", "fake-key <Ctrl-Left>", "insert")
config.bind("<Ctrl-h>", "fake-key <Backspace>", "insert")
config.bind("<Mod1-f>", "fake-key <Ctrl-Right>", "insert")
config.bind("<Mod1-d>", "fake-key <Ctrl-Delete>", "insert")
config.bind("<Ctrl-w>", "fake-key <Ctrl-Backspace>", "insert")
config.bind("<Ctrl-k>", "fake-key <Shift-End><Delete>", "insert")
config.bind("<Ctrl-u>", "fake-key <Shift-Home><Delete>", "insert")

# set default bind imitating firefox browser
config.bind("<Ctrl-h>", "history")
config.bind("<Ctrl-Shift-n>", "open -p")
config.bind("<Ctrl-j>", "download-open")
config.bind("<Ctrl-Shift-r>", "reload -f")
config.bind("<Ctrl-Shift-o>", "bookmark-list")
config.bind("<Ctrl-Shift-i>", "devtools right")
config.bind("xt", "config-cycle tabs.show always never")
config.bind("<Ctrl-m>", "hint links spawn mpv {hint-url}")
config.bind("<Ctrl-t>", "open -t;; cmd-set-text -s :open ")
config.bind("xb", "config-cycle statusbar.show always never")
config.bind(
    "xx",
    "config-cycle statusbar.show always never;; config-cycle tabs.show always never",
)

# set menu completion up, down and select as neovim like binds
config.bind("<Ctrl-y>", "command-accept", mode="command")
config.bind("<Ctrl-p>", "completion-item-focus prev", mode="command")
config.bind("<Ctrl-n>", "completion-item-focus next", mode="command")


# set default search engines
c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?q={}",
    "dg": "https://duckduckgo.com/?q={}",
    "ys": "https://www.youtube.com/results?search_query={}",
}

# Set the page opened when a new empty tab is created
c.url.default_page = "about:blank"

# Set the page(s) opened when qutebrowser starts
c.url.start_pages = ["about:blank"]  # :open -s opens all start pages


# set your preferred download folder
c.downloads.location.directory = "~/Downloads"

# set privacy settings
c.content.canvas_reading = True  # Block canvas fingerprinting
c.content.headers.do_not_track = True  # Send DNT header
c.content.autoplay = False  # Prevent autoplaying media
c.content.geolocation = False  # Disable geolocation by default
c.content.cookies.accept = "all"  # Allow 3rd-party cookies

# set adblock
c.content.blocking.enabled = True

# custom user css file. Modify web pages css
c.content.user_stylesheets = [
    "/home/bryant/.config/qutebrowser/custom_css/global.css",
    "/home/bryant/.config/qutebrowser/custom_css/telegram.css",
    "/home/bryant/.config/qutebrowser/custom_css/twitter.css",
]


# ====================== xresources ======================= {{{
# taken from https://qutebrowser.org/doc/help/configuring.html
def read_xresources(prefix):
    """
    read settings from xresources
    """
    props = {}
    x = subprocess.run(["xrdb", "-query"], stdout=subprocess.PIPE)
    lines = x.stdout.decode().split("\n")
    for line in filter(lambda l: l.startswith(prefix), lines):
        prop, _, value = line.partition(":\t")
        props[prop] = value
    return props


xresources = read_xresources("*")

c.colors.statusbar.normal.bg = xresources["*.background"]
c.colors.statusbar.command.bg = xresources["*.background"]
c.colors.statusbar.command.fg = xresources["*.foreground"]
c.colors.statusbar.normal.fg = xresources["*.foreground"]

c.colors.tabs.bar.bg = xresources["*.background"]
c.colors.tabs.even.bg = xresources["*.color8"]
c.colors.tabs.odd.bg = xresources["*.color8"]
c.colors.tabs.even.fg = xresources["*.background"]
c.colors.tabs.odd.fg = xresources["*.background"]
c.colors.tabs.selected.even.fg = xresources["*.foreground"]
c.colors.tabs.selected.odd.fg = xresources["*.foreground"]
c.colors.tabs.selected.even.bg = xresources["*.cursorColor"]
c.colors.tabs.selected.odd.bg = xresources["*.cursorColor"]
c.colors.hints.bg = xresources["*.cursorColor"]
c.colors.hints.fg = xresources["*.foreground"]

# load the default configuration made using the ui ":set"
config.load_autoconfig()
