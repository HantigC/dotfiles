.PHONY: setup_bash setup_vscode setup_ipython setup_zed

setup_vscode:
	bash config/vscode/setup.sh

setup_ipython:
	bash config/ipython/setup.sh

setup_zed:
	bash config/zed/setup.sh
