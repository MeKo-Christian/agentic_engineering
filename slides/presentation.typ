#import "@preview/polylux:0.4.0": *
#import "@preview/polylux:0.4.0": toolbox.pdfpc
#import "@preview/pinit:0.2.2": *
#import "lib.typ": *
#import "lib.typ" as lib

// Define slides, so we can include it in handout mode
#let slides = [
  #show: setup

  #title-slide(
    title: [Agentic Engineering],
    extra: [Von einfachen Anfragen zu agentischem Arbeiten],
    authors: [
      #text(style: "italic")[Christian Budde] #link("https://github.com/MeKo-Christian")[\@MeKo-Christian] \
    ],
    title-image: image("assets/cyborgo.png"),
  )

  // ============================================================================
  // Gartner Quote
  // ============================================================================

  #content-slide([💡 KI-Transformation])[
    #align(center + horizon)[
      #block(width: 85%)[
        #set text(size: 1.35em, style: "italic")
        „Unternehmen, die beim Einführen von KI ihre Prozesse konsequent neu gestalten, übertreffen ihre Umsatzziele doppelt so häufig wie jene, die einfach Tools einführen und auf Wirkung hoffen."

        #v(1.2em)
        #set text(size: 0.85em, style: "normal", weight: "bold")
        #link("https://www.gartner.com/en/newsroom/press-releases/2025-10-27-gartner-says-chros-must-become-an-enterprise-leader-of-how-work-should-change-in-the-ai-era")[Gartner, 2025]
      ]
    ]
  ]

  // ============================================================================
  // Nutzung von AI Tools
  // ============================================================================

  #slide[
    === 💡 KI-Transformation: Nutzung von AI Tools

    #v(0.5em)

    #toolbox.side-by-side(
      gutter: 2em,
      [
        #set text(size: 0.95em)

        #v(3em)

        - 16% nutzen freie Tools
        - 0,3% nutzen Bezahldienste
        - 0,04% nutzen Code-Agenten

        #v(1.5em)
        #text(size: 0.8em)[Quelle: #link("https://www.linkedin.com/posts/activity-7298692065940758528")[LinkedIn Post]]
      ],
      [
        #set align(center)
        #set text(size: 0.55em)
        *Jeder Punkt entspricht \~3,2 Millionen Menschen*\
        #text(size: 0.8em, fill: luma(120))[2.500 Punkte = 8,1 Milliarden Menschen. Farbe = fortschrittlichste KI-Interaktion, Feb 2026.]

        #v(0.3em)

        // 2500 Punkte: 84% grau (2092), 16% grün (400), 0,3% orange (7), 0,04% rot (1)
        #let dot-grey = luma(200)
        #let dot-green = rgb(76, 175, 80)
        #let dot-orange = rgb(255, 152, 0)
        #let dot-red = rgb(244, 67, 54)

        #let cols = 50
        #let rows = 50
        #let total = cols * rows  // 2500
        #let n-red = 1
        #let n-orange = 7
        #let n-green = 400
        #let n-grey = total - n-green - n-orange - n-red  // 2092

        #grid(
          columns: (4pt,) * cols,
          rows: (4pt,) * rows,
          gutter: 1pt,
          ..range(total).map(i => {
            let color = if i < n-grey { dot-grey }
              else if i < n-grey + n-green { dot-green }
              else if i < n-grey + n-green + n-orange { dot-orange }
              else { dot-red }
            rect(width: 100%, height: 100%, fill: color)
          })
        )

        #v(0.3em)
        #set text(size: 0.7em)
        #grid(
          columns: (auto, auto),
          gutter: 0.8em,
          row-gutter: 0.3em,
          [#box(circle(radius: 4pt, fill: luma(200))) Nie AI genutzt · \~6,8 Mrd. (84%)],
          [#box(circle(radius: 4pt, fill: rgb(76, 175, 80))) Kostenlose Chatbot-Nutzer · \~1,3 Mrd. (16%)],
          [#box(circle(radius: 4pt, fill: rgb(255, 152, 0))) Bezahlt \$20/Monat für KI · \~15–25 Mio. (\~0,3%)],
          [#box(circle(radius: 4pt, fill: rgb(244, 67, 54))) Nutzt Coding Scaffold · \~2–5 Mio. (\~0,04%)],
        )
      ],
    )
  ]

  // ============================================================================
  // 0. Prompt vs. Agent
  // ============================================================================

  #slide[
    === 💬 Einzelner Prompt

    #v(0.3em)
    #text(size: 0.9em, fill: meko_grey)[ChatGPT, Claude.ai, Gemini, …]

    #v(1em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        ```
        Mensch: Prompt

        LLM:    Antwort
                  ↓
             Mensch liest,
            kopiert, prüft,
             führt aus, ...
        ```
      ],
      [
        #set align(horizon)

        - *Eine* Frage, *eine* Antwort
        - LLM sieht nur Text — *handelt nicht*
        - Jeder Schritt: Mensch ist Ausführer
        - Kontext endet mit der Antwort

        #v(2em)
        → *Prompt Engineering* = Kunst, den richtigen Prompt zu formulieren
      ],
    )
  ]

  #slide[
    === 🤖 Agent

    #v(0.3em)
    [#text(size: 0.9em, fill: meko_grey)[Claude Code, Codex, Gemini CLI, Cursor, GitHub Copilot Agent, …]]

    #v(1em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        #image("assets/workflow.png", height: 74%)
      ],
      [
        #set align(horizon)

        - *Ein* Ziel, *viele* autonome Schritte
        - LLM *handelt*: schreibt, führt aus, liest
        - Mensch gibt Richtung — Agent arbeitet
        - Kontext bleibt über den ganzen Prozess erhalten

        #v(2em)
        → *Kontext Engineering* = Kunst, den Agenten mit dem richtigen Kontext zu versorgen
      ],
    )
  ]

// ============================================================================
  // Skills
  // ============================================================================

  #slide[
    === Skills

    #v(0.3em)

    #grid(
      columns: (auto, 1fr),
      gutter: 2em,
      align: horizon,
      image("assets/kungfu.png", height: 88%),
      [
        *Skills* — Wissen on demand

        #v(1em)

        Wie Neo, der in Sekunden Kung-Fu lernt:\
        Agenten bekommen Fähigkeiten _injiziert_ —\
        nicht durch Training, sondern durch Kontext.
      ],
    )
  ]

  #content-slide([Was sind Skills?])[
    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Was sind Skills?*

        #v(0.8em)

        - Wiederverwendbare Prompt-Bausteine / Anweisungen
        - Domänenwissen, Patterns, Coding-Standards
        - Tool-Nutzungsanleitungen für den Agenten
        - In Claude Code: `/skill`-Dateien im Projekt
      ],
      [
        *Warum wichtig?*

        #v(0.8em)

        - Agent kennt _deine_ Konventionen, nicht nur allgemeines Wissen
        - Qualität steigt ohne den Agenten neu zu trainieren
        - Skills = das neue Institutional Knowledge
      ],
    )
  ]

  // ============================================================================
  // MCP
  // ============================================================================

  #content-slide([Model Context Protocol])[
    #toolbox.side-by-side(
      gutter: 2em,
      [
        *Was ist MCP?*

        #v(0.6em)

        Ein offenes Protokoll, das Agenten standardisiert\
        mit externen Tools, Daten und Diensten verbindet.

        #v(0.3em)

        #text(style: "italic")[
          „USB-C für KI-Agenten"
        ]

        #v(0.5em)

        *Das Problem davor:*
        - Jede App × jedes Modell = eigene Integration
        - N×M Custom-Connectoren, kaum wiederverwendbar
        - Anthropic, Nov 2024

        #v(0.5em)

        *Heute:*\
        OpenAI, Google, alle großen Anbieter unterstützen MCP.\
        Seit Dez 2025 unter der Linux Foundation (AAIF).
      ],
      [
        *Die drei Kern-Primitive:*

        #v(0.6em)

        🔧 *Tools* — Aktionen, die der Agent ausführen kann\
        #text(
          size: 0.85em,
          fill: meko_grey,
        )[z.B. Datei lesen, API aufrufen, DB abfragen]

        #v(0.8em)

        📄 *Resources* — Daten, die der Agent lesen kann\
        #text(
          size: 0.85em,
          fill: meko_grey,
        )[z.B. Dateisystem, Dokumentation, Codebase]

        #v(0.8em)

        💬 *Prompts* — Wiederverwendbare Prompt-Templates\
        #text(
          size: 0.85em,
          fill: meko_grey,
        )[z.B. vordefinierte Workflows, Kontext-Snippets]

        #v(1.2em)

        *Architektur:*

        #v(0.4em)

        ```
        Agent (MCP Client)
          ↔ MCP Server A  (GitHub, Jira, …)
          ↔ MCP Server B  (Dateisystem, DB, …)
          ↔ MCP Server C  (eigene Tools, …)
        ```
      ],
    )
  ]

  // ============================================================================
  // 1. Was ist Agentic Engineering?
  // ============================================================================

  #slide[
    === 🎲 Vibe Coding

    #v(0.1em)
    #align(center)[#text(size: 0.9em, fill: meko_grey)[Karpathy, Feb 2025]]

    #v(0.5em)

    #align(center)[
      #text(size: 1.1em, style: "italic")[
        „Fully give in to the vibes, embrace exponentials,\
        _forget that the code even exists._"
      ]
    ]

    #v(1.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        - Code generieren → *Accept All* → hoffen
        - Kein Review, keine Tests, kein Verständnis
        - Optimiert für: schnelle Wegwerfprojekte
        - Verantwortung: #text(fill: red)[keine]
      ],
      [
        #set align(horizon)
        #text(size: 0.95em)[
          Funktioniert für Prototypen und Wegwerfcode —\
          *nicht* für Software, die jemand warten, deployen\
          oder auf die sich jemand verlassen muss.
        ]
      ],
    )
  ]

  #slide[
    === ⚙️ Agentic Engineering

    #v(0.1em)
    #align(center)[#text(size: 0.9em, fill: meko_grey)[Willison, 2025]]

    #v(0.5em)

    #align(center)[
      #text(size: 1.1em, style: "italic")[
        „Seasoned professionals accelerate their work —\
        _proudly accountable_ for the software they ship."
      ]
    ]

    #v(1.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        - Agent = *LLM + Tools + Loop* → Ziel erreichen
        - Code wird ausgeführt, getestet, iteriert
        - Expertise wird verstärkt, nicht ersetzt
        - Verantwortung: #text(fill: meko_green)[bleibt beim Entwickler]
      ],
      [
        #set align(horizon)
        #text(size: 0.95em)[
          *Die Teilkosten fürs Tippen sinken —\
            die Kosten für _guten_ Code nicht.*\
          #v(0.5em)
          Korrektheit, Tests, Sicherheit, Wartbarkeit:\
          weiterhin Aufgabe des Entwicklers.
        ]
      ],
    )
  ]

  // ============================================================================
  // Das Ökosystem
  // ============================================================================

  #content-slide([Das Ökosystem: Coding Agents & CLIs])[
    #set text(size: 16pt)

    #grid(
      columns: (1fr, 1fr),
      gutter: 1.5em,
      [
        *Terminal / CLI*

        #v(0.4em)

        - *Claude Code* — Sonnet 4.6, Opus 4.6)
        - *OpenAI Codex CLI* — GPT-5.3-Codex, GPT-5.4,
        - *Gemini CLI* — Gemini 3.1 Pro (1M Tokens)

        #v(1em)

        *IDE-Erweiterungen*

        #v(0.4em)

        - *GitHub Copilot Agent* — GPT-5, Claude Sonnet
        - *Cline / Roo Code* — VS Code, beliebige Modelle
        - *Continue* — open source, lokal oder cloud
      ],
      [
        *AI-first IDEs*

        #v(0.4em)

        - *Cursor* — Verschiedene Modelle, Composer
        - *Windsurf* (Codeium) — SWE-1, Claude, GPT
        - *VS Code + Copilot* — Edits-Modus, Agent-Modus

        #v(1em)

        *Cloud / Async Agents*

        #v(0.4em)

        - *Devin* (Cognition) — vollständig autonom
        - *Jules* (Google) — Hintergrund-Tasks, GitHub-Integration
        - *GitHub Copilot Workspace* — issue → PR
        - *SWE-agent* — Forschung, SWE-Bench
      ],
    )
  ]

  // ============================================================================
  // Codex CLI Setup
  // ============================================================================

  #section-slide([Hands-on: Codex CLI einrichten])[]

  // --------------------------------------------------------------------------
  // Voraussetzung: Node.js
  // --------------------------------------------------------------------------

  #slide[
    === 📦 Schritt 1: Node.js installieren

    #v(0.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Windows:*

        #v(0.5em)

        + #link("https://nodejs.org")[nodejs.org] öffnen
        + LTS-Version herunterladen (grüner Button)
        + Installer ausführen → alles auf Standard lassen
        + Terminal öffnen und prüfen:

        #v(0.3em)

        ```
        node --version
        ```

        #v(0.3em)

        → Sollte `v22.x.x` oder höher zeigen
      ],
      [
        *Ubuntu / Linux:*

        #v(0.5em)

        Im Terminal:

        #v(0.3em)

        ```bash
        # NodeSource-Repo hinzufügen
        curl -fsSL https://deb.nodesource.com/setup_22.x \
          | sudo -E bash -

        # Node.js installieren
        sudo apt install -y nodejs

        # Prüfen
        node --version
        ```

        #v(0.3em)

        → Sollte `v22.x.x` oder höher zeigen
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Codex CLI installieren
  // --------------------------------------------------------------------------

  #slide[
    === 🚀 Schritt 2: Codex CLI installieren

    #v(0.5em)

    *Auf beiden Systemen gleich — ein Befehl im Terminal:*

    #v(1em)

    #align(center)[
      #block(
        fill: luma(245),
        inset: 1.2em,
        radius: 6pt,
      )[
        #text(size: 1.2em)[
          `npm install -g @openai/codex`
        ]
      ]
    ]

    #v(1.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Prüfen ob es geklappt hat:*

        #v(0.3em)

        ```
        codex --version
        ```
      ],
      [
        *Alternativ (Linux):*\
        Binary direkt von GitHub herunterladen:

        #v(0.3em)

        #text(size: 0.85em)[
          #link("https://github.com/openai/codex/releases/latest")[github.com/openai/codex/releases]
        ]
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Codex CLI starten
  // --------------------------------------------------------------------------

  #slide[
    === ▶️ Schritt 3: Codex starten

    #v(0.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Anmelden:*

        #v(0.5em)

        + Terminal öffnen
        + `codex` eintippen
        + _„Sign in with ChatGPT"_ wählen
        + Browser öffnet sich → einloggen
        + Fertig!

        #v(1em)

        #text(size: 0.85em, fill: meko_grey)[
          Funktioniert mit ChatGPT Plus, Pro,\
          Team, Edu oder Enterprise.
        ]
      ],
      [
        *Erster Befehl:*

        #v(0.5em)

        In einem Projektordner:

        #v(0.3em)

        ```
        codex "Erkläre mir dieses Projekt"
        ```

        #v(1em)

        Oder direkt eine Aufgabe:

        #v(0.3em)

        ```
        codex "Erstelle eine README.md
               für dieses Projekt"
        ```
      ],
    )
  ]

  // ============================================================================
  // Claude Code Setup
  // ============================================================================

  #section-slide([Hands-on: Claude Code einrichten])[]

  // --------------------------------------------------------------------------
  // Voraussetzung: Git
  // --------------------------------------------------------------------------

  #slide[
    === 📦 Schritt 1: Voraussetzungen

    #v(0.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Windows:*

        #v(0.5em)

        *Git for Windows* wird benötigt:

        #v(0.3em)

        + #link("https://git-scm.com/downloads/win")[git-scm.com/downloads/win] öffnen
        + Installer herunterladen und ausführen
        + Alles auf Standard lassen
        + Prüfen:

        #v(0.3em)

        ```
        git --version
        ```
      ],
      [
        *Ubuntu / Linux:*

        #v(0.5em)

        Git ist meistens schon da. Falls nicht:

        #v(0.3em)

        ```bash
        sudo apt install -y git
        ```

        #v(0.5em)

        Prüfen:

        #v(0.3em)

        ```bash
        git --version
        ```
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Claude Code installieren
  // --------------------------------------------------------------------------

  #slide[
    === 🚀 Schritt 2: Claude Code installieren

    #v(0.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Windows (PowerShell):*

        #v(0.5em)

        ```powershell
        irm https://claude.ai/install.ps1 | iex
        ```

        #v(1em)

        *Windows (CMD):*

        #v(0.5em)

        ```
        curl -fsSL https://claude.ai/install.cmd
          -o install.cmd && install.cmd
          && del install.cmd
        ```
      ],
      [
        *Ubuntu / Linux:*

        #v(0.5em)

        ```bash
        curl -fsSL https://claude.ai/install.sh \
          | bash
        ```

        #v(1.5em)

        #text(size: 0.85em, fill: meko_grey)[
          Aktualisiert sich automatisch im Hintergrund.
        ]
      ],
    )

    #v(1em)

    *Prüfen:*

    #v(0.3em)

    ```
    claude --version
    ```
  ]

  // --------------------------------------------------------------------------
  // Claude Code starten
  // --------------------------------------------------------------------------

  #slide[
    === ▶️ Schritt 3: Claude Code starten

    #v(0.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Anmelden:*

        #v(0.5em)

        + Terminal öffnen
        + `claude` eintippen
        + Browser öffnet sich → mit Claude-Konto einloggen
        + Fertig!

        #v(1em)

        #text(size: 0.85em, fill: meko_grey)[
          Benötigt ein Claude Pro, Team\
          oder Enterprise Abo.
        ]
      ],
      [
        *Erster Befehl:*

        #v(0.5em)

        In einem Projektordner:

        #v(0.3em)

        ```
        cd mein-projekt
        claude
        ```

        #v(0.5em)

        Dann im Chat:

        #v(0.3em)

        ```
        > Erkläre mir dieses Projekt
        ```

        #v(0.5em)

        ```
        > Erstelle eine README.md
        ```
      ],
    )
  ]

  // ============================================================================
  // Erste Erfahrung: Mini-Projekt
  // ============================================================================

  #section-slide([Hands-on: Erstes Mini-Projekt])[]

  // --------------------------------------------------------------------------
  // Aufwärmen: Einfache Spiele
  // --------------------------------------------------------------------------

  #slide[
    === 🕹️ Zum Aufwärmen: Ein Spiel in einer Datei

    #v(0.3em)
    #text(size: 0.9em, fill: meko_grey)[Alles was ihr braucht: ein Prompt und ein Agent]

    #v(0.8em)

    #grid(
      columns: (1fr, 1fr, 1fr),
      gutter: 1.5em,
      [
        *🧩 Memory*\
        #v(0.3em)
        #text(size: 0.9em)[Karten aufdecken, Paare finden]\
        #text(size: 0.8em, fill: meko_grey)[🏥 Kunde & passendes Stent-Modell matchen]
      ],
      [
        *📝 Galgenmännchen*\
        #v(0.3em)
        #text(size: 0.9em)[Wort erraten, Buchstabe für Buchstabe]\
        #text(size: 0.8em, fill: meko_grey)[🏥 Medizintechnik-Begriffe raten]
      ],
      [
        *🐍 Snake*\
        #v(0.3em)
        #text(size: 0.9em)[Klassiker — Schlange wächst]\
        #text(size: 0.8em, fill: meko_grey)[🏥 Stent navigiert durch Blutgefäße]
      ],
      [
        *❌⭕ Tic Tac Toe*\
        #v(0.3em)
        #text(size: 0.9em)[Drei in einer Reihe — gegen die KI]
      ],
      [
        *🍬 Candy Crush*\
        #v(0.3em)
        #text(size: 0.9em)[Gleiche Farben verbinden]
      ],
      [
        *🧮 2048*\
        #v(0.3em)
        #text(size: 0.9em)[Zahlen schieben & verdoppeln]
      ],
    )

  ]

  // --------------------------------------------------------------------------
  // Beispiel-Prompts für Mini-Games
  // --------------------------------------------------------------------------

  #slide[
    === 🕹️ Beispiel-Prompts

    #v(0.5em)

    #block(
      fill: luma(245),
      inset: 1em,
      radius: 6pt,
      width: 100%,
    )[
      *🧩 Memory:*\
      #text(size: 0.85em)[
        _„Erstelle ein Memory-Spiel als eine HTML-Datei.
        12 Kartenpaare, modernes Design, mit Gewinn-Animation."_
      ]
    ]

    #v(0.8em)

    #block(
      fill: luma(245),
      inset: 1em,
      radius: 6pt,
      width: 100%,
    )[
      *📝 Galgenmännchen:*\
      #text(size: 0.85em)[
        _„Erstelle ein Galgenmännchen-Spiel als eine HTML-Datei.
        Die Wörter sollen aus der Medizintechnik kommen
        (z.B. Stent, Katheter, Angioplastie, Implantat, Bypass).
        Zeige nach dem Erraten eine kurze Erklärung des Begriffs.
        Modernes Design, Touch-tauglich für Tablets."_
      ]
    ]

    #v(0.8em)

    #align(center)[
      #text(size: 0.9em, fill: meko_grey)[
        Tipp: Einfach ausprobieren — der Agent erstellt, testet und verbessert iterativ.
      ]
    ]
  ]

  // --------------------------------------------------------------------------
  // Aufgabe: IdeenExpo Mini-Game
  // --------------------------------------------------------------------------

  #slide[
    === 🎮 Hausaufgabe: Mini-Game für die IdeenExpo

    #v(0.3em)
    #text(size: 0.9em, fill: meko_grey)[#link("https://www.ideenexpo.de")[ideenexpo.de] — MeKo hat einen kleinen Messestand]

    #v(0.8em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Die Situation:*

        #v(0.3em)

        MeKo ist Hersteller von Stents —\
        winzige Gitterröhrchen, die verengte\
        Blutgefäße offen halten.

        #v(0.8em)

        Wir brauchen ein kleines Spiel für den\
        Messestand, das Besucher (vor allem\
        Jugendliche) anspricht.

        #v(0.8em)

        *Thema:* Stents, Herz-Kreislauf,\
        Medizintechnik
      ],
      [
        *Der Prompt:*

        #v(0.3em)

        #block(
          fill: luma(245),
          inset: 1em,
          radius: 6pt,
          width: 100%,
        )[
          #text(size: 0.7em)[
            _„Erstelle ein kleines Browser-Spiel\
            für unseren Messestand auf der IdeenExpo.\
            Wir sind MeKo, ein Hersteller von Stents\
            (Gefäßstützen). Das Spiel soll Jugendliche\
            ansprechen und spielerisch erklären,\
            was Stents sind und warum sie wichtig sind.\
            Nutze HTML, CSS und JavaScript —\
            alles in einer Datei."_
          ]
        ]

        #v(0.2em)

        #text(size: 0.85em, fill: meko_grey)[
          Tipp: Einfach ausprobieren — der Agent\
          erstellt, testet und verbessert iterativ.
        ]
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Aufgabe: Gesundheits-Quiz
  // --------------------------------------------------------------------------

  #slide[
    === 🩺 Hausaufgabe, Beispiel: Herz-Kreislauf-Check

    #v(0.3em)
    #text(size: 0.9em, fill: meko_grey)[Ein interaktives Quiz für den Messestand]

    #v(0.8em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Die Idee:*

        #v(0.3em)

        Besucher beantworten einfache Fragen\
        zu ihren Gewohnheiten:

        #v(0.3em)

        - Wie oft bewegst du dich pro Woche?
        - Isst du regelmäßig Obst & Gemüse?
        - Wie viel Wasser trinkst du am Tag?
        - Wie viele Stunden schläfst du?

        #v(0.3em)

        → Am Ende: ein Herz-Fitness-Score\
        mit Tipps und Infos über Stents.
      ],
      [
        *Der Prompt:*

        #v(0.5em)

        #block(
          fill: luma(245),
          inset: 1em,
          radius: 6pt,
          width: 100%,
        )[
          #text(size: 0.6em)[
            _„Erstelle ein interaktives Herz-Kreislauf-Quiz\
            als Web-App (eine HTML-Datei).\
            Der Nutzer beantwortet 6–8 einfache Fragen\
            zu Bewegung, Ernährung, Schlaf und Stress.\
            Daraus wird ein Herz-Fitness-Score berechnet.\
            Am Ende: Score-Anzeige mit Ampelfarben,\
            persönliche Tipps und ein kurzer Infotext,\
            was Stents sind.\
            Zielgruppe: Jugendliche, modernes Design."_
          ]
        ]

        #text(size: 0.85em, fill: meko_grey)[
          Bonus: _„Füge einen QR-Code hinzu,\
          der auf meko.de verlinkt."_
        ]
      ],
    )
  ]

  // ============================================================================
  // Willison's Agentic Engineering Patterns
  // ============================================================================

  #section-slide([Agentic Engineering Patterns])[nach Simon Willison]

  // --------------------------------------------------------------------------
  // Code ist billig
  // --------------------------------------------------------------------------

  #slide[
    === 💸 Code ist billig geworden

    #v(0.3em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Früher:*

        #v(0.5em)

        - Einige hundert Zeilen sauberer, getesteter Code = ein voller Arbeitstag
        - Features wurden nach Aufwand/Nutzen-Verhältnis priorisiert
        - Refactoring „lohnt sich nicht"
      ],
      [
        *Heute:*

        #v(0.5em)

        - Parallele Agenten: Implementierung, Tests, Doku _gleichzeitig_
        - Ein Mensch steuert mehrere Code-Streams
        - „Zu aufwendig" → einfach einen Agenten losschicken
      ],
    )
  ]

  #slide[
    === 🔍 Qualität braucht den Menschen

    #v(0.5em)

    #align(center)[
      #text(size: 1.1em, style: "italic")[
        „Die Kosten fürs Erzeugen sinken —\
        die Kosten für Qualität nicht."
      ]
    ]

    #v(1em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Code:*

        #v(0.3em)

        - Korrektheit & Fehlerfreiheit
        - Tests & Regressionssicherheit
        - Wartbarkeit & Einfachheit
        - Sicherheit, Performance
      ],
      [
        *Daten & Analysen:*

        #v(0.3em)

        - Stimmen die Zahlen tatsächlich?
        - Richtige Formeln, richtige Bezüge?
        - Plausibilitäts-Checks durchgeführt?
        - Fehlende Daten / Ausreißer erkannt?
      ],
    )

    #v(1em)

    #align(center)[
      #text(size: 0.95em)[
        Ob Code, Excel-Chart oder Data-Science-Pipeline:\
        *Prüfen bleibt Aufgabe des Menschen.*
      ]
    ]
  ]

  // --------------------------------------------------------------------------
  // Sammle, was du kannst
  // --------------------------------------------------------------------------

  #slide[
    === 🗃️ Sammle, was du kannst

    #v(0.1em)
    #align(center)[#text(size: 0.9em, fill: meko_grey)[„Hoard things you know how to do"]]

    #v(0.8em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Das Prinzip:*

        #v(0.5em)

        - Erfahrung = Sammlung bewiesener Lösungen
        - Nicht nur _wissen_, sondern _gesehen haben_, dass es funktioniert
        - Blog-Posts, TIL-Notizen, Repos, Code-Snippets

        #v(1em)

        *Der Schlüssel:*\
        Mit Agenten musst du einen Trick nur\
        *ein einziges Mal* herausfinden.
      ],
      [
        *Rekombination:*

        #v(0.5em)

        Zwei bekannte Lösungen → Agent baut eine neue daraus.

        #block(
          fill: luma(245),
          inset: 1em,
          radius: 6pt,
          width: 100%,
        )[
          #text(size: 0.8em)[
            _Beispiel:_\
            Tesseract.js (Bild → Text)\
            + PDF.js (PDF → Bild)\
            → Browser-OCR für PDFs
          ]
        ]

        *Agenten durchsuchen deine Sammlung*\
        und kombinieren Bausteine automatisch.
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Bessere Ergebnisse durch KI
  // --------------------------------------------------------------------------

  #slide[
    === ✨ KI soll _bessere_ Ergebnisse liefern

    #v(0.5em)

    #align(center)[
      #text(size: 1.1em, style: "italic")[
        „Schlechtere Ergebnisse mit Agenten zu liefern ist eine _Entscheidung_.\
        Wir können uns auch für bessere entscheiden."
      ]
    ]

    #v(1.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Exploratives Prototyping:*

        #v(0.5em)

        - Hypothesen schnell durch Prototypen prüfen
        - Simulationen & Lasttests in Minuten aufsetzen
        - „Senkt die Kosten für Experimente auf fast null"
      ],
      [
        *Daten & Analysen:*

        #v(0.5em)

        - Excel-Auswertungen automatisch erstellen
        - Diagramme in verschiedenen Varianten testen
        - Daten bereinigen und aufbereiten lassen
        - Mehr Zeit zum Nachdenken, weniger zum Formatieren
      ],
    )

  ]

  // --------------------------------------------------------------------------
  // Kumulativer Wissensaufbau
  // --------------------------------------------------------------------------

  #slide[
    === 🔁 Kumulativer Wissensaufbau

    #v(2em)
    #align(center)[#text(size: 0.9em, fill: meko_grey)[„Compound Engineering"]]

    #v(1em)

    #align(center)[
      ```
      Projekt A  →  Was hat gut funktioniert?
                                  ↓
                          Patterns dokumentieren
                                  ↓
      Projekt B  →  Agent nutzt die Patterns automatisch
                                  ↓
                          Neue Erkenntnisse ergänzen
                                  ↓
      Projekt C  →  Agent wird immer besser
      ```
    ]
  ]

  #slide[
    === 🔁 Kumulativer Wissensaufbau — in der Praxis

    #v(0.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Was dokumentieren?*

        #v(0.3em)

        - Was lief gut, was nicht?
        - Typische Fehler und deren Lösung
        - Entscheidungen und deren Begründung

        #v(0.5em)

        *Wo ablegen?*

        #v(0.3em)

        - `AGENTS.md` — Projekt-Anweisungen
        - Skills — wiederverwendbare Prompt-Bausteine
        - Projekt-Wiki / README — für das Team
      ],
      [
        *Was bringt das?*

        #v(0.3em)

        - Agent macht denselben Fehler nicht zweimal
        - Neue Teammitglieder (und Agenten) starten auf höherem Niveau
        - Qualität steigt mit jedem Durchlauf

        #v(0.5em)

        *Beispiel:*

        #block(
          fill: luma(245),
          inset: 1em,
          radius: 6pt,
          width: 100%,
        )[
          #text(size: 0.7em)[
            _Retro Projekt A:_ „Agent hat immer zu große PRs erstellt."\
            → `AGENTS.md`: „PRs max. 200 Zeilen"\
            _Projekt B:_ Agent hält sich daran.
          ]
        ]
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Ideale Code-Aufgaben
  // --------------------------------------------------------------------------

  #slide[
    === 🛠️ Ideale Code-Aufgaben für Agenten

    #v(0.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Refactoring:*

        #v(0.5em)

        - API-Redesigns über Dutzende Stellen
        - Benennungs-Inkonsistenzen bereinigen
        - Doppelte Funktionalität konsolidieren
        - Große Dateien modularisieren

        #v(1em)

        _Agenten im Hintergrund laufen lassen —\
        Ergebnis als Pull Request reviewen._
      ],
      [
        *Qualitäts-Hebel:*

        #v(0.5em)

        - Test-Coverage erhöhen
        - Dokumentation aktualisieren
        - Typ-Annotationen ergänzen
        - Dependency-Updates durchführen
        - Sicherheits-Audits automatisieren

        #v(1em)

        _Aufgaben, die sich „nie lohnen" —\
        jetzt im Hintergrund erledigt._
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Anti-Patterns
  // --------------------------------------------------------------------------

  #slide[
    === ⛔ Anti-Pattern: Ungeprüfter Code im PR

    #v(0.5em)

    #align(center)[
      #text(size: 1.05em, style: "italic")[
        „Stelle keine Pull Requests mit Code,\
        den du nicht selbst reviewed hast."
      ]
    ]

    #v(1em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Das Problem:*

        #v(0.5em)

        - Hunderte Zeilen Agent-Code → „Accept All" → PR
        - Reviewer hätten den Agent selbst prompten können
        - Verantwortung wird auf andere abgewälzt
      ],
      [
        *Gute Agent-PRs haben:*

        #v(0.5em)

        + *Funktionalität* — Code funktioniert nachweislich
        + *Scope* — Klein genug für effizientes Review
        + *Kontext* — Ziel, Issue-Links, Spezifikation
        + *Eigene Prüfung* — Test-Notizen, Screenshots
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Git + Agenten
  // --------------------------------------------------------------------------

  #slide[
    === 🔀 Git als Sicherheitsnetz

    #v(0.3em)
    #text(size: 0.9em, fill: meko_grey)[Agenten sprechen fließend Git]

    #v(0.8em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Grundlagen delegieren:*

        #v(0.5em)

        - _„Commit diese Änderungen"_ → aussagekräftige Messages
        - _„Zeig mir die Änderungen von heute"_ → `git log`
        - _„Räum dieses Git-Chaos auf"_ → Merge-Konflikte lösen
      ],
      [
        #set align(horizon)
        #block(
          fill: luma(245),
          inset: 1.2em,
          radius: 6pt,
          width: 100%,
        )[
          *Commit-History als erzählte Geschichte*

          #v(0.3em)

          #text(size: 0.85em)[
            Agenten helfen beim Kuratieren:

            - Commits zusammenfassen oder aufteilen
            - Messages verbessern
            - Dateien aus Commits entfernen
            - Code in neue Repos extrahieren
          ]

          #v(0.3em)

          → _Strategie_ statt Syntax
        ]
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Subagenten
  // --------------------------------------------------------------------------

  #slide[
    === 🔄 Subagenten: Parallele Arbeit

    #v(0.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Das Problem:*\
        Kontext-Fenster ist begrenzt\
        (ca. 200k Tokens) → Agent vergisst

        #v(0.3em)

        *Die Lösung:*\
        Agent startet frische Kopien von sich selbst —\
        jeweils mit eigenem Kontext-Fenster.

        #v(0.3em)

        ```
        Haupt-Agent
          ├→ Subagent A  (Codebase erkunden)
          ├→ Subagent B  (Tests schreiben)
          └→ Subagent C  (Doku aktualisieren)
              ↓ parallel ↓
          Ergebnisse zurück an Haupt-Agent
        ```
      ],
      [
        *Spezialisierung:*

        - 🔍 *Explorer* — Codebase analysieren
        - 🧪 *Testläufer* — Fehler isolieren
        - 📝 *Reviewer* — Bugs & Design-Schwächen finden
        - 🐛 *Debugger* — Ursachen untersuchen

        #v(0.3em)

        *Performance:*
        - Parallel auf günstigeren Modellen
        - Haupt-Agent behält wertvollen Kontext
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Red/Green TDD
  // --------------------------------------------------------------------------

  #slide[
    === 🧪 Red/Green TDD mit Agenten

    #v(0.3em)
    #align(center)[#text(size: 0.9em, fill: meko_grey)[„Angenehm kurz und effektiv" — Willison]]

    #v(0.8em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        #grid(
          columns: (auto, 1fr),
          gutter: 0.8em,
          row-gutter: 1.2em,
          align: horizon,
          text(size: 1.4em, fill: red)[⬤],
          [*Red:* Tests schreiben → bestätigen, dass sie _fehlschlagen_],
          text(size: 1.4em, fill: rgb(76, 175, 80))[⬤],
          [*Green:* Code implementieren → Tests bestehen],
          text(size: 1.4em, fill: rgb(33, 150, 243))[⬤],
          [*Refactor:* Aufräumen, vereinfachen],
        )

        #v(1em)

        #text(size: 0.9em)[
          *Prompt:*\
          _„Baue eine Python-Funktion die X tut.\
          Nutze Red/Green TDD."_
        ]
      ],
      [
        #set align(horizon)

        *Warum besonders wichtig mit Agenten:*

        #v(0.3em)

        - Verhindert nicht-funktionierenden Code
        - Schützt vor unnötigen Features
        - Baut robuste Test-Suite auf
        - Regressionssicherheit wächst automatisch

        #v(1em)

        *Achtung:*\
        Red-Phase nie überspringen!
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Erst die Tests laufen lassen
  // --------------------------------------------------------------------------

  #slide[
    === 🏃 „Erst die Tests laufen lassen"

    #v(0.5em)

    #align(center)[
      #text(size: 1.1em, style: "italic")[
        „Automatisierte Tests sind nicht mehr optional\
        wenn man mit Coding-Agenten arbeitet."
      ]
    ]

    #v(1em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Die Vier-Wort-Regel:*

        #v(0.5em)

        #align(center)[
          #block(
            fill: luma(245),
            inset: 1em,
            radius: 6pt,
          )[
            #text(size: 1.1em, weight: "bold")[
              „First run the tests"
            ]
          ]
        ]

        #v(0.8em)

        Jede Session mit dem Agenten so beginnen.\
        Alternativ: _„Run 'just test'"_
      ],
      [
        *Drei Effekte:*

        #v(0.5em)

        + *Discovery* — Agent findet & versteht die Test-Suite
        + *Kontext* — Test-Output zeigt Projektumfang & Komplexität
        + *Mindset* — Agent entwickelt Test-fokussierte Arbeitsweise
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Manuelles Testen mit Agenten
  // --------------------------------------------------------------------------

  #slide[
    === 🖥️ Manuelles Testen mit Agenten

    #v(0.3em)

    #align(center)[
      #text(size: 0.95em, style: "italic")[
        „Gehe nie davon aus, dass LLM-generierter Code funktioniert,\
        bis er _ausgeführt_ wurde."
      ]
    ]

    #v(0.8em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Wie Agenten manuell testen:*

        #v(0.5em)

        - Python: `python -c "..."` direkt im Terminal
        - Web-APIs: Dev-Server starten + `curl` erkunden
        - Andere Sprachen: Demo-Dateien in `/tmp`
        - Browser: Playwright, agent-browser (Vercel)
      ],
      [
        *Der Kreislauf:*

        #v(0.5em)

        ```
        Agent generiert Code
              ↓
        Agent testet manuell
              ↓
        Problem gefunden?
          → Fix mit Red/Green TDD
          → Test bleibt als Regression
              ↓
        Qualität steigt dauerhaft
        ```
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Prüfen ist Pflicht
  // --------------------------------------------------------------------------

  #slide[
    === ⚠️ Prüfen ist Pflicht — nicht nur beim Code

    #v(0.5em)

    #align(center)[
      #text(size: 1.05em, style: "italic")[
        „Vertrauen ist gut — Kontrolle ist bei KI-Ergebnissen unverzichtbar."
      ]
    ]

    #v(1em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Daten & Analysen:*

        #v(0.5em)

        - Stimmen die Zahlen in der Excel-Tabelle?
        - Sind Formeln und Bezüge korrekt?
        - Fehlen Datensätze oder gibt es Ausreißer?
        - Wurde die richtige Spalte aggregiert?

        #v(0.8em)

        *Texte & Dokumente:*

        #v(0.5em)

        - Fakten geprüft? (LLMs halluzinieren!)
        - Quellen vorhanden und korrekt?
        - Fachbegriffe richtig verwendet?
      ],
      [
        *Präsentationen & Berichte:*

        #v(0.5em)

        - Passen Diagramm und Aussage zusammen?
        - Sind Einheiten und Achsenbeschriftungen richtig?
        - Stimmt die Schlussfolgerung mit den Daten überein?

        #v(0.8em)

        *Grundregel:*

        #v(0.5em)

        #block(
          fill: luma(245),
          inset: 1em,
          radius: 6pt,
          width: 100%,
        )[
          Je wichtiger die Entscheidung,\
          desto gründlicher die Prüfung.\
          \
          *KI beschleunigt das Erstellen —\
          nicht das Prüfen.*
        ]
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Code verstehen
  // --------------------------------------------------------------------------

  #slide[
    === 📖 Code verstehen: Walkthroughs & Visualisierungen

    #v(0.5em)

    #toolbox.side-by-side(
      gutter: 3em,
      [
        *Linear Walkthroughs:*

        #v(0.5em)

        Agent erstellt strukturierte Erklärungen\
        des gesamten Codes — Datei für Datei.

        #v(0.5em)

        #block(
          fill: luma(245),
          inset: 1em,
          radius: 6pt,
          width: 100%,
        )[
          #text(size: 0.9em)[
            _„Lies den Quellcode und erstelle\
            einen detaillierten Walkthrough.\
            Zeige Code-Snippets mit grep/cat."_
          ]
        ]

        #v(0.8em)

        → Auch Vibe-Coding-Projekte werden\
        nachträglich verständlich.
      ],
      [
        *Interaktive Erklärungen:*

        #v(0.5em)

        Agent baut animierte HTML-Visualisierungen,\
        die Algorithmen Schritt für Schritt zeigen.

        #v(0.5em)

        - Platzierungs-Algorithmen animiert
        - Kollisions-Erkennung sichtbar gemacht
        - Abstrakte Konzepte → interaktiv erforschbar

        #v(1em)

        *Gegen „Cognitive Debt":*\
        Verstehen, was der Agent gebaut hat —\
        nicht nur dass es funktioniert.
      ],
    )
  ]

  // --------------------------------------------------------------------------
  // Zusammenfassung Patterns
  // --------------------------------------------------------------------------

  #content-slide([Willisons Patterns — Zusammenfassung])[
    #set text(size: 15pt)

    #grid(
      columns: (1fr, 1fr),
      gutter: 1.5em,
      [
        *Prinzipien*

        #v(0.4em)

        + Code ist billig — _guter_ Code nicht
        + Sammle bewiesene Lösungen
        + Nutze KI für _besseren_ Code
        + Kein ungeprüfter Code in PRs

        #v(1em)

        *Arbeiten mit Agenten*

        #v(0.4em)

        + Git als Sicherheitsnetz nutzen
        + Subagenten für parallele Arbeit
        + Kontext-Fenster bewusst managen
      ],
      [
        *Testing & QA*

        #v(0.4em)

        + Red/Green TDD — immer
        + „Erst die Tests laufen lassen"
        + Manuelles Testen nicht vergessen

        #v(1em)

        *Code verstehen*

        #v(0.4em)

        + Lineare Walkthroughs generieren
        + Interaktive Visualisierungen bauen
        + Cognitive Debt vermeiden
      ],
    )

    #v(1em)

    #align(center)[
      #text(size: 0.85em, fill: meko_grey)[
        Quelle: #link("https://simonwillison.net/guides/agentic-engineering-patterns/")[simonwillison.net/guides/agentic-engineering-patterns]
      ]
    ]
  ]

  // ============================================================================
  // Appendix
  // ============================================================================

  #section-slide([Appendix])[]

  #slide[
    === Wie meine privaten Repos seit Claude Code angewachsen sind
    #align(center + horizon)[#image("assets/more_private_repos.png", height: 85%)]
  ]

  #slide[
    === Claude Code: GitHub Commits
    #align(center + horizon)[#image("assets/claude_code_gh_commits.png", height: 85%)]
  ]

  #content-slide([Claude Code: Der Wendepunkt])[
    #text(size: 0.75em)[
      *Quelle:* #link("https://newsletter.semianalysis.com/p/claude-code-is-the-inflection-point")[SemiAnalysis – „Claude Code Is The Inflection Point"]
    ]

    #v(0.8em)

    - *4% aller öffentlichen GitHub-Commits* werden aktuell von Claude Code erstellt – Prognose: über 20% bis Ende 2026

    - Führende Entwickler (Karpathy, Dahl) sehen manuelle Code-Erstellung als zunehmend obsolet – Ingenieure definieren Ziele, KI-Agenten implementieren

    - Das READ-THINK-WRITE-VERIFY-Muster ist auf über 1 Mrd. Informationsarbeiter anwendbar (Finanzen, Recht, Consulting)
  ]

  // ============================================================================
  // Pelican-Benchmark
  // ============================================================================

  #content-slide([🦤 Der Pelikan-Benchmark])[
    #toolbox.side-by-side(
      gutter: 2em,
      [
        *Was wird gemessen?*

        #v(0.5em)

        Simon Willison bittet jedes Modell, per Prompt ein SVG zu erzeugen:

        #v(0.5em)

        #align(center)[
          #text(size: 1.05em, style: "italic")[
            „Generate an SVG of a\
            pelican riding a bicycle."
          ]
        ]

        #v(1em)

        *Warum das interessant ist:*
        - Kein Trainingsdatensatz enthält viele Pelikan-auf-Fahrrad-SVGs
        - Räumliches Denken + Code-Generierung kombiniert
        - Fahrrad korrekt zu zeichnen ist überraschend schwer
        - Ergebnis sofort visuell verständlich — kein Rubric nötig
      ],
      [
        *Was es misst:*

        #v(0.5em)

        - Räumliches & physikalisches Verständnis
        - Fähigkeit, _ausführbaren_ Code zu erzeugen
        - Kreativität vs. mechanische Korrektheit
        - Fortschritt über Modellgenerationen hinweg

        #v(1em)

        *Ursprung:*\
        Simon Willison, 2024 —\
        #text(size: 0.85em)[„_I started it as a joke,\
            but it's actually starting to be a bit useful._"]

        #v(1em)

        #text(size: 0.85em, fill: meko_grey)[
          github.com/simonw/pelican-bicycle
        ]
      ],
    )
  ]

  // Pelican-Vergleich: Modelle chronologisch nach Release-Datum
  // (alle Dateien haben identischen Timestamp — Reihenfolge nach Modell-Release)

  #slide[
    === cerebras-llama3.1-70b (2024)
    #align(center + horizon)[#image("assets/cerebras-llama3.1-70b.svg", height: 85%)]
  ]

  #slide[
    === claude-3-5-sonnet (2024)
    #align(center + horizon)[#image("assets/claude-3-5-sonnet-20240620.svg", height: 85%)]
  ]

  #slide[
    === gemini-1.5-pro (2024)
    #align(center + horizon)[#image("assets/gemini-1.5-pro-002.svg", height: 85%)]
  ]

  #slide[
    === GPT-4o (2024 - "thinking")
    #align(center + horizon)[#image("assets/gpt-4o.svg", height: 85%)]
  ]

  #slide[
    === o1 Pro (High - "thinking")
    #align(center + horizon)[#image(
      "assets/o1-pro-high-pelican.png",
      height: 85%,
    )]
  ]

  #slide[
    === Deep Think
    #align(center + horizon)[#image(
      "assets/deep-think-pelican.png",
      height: 85%,
    )]
  ]

  #slide[
    === Gemini Flash Thinking
    #align(center + horizon)[#image(
      "assets/flash-pelican-thinking.png",
      height: 85%,
    )]
  ]

  #slide[
    === Gemma 3
    #align(center + horizon)[#image("assets/gemma-3-pelican.jpg", height: 85%)]
  ]

  #slide[
    === GPT-4.1 (1M Kontext-Tokens)
    #align(center + horizon)[#image("assets/gpt-4.1-pelican.jpg", height: 85%)]
  ]

  #slide[
    === Gemini (latest)
    #align(center + horizon)[#image(
      "assets/gemini-latest-pelican.jpg",
      height: 85%,
    )]
  ]

  #slide[
    === Gemini 2.5 Flash Thinking Max
    #align(center + horizon)[#image(
      "assets/gemini-2.5-flash-thinking-max.jpg",
      height: 85%,
    )]
  ]

  #slide[
    === GLM-4.5
    #align(center + horizon)[#image("assets/glm-4.5-pelican.jpg", height: 85%)]
  ]

  #slide[
    === Kimi K2 (Open Source)
    #align(center + horizon)[#image("assets/kimi-k2-pelican.png", height: 85%)]
  ]

  #slide[
    === GPT-5
    #align(center + horizon)[#image(
      "assets/gpt-5-pelican-card.jpg",
      height: 85%,
    )]
  ]

  #slide[
    === GPT-5 Codex API
    #align(center + horizon)[#image(
      "assets/gpt-5-codex-api-pelican.png",
      height: 85%,
    )]
  ]

  #slide[
    === GPT-5 Pro
    #align(center + horizon)[#image("assets/gpt-5-pro.png", height: 85%)]
  ]

  #slide[
    === Claude Opus 4.1
    #align(center + horizon)[#image("assets/opus-4.1-pelican.png", height: 85%)]
  ]

  #slide[
    === GPT-5.1 High
    #align(center + horizon)[#image(
      "assets/gpt-5.1-high-pelican.png",
      height: 85%,
    )]
  ]

  #slide[
    === Qwen 3.5-397B
    #align(center + horizon)[#image("assets/qwen3.5-397b.png", height: 85%)]
  ]

  #slide[
    === Claude Opus 4.6
    #align(center + horizon)[#image("assets/opus-4.6-pelican.png", height: 85%)]
  ]

  #slide[
    === Gemini 3 Deep Think
    #align(center + horizon)[#image(
      "assets/gemini-3-deep-think-pelican.png",
      height: 85%,
    )]
  ]

  #slide[
    === Gemini 3.1 Pro
    #align(center + horizon)[#image(
      "assets/gemini-3.1-pro-pelican.png",
      height: 85%,
    )]
  ]

  #slide[
    #set align(center + horizon)

    === Quellen & Credits

    #v(1.5em)

    Pelikan-Bilder und inhaltliche Grundgedanken (Agentic Engineering,\
    Vibe Coding, Pelikan-Benchmark) entnommen aus:

    #v(1em)

    #text(size: 1.2em)[
      #link("https://simonwillison.net/")[simonwillison.net]
    ]

    #v(0.5em)

    #text(size: 0.85em, fill: meko_grey)[Simon Willison's Weblog]
  ]

]

#slides
