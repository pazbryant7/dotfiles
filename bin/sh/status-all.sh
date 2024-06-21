show_status_all() {
	sudo systemctl status docker.socket
	echo ""
	sudo systemctl status mongodb.service
	echo ""
	sudo systemctl status postgresql.service
}

show_status_all
