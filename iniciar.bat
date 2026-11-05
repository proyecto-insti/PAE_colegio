@echo off
chcp 65001 >nul
title Sistema PAE Escolar - Flask + MySQL (XAMPP)
cd /d "%~dp0"

echo ============================================
echo   SISTEMA PAE ESCOLAR - ARRANQUE LOCAL
echo ============================================
echo.

where py >nul 2>nul
if errorlevel 1 (
  echo [ERROR] No se encontro Python. Instale Python 3 y vuelva a intentar.
  pause
  exit /b 1
)

echo [1/2] Verificando que MySQL de XAMPP este encendido...
powershell -NoProfile -Command "$c = Get-NetTCPConnection -LocalPort 3306 -State Listen -ErrorAction SilentlyContinue; if ($c) { exit 0 } else { exit 1 }"
if errorlevel 1 (
  echo.
  echo [AVISO] MySQL NO esta escuchando en el puerto 3306.
  echo         Abra el panel de XAMPP y presione Start junto a MySQL.
  echo         Despues vuelva a ejecutar este archivo.
  echo.
  pause
  exit /b 1
)
echo        MySQL responde en 127.0.0.1:3306.

echo [2/2] Iniciando el servidor...
echo        Abra el navegador en:  http://127.0.0.1:5000/
echo        (No cierre esta ventana mientras use el sistema)
echo.
py app.py

echo.
echo El servidor se ha detenido.
pause
