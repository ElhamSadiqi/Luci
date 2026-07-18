# Project Architecture

## services/

Long-lived providers of data.

Examples:
- MediaService
- CavaService

Services never create UI.

---

## managers/

Coordinate UI behavior.

Examples:
- StatusManager

Managers decide when things appear, disappear, animate, and respond to events.

---

## widgets/

Reusable UI elements.

Widgets should contain little or no application logic.

---

## components/

Larger UI compositions built from widgets.

---

## windows/

Top-level shell windows.

---

## styles/

Theme values, colors, spacing, fonts.

---

## scripts/

Shell scripts that interact with the operating system.

Scripts may write temporary event files consumed by the shell.
