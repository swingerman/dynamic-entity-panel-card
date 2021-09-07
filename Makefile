SHELL := /bin/bash

init: requirements homeassistant-install ## Install requirements

requirements:
	sudo apt update && sudo apt install -y libxml2-dev libxslt-dev libpcap-dev bash curl jq nodejs npm
	python3 -m pip --disable-pip-version-check install -U "pip>=8.0.3,<20.3"
	python3 -m pip --disable-pip-version-check install -U setuptools wheel
	python3 -m pip --disable-pip-version-check install --ignore-installed -r requirements.txt

homeassistant-install: ## Install the latest dev version of Home Assistant
	python3 -m pip --disable-pip-version-check install -U "pip>=8.0.3,<20.3";
	python3 -m pip --disable-pip-version-check install -U setuptools wheel;
	python3 -m pip --disable-pip-version-check \
		install --upgrade git+git://github.com/home-assistant/home-assistant.git@dev;

homeassistant-update: homeassistant-install ## Alias for 'homeassistant-install'