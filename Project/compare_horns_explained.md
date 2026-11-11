# `compare_horns.m` — how it works, and how it fits the assignment

30430 Advanced Antenna Techniques and Measurements, Final assignment, Part 1 (standard gain horns).

---

## 1. Check against the assignment

### 1.1 Geometry and frequencies

| Parameter | Assignment Ka / C [mm] | Theory script Ka / C | OK |
|---|---|---|---|
| a (waveguide width, inner) | 7.112 / 47.55 | 7.112e-3 / 47.55e-3 m | ✓ |
| b (waveguide height, inner) | 3.556 / 22.2 | 3.556e-3 / 22.2e-3 m | ✓ |
| l (waveguide length) | 31.5 / 68 | not used | ✓ (see below) |
| w (wall thickness) | 1 / 8.4 | 1e-3 / 8.4e-3 m | ✓ |
| A_h (aperture width, outer) | 68.5 / 216 | 68.5e-3 / 216e-3 m | ✓ |
| B_h (aperture height, outer) | 56.5 / 160 | 56.5e-3 / 160e-3 m | ✓ |
| L_h (horn length, axial) | 150 / 240 | 150e-3 / 240e-3 m | ✓ |
| Band | 26.5–40 / 3.95–5.85 GHz | edges + centre | ✓ for now |

Interpretation choices in the theory script, all consistent with the figure in the assignment:

- **A_h, B_h are outer dimensions.** In the front view the A_h/B_h arrows span the outer rectangle, so the radiating (inner) aperture is
  a₁ = A_h − 2w, b₁ = B_h − 2w → Ka: 66.5 × 54.5 mm, C: 199.2 × 143.2 mm.
  For the C-band horn this matters (8.4 mm walls → 16.8 mm less aperture). Check that your HFSS model uses the same convention; if HFSS treats A_h as the inner opening, theory and simulation describe different horns.
- **L_h is the axial flare length** (throat → aperture), i.e. Balanis' p_e = p_h. Because both planes share the same L_h, the horn is automatically physically realizable (Balanis' p_e = p_h condition).
- **Apex distances by similar triangles:** ρ₁ = L_h·b₁/(b₁ − b), ρ₂ = L_h·a₁/(a₁ − a)
  → Ka: ρ₁ = 160.5 mm, ρ₂ = 168.0 mm; C: ρ₁ = 284.0 mm, ρ₂ = 315.3 mm.
  These are the axial apex-to-aperture distances that Eqs. (13-44)–(13-46) use (not the slant lengths ρ_e, ρ_h, which the script only computes for checking).
- **l is not needed** in the aperture model: the waveguide section only affects matching and higher-order-mode filtering, which only HFSS sees.

### 1.2 Field equations (theory script)

I compared `pyrField` term by term with Balanis:

- k′ₓ = k sinθ cosφ + π/a₁, k″ₓ = k sinθ cosφ − π/a₁, k_y = k sinθ sinφ ✓
- t₁′, t₂′, t₁″, t₂″ with √(1/(πkρ₂)) and ±ka₁/2 ✓ (13-25), (13-26)
- t₁, t₂ with √(1/(πkρ₁)) and ±kb₁/2 ✓
- I₁ = ½√(πρ₂/k)·[e^{jk′ₓ²ρ₂/2k}F(t₁′,t₂′) + e^{jk″ₓ²ρ₂/2k}F(t₁″,t₂″)] ✓ (13-44)
- I₂ = √(πρ₁/k)·e^{jk_y²ρ₁/2k}F(t₁,t₂) ✓ (13-45)
- E_θ ∝ sinφ(1+cosθ)I₁I₂, E_φ ∝ cosφ(1+cosθ)I₁I₂ ✓ (13-46b,c)

The only deviation is that E_θ in Balanis has a −j prefactor, while the script uses +j for both. That has no effect, because only |E_θ|² and |E_φ|² are used, each on its own cut.

The plane assignment is also correct. The aperture field is y-polarized (along b), so:
- **E-plane = yz-plane = φ = 90°**, co-pol E_θ
- **H-plane = xz-plane = φ = 0°**, co-pol E_φ

The directivity formula `directivityBalanis` matches Balanis' closed form D_p = (8πρ₁ρ₂/a₁b₁)·{[C(u)−C(v)]² + [S(u)−S(v)]²}·{C²(w)+S²(w)}.

### 1.3 Sanity check of the theory numbers (recomputed independently)

