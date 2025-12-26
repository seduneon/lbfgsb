#!/usr/bin/env bash
set -euo pipefail
fpm test --profile release --flag "-DREAL80"
