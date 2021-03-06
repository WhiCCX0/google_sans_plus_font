i=$(timeout 3 getevent -qc 50) && SEL=selector || return

swipe() { i=$(getevent -qc 30) && touch swipe; }

tap() { i=$(getevent -qc 5) && touch tap; }

selector() {
	rm swipe tap
	tap &
	swipe &
	while true; do
		[ -f tap ] && break
	done
	sleep 0.5
	pkill getevent
	[ -f swipe ] && return 1 || return 0
}
