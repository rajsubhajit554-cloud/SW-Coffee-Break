@echo off
title Git Repository Auto-Updater
echo ==========================================
echo       Git Repository Auto-Updater
echo ==========================================
echo.

:: Check git status
echo Current Git Status:
echo ------------------------------------------
git status -s
echo ------------------------------------------
echo.

:: Ask user if they want to proceed
set /p proceed="Do you want to stage, commit, and push these changes? (Y/N): "
if /I not "%proceed%"=="Y" (
    echo Update cancelled.
    goto end
)

:: Stage all changes
echo.
echo Staging all changes...
git add -A

:: Ask for commit message
echo.
set /p msg="Enter commit message (press Enter for default 'Website update'): "
if "%msg%"=="" set msg=Website update

:: Commit changes
echo.
echo Committing changes...
git commit -m "%msg%"

:: Push to remote
echo.
echo Pushing to GitHub (origin main)...
git push origin main

if %errorlevel% equ 0 (
    echo.
    echo ==========================================
    echo    SUCCESS: Repository updated successfully!
    echo ==========================================
) else (
    echo.
    echo ==========================================
    echo    ERROR: Failed to push to GitHub.
    echo    Please check your credentials or connection.
    echo ==========================================
)

:end
echo.
pause
