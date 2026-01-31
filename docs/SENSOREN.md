# Verfügbare Sensoren

## Übersicht

Nach erfolgreicher eBUSd-Integration stehen ca. **460 Entitäten** zur Verfügung.
Hier sind die wichtigsten dokumentiert.

---

## Temperaturen

### Vorlauf / Rücklauf

| Entity ID | Beschreibung | Einheit |
|-----------|--------------|---------|
| `sensor.ebusd_bai_flowtemp_temp` | Aktuelle Vorlauftemperatur | °F |
| `sensor.ebusd_bai_flowtempdesired` | Soll-Vorlauftemperatur | °F |
| `sensor.ebusd_bai_returntemp_temp` | Rücklauftemperatur | °F |
| `sensor.heizung_vorlauf_celsius` | Vorlauf (konvertiert) | °C |
| `sensor.heizung_soll_vorlauf_celsius` | Soll-Vorlauf (konvertiert) | °C |

### Außen / Warmwasser

| Entity ID | Beschreibung | Einheit |
|-----------|--------------|---------|
| `sensor.ebusd_broadcast_outsidetemp` | Außentemperatur | °F |
| `sensor.ebusd_hc_outsidetemp_temp` | Außentemp (Heizkreis) | °F |
| `sensor.ebusd_hwc_hwctemp_temp` | Warmwasser-Temperatur | °F |
| `sensor.ebusd_hwc_hwctempdesired` | Warmwasser-Soll | °F |

---

## Steuerung

### Heizkurve

| Entity ID | Beschreibung | Wertebereich |
|-----------|--------------|--------------|
| `sensor.ebusd_hc_heatingcurve` | Aktuelle Heizkurve | 0.5 - 2.5 |

**Zum Ändern via MQTT:**
```
Topic: ebusd/hc/HeatingCurve/set
Payload: 1.0
```

### Betriebsmodus

| Entity ID | Beschreibung | Werte |
|-----------|--------------|-------|
| `sensor.ebusd_bai_setmode_hcmode` | Heizmodus | auto/off/heat/water |
| `sensor.ebusd_hc_opmode` | Betriebsmodus | - |

---

## Status

### Pumpe & Brenner

| Entity ID | Beschreibung | Werte |
|-----------|--------------|-------|
| `sensor.ebusd_bai_status01_pumpstate` | Pumpen-Status | on/off/overrun/hwc |
| `sensor.heizung_brenner_aktiv` | Brenner aktiv (berechnet) | on/off |

### Verbindung

| Entity ID | Beschreibung | Werte |
|-----------|--------------|-------|
| `binary_sensor.ebusd_global_running` | eBUS Verbindung | on/off |
| `sensor.ebusd_global_uptime` | eBUS Uptime | Sekunden |
| `sensor.ebusd_global_signal` | Signal-Qualität | - |

---

## Statistik / Zähler

### Laufzeiten

| Entity ID | Beschreibung | Einheit |
|-----------|--------------|---------|
| `sensor.ebusd_bai_fanhours` | Brenner-Laufzeit gesamt | Stunden |
| `sensor.ebusd_bai_hcstarts` | Heizungs-Starts gesamt | Anzahl |
| `sensor.ebusd_bai_hwcstarts` | Warmwasser-Starts gesamt | Anzahl |

### Energie

| Entity ID | Beschreibung | Einheit |
|-----------|--------------|---------|
| `sensor.ebusd_bai_prenergycounthc1` | Energie Heizkreis 1 | ? |
| `sensor.ebusd_bai_prenergycounthwc1` | Energie Warmwasser | ? |

### Wartung

| Entity ID | Beschreibung | Einheit |
|-----------|--------------|---------|
| `sensor.ebusd_bai_hourstillservice` | Stunden bis Service | Stunden |
| `sensor.ebusd_bai_counterstillservice` | Counter bis Service | - |

---

## Berechnete Sensoren (Template)

Diese Sensoren werden durch `statistics_sensors.yaml` erstellt:

| Entity ID | Beschreibung |
|-----------|--------------|
| `sensor.heizung_vorlauf_celsius` | Vorlauf in °C |
| `sensor.heizung_soll_vorlauf_celsius` | Soll-Vorlauf in °C |
| `sensor.heizung_brenner_aktiv` | Brenner-Status |
| `sensor.heizung_heizkurve` | Heizkurve als Zahl |
| `sensor.heizung_effizienz_index` | Effizienz-Bewertung |
| `sensor.heizung_vorlauf_24h_durchschnitt` | 24h Durchschnitt |
| `sensor.heizung_vorlauf_24h_maximum` | 24h Maximum |
| `sensor.heizung_vorlauf_24h_minimum` | 24h Minimum |
| `sensor.heizung_vorlauf_stabilitaet` | Standardabweichung |
| `sensor.heizung_brenner_laufzeit_heute` | Laufzeit heute |
| `sensor.heizung_brenner_anteil_heute` | Anteil % heute |
| `sensor.heizung_polling_modus` | Aktueller Polling-Modus |

---

## Utility Meter (Zähler)

| Entity ID | Beschreibung | Reset |
|-----------|--------------|-------|
| `sensor.heizung_laufzeit_taeglich` | Tägliche Laufzeit | Mitternacht |
| `sensor.heizung_laufzeit_woechentlich` | Wöchentliche Laufzeit | Montag |
| `sensor.heizung_laufzeit_monatlich` | Monatliche Laufzeit | 1. des Monats |
| `sensor.heizung_starts_taeglich` | Tägliche Starts | Mitternacht |
| `sensor.heizung_starts_woechentlich` | Wöchentliche Starts | Montag |

---

## Input Helpers

Diese Helfer werden für die Optimierungs-Dokumentation verwendet:

| Entity ID | Beschreibung |
|-----------|--------------|
| `input_boolean.heizung_echtzeit_modus` | Echtzeit-Polling Toggle |
| `input_datetime.heizung_optimierung_start` | Start der Optimierung |
| `input_number.heizung_alte_heizkurve` | Alte Heizkurve |
| `input_number.heizung_neue_heizkurve` | Neue Heizkurve |
| `input_text.heizung_optimierung_notiz` | Notizen |

---

## Sensor-Suche

Um alle ebusd Sensoren zu finden:

1. **Entwicklerwerkzeuge → Zustände**
2. Filter: `ebusd`
3. Oder in YAML: `{{ states.sensor | selectattr('entity_id', 'search', 'ebusd') | list }}`

---

**Tipp:** Nicht alle Sensoren haben sofort Werte. eBUSd fragt nur ab, wenn nötig.
Warte 10-15 Minuten nach dem Start für vollständige Daten.
