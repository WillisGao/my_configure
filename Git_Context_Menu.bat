reg 放到git安装目录下执行。
@echo on
setlocal enabledelayedexpansion
set "GIT_ROOT=%~dp0"
set "GIT_ROOT_REG=!GIT_ROOT:\=\\!"
set "GIT_ROOT_REG=!GIT_ROOT_REG:~0,-1!"

:: ========== 先删除旧配置（避免重复/冲突） ==========
reg delete "HKCR\Directory\shell\GitBashHere" /f >nul
reg delete "HKCR\Directory\shell\GitGUIHere" /f >nul
reg delete "HKCR\Directory\Background\shell\GitBashHere" /f >nul
reg delete "HKCR\Directory\Background\shell\GitGUIHere" /f >nul
reg delete "HKCR\DesktopBackground\shell\GitBashHere" /f >nul
reg delete "HKCR\DesktopBackground\shell\GitGUIHere" /f >nul

:: ========== 写入新配置 ==========
:: 文件夹右键 - Git Bash
reg add "HKCR\Directory\shell\GitBashHere" /ve /d "Git Bash Here" /f >nul
reg add "HKCR\Directory\shell\GitBashHere" /v "Icon" /d "!GIT_ROOT_REG!\\mingw64\\share\\git\\git-for-windows.ico" /f >nul
reg add "HKCR\Directory\shell\GitBashHere\command" /ve /d "\"!GIT_ROOT_REG!\\bin\\bash.exe\" --login -i" /f >nul

:: 文件夹右键 - Git GUI
reg add "HKCR\Directory\shell\GitGUIHere" /ve /d "Git GUI Here" /f >nul
reg add "HKCR\Directory\shell\GitGUIHere" /v "Icon" /d "!GIT_ROOT_REG!\\mingw64\\share\\git\\git-for-windows.ico" /f >nul
reg add "HKCR\Directory\shell\GitGUIHere\command" /ve /d "\"!GIT_ROOT_REG!\\cmd\\git-gui.exe\" --working-dir \"%%1\"" /f >nul

:: 空白处右键 - Git Bash
reg add "HKCR\Directory\Background\shell\GitBashHere" /ve /d "Git Bash Here" /f >nul
reg add "HKCR\Directory\Background\shell\GitBashHere" /v "Icon" /d "!GIT_ROOT_REG!\\mingw64\\share\\git\\git-for-windows.ico" /f >nul
reg add "HKCR\Directory\Background\shell\GitBashHere\command" /ve /d "\"!GIT_ROOT_REG!\\bin\\bash.exe\" --login -i" /f >nul

:: 空白处右键 - Git GUI
reg add "HKCR\Directory\Background\shell\GitGUIHere" /ve /d "Git GUI Here" /f >nul
reg add "HKCR\Directory\Background\shell\GitGUIHere" /v "Icon" /d "!GIT_ROOT_REG!\\mingw64\\share\\git\\git-for-windows.ico" /f >nul
reg add "HKCR\Directory\Background\shell\GitGUIHere\command" /ve /d "\"!GIT_ROOT_REG!\\cmd\\git-gui.exe\" --working-dir \"%%v\"" /f >nul

:: 桌面空白处右键兼容
reg add "HKCR\DesktopBackground\shell\GitBashHere" /ve /d "Git Bash Here" /f >nul
reg add "HKCR\DesktopBackground\shell\GitBashHere" /v "Icon" /d "!GIT_ROOT_REG!\\mingw64\\share\\git\\git-for-windows.ico" /f >nul
reg add "HKCR\DesktopBackground\shell\GitBashHere\command" /ve /d "\"!GIT_ROOT_REG!\\bin\\bash.exe\" --login -i" /f >nul
reg add "HKCR\DesktopBackground\shell\GitGUIHere" /ve /d "Git GUI Here" /f >nul
reg add "HKCR\DesktopBackground\shell\GitGUIHere" /v "Icon" /d "!GIT_ROOT_REG!\\mingw64\\share\\git\\git-for-windows.ico" /f >nul
reg add "HKCR\DesktopBackground\shell\GitGUIHere\command" /ve /d "\"!GIT_ROOT_REG!\\cmd\\git-gui.exe\" --working-dir \"%%v\"" /f >nul

exit
