from ranger.api.commands import Command

class set_wallpaper(Command):
    """
    Custom function to change theme using pywal and set center aligned theme using feh.
    """
    def execute(self):
        self.fm.execute_console('shell feh --bg-fill %f');
