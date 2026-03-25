@echo off
REM Script para abrir servidor local e landing page no Windows
REM Desenvolvido para Luciana - Curso Intensivo Ouvidoria Postalis

setlocal enabledelayedexpansion

echo.
echo ========================================
echo   LANDING PAGE - OUVIDORIA POSTALIS
echo   Servidor Local | Windows
echo ========================================
echo.

REM Detectar Python
where python >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] Python detectado
    set PYTHON_CMD=python
    goto START_SERVER
)

where python3 >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] Python 3 detectado
    set PYTHON_CMD=python3
    goto START_SERVER
)

REM Se Python nao encontrado, abrir arquivo diretamente
echo [AVISO] Python nao detectado
echo.
echo Abrindo landing-page.html diretamente no navegador...
timeout /t 2
start landing-page.html
goto END

:START_SERVER
echo.
echo Iniciando servidor local na porta 8000...
echo.
%PYTHON_CMD% -m http.server 8000

REM Abrir automaticamente no navegador
echo.
echo Abrindo navegador em http://localhost:8000/landing-page.html...
timeout /t 2
start http://localhost:8000/landing-page.html

:END
echo.
echo ========================================
echo Servidor rodando. Pressione CTRL+C para parar.
echo ========================================
pause
