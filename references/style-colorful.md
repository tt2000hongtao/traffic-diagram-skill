# Style 2: Colorful Illustration (彩色示意风格)

Vibrant, accessible, presentation-friendly. Suitable for planning reports, public communication.

## Colors

```
Background:        #f8fafc  (slate-50)
Road surface:      #64748b  (slate-500)
Road surface alt:  #475569  (slate-600)
Sidewalk:          #e2e8f0  (slate-200) with subtle tile pattern
Curb:              #334155  (slate-700)
Green belt:        #86efac  (green-300) with tree icons
Median:            #fde68a  (amber-200) fill, #f59e0b stroke
Traffic island:    #bfdbfe  (blue-200) fill, #3b82f6 stroke
Bike lane:         #bbf7d0  (green-200) fill, #22c55e stroke

Lane markings:
  White solid:     #ffffff
  White dashed:    #ffffff  dash="12,8"
  Yellow solid:    #f59e0b  (amber-500)
  Yellow dashed:   #f59e0b  dash="12,8"
  Stop line:       #ffffff  stroke-width="4"

Signal colors:
  Red:    #ef4444  (brighter)
  Yellow: #f59e0b
  Green:  #22c55e

Direction arrows:  #ffffff  (on road, with subtle drop shadow)

Flow arrow colors (for traffic flow diagrams):
  Through:        #3b82f6  (blue-500)
  Left turn:      #22c55e  (green-500)
  Right turn:     #f97316  (orange-500)
  U-turn:         #a855f7  (purple-500)
  Prohibited:     #ef4444  (red-500)
  Pedestrian:     #06b6d4  (cyan-500)
  Bike:           #10b981  (emerald-500)

Labels:            #1e293b  (slate-800)
Sub-labels:        #64748b  (slate-500)
Title:             #0f172a  font-size="18px" font-weight="700"

Drop shadow filter:
  <filter id="shadow"><feDropShadow dx="0" dy="1" stdDeviation="2" flood-opacity="0.1"/></filter>
```

## Typography

```
font-family: 'Helvetica Neue', Helvetica, Arial, 'PingFang SC', 'Microsoft YaHei', sans-serif
Title:      18px, weight 700
Labels:     14px, weight 600
Sub-labels: 12px, weight 400
Dimensions: 12px, weight 500, slate-600
```

## Accent Fills

```
Blue tint:    #eff6ff / #dbeafe   (water, special zones)
Green tint:   #f0fdf4 / #dcfce7   (parks, green areas)
Amber tint:   #fffbeb / #fef3c7   (caution areas)
Red tint:     #fef2f2 / #fee2e2   (prohibited zones)
Purple tint:  #faf5ff / #ede9fe   (transit areas)
```

## SVG Template

```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 960 960" width="960" height="960">
  <style>
    text { font-family: 'Helvetica Neue', Helvetica, Arial, 'PingFang SC', 'Microsoft YaHei', sans-serif; }
    .title { font-size: 18px; font-weight: 700; fill: #0f172a; }
    .label { font-size: 14px; font-weight: 600; fill: #1e293b; }
    .sub-label { font-size: 12px; font-weight: 400; fill: #64748b; }
  </style>
  <defs>
    <filter id="shadow"><feDropShadow dx="0" dy="1" stdDeviation="2" flood-opacity="0.1"/></filter>
  </defs>
  <rect width="960" height="960" fill="#f8fafc"/>
  <!-- diagram content -->
</svg>
```

## Legend (for traffic flow diagrams)

```xml
<g transform="translate(20, 880)">
  <text x="0" y="0" class="label">Legend</text>
  <line x1="0" y1="16" x2="30" y2="16" stroke="#3b82f6" stroke-width="2.5"/>
  <text x="36" y="20" class="sub-label">Through</text>
  <line x1="100" y1="16" x2="130" y2="16" stroke="#22c55e" stroke-width="2.5"/>
  <text x="136" y="20" class="sub-label">Left turn</text>
  <line x1="210" y1="16" x2="240" y2="16" stroke="#f97316" stroke-width="2.5"/>
  <text x="246" y="20" class="sub-label">Right turn</text>
  <line x1="330" y1="16" x2="360" y2="16" stroke="#ef4444" stroke-width="2.5"/>
  <text x="366" y="20" class="sub-label">Prohibited</text>
</g>
```
