# vaillant-ebus-ha

> Vaillant Heizungssteuerung mit Home Assistant via eBUS-Protokoll

[![Home Assistant](https://img.shields.io/badge/Home%20Assistant-2024.1+-41BDF5?logo=home-assistant&logoColor=white)](https://www.home-assistant.io/)
[![eBUSd](https://img.shields.io/badge/eBUSd-23.3+-green?logo=github)](https://github.com/john30/ebusd)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/Aslan4u73/vaillant-ebus-ha?style=social)](https://github.com/Aslan4u73/vaillant-ebus-ha)

---

## Disclaimer / Haftungsausschluss

> **⚠️ WICHTIGER HINWEIS !!**
>
> Dieses Projekt dokumentiert meine **persönlichen Erfahrungen** mit meiner eigenen Heizungsanlage. Es wird **keine Garantie** für Funktionalität, Sicherheit oder Kompatibilität mit anderen Systemen übernommen.
>
> - Die Nutzung erfolgt **auf eigene Gefahr**
> - **Keine Haftung** für Schäden an Heizungsanlagen, Datenverlust oder Folgeschäden
> - Bei Unsicherheiten einen **Fachbetrieb** hinzuziehen
> - Änderungen an Heizungsanlagen können die **Garantie** beeinflussen

---

## Überblick

Dieses Projekt ermöglicht die Integration einer **Vaillant Heizungsanlage** in Home Assistant über das eBUS-Protokoll. Es enthält fertige Dashboards, Sensoren und Automationen für Monitoring und Optimierung.

### Features

| Feature | Beschreibung |
|---------|--------------|
| 📊 **Echtzeit-Monitoring** | Alle Heizungsdaten live im Dashboard |
| 📈 **Statistik-Tracking** | Vorher/Nachher Vergleich für Optimierungen |
| ⚡ **Echtzeit-Modus** | Schnelles Polling (5s) für Live-Diagnose |
| 💰 **Energie-Analyse** | Verbrauchsübersicht und Effizienz-Bewertung |
| 🎛️ **Profi-Dashboard** | ~460 Sensoren auf einen Blick |

---

## Voraussetzungen

### Hardware

| Komponente | Beschreibung |
|------------|--------------|
| Vaillant Heizung | auroMATIC 620/3 oder kompatibel |
| eBUS Adapter | ESP32-basiert ([ebusd.eu](https://ebusd.eu/)) |
| Home Assistant | Version 2024.1+ |

### Getestete Umgebung

- **Heizung:** Vaillant auroMATIC 620/3
- **Adapter:** eBUS Adapter v5 (ESP32-C6)
- **Home Assistant:** VirtualBox auf Windows

### Software

- Home Assistant Core 2024.1+
- eBUSd Add-on (MQTT-Modus)
- Mosquitto MQTT Broker
- MQTT Integration

---

## Installation

Eine detaillierte Schritt-für-Schritt Anleitung findest du in **[INSTALLATION.md](INSTALLATION.md)**.

### Kurzanleitung

```bash
# 1. Repository klonen
git clone https://github.com/Aslan4u73/vaillant-ebus-ha.git

# 2. Konfigurationen nach Home Assistant kopieren
# 3. Dashboards importieren
# 4. Home Assistant neu starten
```

---

## Projektstruktur

```
vaillant-ebus-ha/
├── config/                      # Home Assistant Konfiguration
│   ├── statistics_sensors.yaml  # Statistik-Sensoren
│   ├── echtzeit_modus.yaml      # Echtzeit-Polling
│   └── automations_heizung.yaml # Automationen
│
├── dashboards/                  # Lovelace Dashboards
│   ├── dashboard_heizung.yaml   # Basis-Dashboard
│   ├── dashboard_profi.yaml     # Profi-Dashboard
│   └── dashboard_statistik.yaml # Statistik-Dashboard
│
├── docs/                        # Dokumentation
│   ├── SENSOREN.md              # Sensor-Referenz
│   ├── HEIZKURVE.md             # Optimierung
│   └── TROUBLESHOOTING.md       # Problemlösung
│
├── INSTALLATION.md              # Installationsanleitung
├── CHANGELOG.md                 # Versionshistorie
└── LICENSE                      # MIT Lizenz
```

---

## Dokumentation

| Dokument | Beschreibung |
|----------|--------------|
| [INSTALLATION.md](INSTALLATION.md) | Schritt-für-Schritt Anleitung |
| [docs/SENSOREN.md](docs/SENSOREN.md) | Alle ~460 verfügbaren Sensoren |
| [docs/HEIZKURVE.md](docs/HEIZKURVE.md) | Heizkurven-Optimierung |
| [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md) | Problemlösung |
| [CHANGELOG.md](CHANGELOG.md) | Versionshistorie |

---

## Heizkurven-Optimierung

Mit diesem Projekt kannst du deine Heizkurve optimieren und **20-30% Energie sparen**.

| Gebäudetyp | Empfohlene Heizkurve |
|------------|----------------------|
| Gut gedämmt (Neubau) | 0.6 - 0.8 |
| Normal gedämmt | 0.8 - 1.0 |
| Schlecht gedämmt | 1.2 - 1.5 |

Mehr Details: **[docs/HEIZKURVE.md](docs/HEIZKURVE.md)**

---

## Contributing

Beiträge sind willkommen!

1. Fork erstellen
2. Feature-Branch anlegen (`git checkout -b feature/NeuesFeature`)
3. Änderungen committen (`git commit -m 'feat: Neues Feature'`)
4. Branch pushen (`git push origin feature/NeuesFeature`)
5. Pull Request erstellen

---

## Danksagung

Besonderer Dank an:

- **[Tom Schorn](https://tom-schorn.de)** - Für die Unterstützung bei Installation, Auswahl des eBUS Adapters und Konfiguration
- **[john30/ebusd](https://github.com/john30/ebusd)** - Für das großartige eBUSd Projekt
- **[Home Assistant](https://www.home-assistant.io/)** - Für die beste Smart Home Platform

---

## Lizenz

Dieses Projekt ist unter der MIT Lizenz veröffentlicht - siehe [LICENSE](LICENSE) für Details.

---

## Autor

<table>
  <tr>
    <td>
      <strong>Murat Aslan</strong><br>
      <em>AI Engineering Student & Smart Home Enthusiast</em><br><br>
      Ich beschäftige mich mit AI, Automatisierung und Smart Home Lösungen.
      Dieses Projekt ist Teil meiner Weiterbildung im Bereich AI Engineering,
      wo ich praktische Erfahrungen mit IoT, Datenanalyse und Automatisierung sammle.
    </td>
  </tr>
</table>

🌐 **Website:** [aslan4u.de](https://www.aslan4u.de)
💻 **GitHub:** [@Aslan4u73](https://github.com/Aslan4u73)

---

## Support

Bei Fragen oder Problemen:

- 📝 [Issue erstellen](https://github.com/Aslan4u73/vaillant-ebus-ha/issues)
- 💬 [Discussions](https://github.com/Aslan4u73/vaillant-ebus-ha/discussions)
- 🏠 [Home Assistant Forum](https://community.home-assistant.io/)

---

<p align="center">
  <b>Viel Erfolg beim Energiesparen!</b> 🌱💰
</p>

---

<p align="center">
  <i>Gefällt dir dieses Projekt? Gib einen ⭐ Star!</i><br>
  <i>Fragen oder Verbesserungsvorschläge? Erstelle ein <a href="https://github.com/Aslan4u73/vaillant-ebus-ha/issues">Issue</a>!</i>
</p>

