# Create a copy of the Firefox bookmarks database
cp $HOME/.mozilla/firefox/v9dya03m.default-release-1679578892857/places.sqlite /tmp/bookmarks.sqlite

# Get list of Firefox bookmarks from the copy
bookmarks=$(sqlite3 /tmp/bookmarks.sqlite "SELECT moz_bookmarks.id, moz_bookmarks.title, moz_places.url FROM (moz_bookmarks INNER JOIN moz_places ON moz_bookmarks.fk=moz_places.id) WHERE moz_bookmarks.parent IS NOT 1 AND moz_bookmarks.parent IS NOT 2 AND moz_bookmarks.title IS NOT NULL ORDER BY moz_bookmarks.lastModified DESC;")

# Check if bookmarks were found
if [ -z "$bookmarks" ]; then
  echo "No bookmarks found"
  exit 1
fi

# Parse bookmark IDs, titles, and URLs
ids=()
titles=()
urls=()
while IFS="|" read -r id title url; do
  ids+=("$id")
  titles+=("$title")
  urls+=("$url")
done <<< "$bookmarks"

# Show the rofi menu with the bookmark options
selected_option=$(printf "%s\n" "${titles[@]}" | rofi -dmenu -i -theme ~/.config/rofi/run.rasi -p "   ")

if [ -n "$selected_option" ]; then
  index=$(printf '%s\n' "${titles[@]}" | grep -x -n "$selected_option" | cut -d: -f1)
  if [ -n "$index" ]; then
    firefox "${urls[$index-1]}"
  fi
fi
