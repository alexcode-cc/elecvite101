!macro preInit
    # electron win自定義安裝路徑完美版
    Var /GLOBAL installDir
	SetRegView 64
    ReadRegStr $installDir HKLM "${INSTALL_REGISTRY_KEY}" InstallLocation
    ${if} $installDir == ""
        WriteRegExpandStr HKLM "${INSTALL_REGISTRY_KEY}" InstallLocation "C:\Apps\ElecVite101"
    ${endif}

    ReadRegStr $installDir HKCU "${INSTALL_REGISTRY_KEY}" InstallLocation
    ${if} $installDir == ""
         WriteRegExpandStr HKCU "${INSTALL_REGISTRY_KEY}" InstallLocation "C:\Apps\ElecVite101"
    ${endif}

	# SetRegView 32 almost ...
!macroend

!macro customRemoveFiles
    ${if} ${isUpdated}
        !insertmacro quitSuccess
    ${else}
        RMDir /r $INSTDIR
    ${endIf}
!macroend

!macro customUnWelcomePage
  !define MUI_WELCOMEPAGE_TITLE "解除安裝本軟體"
  !define MUI_WELCOMEPAGE_TEXT "解除安裝本軟體後會刪除本軟體的所有資料。請備份好重要資料！！！"
  !insertmacro MUI_UNPAGE_WELCOME
!macroend
