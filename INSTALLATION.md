# Installationsanleitung

## Voraussetzungen

- Home Assistant (Core 2024.1+)
- eBUS Adapter (verbunden mit Vaillant Heizung)
- MQTT Broker (Mosquitto Add-on empfohlen)

---

## Schritt 1: eBUSd Add-on installieren

### 1.1 Add-on hinzufügen

1. Home Assistant öffnen
2. **Einstellungen → Add-ons → Add-on Store**
3. Suche nach "eBUSd"
4. **Installieren**

### 1.2 eBUSd konfigurieren

Gehe zu **eBUSd → Konfiguration** und setze:

```yaml
device: "enh:192.168.1.37:9999"  # IP deines eBUS Adapters
mqtthost: "192.168.1.41"          # IP deines MQTT Brokers (oder localhost)
mqttport: 1883
mqttuser: ""
mqttpass: ""
mqtttopic: "ebusd"
mqttint: "homeassistant/%prefix%/%name"
pollinterval: 30
scanconfig: "full"
```

### 1.3 Add-on starten

1. **Speichern**
2. **Starten**
3. **Protokoll** prüfen - sollte Verbindung zeigen

---

## Schritt 2: MQTT Integration einrichten

1. **Einstellungen → Geräte & Dienste**
2. **+ Integration hinzufügen**
3. **MQTT** suchen und auswählen
4. Broker konfigurieren:
   - Host: `192.168.1.41` (oder `localhost`)
   - Port: `1883`
   - Benutzername/Passwort (falls konfiguriert)

Nach erfolgreicher Verbindung erscheinen ~460 ebusd Entitäten!

---

## Schritt 3: Heizungs-Sensoren hinzufügen

### Option A: Alles in configuration.yaml

1. Öffne **File Editor** Add-on
2. Bearbeite `/config/configuration.yaml`
3. Füge am Ende hinzu:

```yaml
# Lade Heizungs-Konfigurationen
# Kopiere den Inhalt von config/statistics_sensors.yaml hier rein
```

4. **Home Assistant neu starten**

### Option B: Packages (empfohlen)

1. Erstelle Ordner `/config/packages/`
2. Kopiere alle `.yaml` Dateien aus `config/` dorthin
3. Füge in `configuration.yaml` hinzu:

```yaml
homeassistant:
  packages: !include_dir_named packages
```

4. **Home Assistant neu starten**

---

## Schritt 4: Dashboards importieren

### Dashboard hinzufügen

1. **Einstellungen → Dashboards**
2. **+ Dashboard hinzufügen**
3. Name: `Heizung`, Icon: `mdi:radiator`
4. **Erstellen**

### Dashboard konfigurieren

1. Öffne das neue Dashboard
2. **3-Punkte-Menü (⋮) → Raw-Konfigurationseditor**
3. **Lösche alles**
4. **Kopiere Inhalt** aus `dashboards/dashboard_heizung.yaml`
5. **Speichern**

### Weitere Dashboards

Wiederhole für:
- `Heizung Profi` → `dashboards/dashboard_profi.yaml`
- `Heizung Statistik` → `dashboards/dashboard_statistik.yaml`

---

## Schritt 5: Erste Schritte

### Sensoren prüfen

1. **Entwicklerwerkzeuge → Zustände**
2. Suche nach `ebusd`
3. Du solltest ~460 Entitäten sehen

### Wichtige Sensoren testen

| Entity | Erwarteter Wert |
|--------|-----------------|
| `sensor.ebusd_bai_flowtemp_temp` | Temperatur in °F |
| `sensor.ebusd_hc_heatingcurve` | Zahl (z.B. 1.3) |
| `binary_sensor.ebusd_global_running` | on |

---

## Troubleshooting

### Problem: Keine ebusd Entitäten

**Lösung:**
1. eBUSd Add-on Protokoll prüfen
2. MQTT Integration neu laden
3. 5 Minuten warten (MQTT Discovery)

### Problem: Sensoren zeigen "unbekannt"

**Lösung:**
1. Normal beim ersten Start
2. eBUSd muss Werte erst abfragen
3. Warte 10-15 Minuten

### Problem: Temperaturen in Fahrenheit

**Ursache:**
Die eBUSd MQTT Integration liefert Temperaturwerte in **Fahrenheit** (°F)!
Ein Wert von 104.6°F entspricht ca. 40°C (normale Vorlauftemperatur).

**⚠️ WICHTIG:** Die `customize`-Methode ändert NUR das Label, NICHT den Wert!
Das führt zu falschen Anzeigen wie "104°C" - was unrealistisch wäre.

**Lösung: Template-Sensoren (EMPFOHLEN)**

Die Template-Sensoren in `statistics_sensors.yaml` konvertieren korrekt von °F nach °C:

```yaml
# Formel: (°F - 32) * 5/9 = °C
state: "{{ ((states('sensor.ebusd_bai_flowtemp_temp') | float(32) - 32) * 5/9) | round(1) }}"
```

**Verfügbare Celsius-Sensoren:**
- `sensor.heizung_vorlauf_celsius` - Vorlauftemperatur
- `sensor.heizung_ruecklauf_celsius` - Rücklauftemperatur
- `sensor.heizung_aussen_celsius` - Außentemperatur
- `sensor.heizung_soll_vorlauf_celsius` - Soll-Vorlauf

**Rohwerte (Fahrenheit):**
- `sensor.ebusd_bai_flowtemp_temp` - Original eBUS Wert in °F

---

## Nächste Schritte

1. **2-3 Tage Daten sammeln** (Baseline)
2. **Heizkurve notieren** (aktuell: 1.3)
3. **Dashboard beobachten**
4. **Nach Baseline:** Heizkurve auf 1.0 reduzieren
5. **Vergleichen!**

---

**Viel Erfolg!** 🔥💙
