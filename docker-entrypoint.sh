#!/bin/sh
# Proseify hosted-MCP stdio bridge entrypoint.
# Bridges local stdio MCP <-> https://mcp.proseify.xyz/mcp (streamable HTTP).
# PROSEIFY_KEY (optional): if set, every request carries Bearer auth.
set -e
if [ -n "$PROSEIFY_KEY" ]; then
  exec mcp-remote https://mcp.proseify.xyz/mcp \
    --header "Authorization: Bearer ${PROSEIFY_KEY}"
else
  exec mcp-remote https://mcp.proseify.xyz/mcp
fi
