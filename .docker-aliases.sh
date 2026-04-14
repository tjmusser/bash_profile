# Docker aliases
# Only active when Docker is installed

if command -v docker &>/dev/null; then
  alias dps='docker ps'
  alias dpsa='docker ps -a'
  alias dimg='docker images'
  alias dprune='docker system prune -af'
  alias dlog='docker logs -f'

  # Docker Compose
  alias dcu='docker compose up -d'
  alias dcd='docker compose down'
  alias dcr='docker compose restart'
  alias dcl='docker compose logs -f'
  alias dcb='docker compose build'
fi
