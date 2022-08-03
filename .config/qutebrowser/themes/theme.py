# background_0
# background_1
# background_2
# background_3
#
# foreground_0
# foreground_1
# foreground_2
# foreground_3
# foreground_4
#
# red
# green
# yellow
# blue
# purple
# accent


def hex_to_rgb(hex):
    return tuple(int(hex[i : i + 2], 16) for i in (0, 2, 4))


def rgb_to_hex(rgb):
    return "#%02x%02x%02x" % rgb


def darken(hex, amount):
    hex = hex[1:]
    rgb = hex_to_rgb(hex)
    rgb = tuple(int(c * amount) for c in rgb)
    return rgb_to_hex(rgb)


background_0 = "#1C1C1C"
background_1 = darken(background_0, 0.9)
background_2 = darken(background_0, 0.8)
background_3 = darken(background_0, 0.7)

foreground_0 = "#dddddd"
foreground_1 = darken(foreground_0, 0.9)
foreground_2 = darken(foreground_0, 0.7)
foreground_3 = darken(foreground_0, 0.6)

red = "#db2d20"
green = "#e8bbd0"
yellow = "#fded02"
blue = "#01a252"
purple = "#b5e4f4"
accent = "#01a0e4"
blue = "#01a0e4"

# set qutebrowser colors

# Text color of the completion widget. May be a single color to use for
# all columns or a list of three colors, one for each column.
c.colors.completion.fg = foreground_3

# Background color of the completion widget for odd rows.
c.colors.completion.odd.bg = background_1

# Background color of the completion widget for even rows.
c.colors.completion.even.bg = background_1

# Foreground color of completion widget category headers.
c.colors.completion.category.fg = accent

# Background color of the completion widget category headers.
c.colors.completion.category.bg = background_1

# Top border color of the completion widget category headers.
c.colors.completion.category.border.top = background_1

# Bottom border color of the completion widget category headers.
c.colors.completion.category.border.bottom = background_1

# Foreground color of the selected completion item.
c.colors.completion.item.selected.fg = foreground_0

# Foreground color of the matched text in the selected completion item.
c.colors.completion.item.selected.match.fg = foreground_0

# Background color of the selected completion item.
c.colors.completion.item.selected.bg = background_0

# Top border color of the selected completion item.
c.colors.completion.item.selected.border.top = background_0

# Bottom border color of the selected completion item.
c.colors.completion.item.selected.border.bottom = background_0

# Foreground color of the matched text in the completion.
c.colors.completion.match.fg = foreground_1

# Color of the scrollbar handle in the completion view.
c.colors.completion.scrollbar.fg = foreground_1

# Color of the scrollbar in the completion view.
c.colors.completion.scrollbar.bg = background_0

# Background color of disabled items in the context menu.
c.colors.contextmenu.disabled.bg = background_1

# Foreground color of disabled items in the context menu.
c.colors.contextmenu.disabled.fg = foreground_0

# Background color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.bg = background_1

# Foreground color of the context menu. If set to null, the Qt default is used.
c.colors.contextmenu.menu.fg = foreground_1

# Background color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.bg = background_2

# Foreground color of the context menu’s selected item. If set to null, the Qt default is used.
c.colors.contextmenu.selected.fg = foreground_1

# Background color for the download bar.
c.colors.downloads.bar.bg = background_0

# Color gradient start for download text.
c.colors.downloads.start.fg = background_0

# Color gradient start for download backgrounds.
c.colors.downloads.start.bg = accent

# Color gradient end for download text.
c.colors.downloads.stop.fg = background_0

# Color gradient stop for download backgrounds.
c.colors.downloads.stop.bg = purple

# Foreground color for downloads with errors.
c.colors.downloads.error.fg = red

# Font color for hints.
c.colors.hints.fg = background_0

# Background color for hints. Note that you can use a `rgba(...)` value
# for transparency.
c.colors.hints.bg = yellow

# Font color for the matched part of hints.
c.colors.hints.match.fg = foreground_1

# Text color for the keyhint widget.
c.colors.keyhint.fg = foreground_1

# Highlight color for keys to complete the current keychain.
c.colors.keyhint.suffix.fg = foreground_1

# Background color of the keyhint widget.
c.colors.keyhint.bg = background_0

# Foreground color of an error message.
c.colors.messages.error.fg = background_0

# Background color of an error message.
c.colors.messages.error.bg = red

# Border color of an error message.
c.colors.messages.error.border = red

# Foreground color of a warning message.
c.colors.messages.warning.fg = background_0

