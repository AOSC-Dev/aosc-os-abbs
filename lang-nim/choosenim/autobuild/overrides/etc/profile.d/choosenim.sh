if [ -d "${HOME}/.nimble/bin" ]; then
    case ":${PATH}:" in
        *":${HOME}/.nimble/bin:"*) ;;
        *) PATH="${HOME}/.nimble/bin:${PATH}" ;;
    esac
    export PATH
fi