| Horn | f [GHz] | D₀ [dBi] | Uniform-aperture limit 4πa₁b₁/λ² [dBi] | Aperture eff. | s = b₁²/8λρ₁ | t = a₁²/8λρ₂ |
|---|---|---|---|---|---|---|
| Ka | 26.50 | 23.34 | 25.51 | 0.61 | 0.20 | 0.29 |
| Ka | 33.25 | 24.60 | 27.48 | 0.51 | 0.26 | 0.37 |
| Ka | 40.00 | 25.32 | 29.09 | 0.42 | 0.31 | 0.44 |
| C  | 3.95  | 16.50 | 17.94 | 0.72 | 0.12 | 0.21 |
| C  | 4.90  | 18.09 | 19.81 | 0.67 | 0.15 | 0.26 |
| C  | 5.85  | 19.28 | 21.35 | 0.62 | 0.18 | 0.31 |

These are plausible values for standard gain horns. They also give you useful material for the report:

- **Aperture efficiency falls with frequency.** The quadratic phase error across the aperture grows as s, t ∝ 1/λ. D₀ therefore rises more slowly than the 20 log f of a fixed aperture: about +2 dB over the band instead of +3.6 dB for Ka.
- **The Ka horn is close to an "optimum gain" horn at mid-band.** Balanis' optimum is s ≈ 0.25, t ≈ 0.375, which the Ka horn hits at 33.25 GHz. Above that it is phase-error limited.
- **The C-band horn has small phase errors** (s, t < 0.32 everywhere), so its efficiency stays high. The cosine H-plane taper alone limits it to about 0.81.

### 1.4 What the theory model *cannot* predict (important for the comparison)

Eqs. (13-46) are an **aperture-only** model: the field in the aperture is radiated with the Huygens obliquity factor (1+cosθ)/2. Nothing else is included:

| Effect | Theory | HFSS | Measurement |
|---|---|---|---|
| Edge diffraction at the aperture rim | ✗ | ✓ | ✓ |
| Currents on the outer horn walls | ✗ | ✓ | ✓ |
| Back radiation | **exactly 0** at θ = 180° (1+cosθ = 0) → `Back_dB = -Inf` in the table | ✓ | ✓ (if the scan reaches ±180°) |
| Cross-pol in the principal planes | **exactly 0** (sinφ / cosφ factors) | small, nonzero | nonzero (incl. probe and alignment errors) |
| Mismatch, conductor loss | ✗ (D ≡ G) | GainTotal includes loss | measured gain includes everything |

Consequences:
- The theory curves are only meaningful in the forward hemisphere, roughly |θ| < 90°.
- The **E-plane** sidelobes are high in all three sources. The E-plane amplitude is uniform, giving a first sidelobe of about −13 dB plus a phase-error fill-in. The **H-plane** sidelobes are much lower because of the cosine taper. Differences between theory and HFSS/measurement at wide angles and in the back come from diffraction, which theory lacks. That is exactly the point the assignment asks you to explain.

### 1.5 Data issues found so far

1. `Directivity_C_2D_4_9.csv` exported **GainTotal** instead of DirTotal. Re-export it.
2. `Directivity_C_2D_3_95.csv` (as uploaded) stops mid-row at φ = 83°, θ = 131°, so **φ = 90° (E-plane) is missing**. Check the file on disk and re-export if needed.
3. The C-band "2D" export sweeps φ in 1° steps (≈ 65k rows). Restricting it to φ ∈ {0°, 90°} is enough for the cuts and much smaller.
4. The 3D export has no Freq column. The reader now copes with that by taking the frequency from the file name.

### 1.6 Things still to align before the final report

- **Frequencies.** The assignment says the measurement is at "3 frequencies within the respective bands". Once you know them, set `H(n).f` in the theory script and the HFSS sweep to the same values, because the comparison pairs data by frequency within ±50 MHz.
- **Gain vs directivity.** The chamber measures **gain** (gain-transfer against a reference horn) or a relative pattern. Directivity would need a full-sphere scan. So compare measured gain against HFSS **GainTotal** (export it next to DirTotal), and use theory D₀ ≈ G for a lossless horn. HFSS D − G gives the simulated efficiency.
- **Cross-polar level** is in the assignment's parameter list, but the script does not compute it yet. Export co/cross components from HFSS, for example Ludwig-3 `DirL3Y` (co) and `DirL3X` (cross) for this y-polarized horn, as extra columns. They are then plotted automatically, dashed. A cross-pol metric (peak cross-pol within the main beam relative to the co-pol peak) is a small addition. Note that the theory has no cross-pol in these planes, so this comparison is HFSS vs measurement only.
- **HFSS orientation.** The script assumes the horn's broad wall (a) lies along x, as in Balanis. If your HFSS model is rotated, swap `cfg.phiE` and `cfg.phiH`.
- **The theory script attached most recently does not contain the `save(...)` lines.** `theory_horns.mat` exists, so you presumably added them. Rerun the theory script whenever you change the frequencies.

