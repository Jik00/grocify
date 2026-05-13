import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocify/core/utils/constants.dart';
import 'package:latlong2/latlong.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Thin wrapper so callers can pass a plain data class without importing latlong2
// ─────────────────────────────────────────────────────────────────────────────
class LatLngPoint {
  final double latitude;
  final double longitude;
  const LatLngPoint(this.latitude, this.longitude);
  LatLng get _ll => LatLng(latitude, longitude);
}

// ─────────────────────────────────────────────────────────────────────────────
// Tile-layer presets
// ─────────────────────────────────────────────────────────────────────────────
enum MapStyle { street, satellite, terrain }

extension _MapStyleExt on MapStyle {
  String get label => switch (this) {
        MapStyle.street => 'Street',
        MapStyle.satellite => 'Satellite',
        MapStyle.terrain => 'Terrain',
      };

  IconData get icon => switch (this) {
        MapStyle.street => Icons.map_outlined,
        MapStyle.satellite => Icons.satellite_alt_outlined,
        MapStyle.terrain => Icons.terrain_outlined,
      };

  String get urlTemplate => switch (this) {
        MapStyle.street => 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        MapStyle.satellite =>
          'https://server.arcgisonline.com/ArcGIS/rest/services/'
              'World_Imagery/MapServer/tile/{z}/{y}/{x}',
        MapStyle.terrain => 'https://tile.opentopomap.org/{z}/{x}/{y}.png',
      };

  String get attribution => switch (this) {
        MapStyle.street => '© OpenStreetMap contributors',
        MapStyle.satellite => '© Esri — Esri, USGS, NOAA',
        MapStyle.terrain => '© OpenTopoMap (CC-BY-SA)',
      };
}

// ─────────────────────────────────────────────────────────────────────────────
// MapWidget — drop this anywhere, it's fully self-contained.
// ─────────────────────────────────────────────────────────────────────────────
class MapWidget extends StatefulWidget {
  /// Starting map center.
  final LatLngPoint initialCenter;

  /// Starting zoom level (1–18).
  final double initialZoom;

  /// Show the layer-toggle button in the top-right corner.
  final bool showLayerToggle;

  /// Optional list of pin locations to render.
  final List<LatLngPoint> markers;

  /// Callback fired when the user taps the map.
  final void Function(LatLngPoint tapped)? onTap;

  const MapWidget({
    super.key,
    this.initialCenter = const LatLngPoint(30.5965, 32.2715), // Ismailia
    this.initialZoom = 12,
    this.showLayerToggle = true,
    this.markers = const [],
    this.onTap,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> with TickerProviderStateMixin {
  late final MapController _mapController;
  MapStyle _style = MapStyle.street;
  double _currentZoom = 12;
  late LatLng _center;

  bool _mapReady = false;

  // Pinned taps added interactively
  final List<LatLng> _tappedPins = [];

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _currentZoom = widget.initialZoom.isFinite ? widget.initialZoom : 12.0;
    _center = widget.initialCenter._ll;
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  // ── helpers ────────────────────────────────────────────────────────────────

  void _animateTo(LatLng target, {double? zoom}) {
    if (!_mapReady) return;
    final destZoom = zoom ?? _currentZoom;
    _mapController.move(target, destZoom);
    setState(() {
      _center = target;
      _currentZoom = destZoom;
    });
  }

  void _zoom(double delta) {
    if (!_mapReady) return;
    final next = (_currentZoom + delta).clamp(1.0, 18.0);
    _mapController.move(_center, next);
    setState(() => _currentZoom = next);
  }

  void _resetToInitial() =>
      _animateTo(widget.initialCenter._ll, zoom: widget.initialZoom);

  void _setStyle(MapStyle style) => setState(() => _style = style);

  // ── build ──────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      children: [
        // ── Map ──────────────────────────────────────────────────────────────
        Positioned.fill(
            child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: _center,
            initialZoom: _currentZoom,
            minZoom: 1,
            maxZoom: 18,
            onMapReady: () => setState(() => _mapReady = true),
            onTap: (tapPos, latLng) {
              setState(() => _tappedPins.add(latLng));
              widget.onTap
                  ?.call(LatLngPoint(latLng.latitude, latLng.longitude));
            },
            onPositionChanged: (pos, _) {
              _center = pos.center;
              _currentZoom = pos.zoom;
            },
          ),
          children: [
            // Tile layer
            TileLayer(
              urlTemplate: _style.urlTemplate,
              userAgentPackageName: kPackageName,
              maxZoom: 18,
            ),

            // Attribution
            RichAttributionWidget(
              attributions: [
                TextSourceAttribution(_style.attribution),
              ],
            ),

            // Preset markers (passed via widget.markers)
            MarkerLayer(
              markers: [
                for (final p in widget.markers)
                  _buildMarker(p._ll, colorScheme.primary),
                for (final ll in _tappedPins)
                  _buildMarker(ll, colorScheme.error),
              ],
            ),
          ],
        )),

        // ── Top-right: style toggle ───────────────────────────────────────
        if (widget.showLayerToggle)
          Positioned(
            top: 12.h,
            right: 28.w,
            child: _LayerToggle(
              current: _style,
              onChanged: _setStyle,
            ),
          ),

        // ── Bottom-right: zoom + reset controls ──────────────────────────
        Positioned(
          bottom: 32.h,
          right: 6.w,
          child: _MapControls(
            onZoomIn: () => _zoom(1),
            onZoomOut: () => _zoom(-1),
            onReset: _resetToInitial,
            onClearPins: _tappedPins.isEmpty
                ? null
                : () => setState(() => _tappedPins.clear()),
          ),
        ),

        // ── Bottom-left: zoom badge ───────────────────────────────────────
        Positioned(
          bottom: 32.h,
          left: 12.w,
          child: _ZoomBadge(zoom: _currentZoom),
        ),
      ],
    );
  }

  Marker _buildMarker(LatLng point, Color color) => Marker(
        point: point,
        width: 36.w,
        height: 44.h,
        child: Icon(Icons.location_pin, color: color, size: 36.sp),
      );
}

