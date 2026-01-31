# Heizkurven-Optimierung

## Was ist die Heizkurve?

Die **Heizkurve** bestimmt, wie warm das Heizwasser (Vorlauf) bei einer bestimmten Außentemperatur sein soll.

- **Hohe Heizkurve** (z.B. 1.5) = Höhere Vorlauftemperatur = Mehr Energieverbrauch
- **Niedrige Heizkurve** (z.B. 0.8) = Niedrigere Vorlauftemperatur = Weniger Energieverbrauch

---

## Empfohlene Werte

| Gebäudetyp | Heizkurve | Vorlauf bei -10°C |
|------------|-----------|-------------------|
| Neubau (sehr gut gedämmt) | 0.5 - 0.7 | ~35-40°C |
| Gut gedämmt | 0.7 - 0.9 | ~40-45°C |
| Normal gedämmt | 0.9 - 1.1 | ~45-50°C |
| Schlecht gedämmt (Altbau) | 1.2 - 1.5 | ~55-65°C |
| Sehr schlecht gedämmt | 1.5 - 2.0 | ~65-75°C |

---

## Dein aktueller Wert

**Heizkurve: 1.3**

Für ein **renoviertes Haus** (wie deines) ist das **zu hoch**!

**Zielwert: 0.8 - 1.0**

---

## Warum optimieren?

### Energie-Ersparnis

| Vorlauf-Reduktion | Geschätzte Ersparnis |
|-------------------|---------------------|
| 5°C weniger | ~10-15% |
| 10°C weniger | ~20-30% |
| 15°C weniger | ~30-40% |

**Jedes Grad weniger Vorlauf = ca. 2-3% weniger Gasverbrauch!**

### Beispiel-Rechnung

Annahmen:
- Gasverbrauch: 15.000 kWh/Jahr
- Gaspreis: 0,12 €/kWh
- Jährliche Kosten: 1.800 €

| Optimierung | Ersparnis |
|-------------|-----------|
| 10°C weniger Vorlauf | ~360-540 €/Jahr |
| 15°C weniger Vorlauf | ~540-720 €/Jahr |

---

## Optimierungs-Prozess

### Phase 1: Baseline (2-3 Tage)

1. **Nichts ändern!**
2. Daten sammeln lassen
3. Dashboard beobachten:
   - Durchschnittliche Vorlauftemperatur
   - Brenner-Laufzeit %
   - Raumtemperatur (gefühlt)

### Phase 2: Datum markieren

1. Im Statistik-Dashboard → "Vergleich"
2. Setze "Optimierung Start" auf HEUTE
3. Trage ein: "Alte Heizkurve: 1.3"

### Phase 3: Heizkurve reduzieren

**Vorsichtig vorgehen!**

```
Schritt 1: 1.3 → 1.2  (warten 1-2 Tage)
Schritt 2: 1.2 → 1.1  (warten 1-2 Tage)
Schritt 3: 1.1 → 1.0  (warten 2-3 Tage)
Schritt 4: Falls noch warm genug: 1.0 → 0.9
```

### Phase 4: Beobachten

**Warnsignale:**
- Räume werden nicht mehr warm
- Heizung läuft ständig
- Vorlauf erreicht Maximum

**Gute Zeichen:**
- Räume sind warm (20-21°C)
- Brenner läuft weniger
- Vorlauf ist niedriger

### Phase 5: Feintuning

Nach 1 Woche mit neuer Heizkurve:
- Vergleich im Dashboard ansehen
- Notizen machen
- Bei Bedarf nachjustieren

---

## Heizkurve ändern

### Via Home Assistant (MQTT)

**Service aufrufen:**

```yaml
service: mqtt.publish
data:
  topic: "ebusd/hc/HeatingCurve/set"
  payload: "1.0"
```

### Via eBUSd direkt

```bash
# SSH zum HA Server
ebusctl write -c hc HeatingCurve 1.0
```

### Via Thermostat

Falls vorhanden, auch am Gerät einstellbar.

---

## Zusätzliche Optimierungen

### 1. Nachtabsenkung

- 22:00 - 06:00 Uhr: 16-17°C
- Spart zusätzlich ~5-10%

### 2. Warmwasser-Temperatur

- Standard: 60°C
- Optimal: 50-55°C (Legionellen beachten!)
- Spart ~5-10%

### 3. Pumpen-Einstellung

- Hydraulischer Abgleich empfohlen
- Kann weitere 5-10% sparen

---

## Messwerte nach Optimierung

### Erwartete Verbesserung

| Messwert | VORHER (1.3) | NACHHER (1.0) |
|----------|--------------|---------------|
| Ø Vorlauf | 50-55°C | 40-45°C |
| Max Vorlauf | 65°C | 55°C |
| Brenner % | 40-50% | 30-35% |
| Starts/Tag | hoch | niedriger |

---

## Wichtige Hinweise

1. **Geduld!** Änderungen brauchen 1-2 Tage um sichtbar zu werden
2. **Langsam vorgehen!** Nicht zu viel auf einmal ändern
3. **Beobachten!** Dashboard regelmäßig prüfen
4. **Dokumentieren!** Notizen im Dashboard machen
5. **Rückgängig machen!** Bei Problemen Heizkurve wieder erhöhen

---

## Checkliste

- [ ] Baseline-Daten gesammelt (2-3 Tage)
- [ ] Alte Heizkurve notiert: ______
- [ ] Optimierung-Startdatum gesetzt: ______
- [ ] Heizkurve reduziert auf: ______
- [ ] 3 Tage beobachtet
- [ ] Vergleich im Dashboard geprüft
- [ ] Endergebnis dokumentiert

---

**Viel Erfolg beim Energiesparen!** 💰🌱
