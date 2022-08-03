def hex_to_rgb(hex):
    return tuple(int(hex[i : i + 2], 16) for i in (0, 2, 4))


def rgb_to_hex(rgb):
    return "#%02x%02x%02x" % rgb


# Allow for negative amounts


def lighten(hex, amount):
    hex = hex[1:]
    rgb = hex_to_rgb(hex)
    rgb = tuple(int(x * (1 + amount)) for x in rgb)
    return rgb_to_hex(rgb)
