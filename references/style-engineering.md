# Style 1: Engineering Blueprint (工程图纸风格)

标准工程制图风格，参照 GB/T 国标制图规范。以线条轮廓和图案填充为主，接近 CAD 出图效果。适用于设计文件、施工图、技术报告。

## 设计原则

1. **线条为主** — 道路结构以轮廓线 + 填充图案表达，不用大面积彩色色块
2. **线宽分级** — 粗线（轮廓/边界）> 中线（元素/标线）> 细线（标注/引线）> 极细线（填充图案）
3. **色彩克制** — 仅黑/深灰 + 少量功能色（红/黄/绿信号灯、蓝色检测范围）
4. **图框规范** — 标准图框边线 + 标题栏 + 图例框
5. **标注规范** — 尺寸线带箭头/短横线端，文字居中放置

## Line Weight System (线宽体系)

| 级别 | 用途 | stroke-width | 颜色 |
|------|------|-------------|------|
| **粗线** | 道路边界、图框、轮廓 | 1.5-2.0px | #111827 |
| **中线** | 车道标线、停车线、斑马线 | 1.0-1.5px | #111827 或 #ffffff |
| **细线** | 尺寸线、引线、标注 | 0.5-0.7px | #374151 |
| **极细线** | 填充图案、辅助线 | 0.3-0.4px | #6b7280 |

## Colors (色彩方案)

```
Background:         #ffffff  纯白
Drawing border:     #111827  黑色图框线 (stroke-width: 2.0)

Road surfaces:
  Carriageway:      #e8e8e8  浅灰填充 + #111827 轮廓线
  Bike lane:        #f0f0f0  更浅灰 + 斜线填充图案
  Sidewalk:         #f5f5f5  极浅灰 + 点阵填充
  Curb:             #111827  黑色细线表示

Separators:
  Median:           none fill + #111827 交叉线填充
  Green belt:       none fill + #374151 圆圈树木图案
  Traffic island:   none fill + #6b7280 单向斜线填充

Lane markings:
  White solid:      #111827  (图纸上用黑色表示白色标线)
  White dashed:     #111827  dash="10,6"
  Center line:      #111827  双实线 (2×0.8px, gap 3px)
  Stop line:        #111827  stroke-width="2.5"
  Crosswalk bar:    #111827  stroke + #ffffff fill (带黑色轮廓的白色条)

Dimension & annotation:
  Dim lines:        #111827  stroke-width="0.5"
  Dim text:         #111827  font-size="9px"
  Dim ticks:        #111827  端部短横线 3px
  Leader lines:     #374151  stroke-width="0.5"

Functional colors (仅限特殊元素):
  Signal Red:       #c0392b
  Signal Yellow:    #f39c12
  Signal Green:     #27ae60
  Detection zone:   #2563eb  fill-opacity="0.08" stroke-dasharray="6,3"
  Equipment:        #1e3a8a  (深蓝，用于传感器/设备符号)
  Warning sign:     #f39c12  (黄色，仅交通标志)

Labels:
  Title:            #111827  font-size="14px" weight 700
  Section label:    #111827  font-size="10px" weight 600
  Sub-label:        #374151  font-size="9px" weight 400
  Callout title:    #1e3a8a  font-size="10px" weight 600
  Callout param:    #374151  font-size="9px" weight 400
```

## Typography (字体规范)

```
Primary:   'Helvetica Neue', Helvetica, Arial, 'PingFang SC', 'Microsoft YaHei', sans-serif
Monospace: 'SF Mono', 'Menlo', monospace  (仅用于坐标/编号)

Title block:   14px, weight 700, #111827
Subtitle:      11px, weight 400, #374151
Section label: 10px, weight 600, #111827
Dimension:      9px, weight 400, #111827
Legend text:     9px, weight 400, #374151
Equipment ID:    8px, weight 600, #1e3a8a, monospace
```

## Hatching Patterns (填充图案)