# Background color of a warning message.
c.colors.messages.warning.bg = red

# Border color of a warning message.
c.colors.messages.warning.border = red

# Foreground color of an info message.
c.colors.messages.info.fg = foreground_1

# Background color of an info message.
c.colors.messages.info.bg = background_0

# Border color of an info message.
c.colors.messages.info.border = background_0

# Foreground color for prompts.
c.colors.prompts.fg = foreground_3

# Border used around UI elements in prompts.
c.colors.prompts.border = background_0

# Background color for prompts.
c.colors.prompts.bg = background_0

# Background color for the selected item in filename prompts.
c.colors.prompts.selected.bg = background_2

# Foreground color for the selected item in filename prompts.
c.colors.prompts.selected.fg = foreground_1

# Foreground color of the statusbar.
c.colors.statusbar.normal.fg = foreground_1

# Background color of the statusbar.
c.colors.statusbar.normal.bg = background_2

# Foreground color of the statusbar in insert mode.
c.colors.statusbar.insert.fg = foreground_2

# Background color of the statusbar in insert mode.
c.colors.statusbar.insert.bg = background_0

# Foreground color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.fg = foreground_2

# Background color of the statusbar in passthrough mode.
c.colors.statusbar.passthrough.bg = background_0

# Foreground color of the statusbar in private browsing mode.
c.colors.statusbar.private.fg = background_3

# Background color of the statusbar in private browsing mode.
c.colors.statusbar.private.bg = background_0

# Foreground color of the statusbar in command mode.
c.colors.statusbar.command.fg = foreground_0

# Background color of the statusbar in command mode.
c.colors.statusbar.command.bg = background_1

# Foreground color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.fg = background_3

# Background color of the statusbar in private browsing + command mode.
c.colors.statusbar.command.private.bg = background_1

# Foreground color of the statusbar in caret mode.
c.colors.statusbar.caret.fg = accent

# Background color of the statusbar in caret mode.
c.colors.statusbar.caret.bg = background_0

# Foreground color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.fg = accent

# Background color of the statusbar in caret mode with a selection.
c.colors.statusbar.caret.selection.bg = background_0

# Background color of the progress bar.
c.colors.statusbar.progress.bg = accent

# Default foreground color of the URL in the statusbar.
c.colors.statusbar.url.fg = foreground_1

# Foreground color of the URL in the statusbar on error.
c.colors.statusbar.url.error.fg = red

# Foreground color of the URL in the statusbar for hovered links.
c.colors.statusbar.url.hover.fg = green

# Foreground color of the URL in the statusbar on successful load
# (http).
c.colors.statusbar.url.success.http.fg = blue

# Foreground color of the URL in the statusbar on successful load
# (https).
c.colors.statusbar.url.success.https.fg = blue

# Foreground color of the URL in the statusbar when there's a warning.
c.colors.statusbar.url.warn.fg = foreground_3

# Background color of the tab bar.
c.colors.tabs.bar.bg = background_1

# Color gradient start for the tab indicator.
c.colors.tabs.indicator.start = accent

# Color gradient end for the tab indicator.
c.colors.tabs.indicator.stop = purple

# Color for the tab indicator on errors.
c.colors.tabs.indicator.error = red

# Foreground color of unselected odd tabs.
c.colors.tabs.odd.fg = foreground_1

# Background color of unselected odd tabs.
c.colors.tabs.odd.bg = background_1

# Foreground color of unselected even tabs.
c.colors.tabs.even.fg = foreground_2

# Background color of unselected even tabs.
c.colors.tabs.even.bg = background_1

# Background color of pinned unselected even tabs.
c.colors.tabs.pinned.even.bg = blue

# Foreground color of pinned unselected even tabs.
c.colors.tabs.pinned.even.fg = background_0

# Background color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.bg = blue

# Foreground color of pinned unselected odd tabs.
c.colors.tabs.pinned.odd.fg = background_0

# Background color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.bg = background_2

# Foreground color of pinned selected even tabs.
c.colors.tabs.pinned.selected.even.fg = foreground_1

# Background color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.bg = background_2

# Foreground color of pinned selected odd tabs.
c.colors.tabs.pinned.selected.odd.fg = foreground_1

# Foreground color of selected even tabs.
c.colors.tabs.selected.even.fg = foreground_2

# Foreground color of selected odd tabs.
c.colors.tabs.selected.odd.fg = foreground_2
# Background color of selected even tabs.
c.colors.tabs.selected.even.bg = background_2

# Background color of selected odd tabs.
c.colors.tabs.selected.odd.bg = background_2
