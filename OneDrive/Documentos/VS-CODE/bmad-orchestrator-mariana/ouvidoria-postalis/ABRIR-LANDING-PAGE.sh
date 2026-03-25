#!/bin/bash

# Script para abrir servidor local e landing page no macOS/Linux
# Desenvolvido para Luciana - Curso Intensivo Ouvidoria Postalis

echo ""
echo "========================================"
echo "  LANDING PAGE - OUVIDORIA POSTALIS"
echo "  Servidor Local | macOS/Linux"
echo "========================================"
echo ""

# Detectar Python
if command -v python3 &> /dev/null; then
    echo "[OK] Python 3 detectado"
    PYTHON_CMD="python3"
elif command -v python &> /dev/null; then
    echo "[OK] Python detectado"
    PYTHON_CMD="python"
else
    echo "[AVISO] Python não detectado"
    echo ""
    echo "Abrindo landing-page.html diretamente..."

    # Abrir no navegador padrão
    if command -v open &> /dev/null; then
        # macOS
        open landing-page.html
    elif command -v xdg-open &> /dev/null; then
        # Linux
        xdg-open landing-page.html
    fi

    exit 0
fi

echo ""
echo "Iniciando servidor local na porta 8000..."
echo ""
echo ">>> Acesse: http://localhost:8000/landing-page.html"
echo ">>> Pressione CTRL+C para parar o servidor"
echo ""

# Abrir no navegador padrão (background)
if command -v open &> /dev/null; then
    # macOS
    sleep 1
    open "http://localhost:8000/landing-page.html"
elif command -v xdg-open &> /dev/null; then
    # Linux
    sleep 1
    xdg-open "http://localhost:8000/landing-page.html" &
fi

# Iniciar servidor
$PYTHON_CMD -m http.server 8000 --directory .

echo ""
echo "========================================"
echo "Servidor parado."
echo "========================================"
