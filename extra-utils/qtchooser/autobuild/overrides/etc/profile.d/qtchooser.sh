case ":${PATH:-}:" in
    *:/usr/lib/qtchooser:*) ;;
    *) PATH="/usr/lib/qtchooser${PATH:+:$PATH}" ;;
esac
