---
name: traffic-diagram
description: >-
  Generate editable SVG road traffic diagrams from natural language descriptions,
  including intersection top-down views, road cross-sections, and traffic flow
  organization charts. Export as SVG+PNG. Trigger on: "交通图" "路口图" "交叉口"
  "横断面" "车道" "交通组织" "信号灯" "渠化" "道路设计" "intersection" "road diagram"
  "traffic flow" "cross-section" "lane layout" "部署图" "deployment" "设备安装"
  "行人过街" "pedestrian crossing" "雷达" "sensor" "检测范围" or any road/traffic description.
---

# Traffic Diagram

Generate production-quality SVG road traffic diagrams exported as PNG via `rsvg-convert`.

## Workflow (Always Follow This Order)

1. **Classify** the diagram type (see Diagram Types below)
2. **Extract structure** from user description: road geometry, lane count, directions, signals, markings
3. **Select style** - load `references/style-engineering.md` (default) or `references/style-colorful.md`
4. **Load element library** - read `references/road-elements.md` for SVG snippets
5. **Plan layout** - apply layout rules for the diagram type; snap to grid
6. **Write SVG** using Python list method (see SVG Generation below)
7. **Validate**: `rsvg-convert file.svg -o /tmp/test.png 2>&1 && echo "Valid"`
8. **Export PNG**: `rsvg-convert -w 1920 file.svg -o file.png`
9. **Report** generated file paths

## Diagram Types

### 1. Intersection Top-Down View (交叉口俯视图)

Birds-eye view of road intersections with lanes, markings, signals, and crosswalks.

**Subtypes:**
- **Cross intersection** (十字路口): 4-arm, right angles
- **T-intersection** (T字路口): 3-arm
- **Roundabout** (环形交叉口): circular central island with circulating lanes
- **Offset intersection** (错位交叉): staggered arms
- **Five-way+** (多路交叉): 5+ approach arms

**Layout rules:**
- ViewBox: `0 0 960 960` (square canvas, centered intersection)
- Intersection center at `(480, 480)`
- Each approach arm extends from center to canvas edge
- Lane width: 35px (≈3.5m at 1px=0.1m scale)
- Approach arm width = lane_count × 35px + median + shoulder
- Draw order: road surface → lane markings → crosswalks → islands → signals → arrows → labels
- North is UP by default unless user specifies otherwise

**Required elements:**
- Road surface (gray fill)
- Lane dividers (white dashed for same-direction, yellow solid for opposing)
- Stop lines (white solid, 3px thick)
- Crosswalks (zebra pattern)
- Direction arrows in each lane
- Signal heads at each approach (optional)
- Turn radius curves at corners

### 2. Road Cross-Section (道路横断面)

Vertical slice showing road layers from left sidewalk to right sidewalk.

**Layout rules:**
- ViewBox: `0 0 960 400`
- Ground line at y=280, elements stack above
- Symmetric about centerline at x=480 (unless asymmetric design)
- Scale: 1px ≈ 0.05m (a 3.5m lane = 70px)
- Minimum element labels: lane type + width dimension

**Layers (left to right, typical):**
- Sidewalk → Green belt → Non-motorized lane → Curb → Motorized lanes (with median) → Curb → Non-motorized lane → Green belt → Sidewalk

**Required elements:**
- Dimension lines with arrows and width labels (meters)
- Surface type fills (asphalt, concrete, grass)
- Curb profile (raised edge)
- Centerline / median barrier
- Total width dimension at top
- Cross-slope indicators (optional)

### 3. Traffic Flow / Organization Diagram (交通流向/组织图)

Schematic showing vehicle movement paths, allowed/prohibited turns, signal phases, or channelization plans.

**Subtypes:**
- **Turn restriction diagram**: arrows showing allowed/prohibited movements per approach
- **Signal phase diagram**: phases with green/red arrows per direction
- **Channelization plan** (渠化图): physical islands and guide lines directing traffic
- **One-way / tidal flow scheme**: time-based lane direction changes
- **Detour plan** (绕行方案): temporary route guidance

