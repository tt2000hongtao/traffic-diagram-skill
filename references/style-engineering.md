# Style 1: Engineering Drawing (工程制图风格)

CAD-like, technical, precise. Suitable for design documents, traffic engineering reports.

## Colors

```
Background:        #ffffff
Road surface:      #4b5563  (gray-600)
Road surface alt:  #374151  (gray-700, for cross-section fill)
Sidewalk:          #d1d5db  (gray-300)
Curb:              #1f2937  (gray-800)
Green belt:        #d1d5db  (gray-300, with tree hatch)
Median:            #fbbf24  (amber-400, with hatch)
Traffic island:    #e5e7eb  (gray-200, with diagonal hatch)

Lane markings:
  White solid:     #ffffff
  White dashed:    #ffffff  dash="12,8"
  Yellow solid:    #fbbf24  (amber-400)
  Yellow dashed:   #fbbf24  dash="12,8"
  Stop line:       #ffffff  stroke-width="4"

Dimension lines:   #374151  (gray-700) stroke-width="0.8"
Dimension text:    #374151  font-size="11px"
Tick marks:        #374151  4px perpendicular lines at ends

Signal colors:
  Red:    #dc2626
  Yellow: #fbbf24
  Green:  #16a34a

Direction arrows:  #ffffff  (on road surface)
Labels:            #111827  (gray-900)
Sub-labels:        #6b7280  (gray-500)
Title:             #111827  font-size="16px" font-weight="700"
```

## Typography

```
font-family: 'Helvetica Neue', Helvetica, Arial, 'PingFang SC', 'Microsoft YaHei', sans-serif
Title:      16px, weight 700
Labels:     13px, weight 600
Sub-labels: 11px, weight 400
Dimensions: 11px, weight 400, gray-700
```

## Hatching Patterns

```xml
<defs>
  <!-- Diagonal hatch for traffic islands -->
  <pattern id="hatch-island" patternUnits="userSpaceOnUse" width="8" height="8">
    <path d="M 0,8 L 8,0" stroke="#9ca3af" stroke-width="0.8" fill="none"/>
  </pattern>

  <!-- Cross hatch for median -->
  <pattern id="hatch-median" patternUnits="userSpaceOnUse" width="8" height="8">
    <path d="M 0,8 L 8,0 M 0,0 L 8,8" stroke="#d97706" stroke-width="0.6" fill="none"/>
  </pattern>

  <!-- Grass hatch for green belt -->
  <pattern id="hatch-grass" patternUnits="userSpaceOnUse" width="12" height="12">
    <circle cx="6" cy="6" r="1.5" fill="#9ca3af" opacity="0.4"/>
  </pattern>
</defs>
```

## Arrow Markers

```xml
<defs>
  <marker id="dim-arrow-l" markerWidth="8" markerHeight="6" refX="0" refY="3" orient="auto">
    <polygon points="0 3, 8 0, 8 6" fill="#374151"/>
  </marker>
  <marker id="dim-arrow-r" markerWidth="8" markerHeight="6" refX="8" refY="3" orient="auto">
    <polygon points="8 3, 0 0, 0 6" fill="#374151"/>
  </marker>
</defs>
```

## SVG Template

```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 960 960" width="960" height="960">
  <style>
    text { font-family: 'Helvetica Neue', Helvetica, Arial, 'PingFang SC', 'Microsoft YaHei', sans-serif; }
    .title { font-size: 16px; font-weight: 700; fill: #111827; }
    .label { font-size: 13px; font-weight: 600; fill: #111827; }
    .sub-label { font-size: 11px; font-weight: 400; fill: #6b7280; }
    .dim-text { font-size: 11px; font-weight: 400; fill: #374151; }
  </style>
  <defs>
    <!-- hatching patterns, arrow markers -->
  </defs>
  <rect width="960" height="960" fill="#ffffff"/>
  <!-- diagram content -->
</svg>
```
