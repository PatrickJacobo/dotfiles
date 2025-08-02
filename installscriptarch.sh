#!/usr/bin/env bash

# this script installs a lot of stuff


REPOS=(
    "https://github.com/PatrickJacobo/dwm"
    "https://github.com/PatrickJacobo/st"
    "https://github.com/PatrickJacobo/slstatus"
)

# Loop through each repository
for REPO_URL in "${REPOS[@]}"; do
    echo "Cloning repository from $REPO_URL..."
    
    # Clone the repository
    git clone "$REPO_URL"
    if [ $? -ne 0 ]; then
        echo "Error: Failed to clone $REPO_URL."
        continue
    fi

    # Extract the directory name from the repository URL
    REPO_DIR=$(basename "$REPO_URL" .git)

    # Navigate into the repository directory
    if [ -d "$REPO_DIR" ]; then
        cd "$REPO_DIR" || { echo "Error: Could not enter directory $REPO_DIR"; continue; }
    else
        echo "Error: Directory $REPO_DIR does not exist."
        continue
    fi

    # Run make install clean with sudo
    echo "Installing the repository using 'sudo make install clean'..."
    sudo make install clean
    if [ $? -ne 0 ]; then
        echo "Error: Installation failed for $REPO_URL."
        cd .. # Go back to the parent directory
        continue
    fi

    echo "Installation completed successfully for $REPO_URL."

    # Return to the parent directory
    cd ..
done

echo "All repositories processed."
sudo xbps-install rofi firefox wireplumber 
