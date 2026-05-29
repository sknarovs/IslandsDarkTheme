#!/usr/bin/env bash
# Islands Dark Theme - Bash Sample

set -euo pipefail

readonly SCRIPT_NAME=$(basename "$0")
readonly CONFIG_DIR="${HOME}/.config/islands-dark"
readonly MAX_RETRIES=3

print_header() {
    local title="$1"
    echo "========================================"
    echo "  $title"
    echo "========================================"
}

log_message() {
    local level="$1"
    shift
    local message="$*"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [$level] $message"
}

process_files() {
    local directory="$1"
    local pattern="${2:-*.txt}"

    if [[ ! -d "$directory" ]]; then
        log_message "ERROR" "Directory not found: $directory"
        return 1
    fi

    local count=0
    while IFS= read -r -d '' file; do
        local size
        size=$(wc -c < "$file")
        log_message "INFO" "Processing: $file ($size bytes)"
        ((count++))
    done < <(find "$directory" -name "$pattern" -print0 2>/dev/null)

    log_message "INFO" "Processed $count file(s)"
    return 0
}

main() {
    print_header "Islands Dark Theme Setup"

    local dir="${1:-$CONFIG_DIR}"

    for i in $(seq 1 "$MAX_RETRIES"); do
        log_message "INFO" "Attempt $i of $MAX_RETRIES"
        if process_files "$dir"; then
            log_message "INFO" "Setup completed successfully"
            exit 0
        fi
        sleep 2
    done

    log_message "ERROR" "Setup failed after $MAX_RETRIES attempts"
    exit 1
}

main "$@"