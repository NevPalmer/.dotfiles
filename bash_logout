# ~/.bash_logout: executed by bash(1) when login shell exits.

# When leaving the console clear the screen to increase privacy
# Note that "printf '\e[3J'" completely clears the buffer, not just scroll up.

if [ "$SHLVL" = 1 ]; then
    [ -x `which clear` ] && clear && printf '\e[3J'
fi
