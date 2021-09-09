SHELL = bash

MAKEFILE_DIR := $(dir $(realpath $(firstword ${MAKEFILE_LIST})))
BIN_DIR := ${MAKEFILE_DIR}/bin
LIB_DIR := ${MAKEFILE_DIR}/lib

.PHONY: open \
		bootstrap \
		generate-project \
		local-install-mint \
		local-install-xcodegen \
		local-install-swiftgen \
		local-install-swiftlint \
		local-install-swiftformat \
		local-install-iblinter \
		local-install-licenseplist

open:
	@open ExampleBuildToolsManagement.xcodeproj

bootstrap:
	@echo "*** Install build tools ***"
	@$(MAKE) local-install-mint
	@$(MAKE) local-install-xcodegen
	@$(MAKE) local-install-swiftgen
	@$(MAKE) local-install-swiftlint
	@$(MAKE) local-install-swiftformat
	@$(MAKE) local-install-iblinter
	@${MAKE} local-install-licenseplist
	@echo ""
	@echo "*** Generate Xcode project ***"
	@$(MAKE) generate-project
	@echo ""
	@echo "Complete bootstrap."

generate-project: local-install-xcodegen
	@echo "Xcode project generating..."
	@${XCODEGEN_BIN_PATH} -q
	@echo "Xcode project generated."

local-install-mint:
	@echo -n "Mint..."
	@MINT_PATH=$$(${MAKEFILE_DIR}/scripts/local-install-mint.sh -s "${LIB_DIR}/mint"); \
		ln -sf "$${MINT_PATH}" "${BIN_DIR}/mint"
	@echo "OK!"

local-install-xcodegen:
	@echo -n "XcodeGen..."
#	It won't work properly with symbolic link.
#   see https://github.com/yonaskolb/XcodeGen/issues/247, https://github.com/yonaskolb/XcodeGen/pull/248
	$(eval XCODEGEN_BIN_PATH := $(shell ${MAKEFILE_DIR}/scripts/local-install-xcodegen.sh -s "${LIB_DIR}/xcodegen"))
	@echo "OK!"

local-install-swiftgen:
	@echo -n "SwiftGen..."
	@SWIFTGEN_PATH=$$(${MAKEFILE_DIR}/scripts/local-install-swiftgen.sh -s "${LIB_DIR}/swiftgen"); \
		ln -sf "$${SWIFTGEN_PATH}" "${BIN_DIR}/swiftgen"
	@echo "OK!"

local-install-swiftlint:
	@echo -n "SwiftLint..."
	@SWIFTLINT_PATH=$$(${MAKEFILE_DIR}/scripts/local-install-swiftlint.sh -s "${LIB_DIR}/swiftlint"); \
		ln -sf "$${SWIFTLINT_PATH}" "${BIN_DIR}/swiftlint"
	@echo "OK!"

local-install-swiftformat:
	@echo -n "SwiftFormat..."
	@SWIFTFORMAT_PATH=$$(${MAKEFILE_DIR}/scripts/local-install-swiftformat.sh -s "${LIB_DIR}/swiftformat"); \
		ln -sf "$${SWIFTFORMAT_PATH}" "${BIN_DIR}/swiftformat"
	@echo "OK!"

local-install-iblinter:
	@echo -n "IBLinter..."
	@IBLINTER_PATH=$$(${MAKEFILE_DIR}/scripts/local-install-iblinter.sh -s "${LIB_DIR}/iblinter"); \
		ln -sf "$${IBLINTER_PATH}" "${BIN_DIR}/iblinter"
	@echo "OK!"

local-install-licenseplist:
	@echo -n "LicensePlist..."
	@LICENSEPLIST_PATH=$$(${MAKEFILE_DIR}/scripts/local-install-licenseplist.sh -s "${LIB_DIR}/licenseplist"); \
		ln -sf "$${LICENSEPLIST_PATH}" "${BIN_DIR}/license-plist"
	@echo "OK!"