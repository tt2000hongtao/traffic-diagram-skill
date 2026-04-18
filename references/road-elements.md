# Road Element SVG Component Library

Reusable SVG snippets for traffic diagram elements. Replace placeholder values (cx, cy, w, h, etc.) with actual coordinates.

## Road Surfaces

### Straight Road Segment (Horizontal)
```xml
<!-- x=left, y=top, w=width, h=height (h = total road width including shoulders) -->
<rect x="x" y="y" width="w" height="h" fill="#4b5563" rx="0"/>
```

### Straight Road Segment (Vertical)
```xml
<rect x="x" y="y" width="w" height="h" fill="#4b5563" rx="0"/>
```

### Road Corner (Quarter Arc)
```xml
<!-- For a corner connecting horizontal and vertical roads -->
<!-- outer_r = outer radius, inner_r = inner radius, cx/cy = center of arc -->
<path d="M cx,cy-outer_r A outer_r,outer_r 0 0,1 cx+outer_r,cy L cx+inner_r,cy A inner_r,inner_r 0 0,0 cx,cy-inner_r Z"
      fill="#4b5563"/>
```

## Lane Markings

### White Dashed Lane Divider (Horizontal)
```xml
<line x1="x1" y1="y" x2="x2" y2="y" stroke="#ffffff" stroke-width="2" stroke-dasharray="12,8"/>
```

### White Dashed Lane Divider (Vertical)
```xml
<line x1="x" y1="y1" x2="x" y2="y2" stroke="#ffffff" stroke-width="2" stroke-dasharray="12,8"/>
```

### Yellow Center Line (Solid, Horizontal)
```xml
<line x1="x1" y1="y" x2="x2" y2="y" stroke="#fbbf24" stroke-width="2.5"/>
```

### Double Yellow Center Line (Horizontal)
```xml
<line x1="x1" y1="y-2" x2="x2" y2="y-2" stroke="#fbbf24" stroke-width="1.5"/>
<line x1="x1" y1="y+2" x2="x2" y2="y+2" stroke="#fbbf24" stroke-width="1.5"/>
```

### White Edge Line (Solid)
```xml
<line x1="x1" y1="y" x2="x2" y2="y" stroke="#ffffff" stroke-width="2"/>
```

### Stop Line (Horizontal, before crosswalk)
```xml
<line x1="x1" y1="y" x2="x2" y2="y" stroke="#ffffff" stroke-width="4"/>
```

## Crosswalks

### Zebra Crosswalk (Horizontal crossing, bars vertical)
```xml
<!-- cx=center-x, cy=center-y, w=crossing width, bar_count=number of bars -->
<g>
  <!-- Repeat bar_count times, spacing = w / bar_count -->
  <rect x="cx - w/2 + i*spacing" y="cy - bar_length/2" width="bar_w" height="bar_length" fill="#ffffff"/>
  <!-- i = 0, 1, 2, ... bar_count-1; typical bar_w=5, bar_length=40, spacing=8 -->
</g>
```

### Zebra Crosswalk (Vertical crossing, bars horizontal)
```xml
<g>
  <rect x="cx - bar_length/2" y="cy - w/2 + i*spacing" width="bar_length" height="bar_w" fill="#ffffff"/>
</g>
```

## Direction Arrows

All arrows are white, placed at lane center. Scale with `transform="scale(s)"` if needed.

### Straight Arrow (pointing up, for northbound lane)
```xml
<g transform="translate(cx, cy)">
  <path d="M 0,-20 L 0,10 M -6,-14 L 0,-22 L 6,-14" stroke="#ffffff" stroke-width="2.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
</g>
```

### Left Turn Arrow
```xml
<g transform="translate(cx, cy)">
  <path d="M 0,10 L 0,-8 Q 0,-16 -8,-16 L -14,-16 M -10,-22 L -18,-16 L -10,-10" stroke="#ffffff" stroke-width="2.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
</g>
```

### Right Turn Arrow
```xml
<g transform="translate(cx, cy)">
  <path d="M 0,10 L 0,-8 Q 0,-16 8,-16 L 14,-16 M 10,-22 L 18,-16 L 10,-10" stroke="#ffffff" stroke-width="2.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
</g>
```

