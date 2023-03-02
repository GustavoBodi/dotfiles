all:
	stow --verbose --targe=$$HOME --restow */
delete:
	stow --verbose --target=$$HOME --delete */