// ─────────────────────────────────────────────────────────────────────────────
// Layer toggle chip row
// ─────────────────────────────────────────────────────────────────────────────
class _LayerToggle extends StatelessWidget {
  final MapStyle current;
  final ValueChanged<MapStyle> onChanged;

  const _LayerToggle({required this.current, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: MapStyle.values.map((s) {
            final active = s == current;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Tooltip(
                message: s.label,
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.r),
                  onTap: () => onChanged(s),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: active
                          ? Theme.of(context).colorScheme.primary
                          : Colors.transparent,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          s.icon,
                          size: 16.sp,
                          color: active
                              ? Colors.white
                              : Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(150),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          s.label,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: active
                                ? Colors.white
                                : Theme.of(context)
                                    .colorScheme
                                    .onSurface
                                    .withAlpha(150),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Zoom + action button column
// ─────────────────────────────────────────────────────────────────────────────
class _MapControls extends StatelessWidget {
  final VoidCallback onZoomIn;
  final VoidCallback onZoomOut;
  final VoidCallback onReset;
  final VoidCallback? onClearPins;

  const _MapControls({
    required this.onZoomIn,
    required this.onZoomOut,
    required this.onReset,
    this.onClearPins,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ControlButton(icon: Icons.add, tooltip: 'Zoom in', onTap: onZoomIn),
          const Divider(height: 1, indent: 8, endIndent: 8),
          _ControlButton(
              icon: Icons.remove, tooltip: 'Zoom out', onTap: onZoomOut),
          const Divider(height: 1, indent: 8, endIndent: 8),
          _ControlButton(
              icon: Icons.my_location,
              tooltip: 'Reset to origin',
              onTap: onReset),
          if (onClearPins != null) ...[
            const Divider(height: 1, indent: 8, endIndent: 8),
            _ControlButton(
                icon: Icons.clear_all,
                tooltip: 'Clear pins',
                onTap: onClearPins!,
                color: Theme.of(context).colorScheme.error),
          ],
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final Color? color;

  const _ControlButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(10.sp),
          child: Icon(icon,
              size: 22.sp,
              color: color ?? Theme.of(context).colorScheme.onSurface),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Zoom level badge
// ─────────────────────────────────────────────────────────────────────────────
class _ZoomBadge extends StatelessWidget {
  final double zoom;
  const _ZoomBadge({required this.zoom});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        child: Text(
          'Z ${zoom.toStringAsFixed(1)}',
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