**Layout rules:**
- ViewBox: `0 0 960 700` (or `960 960` for symmetric intersections)
- Use curved arrow paths for turning movements
- Color-code movements: green=allowed, red=prohibited, orange=yield, blue=special
- Number each movement for reference
- Signal phase boxes: side panels showing phase sequence

### 4. Engineering Deployment Plan (工程部署平面图)

Professional-grade layout plan showing road geometry + equipment installation positions + detection coverage. Used for traffic engineering design documents, ITS deployment, and construction drawings.

**Key features vs. other diagram types:**
- **Title block** (标题栏) at bottom with formal drawing title in Chinese + English
- **Legend** (图例) panel in top-left corner explaining all symbols
- **Equipment callouts** with leader lines pointing to installation positions
- **Detection coverage** visualized as dashed arc/sector fills
- **Bilingual labels** (Chinese primary, English secondary)
- **Dimension annotations** with precise measurements in meters

**Layout rules:**
- ViewBox: `0 0 1200 800` (landscape, wider for road segments)
- Road runs horizontally at canvas center
- Title block: bottom 50px band, full width, thin border
- Legend panel: top-left, 180×160px, white background with 1px border
- Equipment symbols placed at actual installation positions on road edge
- Detection range: dashed arc with semi-transparent fill, annotated with distance/angle
- Scale bar in bottom-right corner
- North arrow in top-right corner

**Required elements:**
- Road surface with lane markings (per existing lane marking rules)
- Crosswalk / stop lines at pedestrian crossing points
- Green belts and sidewalks on both sides
- Equipment symbols (radar, camera, signal head, sign post) at installation positions
- Detection coverage sectors (dashed stroke, 5-10% opacity fill)
- Leader lines + callout boxes with equipment name and parameters
- Sign symbols (人行横道标志, 注意行人标志 etc.) with GB notation
- Legend explaining all symbols used
- Title block with drawing name
- North arrow + scale bar
- **Dimension annotations**: lane widths on the right side, sign-to-crosswalk distances at bottom

**Sign placement rules (IMPORTANT):**
- Traffic warning signs (注意行人, 人行横道) are placed at the **carriageway curb** (机动车道路沿石 / 机非分界线), NOT at the green belt curb
- North side: y = carriageway top edge (e.g. y=237.2 for edge line position)
- South side: y = carriageway bottom edge (e.g. y=522.8)
- 注意行人 warning sign: typically **5m** from crosswalk edge (upstream of traffic)
- 人行横道 advance sign: typically **20m** from crosswalk edge (upstream of traffic)
- Signs are placed on the UPSTREAM side (approaching direction) of each carriageway
- Mark sign-to-crosswalk distances with horizontal dimension lines below the road

**Dimension annotation rules:**
- Right side: two-level dimension chain showing individual section widths + total road width
- Sub-level: individual motor vehicle lane widths (e.g., 3.5m × 3)
- Bottom: sign-to-crosswalk distances + crosswalk width as a continuous horizontal dimension chain
- Use extension lines from road boundaries to dimension area

**Equipment callout format:**
```
┌──────────────────────────┐
│ Equipment Name (中/EN)   │
│ param1, param2           │
└──────────────────────────┘
         │ (leader line)
         ▼ (to equipment position)
```

See `references/road-elements.md` for equipment SVG snippets.

## Element Semantics

| Element | Shape | Notes |
|---------|-------|-------|
| Motorized lane | Rect, dark gray fill | Width proportional to real lane width |
| Bike lane | Rect, green tint or hatched | Narrower, with bike symbol |
| Sidewalk | Rect, light gray or tile pattern | Outermost element |
| Median | Rect, yellow/hatched or green fill | Center divider |
| Traffic island | Polygon, hatched or green fill | Channelization areas |
| Crosswalk | Alternating white bars | Perpendicular to traffic |
| Stop line | Solid white line, 3px | Before crosswalk |
| Direction arrow | Path with arrowhead | Inside lane |
| Traffic signal | Circle (R/Y/G) on pole | At intersection corners |
| Curb | Thin rect, dark stroke | Raised edge indicator |
| Green belt | Rect with tree symbols | Landscape strip |
| Dimension line | Line with end ticks + text | Shows width in meters |