```xml
<defs>
  <!-- 机动车道：细密水平线 -->
  <pattern id="hatch-carriageway" patternUnits="userSpaceOnUse" width="6" height="6">
    <line x1="0" y1="3" x2="6" y2="3" stroke="#c8c8c8" stroke-width="0.3"/>
  </pattern>

  <!-- 非机动车道：稀疏斜线 -->
  <pattern id="hatch-bikelane" patternUnits="userSpaceOnUse" width="8" height="8">
    <path d="M 0,8 L 8,0" stroke="#b0b0b0" stroke-width="0.3" fill="none"/>
  </pattern>

  <!-- 人行道：点阵 -->
  <pattern id="hatch-sidewalk" patternUnits="userSpaceOnUse" width="8" height="8">
    <circle cx="4" cy="4" r="0.6" fill="#b0b0b0"/>
  </pattern>

  <!-- 中央分隔带：交叉线 -->
  <pattern id="hatch-median" patternUnits="userSpaceOnUse" width="8" height="8">
    <path d="M 0,8 L 8,0 M 0,0 L 8,8" stroke="#666666" stroke-width="0.4" fill="none"/>
  </pattern>

  <!-- 绿化带：圆形树木符号 -->
  <pattern id="hatch-greenbelt" patternUnits="userSpaceOnUse" width="20" height="20">
    <circle cx="10" cy="10" r="6" fill="none" stroke="#555555" stroke-width="0.4"/>
    <circle cx="10" cy="10" r="1.8" fill="#555555"/>
  </pattern>

  <!-- 交通岛/渠化岛：单向斜线 -->
  <pattern id="hatch-island" patternUnits="userSpaceOnUse" width="6" height="6">
    <path d="M 0,6 L 6,0" stroke="#888888" stroke-width="0.5" fill="none"/>
  </pattern>

  <!-- 斑马线条纹 (for crosswalk in top-down view) -->
  <pattern id="hatch-zebra" patternUnits="userSpaceOnUse" width="10" height="10">
    <rect width="10" height="5" fill="#111827"/>
    <rect y="5" width="10" height="5" fill="#ffffff"/>
  </pattern>
</defs>
```

## Drawing Frame (图框)

```xml
<!-- 外框 -->
<rect x="10" y="10" width="1380" height="780" fill="none" stroke="#111827" stroke-width="2.0"/>
<!-- 内框（图面区域） -->
<rect x="20" y="20" width="1360" height="720" fill="none" stroke="#111827" stroke-width="0.8"/>

<!-- 标题栏 (底部) -->
<rect x="20" y="740" width="1360" height="50" fill="#fafafa" stroke="#111827" stroke-width="0.8"/>
<line x1="700" y1="740" x2="700" y2="790" stroke="#111827" stroke-width="0.5"/>
<!-- 左半：图名 -->
<text x="360" y="762" text-anchor="middle" font-size="14" font-weight="700" fill="#111827">图名</text>
<text x="360" y="780" text-anchor="middle" font-size="10" fill="#374151">English Title</text>
<!-- 右半：比例/日期/编号 -->
<text x="820" y="758" font-size="9" fill="#374151">比例: 1:500</text>
<text x="820" y="772" font-size="9" fill="#374151">日期: 2026-04</text>
<text x="820" y="786" font-size="9" fill="#374151">图号: TD-001</text>
```

## Legend Panel (图例框)

```xml
<rect x="30" y="30" width="180" height="180" rx="0" fill="#ffffff" stroke="#111827" stroke-width="0.8"/>
<text x="40" y="48" font-size="11" font-weight="700" fill="#111827">图 例</text>
<line x1="35" y1="54" x2="205" y2="54" stroke="#111827" stroke-width="0.5"/>
<!-- 图例条目：左边符号 + 右边文字 -->
<rect x="40" y="62" width="16" height="10" fill="#e8e8e8" stroke="#111827" stroke-width="0.5"/>
<text x="64" y="71" font-size="9" fill="#374151">机动车道</text>
<!-- ... 更多条目 ... -->
```

## Equipment Symbols (设备符号 — 工程图纸版)

```xml
<!-- 传感器/摄像头：实心小方块 + 编号 -->
<g transform="translate(X, Y)">
  <rect x="-4" y="-4" width="8" height="8" fill="#1e3a8a" stroke="#111827" stroke-width="0.5"/>
  <text x="0" y="2" text-anchor="middle" font-size="5" fill="#ffffff" font-weight="700">R</text>
</g>

<!-- 标志杆：圆圈 + 十字 -->
<g transform="translate(X, Y)">
  <circle cx="0" cy="0" r="5" fill="none" stroke="#111827" stroke-width="0.6"/>
  <line x1="-3" y1="0" x2="3" y2="0" stroke="#111827" stroke-width="0.4"/>
  <line x1="0" y1="-3" x2="0" y2="3" stroke="#111827" stroke-width="0.4"/>
</g>

<!-- 检测范围：虚线扇形，极低透明度 -->
<path d="M cx,cy L x1,y1 A r,r 0 0,1 x2,y2 Z"
  fill="#2563eb" fill-opacity="0.08"
  stroke="#2563eb" stroke-width="0.7" stroke-dasharray="6,3"/>
```

