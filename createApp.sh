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
    
    <script src="script.js" ></script>
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
        if [ "$repo_visibility" == "public" ]; then
            private_flag=false
            break
        elif [ "$repo_visibility" == "private" ]; then
            private_flag=true
            break
        else
            echo "Invalid input. Please enter 'public' or 'private'."
        fi
    done

    # Create the repository using the GitHub API
    curl -H "Authorization: token $github_token" \
         -H "Accept: application/vnd.github+json" \
         https://api.github.com/user/repos \
         -d "{\"name\":\"$repo_name\", \"private\":$private_flag}"

    # Initialize a new Git repository
    git init

    # Add all files to the repository
    git add .

    # Commit the files
    git commit -m "Initial commit"

    # Add the remote GitHub repository
    git remote add origin https://github.com/$github_username/$repo_name.git

    # Push the code to GitHub
    git branch -M main
    git push -u origin main

    echo "Repository '$repo_name' created and pushed to GitHub under username '$github_username'."
else
    echo "No Git repository created."
fi
