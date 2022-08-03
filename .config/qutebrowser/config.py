c = c
config = config

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# config.source("themes/theme.py")
config.source("themes/summer_night.py")
c.content.user_stylesheets = "theme.css"

# UI font
# c.fonts.default_family = "Iosevka"
c.fonts.default_family = "InputMonoNarrow Medium"
c.fonts.default_size = "12px"

# Completion
c.completion.height = "60%"
c.completion.timestamp_format = ""

# Padding
c.statusbar.padding = {"bottom": 5, "left": 1, "right": 1, "top": 5}
c.tabs.indicator.padding = {"bottom": 0, "left": 0, "right": 10, "top": 0}
c.tabs.padding = {"bottom": 5, "left": 10, "right": 0, "top": 5}
# c.completion.item_padding = {'bottom': 1, 'left': 3, 'right': 8, 'top': 1}
c.completion.item_padding = {"bottom": 1, "left": 3, "right": 8, "top": 1}

c.content.autoplay = False

# Prefer dark mode
c.colors.webpage.preferred_color_scheme = "dark"

# Tabs
c.tabs.position = "right"
c.tabs.width = 240
c.tabs.indicator.width = 0
c.tabs.favicons.scale = 0.8
c.tabs.favicons.show = "never"
c.tabs.title.format = "{audio} {current_title}"
c.tabs.title.alignment = "left"
c.tabs.max_width = 200

c.content.javascript.can_access_clipboard = True

config.unbind("q")

config.bind("<Ctrl+Return>", "config-cycle tabs.show always never")

config.bind("<Ctrl+n>", "tab-next")
config.bind("<Ctrl+p>", "tab-prev")

config.bind("<Ctrl-Shift-p>", "tab-move -")
config.bind("<Ctrl-Shift-n>", "tab-move +")


config.bind("<Ctrl-n>", "completion-item-focus next", mode="command")
config.bind("<Ctrl-p>", "completion-item-focus prev", mode="command")
config.bind( "<Ctrl+a>", "mode-enter caret ;; selection-toggle ;; move-to-end-of-document")

config.bind("j", "fake-key <Down>", mode="normal")
config.bind("k", "fake-key <Up>", mode="normal")

c.statusbar.show = "never"
c.tabs.show = "never"

# Autosave
c.auto_save.session = True

c.url.searchengines = {
    "DEFAULT": "duckduckgo.com/?q={}",
    "go": "google.com/search?q={}",
    "aur": "https://aur.archlinux.org/packages?O=0&SeB=nd&K={}&outdated=&SB=v&SO=d&PP=50&submit=Go",
    "g": "github.com/search?q={}",
    "c": "github.com/search?q={}&type=code",
    "y": "youtube.com/results?search_query={}",
    "a": "https://wiki.archlinux.org/?search={}",
}

c.completion.show = "always"

c.fonts.statusbar = "default_size default_family"

c.tabs.focus_stack_size = 20