## Callout Box (标注框 — 工程图纸版)

```xml
<!-- 简洁方框 + 引线，无圆角 -->
<rect x="X" y="Y" width="180" height="40" rx="0"
  fill="#ffffff" stroke="#111827" stroke-width="0.6"/>
<text x="X+8" y="Y+15" font-size="10" font-weight="600" fill="#1e3a8a">设备名称</text>
<text x="X+8" y="Y+30" font-size="8" fill="#374151">参数: FOV 80° Range ≤25m</text>
<!-- 引线 -->
<line x1="X+90" y1="Y+40" x2="TX" y2="TY" stroke="#374151" stroke-width="0.5"/>
<circle cx="TX" cy="TY" r="2" fill="#111827"/>
```

## Dimension Style (尺寸标注风格)

```xml
<!-- 端部用短横线（tick），不用箭头 -->
<!-- 水平尺寸示例 -->
<line x1="X1" y1="DY" x2="X2" y2="DY" stroke="#111827" stroke-width="0.5"/>
<line x1="X1" y1="DY-3" x2="X1" y2="DY+3" stroke="#111827" stroke-width="0.5"/>
<line x1="X2" y1="DY-3" x2="X2" y2="DY+3" stroke="#111827" stroke-width="0.5"/>
<text x="MID" y="DY-3" text-anchor="middle" font-size="9" fill="#111827">10.5m</text>

<!-- 引出线（从被标注位置到尺寸线） -->
<line x1="X1" y1="ROAD_Y" x2="X1" y2="DY" stroke="#111827" stroke-width="0.3"/>
```

## SVG Template (完整模板)

```xml
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1400 800" width="1400" height="800">
  <style>
    text {
      font-family: 'Helvetica Neue', Helvetica, Arial, 'PingFang SC', 'Microsoft YaHei', sans-serif;
    }
    .title     { font-size: 14px; font-weight: 700; fill: #111827; }
    .subtitle  { font-size: 11px; font-weight: 400; fill: #374151; }
    .label     { font-size: 10px; font-weight: 600; fill: #111827; }
    .sub-label { font-size:  9px; font-weight: 400; fill: #374151; }
    .dim-text  { font-size:  9px; font-weight: 400; fill: #111827; }
    .dim-label { font-size:  8px; font-weight: 400; fill: #374151; }
    .callout-title { font-size: 10px; font-weight: 600; fill: #1e3a8a; }
    .callout-param { font-size:  8px; font-weight: 400; fill: #374151; }
    .legend-title  { font-size: 11px; font-weight: 700; fill: #111827; }
    .legend-text   { font-size:  9px; font-weight: 400; fill: #374151; }
    .equip-id  { font-size:  8px; font-weight: 600; fill: #1e3a8a; }
  </style>
  <defs>
    <!-- 填充图案 (见上方 Hatching Patterns) -->
    <!-- 箭头标记 (如需要) -->
  </defs>

  <!-- 图框 -->
  <rect x="10" y="10" width="1380" height="780" fill="none" stroke="#111827" stroke-width="2.0"/>
  <rect width="1400" height="800" fill="#ffffff"/>

  <!-- 图面内容区域 -->
  <!-- ... 道路结构、标线、设备、标注 ... -->

  <!-- 图例框 -->
  <!-- ... -->

  <!-- 标题栏 -->
  <!-- ... -->

  <!-- 指北针 + 比例尺 -->
</svg>
```

## 与彩色风格的对比

| 特征 | 工程图纸风格 | 彩色演示风格 |
|------|------------|------------|
| 路面 | 浅灰 + 填充图案 + 黑色轮廓 | 深灰实填 (#4b5563) |
| 绿化带 | 白底 + 圆圈树木图案 | 绿色实填 + 彩色树木 |
| 中央分隔带 | 白底 + 交叉线填充 | 黄色实填 + 交叉线 |
| 车道标线 | 黑色 (图纸表达) | 白色/黄色 (实际颜色) |
| 尺寸端部 | 短横线 (tick) | 三角箭头 |
| 标注框 | 直角方框 + 细线 | 圆角方框 + 彩色边框 |
| 设备符号 | 深蓝小方块 + 字母编号 | 彩色图标 |
| 色彩数量 | ≤4 色 | 8-12 色 |

## 参考模板

完整工程图纸风格的行人过街部署平面图示例：[templates/deployment-plan-engineering.svg](../templates/deployment-plan-engineering.svg)
