# Troubleshooting

## Häufige Probleme und Lösungen

---

## eBUS Verbindung

### Problem: eBUSd verbindet nicht

**Symptome:**
- `binary_sensor.ebusd_global_running` = off
- Keine ebusd Entitäten sichtbar

**Lösungen:**

1. **eBUS Adapter prüfen**
   ```bash
   # Ping testen
   ping 192.168.1.37

   # Telnet testen
   telnet 192.168.1.37 9999
   ```

2. **eBUSd Add-on Konfiguration prüfen**
   - Device: `enh:192.168.1.37:9999`
   - Kein Tippfehler in IP?

3. **eBUSd Add-on neu starten**
   - Add-ons → eBUSd → Stoppen → Starten

4. **Protokoll prüfen**
   - Add-ons → eBUSd → Protokoll
   - Suche nach "error" oder "failed"

---

### Problem: Keine MQTT Entitäten

**Symptome:**
- eBUSd läuft (Protokoll zeigt Daten)
- Aber keine `sensor.ebusd_*` Entitäten

**Lösungen:**

1. **MQTT Integration prüfen**
   - Geräte & Dienste → MQTT → Konfigurieren
   - Verbindung testen

2. **MQTT Discovery aktivieren**
   - eBUSd Konfiguration:
     ```yaml
     mqttint: "homeassistant/%prefix%/%name"
     ```

3. **Mosquitto Broker prüfen**
   - Add-ons → Mosquitto → Protokoll
   - Läuft der Broker?

4. **Warten!**
   - MQTT Discovery braucht bis zu 5 Minuten
   - Home Assistant neu starten kann helfen

---

## Sensoren

### Problem: Sensoren zeigen "Unbekannt"

**Symptome:**
- `sensor.ebusd_bai_flowtemp_temp` = unknown
- Entität existiert, aber kein Wert

**Lösungen:**

1. **Warten** (10-15 Minuten)
   - eBUSd fragt nicht alle Werte sofort ab
   - Manche werden nur bei Bedarf gelesen

2. **Manuell abfragen**
   ```yaml
   # Service aufrufen
   service: mqtt.publish
   data:
     topic: "ebusd/bai/FlowTemp/get"
     payload: ""
   ```

3. **eBUSd Polling prüfen**
   - Konfiguration: `pollinterval: 30`
   - Kürzeres Interval = schnellere Updates

---

### Problem: Temperaturen in Fahrenheit

**Symptome:**
- `sensor.ebusd_bai_flowtemp_temp` zeigt z.B. 131
- Das sind 131°F = 55°C

**Lösung:**

Nutze die konvertierten Sensoren:
- `sensor.heizung_vorlauf_celsius` (zeigt °C)
- `sensor.heizung_soll_vorlauf_celsius` (zeigt °C)

Diese werden durch `statistics_sensors.yaml` erstellt und konvertieren automatisch.

---

### Problem: Statistik-Sensoren fehlen

**Symptome:**
- `sensor.heizung_vorlauf_24h_durchschnitt` existiert nicht
- Template-Sensoren nicht sichtbar

**Lösungen:**

1. **configuration.yaml prüfen**
   - Wurde `statistics_sensors.yaml` hinzugefügt?
   - Syntax-Fehler? YAML prüfen!

2. **Home Assistant Konfiguration prüfen**
   ```bash
   # Im Terminal
   ha core check
   ```

3. **Nach Fehler suchen**
   - Einstellungen → System → Protokolle
   - Suche nach "template" oder "statistics"

4. **Home Assistant neu starten**
   - Einstellungen → System → Neu starten

---

## Dashboard

### Problem: Dashboard ist leer

**Symptome:**
- Dashboard öffnet sich
- Aber keine Karten sichtbar

**Lösungen:**

1. **Raw-Editor prüfen**
   - 3-Punkte → Raw-Konfigurationseditor
   - Ist YAML-Code vorhanden?

2. **YAML-Syntax prüfen**
   - Online YAML Validator nutzen
   - Einrückung korrekt? (2 Spaces!)

3. **Entity IDs prüfen**
   - Existieren alle referenzierten Entitäten?
   - `sensor.ebusd_bai_flowtemp_temp` etc.

---

### Problem: Karten zeigen Fehler

**Symptome:**
- Rote Fehlermeldung in Karte
- "Entity not available"

**Lösungen:**

1. **Entity ID prüfen**
   - Entwicklerwerkzeuge → Zustände
   - Existiert die Entität?

2. **Schreibfehler?**
   - `sensor.ebusd_bai_flowtemp_temp` (korrekt)
   - `sensor.ebusd_bai_flowtemp` (falsch!)

3. **Alternative Entity nutzen**
   - Manche Sensoren heißen anders
   - Liste in `docs/SENSOREN.md` prüfen

---

## Echtzeit-Modus

### Problem: Echtzeit-Modus funktioniert nicht

**Symptome:**
- Toggle ist AN
- Aber Daten aktualisieren nicht schneller

**Lösungen:**

1. **Automation prüfen**
   - Einstellungen → Automationen
   - "Heizung Echtzeit-Polling" aktiv?

2. **MQTT prüfen**
   - Entwicklerwerkzeuge → Dienste
   - `mqtt.publish` manuell testen

3. **eBUSd reagiert?**
   - eBUSd Protokoll beobachten
   - Werden GET-Anfragen verarbeitet?

---

## Allgemeine Tipps

### Home Assistant Logs prüfen

```
Einstellungen → System → Protokolle
```

Filter nach:
- `ebusd`
- `mqtt`
- `template`
- `automation`

### Konfiguration validieren

```bash
# Im Terminal Add-on
ha core check
```

### Alles neu starten (Nuclear Option)

1. eBUSd Add-on stoppen
2. Mosquitto Add-on stoppen
3. Home Assistant neu starten
4. Mosquitto starten
5. eBUSd starten
6. 5 Minuten warten

---

## Support

Bei weiteren Problemen:

1. **Issue erstellen** auf GitHub
2. **Logs beifügen** (anonymisiert!)
3. **Konfiguration zeigen** (ohne Passwörter!)

---

**Tipp:** Die meisten Probleme lösen sich durch Warten und Neustart! 😊
