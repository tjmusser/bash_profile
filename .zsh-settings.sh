# Zsh prompt configuration with git integration
#
# Displays: TIME (branch) PATH$ when in a git repo (clean = green, dirty = red)
#           TIME PATH$ when not in a git repo

setopt PROMPT_SUBST

precmd() {
  local git_info=""
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    if [[ -z $(git status --porcelain 2>/dev/null) ]]; then
      git_info="%F{green}$(__git_ps1 " (%s)")%f"
    else
      git_info="%F{9}$(__git_ps1 " {%s}")%f"
    fi
  fi
  PROMPT="%F{242}%@%f${git_info} %B%F{yellow}%~%f%b%# "
}
