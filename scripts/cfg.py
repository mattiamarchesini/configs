
import sys
import os
from pathlib import Path

profile_json_schema=""

def check_profile_json(profile_json) :
    pass

def read_profile(profile_name):
    """Reads and checks a profile.json file."""
    configs_dir = os.getenv("CONFIGS_DIR")
    if not configs_dir:
        print("Error: CONFIGS_DIR environment variable is not set.", file=sys.stderr)
        sys.exit(1)

    profile_path = Path(configs_dir) / "profiles" / profile_name / "profile.json"

    try:
        profile_json = profile_path.read_text()
        check_profile_json(profile_json)
        print("ciao")
        return profile_json
    except FileNotFoundError:
        print(f"Error: Profile file not found at '{profile_path}'", file=sys.stderr)
        sys.exit(1)

# --- Command Functions ---

def apply(*args):
    """Applies the configuration."""
    # ' '.join(args) mimics the behavior of "$@" in the bash echo statement
    print(f"apply {' '.join(args)}")

def init(*args):
    """Initializes the configuration."""
    print(f"init {' '.join(args)}")

def deploy(*args):
    """Deploys the configuration."""
    print(f"deploy {' '.join(args)}")

# --- Main Entry Point ---

# Using a dictionary to map command strings to functions is a clean
# and scalable approach in Python.
COMMANDS = {
    'init': init,
    'apply': apply,
    'deploy': deploy,
}

def main():
    """Parses command-line arguments and calls the appropriate function."""
    if len(sys.argv) < 2:
        print("Error: No command specified.", file=sys.stderr)
        print(f"Usage: {sys.argv[0]} <command> [args...]", file=sys.stderr)
        print(f"Available commands: {', '.join(COMMANDS.keys())}", file=sys.stderr)
        sys.exit(1)

    command_name = sys.argv[1]
    arguments = sys.argv[2:]

    # Check if the command is valid
    if command_name not in COMMANDS:
        print(f"Command {command_name} not found", file=sys.stderr)
        sys.exit(1)

    # This line mimics the `echo "$@"` line from the original main function
    print(' '.join(arguments))

    # Get the function from the dictionary and call it
    command_function = COMMANDS[command_name]

    # The * unpacks the 'arguments' list into positional arguments for the function
    command_function(*arguments)

if __name__ == "__main__":
    main()
