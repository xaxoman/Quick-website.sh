# QuickWebsite.sh

This shell script automates the creation of a basic web project structure, initializes a Git repository, and optionally creates and pushes a new repository to GitHub.

## Features

- Creates a project directory with a specified name.
- Generates essential files: `index.html`, `style.css`, and `script.js`.
- Creates additional directories for images (`img`) and fonts (`fonts`).
- Initializes a Git repository locally.
- Optionally creates a new repository on GitHub (public or private) and pushes the local code to the remote repository.

## Requirements

- **Git**: Make sure Git is installed on your system. [Install Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) if it's not already installed.
- **cURL**: Ensure cURL is installed. Most Unix-based systems like Linux and macOS come with cURL pre-installed.
- **GitHub Personal Access Token**: You'll need a GitHub personal access token with the appropriate permissions to create repositories.

## Installation

1. **Clone the repository (if available) or download the script**:
    
    - Clone with Git:
        
`git clone https://github.com/yourusername/your-repo.git`

`cd your-repo`
        
    - Or, download the script directly and navigate to the directory containing the script.
2. **Make the script executable**:
    

    
    `chmod +x script_name.sh`
    

## How to Use

1. **Set up your GitHub token and username**:
    
    - Open the script file (`script_name.sh`) in a text editor.
    - Replace the `github_token` variable with your actual GitHub Personal Access Token.
    - Replace the `github_username` variable with your GitHub username.
2. **Execute the script**:
    
    `./script_name.sh`
    
    - The script will prompt you to enter a directory name for your project.
    - It will then ask if you want to create a GitHub repository and deploy the project.
    - If you choose to create a repository, the script will prompt you to specify whether the repository should be `public` or `private`.

## How to Obtain a GitHub Personal Access Token

1. Go to your GitHub account and navigate to **Settings** > **Developer settings** > **Personal access tokens** > **Tokens (classic)**.
    
2. Click **Generate new token**.
    
3. Set a descriptive name for your token and choose an expiration date.
    
4. Under **Select scopes**, choose the following permissions:
    
    - `repo` (for full control of private repositories)
    - `workflow` (for triggering GitHub Actions workflows)
    - `admin:repo_hook` (for managing repository hooks)
    - `user` (for reading and writing profile data)
    - `delete_repo` (for deleting repositories)
    - `write:packages`, `read:packages` (for package management)
    - `admin:org`, `admin:public_key`, `admin:repo_hook`, `admin:org_hook` if you need organizational permissions.
5. Click **Generate token**.
    
6. Copy the generated token and replace the placeholder in the script (`github_token="your_token_here"`) with this value.
    

> **Important:** Keep your token secure and never share it. If it gets exposed, revoke it immediately and create a new one.    

## Notes

- This script is designed for use in Unix-based systems (Linux, macOS). It may require modifications to run on Windows.
- Ensure your GitHub token has the necessary permissions to perform actions like repository creation and pushing code.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

