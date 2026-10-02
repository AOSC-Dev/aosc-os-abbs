if test -d "$HOME/.nimble/bin"
    if not contains "$HOME/.nimble/bin" $PATH
        set -gx PATH "$HOME/.nimble/bin" $PATH
    end
end
