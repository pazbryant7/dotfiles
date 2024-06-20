#!/bin/sh

sync_password_manager() {
	# Navigate to the password manager directory
	cd ~/.password-store || {
		echo "Failed to navigate to ~/.password_manager"
		exit 1
	}

	# Pull the latest changes from the remote repository
	git pull origin main || {
		echo "Failed to pull from remote repository"
		exit 1
	}

	# Add any new or changed files
	git add -A || {
		echo "Failed to add changes"
		exit 1
	}

	# Commit the changes with a message
	commit_message="Auto-sync on $(date)"
	git commit -m "$commit_message" || { echo "No changes to commit"; }

	# Push the changes to the remote repository
	git push origin main || {
		echo "Failed to push to remote repository"
		exit 1
	}
}

# Execute the function
sync_password_manager