---

## 2. What `compare_horns.m` does

```
 Theory_Results/theory_horns.mat ────┐
 Simulation_Results/Problem1/*.csv ──┼──► per horn ──► per frequency ──► E/H-plane figure  ──► plotresults/*.png|pdf
 Measurement_Results/* (later) ──────┘                 └─► metrics rows ──► metrics_<horn>.csv
                                         └─► D0 vs f figure ──────────────────────────────► plotresults/*_D0_vs_freq.*
```

Three sources describe the same horn in different formats, with different angle grids and sometimes different frequencies:

| Source | Format | θ grid | Frequencies | Quantity |
|---|---|---|---|---|
| Theory | struct `T` in a `.mat` | −180…180°, 0.25° (1441 pts) | `H(n).f` in theory script | co-pol D in dBi |
| HFSS | CSV, one per frequency | −180…180°, 1° | HFSS sweep | dB(DirTotal), optionally more columns |
| Measurement | not yet known | depends on scanner | 3 per band | gain or relative pattern |

The script brings all three into one common internal format (section 3.3). It then extracts matching cuts, overlays them, and computes the same metrics on each.

---

## 3. Walk-through

### 3.1 Configuration

```matlab
baseDir = fileparts(mfilename('fullpath'));
```
All paths are built from the script's own folder. Relative paths would otherwise be resolved against MATLAB's *current* folder, which caused the "Unable to find file" error earlier. This only works when the file is run as a script (F5 / Run). `mfilename` is empty when code is pasted into the Command Window.

| Field | Meaning |
|---|---|
| `cfg.theoryFile` | `.mat` written by the theory script, must contain struct `T` |
| `cfg.outDir` | output folder, created if missing |
| `cfg.formats` | `{'png','pdf'}`. The PDF is vector (sharp in LaTeX), the PNG is 300 dpi. Add `'fig'` for editable MATLAB figures |
| `cfg.fTolGHz` | how far a data frequency may be from a theory frequency and still count as "the same" (0.05 GHz) |
| `cfg.phiH`, `cfg.phiE` | which φ-cut is H-/E-plane in HFSS and measurement data |
| `cfg.dynRange` | y-axis span below the peak (60 dB) |
| `cfg.measAlignPeak` | if `true`, shifts each measured cut so its peak equals the theory peak. Use only for relative (normalized) measurements, and say so in the report |

The `src` struct array lists the horns:

```matlab
src(1).name = 'Ka-band';
src(1).hfss = fullfile(baseDir,'Simulation_Results','Problem1','Directivity_Ka_2D_*.csv');
src(1).meas = '';
```
- `name` must match `T(n).name` exactly, which is how theory and data are linked.
- `hfss` / `meas` may be a single file or a wildcard. All matching files are read and stacked, so one CSV per frequency works. The `*` would also match a stray file such as `Directivity_Ka_2D_old.csv`, so keep the folder clean.
- `meas = ''` means "no measurement yet". The script then simply skips it.

### 3.2 Loading the theory

```matlab
L = load(cfg.theoryFile,'T');  T = L.T;
```
Loading into a struct (instead of a bare `load`) avoids variables silently appearing in or overwriting the workspace. The expected layout of `T(n)`, written by the snippet in the theory script:

| Field | Size | Content |
|---|---|---|
| `name` | char | `'Ka-band'` / `'C-band'` |
| `f` | 1 × N_f | frequencies in **Hz** |
| `th_deg` | 1 × 1441 | θ in degrees |
| `DE`, `DH` | N_f × 1441 | E-/H-plane directivity pattern in dBi, row m ↔ `f(m)` |
| `D0` | 1 × N_f | Balanis closed-form D₀ in dBi |

### 3.3 Main loop: per horn

```matlab
iT = find(strcmp({T.name}, s.name), 1);
th = T(iT);
H  = readCuts(s.hfss);
M  = loadMeasurement(s.meas);
```
`H` and `M` are both in the same **common format**, which is what makes everything after this source-agnostic:

| Field | Content |
|---|---|
| `S.f` | column vector, frequency of each row in **GHz** |
| `S.phi`, `S.theta` | column vectors in degrees |
| `S.Q` | matrix, one column per quantity (in dB) |
| `S.qnames` | cleaned quantity names, e.g. `{'DirTotal','DirL3X'}` |