## Lane Marking Rules

| Marking | Color | Stroke | Dash | Meaning |
|---------|-------|--------|------|---------|
| Lane divider (same dir) | White `#ffffff` | 2px | `12,8` | Lanes in same direction |
| Center line (opposing) | Yellow `#fbbf24` | 2.5px solid | none | Separates opposing traffic |
| Double yellow | Yellow `#fbbf24` | 2×1.5px, 4px gap | none | No-passing zone |
| Edge line | White `#ffffff` | 2px solid | none | Road edge |
| Stop line | White `#ffffff` | 4px solid | none | Stop position |
| Crosswalk bar | White `#ffffff` | fill 40×5px rects | none | Alternating bars |
| Turn guide line | White `#ffffff` | 1.5px | `6,4` | Curved guide through intersection |
| Bike lane edge | White `#ffffff` | 2px solid | none | Bike lane boundary |

## Direction Arrow Library

Arrows are placed at lane center, 80-100px before stop line. Standard set:

| Arrow | Path description | Unicode hint |
|-------|-----------------|------|
| Straight | Vertical arrow up | ↑ |
| Left turn | Curved arrow left | ↰ |
| Right turn | Curved arrow right | ↱ |
| U-turn | 180° curved arrow | ↶ |
| Straight + Left | Combined Y-shape | ↑↰ |
| Straight + Right | Combined Y-shape | ↑↱ |
| Left + Right | Two-way split | ↰↱ |

See `references/road-elements.md` for exact SVG path data.

## Styles

| # | Name | Best For |
|---|------|----------|
| 1 | **Engineering** (default) | Design documents, technical reports, CAD-like drawings |
| 2 | **Colorful** | Presentations, planning reports, public communication |

Load `references/style-engineering.md` or `references/style-colorful.md` for exact color tokens.

**Style 1 - Engineering** (default): Dark gray roads, white/yellow markings, minimal color, dimension lines, hatched fills, clean and precise.

**Style 2 - Colorful**: Tinted road surfaces, colored lane types, gradient fills, soft shadows, vibrant signal colors, suitable for non-technical audiences.

## SVG Generation (MANDATORY: Python List Method)

```python
python3 << 'EOF'
lines = []
lines.append('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 960 960">')
lines.append('  <defs>')
# ... each line separately
lines.append('</svg>')

with open('/path/to/output.svg', 'w') as f:
    f.write('\n'.join(lines))
print("SVG generated successfully")
EOF
```

**Pre-Tool-Call Checklist:**
1. Can I write out the COMPLETE content right now?
2. Do I have ALL required parameters ready?
3. Have I checked for syntax errors?

If ANY answer is NO: STOP. Prepare content first.

**Error Recovery:**
- First error: Analyze root cause, targeted fix
- Second error: Switch generation method
- Third error: STOP and report to user

## SVG Technical Rules

- ViewBox: per diagram type (see above)
- Fonts: `<style>text { font-family: 'Helvetica Neue', Arial, 'PingFang SC', sans-serif; }</style>`
- No `@import` (breaks rsvg-convert)
- Arrow markers in `<defs>`, `markerWidth="10" markerHeight="7"`
- Hatching patterns in `<defs>` for medians and islands
- Minimum text size: 11px labels, 13px titles
- Use `<clipPath>` if elements might overflow

## Output

- **Default**: `./[derived-name].svg` and `./[derived-name].png` in current directory
- **PNG export**: `rsvg-convert -w 1920 file.svg -o file.png`

## Additional Resources

- Engineering style tokens: [references/style-engineering.md](references/style-engineering.md)
- Colorful style tokens: [references/style-colorful.md](references/style-colorful.md)
- Road element SVG snippets: [references/road-elements.md](references/road-elements.md)
