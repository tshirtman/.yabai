layout=$(yabai -m query --spaces --space | jq -r .type)

case $layout in
"bsp")
	yabai -m window --focus $1;;
"stack")
	case $1 in
	"east")
		yabai -m window --focus stack.prev;;
	"west")
		yabai -m window --focus stack.next;;
	"north")
		yabai -m window --focus stack.first;;
	"south")
		yabai -m window --focus stack.last;;
	esac
	;;
"float")
	case $1 in
	"east")
		yabai -m query --spaces --space \
		| jq -re ".index" \
		| xargs -I{} yabai -m query --windows --space {}\
		| jq -sre 'add|map(select(.["is-minimized"] == false)) | sort_by(.display, .frame.y, .frame.x, .id) | reverse | nth(index(map(select(.["has-focus"]))) - 1).id' \
		| xargs -I{} yabai -m window --focus {}
		;;
	"west")
		yabai -m query --spaces --space \
		| jq -re ".index" \
		| xargs -I{} yabai -m query --windows --space {}\
		| jq -sre 'add|map(select(.["is-minimized"] == false)) | sort_by(.display, .frame.y, .frame.x, .id) | nth(index(map(select(.["has-focus"]))) - 1).id' \
		| xargs -I{} yabai -m window --focus {}
		;;
	esac
esac
