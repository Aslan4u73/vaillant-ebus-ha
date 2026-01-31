#!/bin/bash
# =========================================
# eBUS Verbindungstest
# =========================================
#
# Verwendung:
#   ./check_ebus.sh [IP_ADRESSE] [PORT]
#
# Beispiel:
#   ./check_ebus.sh 192.168.1.37 9999
#
# =========================================

EBUS_IP="${1:-192.168.1.37}"
EBUS_PORT="${2:-9999}"

echo "========================================="
echo "eBUS Adapter Verbindungstest"
echo "========================================="
echo ""
echo "Ziel: $EBUS_IP:$EBUS_PORT"
echo ""

# Ping Test
echo "1. Ping Test..."
if ping -c 3 "$EBUS_IP" > /dev/null 2>&1; then
    echo "   ✅ Ping erfolgreich"
else
    echo "   ❌ Ping fehlgeschlagen!"
    echo "   → Prüfe: Ist der Adapter eingeschaltet?"
    echo "   → Prüfe: Ist die IP korrekt?"
    exit 1
fi

# Port Test
echo ""
echo "2. Port Test ($EBUS_PORT)..."
if nc -z -w 3 "$EBUS_IP" "$EBUS_PORT" 2>/dev/null; then
    echo "   ✅ Port erreichbar"
else
    echo "   ❌ Port nicht erreichbar!"
    echo "   → Prüfe: Läuft der eBUS Adapter?"
    echo "   → Prüfe: Ist der Port korrekt?"
    exit 1
fi

# Telnet Test
echo ""
echo "3. Telnet Verbindung..."
timeout 3 bash -c "echo 'info' | nc $EBUS_IP $EBUS_PORT" 2>/dev/null
if [ $? -eq 0 ]; then
    echo "   ✅ Telnet erfolgreich"
else
    echo "   ⚠️ Telnet Timeout (könnte OK sein)"
fi

echo ""
echo "========================================="
echo "Test abgeschlossen!"
echo "========================================="
echo ""
echo "Nächste Schritte:"
echo "1. eBUSd Add-on mit device: enh:$EBUS_IP:$EBUS_PORT konfigurieren"
echo "2. Add-on starten und Protokoll prüfen"
echo ""
