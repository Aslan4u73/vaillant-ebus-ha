# Changelog

Alle wichtigen Änderungen an diesem Projekt werden hier dokumentiert.

Das Format basiert auf [Keep a Changelog](https://keepachangelog.com/de/1.0.0/).

---

## [1.2.0] - 2026-01-31

### Hinzugefügt
- **Wetter-Vergleich** - Außentemperatur: eBUS vs Wetterdienst Marl
  - `sensor.wetter_aussen_temperatur` - Temperatur vom Wetterdienst
  - `sensor.heizung_aussen_differenz` - Abweichung eBUS vs Wetter
- **Dashboard Erweiterung** - Vaillant & Marl Außentemperatur nebeneinander

### Geändert
- `statistics_sensors.yaml` v1.2.0 - Wetter-Vergleich Sensoren
- `dashboard_statistik.yaml` - Außentemperatur Vergleichsboxen

---

## [1.1.0] - 2026-01-31

### Gefixt
- **Fahrenheit zu Celsius Konvertierung** - eBUSd liefert Werte in °F, nicht °C!
  - Alte Methode (customize) änderte nur Label, nicht Werte → 104°C Anzeige (FALSCH)
  - Neue Methode: Template-Sensoren mit echter Konvertierung: `(°F - 32) * 5/9`

### Hinzugefügt
- `sensor.heizung_ruecklauf_celsius` - Rücklauf in °C
- `sensor.heizung_aussen_celsius` - Außentemperatur in °C

### Geändert
- `statistics_sensors.yaml` v1.1.0 - Vereinfachte F→C Konvertierung
- `INSTALLATION.md` - Korrigierte Dokumentation zur Temperatur-Problematik

---

## [1.0.0] - 2026-01-30

### Hinzugefügt

- **Basis-Dashboard** (`dashboard_heizung.yaml`)
  - Temperatur-Anzeigen (Vorlauf, Rücklauf, Außen, Warmwasser)
  - Heizkurven-Anzeige
  - Brenner-Status
  - 24h Temperaturverlauf

- **Profi-Dashboard** (`dashboard_profi.yaml`)
  - 4 Tabs: Status, Betrieb, Wartung, Energie
  - Alle ebusd Sensoren auf einen Blick
  - eBUS Verbindungs-Status
  - Energie-Zähler (HC1, HWC1)
  - Service-Intervall Anzeige

- **Statistik-Dashboard** (`dashboard_statistik.yaml`)
  - Live-Übersicht mit Gauges
  - Vorher/Nachher Vergleich
  - Brenner-Laufzeit Analyse
  - Langzeit-Statistiken (Wochen/Monate)
  - Effizienz-Bewertung mit Empfehlungen

- **Statistik-Sensoren** (`statistics_sensors.yaml`)
  - Temperatur-Konvertierung F→C
  - 24h Durchschnitt/Min/Max
  - Brenner-Laufzeit Tracking
  - Utility Meter (täglich/wöchentlich/monatlich)
  - Optimierungs-Markierung (input_datetime, input_number)

- **Echtzeit-Modus** (`echtzeit_modus.yaml`)
  - Toggle für schnelles Polling (5s statt 30s)
  - Automatische Abschaltung nach 30 Minuten
  - MQTT-basierte Sensor-Abfrage

- **Automationen** (`automations_heizung.yaml`)
  - Warnungen bei hoher Vorlauftemperatur
  - Benachrichtigungen bei Heizungsfehlern

### Dokumentation

- README.md mit Projektübersicht
- INSTALLATION.md mit Schritt-für-Schritt Anleitung
- CHANGELOG.md (diese Datei)
- docs/SENSOREN.md mit allen verfügbaren Sensoren
- docs/HEIZKURVE.md mit Optimierungs-Tipps

---

## [Geplant]

### Version 1.3.0

- [ ] Automatische Heizkurven-Anpassung basierend auf Außentemperatur
- [ ] Kosten-Berechnung basierend auf Gaspreis
- [ ] Push-Benachrichtigungen für Wartungserinnerungen

### Version 1.4.0

- [ ] Raumtemperatur-Integration (über weitere Sensoren)
- [ ] Anwesenheits-basierte Steuerung
- [ ] Nachtabsenkungs-Automation
- [ ] Energie-Reports (wöchentlich/monatlich)

---

## Versionshistorie

| Version | Datum | Beschreibung |
|---------|-------|--------------|
| 1.2.0 | 2026-01-31 | Wetter-Vergleich (eBUS vs Wetterdienst) |
| 1.1.0 | 2026-01-31 | F→C Konvertierung gefixt |
| 1.0.0 | 2026-01-30 | Erste vollständige Version |

---

**Erstellt von:** Murat (Aslan4u) mit LISA 💙