It is a flat "long" table: every row is one (f, φ, θ) sample. No assumption is made about ordering or grid size. `S = []` means "no data", and every later function checks for that.

### 3.4 Per frequency: pattern figures

The loop runs over the **theory** frequencies. Theory is always available, and each figure needs a reference curve. HFSS-only frequencies therefore get no pattern figure, but they do appear in the D₀-vs-f plot.

For each plane (`planes` cell: name, φ, theory row):

1. **Theory**: plotted as a black solid line, one metrics row added.
2. **HFSS**: `getCut(H, fG, phi, tol)` returns θ (sorted), the quantity columns and the *actual* frequency found. It is plotted in blue. If nothing matches, a warning is issued, but only if HFSS data exists at all, so a missing C-band export doesn't spam warnings.
3. **Measurement**: same as HFSS, in red, with optional peak alignment.
4. The axis shows `peak − dynRange … peak + 3` dB. `peak` is the maximum over all plotted sources, so no curve is clipped at the top.

**Different grid sizes:** each source is plotted against its own θ vector, and all metrics are computed on each source's own grid. Nothing is interpolated onto a common grid. Overlaying curves doesn't require that, and it avoids introducing interpolation artefacts.

File names: `Ka_band_26p50GHz.png`. `fstr` replaces the decimal point, so LaTeX (`\includegraphics`) and some file systems don't trip over a second dot.

### 3.5 D₀ vs frequency

- **Theory:** `T.D0` (closed form).
- **HFSS / measurement:** `peakVsFreq` takes, for every frequency present, the maximum of the first quantity over the E- and H-plane cuts. For a horn the maximum is on boresight, which both cuts contain, so this equals D₀ (or G₀ if the column is gain).

This plot covers the "frequency dependence" item of the assignment. The theory curve shows the efficiency roll-off from section 1.3.

### 3.6 Metrics table

`rows` collects one row per (source, plane, frequency):

| Column | Definition |
|---|---|
| `Source` | Theory / HFSS / Measured |
| `Plane` | E-plane / H-plane |
| `f_GHz` | actual frequency of that data set |
| `D0_dBi` | maximum of the cut |
| `HPBW_deg` | −3 dB beamwidth |
| `SLL_dB` | highest side lobe relative to the peak (negative) |
| `Back_dB` | value at θ = ±180° relative to the peak (front-to-back ratio with a minus sign) |

The table is sorted by frequency, plane and source, so theory/HFSS/measured for the same case sit on consecutive lines. It is printed and written to `metrics_<horn>.csv`, ready to turn into a LaTeX table.

---

## 4. Local functions

### `readCuts(spec)`
Expands the wildcard with `dir`, reads each file with `readCutFile` and stacks the rows. Files are merged by **quantity name**: if one file has columns another lacks, only the common ones are kept (with a warning). If two files share nothing, it stops and prints both headers. That is how the GainTotal/DirTotal mix-up was caught, instead of silently plotting gain as directivity. At the end it prints which frequencies and quantities were loaded. Read this line once per run.

### `readCutFile(file)`
- `readtable(..., 'VariableNamingRule','preserve')` keeps the original HFSS headers such as `dB(DirTotal) []`. MATLAB would otherwise mangle them.
- Columns are found by prefix (`Freq`, `Phi`, `Theta`, case-insensitive), so `"Phi [deg]"` and `Phi[deg]` both work.
- Every other column is a quantity.
- Units: `MHz`/`Hz` in the Freq header are converted to GHz, and `rad` in the Theta header to degrees.
- **No Freq column** (as in the 3D export): the frequency is taken from the file name via `freqFromName`.

### `cleanQName(names)`
Turns `dB(DirTotal) []`, `dB(DirTotal)` and `dB(DirTotal) [] - Freq='4.9GHz'` into `DirTotal`, so header variants of the same quantity merge.

### `freqFromName(file)`
Reads the trailing `_<int>` or `_<int>_<frac>` from the file name as GHz: `..._4_9` → 4.9, `..._33_25` → 33.25, `..._40` → 40. Stick to this naming scheme.

### `loadMeasurement(file)`
Placeholder. CSV files are routed through `readCuts`, so the quickest path once the lab data arrives is to convert it to the HFSS layout (`Freq [GHz], Phi [deg], Theta [deg], dB(...)`). For any other format, add a `case` that fills the same common struct (section 3.3). Nothing else in the script needs to change.

