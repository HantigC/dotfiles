.PHONY: setup_bash setup_vscode

setup_bash:
	echo "source ${HOME}/.bash_config" >> "${HOME}/.bashrc"

setup_vscode:
	bash config/vscode/setup.sh
