#!/usr/bin/env bash
# shellcheck disable=SC2034

# Should always work.
RESET="\e[0m"
BOLD_ON="\e[1m"
BOLD_OFF="\e[22m"
UNDERLINE_ON="\e[4m"
UNDERLINE_OFF="\e[24m"

# Might work; depends on terminal emulator.
FAINT_ON="\e[2m"
FAINT_OFF="\e[22m"
ITALIC_ON="\e[3m"
ITALIC_OFF="\e[23m"
BLINK_ON="\e[5m"
BLINK_OFF="\e[25m"
INVERSE_ON="\e[7m"
INVERSE_OFF="\e[27m"
STRIKE_ON="\e[9m"
STRIKE_OFF="\e[29m"

# Foreground colors.
FG_BLACK="\e[30m"
FG_RED="\e[31m"
FG_GREEN="\e[32m"
FG_YELLOW="\e[33m"
FG_BLUE="\e[34m"
FG_PURPLE="\e[35m"
FG_CYAN="\e[36m"
FG_WHITE="\e[37m"

FG_BRIGHT_BLACK="\e[90m"
FG_BRIGHT_RED="\e[91m"
FG_BRIGHT_GREEN="\e[92m"
FG_BRIGHT_YELLOW="\e[93m"
FG_BRIGHT_BLUE="\e[94m"
FG_BRIGHT_PURPLE="\e[95m"
FG_BRIGHT_CYAN="\e[96m"
FG_BRIGHT_WHITE="\e[97m"

# Background colors.
BG_BLACK="\e[40m"
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[44m"
BG_PURPLE="\e[45m"
BG_CYAN="\e[46m"
BG_WHITE="\e[47m"

BG_BRIGHT_BLACK="\e[100m"
BG_BRIGHT_RED="\e[101m"
BG_BRIGHT_GREEN="\e[102m"
BG_BRIGHT_YELLOW="\e[103m"
BG_BRIGHT_BLUE="\e[104m"
BG_BRIGHT_PURPLE="\e[105m"
BG_BRIGHT_CYAN="\e[106m"
BG_BRIGHT_WHITE="\e[107m"

# Usage Examples:
echo -e "${BOLD_ON}${FG_RED}${BG_YELLOW}Bold red on yellow${BOLD_OFF} normal intensity${RESET}"
echo -e "${UNDERLINE_ON}${FG_BLUE}Underlined blue text${UNDERLINE_OFF} normal text${RESET}"
echo -e "${FG_GREEN}${BG_BLACK}Green on black${RESET} normal text${RESET}"
echo -e "${BOLD_ON}${UNDERLINE_ON}${FG_CYAN}Bold & underlined cyan${BOLD_OFF}${UNDERLINE_OFF} normal text${RESET}"

rgb_fg() {
  #          fg                r    g    b
  printf "\e[38;2;%s;%s;%sm" "$1" "$2" "$3"
}
rgb_bg() {
  #          bg                r    g    b
  printf "\e[48;2;%s;%s;%sm" "$1" "$2" "$3"
}

# RGB Examples:
PINK="$(rgb_fg 255 105 180)"
BOLD_PINK_ON_WHITE="${BOLD_ON}$(rgb_fg 255 105 180)$(rgb_bg 255 255 255)"

echo -e "${UNDERLINE_ON}${PINK}Hello${RESET}"
echo -e "${BOLD_PINK_ON_WHITE}Hello${RESET}"

printf "%b\n" "${BOLD_PINK_ON_WHITE}Hello${RESET}"
printf "%bThis is some text%b\n" "${BOLD_ON}${PINK}" "$RESET"