### U-Turn Arrow
```xml
<g transform="translate(cx, cy)">
  <path d="M 4,10 L 4,-6 A 8,8 0 0,0 -12,-6 L -12,0 M -8,-4 L -12,4 L -16,-4" stroke="#ffffff" stroke-width="2.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
</g>
```

### Straight + Left Combined
```xml
<g transform="translate(cx, cy)">
  <path d="M 0,10 L 0,-8 M -6,-2 L 0,-10 L 6,-2 M 0,-4 Q -4,-8 -10,-12 L -14,-14 M -10,-20 L -16,-14 L -8,-12" stroke="#ffffff" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
</g>
```

### Straight + Right Combined
```xml
<g transform="translate(cx, cy)">
  <path d="M 0,10 L 0,-8 M -6,-2 L 0,-10 L 6,-2 M 0,-4 Q 4,-8 10,-12 L 14,-14 M 10,-20 L 16,-14 L 8,-12" stroke="#ffffff" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
</g>
```

## Rotation Guide

To orient arrows for different approach directions:
- **Northbound** (default): no rotation
- **Southbound**: `rotate(180, cx, cy)`
- **Eastbound**: `rotate(90, cx, cy)`
- **Westbound**: `rotate(-90, cx, cy)` or `rotate(270, cx, cy)`

## Traffic Signals

### Signal Head (3-light vertical)
```xml
<!-- cx, cy = center of signal assembly; top of pole -->
<g transform="translate(cx, cy)">
  <!-- Housing -->
  <rect x="-10" y="0" width="20" height="52" rx="4" fill="#1f2937" stroke="#111827" stroke-width="1"/>
  <!-- Red light -->
  <circle cx="0" cy="12" r="6" fill="#dc2626"/>
  <!-- Yellow light -->
  <circle cx="0" cy="26" r="6" fill="#fbbf24"/>
  <!-- Green light -->
  <circle cx="0" cy="40" r="6" fill="#16a34a"/>
  <!-- Pole -->
  <line x1="0" y1="52" x2="0" y2="72" stroke="#374151" stroke-width="3"/>
</g>
```

### Signal Head (Horizontal, 3-light)
```xml
<g transform="translate(cx, cy)">
  <rect x="0" y="-10" width="52" height="20" rx="4" fill="#1f2937"/>
  <circle cx="12" cy="0" r="6" fill="#dc2626"/>
  <circle cx="26" cy="0" r="6" fill="#fbbf24"/>
  <circle cx="40" cy="0" r="6" fill="#16a34a"/>
</g>
```

### Green Arrow Signal
```xml
<g transform="translate(cx, cy)">
  <circle cx="0" cy="0" r="8" fill="#16a34a"/>
  <path d="M -3,2 L 0,-4 L 3,2" stroke="#ffffff" stroke-width="1.5" fill="none"/>
</g>
```

## Cross-Section Elements

### Carriageway Layer (cross-section view)
```xml
<!-- x=left, y=top of surface, w=width, depth=layer thickness -->
<rect x="x" y="y" width="w" height="depth" fill="#4b5563"/>
<!-- Surface line -->
<line x1="x" y1="y" x2="x+w" y2="y" stroke="#1f2937" stroke-width="1.5"/>
```

### Raised Curb (cross-section)
```xml
<!-- x=curb left, y=road surface level, curb_h=curb height(~8px) -->
<path d="M x,y L x,y-curb_h L x+8,y-curb_h L x+8,y" fill="#9ca3af" stroke="#374151" stroke-width="1"/>
```

### Sidewalk Block (cross-section)
```xml
<rect x="x" y="y-curb_h" width="w" height="curb_h + base_h" fill="#d1d5db" stroke="#9ca3af" stroke-width="0.5"/>
```

### Tree Symbol (for green belt, top view)
```xml
<circle cx="cx" cy="cy" r="12" fill="#86efac" stroke="#22c55e" stroke-width="1"/>
<circle cx="cx" cy="cy" r="3" fill="#15803d"/>
```

### Tree Symbol (cross-section side view)
```xml
<g transform="translate(cx, cy)">
  <!-- Trunk -->
  <rect x="-2" y="-4" width="4" height="16" fill="#92400e"/>
  <!-- Crown -->
  <ellipse cx="0" cy="-14" rx="12" ry="10" fill="#86efac" stroke="#22c55e" stroke-width="0.8"/>
</g>
```

