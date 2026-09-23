# Proseify hosted-MCP → local stdio bridge.
# Lets MCP clients (and evaluators like Glama) run Proseify over stdio while
# the actual tools stay hosted at https://mcp.proseify.xyz/mcp.
#
#   docker run -i -e PROSEIFY_KEY=your_key ghcr.io/dionisselami/proseify-mcp
#     -> stdio MCP bridge to https://mcp.proseify.xyz/mcp with Bearer auth
#
# The key is supplied at RUNTIME via env — never baked into the image.
# mcp-remote bridges local stdio <-> remote streamable-http MCP.

FROM node:22-alpine
WORKDIR /app
RUN npm install -g mcp-remote@latest && npm cache clean --force
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
