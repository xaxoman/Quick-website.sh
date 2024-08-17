#!/bin/bash

# GitHub personal access token (replace with your actual token)
github_token=""

# GitHub username (replace with your actual username)
github_username="xaxoman"

# Ask for the directory name
echo "Enter the directory name:"
read dir_name

# Create the directory with the provided name
mkdir -p "$dir_name"

# Navigate into the newly created directory
cd "$dir_name"

# Create the three files
touch index.html style.css script.js

# Create other useful directories like img and fonts
mkdir img fonts

# Add the specified HTML content to the index.html file
cat <<EOL > index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <script src="script.js"></script>
</body>
</html>
EOL

echo "Directory '$dir_name' created with files index.html, style.css, and script.js inside."

# Ask the user if they want to create a Git repository
echo "Do you want to create a Git repository and deploy it to GitHub? (y/n)"
read create_repo

if [ "$create_repo" == "y" ]; then
    # Ask for the GitHub repository name
    echo "Enter the GitHub repository name:"
    read repo_name

    # Ask if the repository should be public or private
    while true; do
        echo "Do you want the repository to be public or private? (public/private)"
        read repo_visibility
        case $repo_visibility in
            public)
                private_flag=false
                break
                ;;
            private)
                private_flag=true
                break
                ;;
            *)
                echo "Invalid input. Please enter 'public' or 'private'."
                ;;
        esac
    done

    # Create the repository using the GitHub API
    curl -H "Authorization: token $github_token" \
         -H "Accept: application/vnd.github+json" \
         https://api.github.com/user/repos \
         -d "{\"name\":\"$repo_name\", \"private\":$private_flag}"

    # Initialize a new Git repository
    git init

    # Configure Git user if not set
    if ! git config user.name &>/dev/null; then
        echo "Please configure your Git username:"
        read git_username
        git config --global user.name "$git_username"
    fi

    if ! git config user.email &>/dev/null; then
        echo "Please configure your Git email:"
        read git_email
        git config --global user.email "$git_email"
    fi

    # Rename the default branch to main
    git branch -M main

    # Add all files to the repository
    git add .

    # Commit the files
    git commit -m "Initial commit"

    # Add the remote GitHub repository with Personal Access Token for HTTPS
    git remote add origin https://$github_token@github.com/$github_username/$repo_name.git

    # Push the code to GitHub
    git push -u origin main

    echo "Repository '$repo_name' created and pushed to GitHub under username '$github_username'."
else
    echo "No Git repository created."
fi