## Dimension Lines

### Horizontal Dimension
```xml
<!-- x1, x2 = left and right extents; y = dimension line y position -->
<g>
  <!-- Extension lines (vertical tick lines) -->
  <line x1="x1" y1="y-6" x2="x1" y2="y+6" stroke="#374151" stroke-width="0.8"/>
  <line x1="x2" y1="y-6" x2="x2" y2="y+6" stroke="#374151" stroke-width="0.8"/>
  <!-- Dimension line with arrows -->
  <line x1="x1" y1="y" x2="x2" y2="y" stroke="#374151" stroke-width="0.8"
        marker-start="url(#dim-arrow-l)" marker-end="url(#dim-arrow-r)"/>
  <!-- Label -->
  <rect x="mid-16" y="y-9" width="32" height="14" rx="2" fill="#ffffff" opacity="0.9"/>
  <text x="mid" y="y+3" text-anchor="middle" class="dim-text">3.5m</text>
</g>
```

## Roundabout Elements

### Central Island
```xml
<circle cx="cx" cy="cy" r="r" fill="#86efac" stroke="#22c55e" stroke-width="1.5"/>
<!-- Optional: inner landscaping circle -->
<circle cx="cx" cy="cy" r="r-8" fill="#dcfce7" stroke="none"/>
```

### Circulating Carriageway Ring
```xml
<!-- outer_r = island_r + lane_count * lane_width -->
<circle cx="cx" cy="cy" r="outer_r" fill="#4b5563" stroke="none"/>
<circle cx="cx" cy="cy" r="island_r" fill="#86efac" stroke="#22c55e" stroke-width="1.5"/>
<!-- Lane divider ring (if multi-lane) -->
<circle cx="cx" cy="cy" r="mid_r" fill="none" stroke="#ffffff" stroke-width="2" stroke-dasharray="12,8"/>
```

## Traffic Flow Arrows (Curved Paths)

### Left Turn Movement (from south approach, turning east)
```xml
<path d="M cx,y_start L cx,cy Q cx,cy-20 cx+20,cy-20 L x_end,cy-20"
      stroke="#22c55e" stroke-width="3" fill="none" marker-end="url(#arrow-green)"/>
```

### Right Turn Movement (from south approach, turning west)
```xml
<path d="M cx,y_start L cx,cy+20 Q cx,cy+30 cx-20,cy+30 L x_end,cy+30"
      stroke="#f97316" stroke-width="3" fill="none" marker-end="url(#arrow-orange)"/>
```

### Through Movement
```xml
<path d="M cx,y_start L cx,y_end"
      stroke="#3b82f6" stroke-width="3" fill="none" marker-end="url(#arrow-blue)"/>
```

### U-Turn Movement (from south, U-turning back south)
```xml
<path d="M cx,y_start L cx,cy A 25,25 0 0,0 cx-50,cy L cx-50,y_start+20"
      stroke="#a855f7" stroke-width="2.5" fill="none" marker-end="url(#arrow-purple)"/>
```

## Engineering Deployment Plan Elements

### Radar/Video Sensor Symbol (雷达视频一体机)
```xml
<g transform="translate(cx, cy)">
  <!-- Pole base -->
  <rect x="-3" y="-2" width="6" height="14" fill="#374151"/>
  <!-- Sensor head -->
  <rect x="-8" y="-10" width="16" height="10" rx="2" fill="#1e40af" stroke="#1e3a8a" stroke-width="1"/>
  <!-- Lens dot -->
  <circle cx="0" cy="-5" r="2.5" fill="#60a5fa"/>
</g>
```

### Detection Coverage Sector (检测范围扇形)
```xml
<!-- cx,cy = sensor position; r = detection range in px; a1,a2 = start/end angle -->
<!-- Example: 120-degree sector facing down, r=150px -->
<path d="M cx,cy L cx+r*cos(a1),cy+r*sin(a1) A r,r 0 0,1 cx+r*cos(a2),cy+r*sin(a2) Z"
      fill="#3b82f6" fill-opacity="0.06" stroke="#3b82f6" stroke-width="1" stroke-dasharray="6,4"/>
```

