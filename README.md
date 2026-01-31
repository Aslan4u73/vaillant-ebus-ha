# vaillant-ebus-ha

**Vaillant Heizungssteuerung mit Home Assistant via eBUS**

[![Home Assistant](https://img.shields.io/badge/Home%20Assistant-2024.1+-blue.svg)](https://www.home-assistant.io/)
[![eBUSd](https://img.shields.io/badge/eBUSd-23.3+-green.svg)](https://github.com/john30/ebusd)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## Überblick

Dieses Projekt ermöglicht die vollständige Integration einer **Vaillant Heizungsanlage** (auroMATIC 620/3) in Home Assistant über das eBUS-Protokoll.

### Features

- **Echtzeit-Monitoring** - Alle Heizungsdaten live im Dashboard
- **Statistik-Tracking** - Vorher/Nachher Vergleich für Optimierungen
- **Echtzeit-Modus** - Schnelles Polling (5s) für Live-Diagnose
- **Energie-Analyse** - Verbrauchsübersicht und Effizienz-Bewertung
- **Profi-Dashboard** - Alle Werte auf einen Blick

---

## Hardware-Anforderungen

| Komponente | Beschreibung | Link |
|------------|--------------|------|
| **Vaillant Heizung** | auroMATIC 620/3 oder kompatibel | - |
| **eBUS Adapter** | ESP32 oder Raspberry Pi basiert | [eBUS Adapter](https://ebusd.eu/) |
| **Home Assistant** | Version 2024.1 oder neuer | [home-assistant.io](https://www.home-assistant.io/) |

### Getestete Hardware

- Vaillant auroMATIC 620/3
- eBUS Adapter v5 (ESP32-C6)
- Home Assistant auf Raspberry Pi 4

---

## Software-Anforderungen

- Home Assistant Core 2024.1+
- eBUSd Add-on (MQTT-Modus)
- Mosquitto MQTT Broker
- MQTT Integration

---

## Schnellstart

### 1. eBUS Adapter einrichten

```bash
# eBUS Adapter IP (Beispiel)
192.168.1.37:9999
```

### 2. eBUSd Add-on installieren

1. Add-on Store öffnen
2. "eBUSd" suchen und installieren
3. Konfiguration anpassen (siehe `ebusd_config.yaml`)

### 3. MQTT Integration einrichten

1. Einstellungen → Geräte & Dienste → Integration hinzufügen
2. MQTT auswählen
3. Broker: `localhost` oder IP des MQTT-Servers

### 4. Konfiguration kopieren

```bash
# Sensoren und Automationen zu configuration.yaml hinzufügen
# Siehe: config/configuration_heizung.yaml
```

### 5. Dashboards importieren

1. Einstellungen → Dashboards → + Dashboard hinzufügen
2. Raw-Editor öffnen
3. Inhalt aus `dashboards/` Ordner einfügen

---

## Projektstruktur

```
vaillant-ebus-ha/
├── README.md                    # Diese Datei
├── INSTALLATION.md              # Detaillierte Installationsanleitung
├── CHANGELOG.md                 # Versionshistorie
├── LICENSE                      # MIT Lizenz
│
├── config/                      # Home Assistant Konfiguration
│   ├── statistics_sensors.yaml  # Statistik-Sensoren + F→C Konvertierung
│   ├── echtzeit_modus.yaml      # Echtzeit-Polling Toggle
│   └── automations_heizung.yaml # Heizungs-Automationen
│
├── dashboards/                  # Lovelace Dashboards
│   ├── dashboard_heizung.yaml   # Basis-Dashboard
│   ├── dashboard_profi.yaml     # Profi-Dashboard (alle Daten)
│   └── dashboard_statistik.yaml # Statistik-Dashboard
│
├── docs/                        # Dokumentation
│   ├── SENSOREN.md              # Alle verfügbaren Sensoren
│   ├── HEIZKURVE.md             # Heizkurven-Optimierung
│   └── TROUBLESHOOTING.md       # Problemlösung
│
└── scripts/                     # Hilfs-Skripte
    └── check_ebus.sh            # eBUS Verbindungstest
```

---

## Wichtige Sensoren

### Temperaturen

| Entity ID | Beschreibung |
|-----------|--------------|
| `sensor.ebusd_bai_flowtemp_temp` | Vorlauftemperatur |
| `sensor.ebusd_bai_returntemp_temp` | Rücklauftemperatur |
| `sensor.ebusd_broadcast_outsidetemp` | Außentemperatur |
| `sensor.ebusd_hwc_hwctemp_temp` | Warmwasser-Temperatur |

### Steuerung

| Entity ID | Beschreibung |
|-----------|--------------|
| `sensor.ebusd_hc_heatingcurve` | Heizkurve (0.5 - 2.5) |
| `sensor.ebusd_bai_setmode_hcmode` | Heizmodus |
| `sensor.ebusd_bai_status01_pumpstate` | Pumpen-Status |

### Statistik

| Entity ID | Beschreibung |
|-----------|--------------|
| `sensor.ebusd_bai_fanhours` | Brenner-Laufzeit (Stunden) |
| `sensor.ebusd_bai_hcstarts` | Heizungs-Starts (Anzahl) |
| `sensor.ebusd_bai_prenergycounthc1` | Energie-Zähler Heizung |

---

## Heizkurven-Optimierung

### Empfohlene Werte

| Gebäudetyp | Heizkurve |
|------------|-----------|
| Gut gedämmt (Neubau) | 0.6 - 0.8 |
| Normal gedämmt | 0.8 - 1.0 |
| Schlecht gedämmt (Altbau) | 1.2 - 1.5 |

### Vorher/Nachher Vergleich

Mit den Statistik-Sensoren kannst du den Effekt einer Heizkurven-Änderung messen:

1. **Baseline sammeln** (2-3 Tage mit alter Einstellung)
2. **Datum markieren** im Dashboard
3. **Heizkurve ändern**
4. **Vergleichen** nach weiteren 2-3 Tagen

**Erwartete Ersparnis bei 10°C niedrigerer Vorlauftemperatur: ~20-30%!**

---

## Screenshots

### Profi-Dashboard
*Alle Heizungsdaten auf einen Blick*

### Statistik-Dashboard
*Vorher/Nachher Vergleich und Langzeit-Trends*

---

## Mitwirken

Beiträge sind willkommen! Bitte:

1. Fork erstellen
2. Feature-Branch anlegen (`git checkout -b feature/AmazingFeature`)
3. Änderungen committen (`git commit -m 'Add AmazingFeature'`)
4. Branch pushen (`git push origin feature/AmazingFeature`)
5. Pull Request erstellen

---

## Lizenz

MIT License - siehe [LICENSE](LICENSE) Datei.

---

## Credits

- **Erstellt von:** Murat (Aslan4u)
- **Mit Unterstützung von:** LISA 💙
- **eBUSd:** [john30/ebusd](https://github.com/john30/ebusd)
- **Home Assistant:** [home-assistant.io](https://www.home-assistant.io/)

---

## Support

Bei Fragen oder Problemen:

1. [Issues](../../issues) erstellen
2. [Discussions](../../discussions) nutzen
3. [Home Assistant Forum](https://community.home-assistant.io/) besuchen

---

**Viel Erfolg beim Energiesparen!** 🌱💰
