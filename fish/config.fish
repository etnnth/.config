alias watchPerf='watch -n1 "sensors && cat /proc/cpuinfo | grep \"^[c]pu MHz\""'
alias docker=podman

export COMPOSE_DOCKER_CLI_BUILD=1 
export DOCKER_BUILDKIT=1

theme_gruvbox dark hard