### Equipment Callout Box (设备标注框)
```xml
<g>
  <!-- Callout box -->
  <rect x="bx" y="by" width="bw" height="bh" rx="3" fill="#ffffff" stroke="#374151" stroke-width="1"/>
  <!-- Title line -->
  <text x="bx+8" y="by+15" font-size="11" fill="#111827" font-weight="600">设备名称 (English)</text>
  <!-- Param line -->
  <text x="bx+8" y="by+30" font-size="10" fill="#6b7280">param: value</text>
  <!-- Leader line from box to equipment -->
  <line x1="lx1" y1="ly1" x2="lx2" y2="ly2" stroke="#374151" stroke-width="0.8"/>
  <!-- Arrowhead dot at equipment -->
  <circle cx="lx2" cy="ly2" r="3" fill="#374151"/>
</g>
```

### Sign Post Symbol (标志牌)
```xml
<!-- Pedestrian Crossing Sign (人行横道标志) - triangular warning -->
<g transform="translate(cx, cy)">
  <!-- Post -->
  <line x1="0" y1="0" x2="0" y2="20" stroke="#374151" stroke-width="2.5"/>
  <!-- Triangle sign plate -->
  <polygon points="0,-18 12,6 -12,6" fill="#fbbf24" stroke="#111827" stroke-width="1.2"/>
  <!-- Pedestrian icon (simplified) -->
  <circle cx="0" cy="-6" r="2" fill="#111827"/>
  <line x1="0" y1="-4" x2="0" y2="2" stroke="#111827" stroke-width="1"/>
</g>
```

### Advance Warning Sign (预告标志)
```xml
<g transform="translate(cx, cy)">
  <line x1="0" y1="0" x2="0" y2="20" stroke="#374151" stroke-width="2.5"/>
  <!-- Diamond sign plate -->
  <polygon points="0,-16 12,0 0,16 -12,0" fill="#fbbf24" stroke="#111827" stroke-width="1.2"/>
  <path d="M -3,4 L -3,-4 L 3,-4 L 3,4" fill="none" stroke="#111827" stroke-width="0.8"/>
</g>
```

### Title Block (标题栏, bottom of drawing)
```xml
<g>
  <rect x="0" y="canvas_h - 50" width="canvas_w" height="50" fill="#ffffff" stroke="#374151" stroke-width="1"/>
  <!-- Chinese title -->
  <text x="canvas_w/2" y="canvas_h - 28" text-anchor="middle" font-size="14" fill="#111827" font-weight="700">图名（中文）</text>
  <!-- English subtitle -->
  <text x="canvas_w/2" y="canvas_h - 12" text-anchor="middle" font-size="11" fill="#6b7280">English Title</text>
</g>
```

### Legend Panel (图例框)
```xml
<g transform="translate(20, 40)">
  <rect x="0" y="0" width="180" height="160" rx="4" fill="#ffffff" stroke="#9ca3af" stroke-width="1"/>
  <text x="10" y="20" font-size="12" fill="#111827" font-weight="700">图例</text>
  <line x1="10" y1="26" x2="170" y2="26" stroke="#d1d5db" stroke-width="0.5"/>
  <!-- Symbol rows: icon at x=16, label at x=40, y increments by 22 -->
  <!-- Example row: -->
  <circle cx="16" cy="44" r="5" fill="#1e40af"/>
  <text x="40" y="48" font-size="10" fill="#374151">雷达视频一体机</text>
  <!-- Add more rows as needed -->
</g>
```

### North Arrow
```xml
<g transform="translate(nx, ny)">
  <circle cx="0" cy="0" r="18" fill="none" stroke="#374151" stroke-width="1.2"/>
  <path d="M 0,12 L 0,-12 M -5,-6 L 0,-14 L 5,-6" stroke="#374151" stroke-width="1.8" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
  <text x="0" y="28" text-anchor="middle" font-size="12" fill="#374151" font-weight="700">N</text>
</g>
```

### Scale Bar
```xml
<g transform="translate(sx, sy)">
  <line x1="0" y1="0" x2="bar_len" y2="0" stroke="#374151" stroke-width="1.5"/>
  <line x1="0" y1="-4" x2="0" y2="4" stroke="#374151" stroke-width="1"/>
  <line x1="bar_len" y1="-4" x2="bar_len" y2="4" stroke="#374151" stroke-width="1"/>
  <text x="bar_len/2" y="-6" text-anchor="middle" font-size="10" fill="#374151">10m</text>
</g>
```
