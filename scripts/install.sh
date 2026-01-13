#!/usr/bin/env sh

# Set $PROFILE and $INSTALL_ARGS variables then, to run on Unix-like OSs:

# curl https://raw.githubusercontent.com/mattiamarchesini/configs/main/scripts/install | sh

set -e

# --- Argument Validation ---
# Check if the number of arguments is not equal to 2
if [ "$#" -ne 2 ]; then
    # Print the correct usage to stderr and exit with an error
    echo "Error: You must provide the URL and the output file." >&2
    echo "Usage: $0 <URL> <output_file>" >&2
    echo "Example: $0 https://example.com/file.zip /tmp/file.zip" >&2
    exit 1
fi

URL="$1"
OUTPUT_FILE="$2"

# --- Downloader Selection Logic ---

# Check if 'curl' is installed
if command -v curl >/dev/null 2>&1; then

    echo "Found curl. Starting download..."

    # Use curl to download the file
    # -f: Fail fast (returns an error if the server gives an HTTP error)
    # -s: Silent (do not show progress bar)
    # -S: Show error (shows the error even in silent mode)
    # -L: Follow redirects (essential for GitHub, etc.)
    # -o: Specify the output file
    curl -fsSL -o "$OUTPUT_FILE" "$URL"

# If 'curl' was not found, check for 'wget'
elif command -v wget >/dev/null 2>&1; then

    echo "Found wget. Starting download..."
    wget -q -O "$OUTPUT_FILE" "$URL"

else
    echo "Error: 'curl' or 'wget' is required to download the configs, but neither is installed." >&2
    exit 1
fi

# Final check: verify that the file was created and is not empty
# The '-s' flag checks if the file exists AND has a size greater than zero
if [ -s "$OUTPUT_FILE" ]; then
    echo "Download completed successfully: $OUTPUT_FILE"
else
    echo "Error: Download failed or the file is empty." >&2
    exit 1
fi

wget -o configs.tar.gz https://github.com/mattiamarchesini/configs/archive/refs/heads/main.tar.gz
tar -xzf configs.tar.gz
cd configs-main
./profiles/$PROFILE/install/base
python3 scripts/cfg.py install $PROFILE $INSTALL_ARGS