### `getCut(S, fGHz, phi, tol)`
1. Finds the available frequency closest to `fGHz`. If it is further than `tol` away, it returns empty.
2. Selects rows at that frequency and φ. The φ comparison is done modulo 360° (`mod(Δφ+180,360)−180`), so φ = 360 matches φ = 0.
3. Sorts by θ, because files are not guaranteed to be ordered.

It returns the actual frequency too, so the table reports what was really used.

### `plotQuantities(ax, t, Q, qnames, col, label)`
Plots every quantity column of a source in that source's colour. The first is solid, then dashed, dotted and dash-dot. With a co/cross export you get co-pol solid and cross-pol dashed automatically. Legend entries read `HFSS DirTotal`, `HFSS DirL3X`, and so on.

### `metricsRow(src, plane, f, t, D)`
Computes all metrics for one cut on its own grid. Always on the **first** quantity column, so keep DirTotal (or co-pol) first in the HFSS export.

### `hpbw(t, D, i0)`
From the peak index, it searches outwards for the first samples below peak − 3 dB on each side. It then **linearly interpolates** between the samples on either side of each crossing. Without that, the 1° HFSS grid would quantize the beamwidth to whole degrees, a visible error for the about 10° Ka-band beam. If the pattern never drops 3 dB on one side, it returns `NaN`.

### `sll(D, i0)`
1. Defines the main lobe as the region between the first local minima on each side of the peak.
2. Finds all interior local maxima outside that region.
3. Returns the highest one relative to the peak.

This uses the whole cut (both sides, front and back). The original theory-script version only looked at the right half. Caveats:
- Noisy measured data can have a tiny ripple on the main-lobe flank that stops the walk early. If an SLL looks suspiciously high, check the plot.
- A lobe whose maximum sits exactly at θ = ±180° is not counted (endpoints aren't interior maxima). That case is covered by `Back_dB`.
- HFSS DirTotal includes cross-pol power, which can slightly raise far-out side lobes compared with the co-pol-only theory.

### `backLevel(t, D)`
Returns the value at the largest |θ|, i.e. θ = ±180°, or `NaN` if the cut doesn't reach at least 179°. Measurement scans often stop at ±90°, and silently reporting the 90° value as "back" would be wrong. For theory this is `-Inf` (see section 1.4). In the report, write "no back radiation in the aperture model" rather than quoting −∞.

### `peakVsFreq(S, phis)`
Boresight maximum per frequency over the E/H cuts, for the D₀-vs-f plot.

### `fstr(fG)`, `saveFig(fig, dir, base, formats)`
File naming and export. `exportgraphics` with `'ContentType','vector'` for PDF keeps lines sharp when scaled in the report.

---

## 5. Typical workflow

1. Run the theory script (it writes `Theory_Results/theory_horns.mat`).
2. Export HFSS cuts per frequency to `Simulation_Results/Problem1/Directivity_<band>_2D_<f>.csv`, with φ = 0° and 90°, DirTotal first, optionally GainTotal and Ludwig-3 co/cross as extra columns.
3. Run `compare_horns.m`. Check the "Loaded … f = … quantities: …" lines and any warnings.
4. After the lab: set the measured frequencies in the theory script and HFSS, rerun both, convert the measurements to the CSV layout, set `src(n).meas`, and rerun the comparison.

## 6. Reading the results (what to explain in the report)

- **Boresight D₀:** theory vs HFSS should agree within a few tenths of a dB at the frequencies where phase errors are small. Larger differences at the top of the Ka band point to the limits of the quadratic-phase approximation. Measured gain is lower than D by the losses and mismatch.
- **HPBW:** this should agree well, since it is set by the aperture size and illumination. The E-plane is narrower than the H-plane for a similar aperture size, because the E-plane illumination is uniform and the H-plane is cosine-tapered.
- **SLL:** the E-plane is around −10 to −13 dB, with lobes filled in by phase error. The H-plane is much lower. HFSS and measurement differ from theory at wide angles because of rim diffraction.
- **Back radiation:** zero in theory, finite in HFSS and measurement. It comes from diffraction at the E-plane rim (where the aperture field is strong) and from wall currents, so the E-plane back lobe is normally higher than the H-plane one.
- **Cross-pol:** zero in theory in the principal planes. In HFSS it comes from the finite structure, in measurement also from probe polarization purity and alignment.
- **Frequency trend:** D₀ rises less than 20 log f, because the phase error grows. Beamwidths shrink roughly ∝ 1/f.
