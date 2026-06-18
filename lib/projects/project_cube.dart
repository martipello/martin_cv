import 'dart:math';

import 'package:flutter/material.dart';

import 'project_data.dart';

class ProjectCube extends StatefulWidget {
  const ProjectCube({
    super.key,
    required this.projects,
    required this.onFaceChanged,
  });

  final List<ProjectInfo> projects;
  final ValueChanged<int> onFaceChanged;

  @override
  State<ProjectCube> createState() => _ProjectCubeState();
}

class _ProjectCubeState extends State<ProjectCube> with SingleTickerProviderStateMixin {
  static const int _numFaces = 4;

  // Global Y rotation. Negative = rotate to show higher-indexed faces.
  double _rotationY = 0.0;
  double _dragStartX = 0.0;
  double _rotationAtDragStart = 0.0;
  double _currentFaceSize = 280.0;

  late final AnimationController _snapController;
  late Animation<double> _snapAnimation;

  int get _currentFaceIndex => ((-_rotationY / (pi / 2)).round() % _numFaces + _numFaces) % _numFaces;

  @override
  void initState() {
    super.initState();
    _snapController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    )
      ..addListener(() => setState(() => _rotationY = _snapAnimation.value))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onFaceChanged(_currentFaceIndex);
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((_) => widget.onFaceChanged(0));
  }

  @override
  void dispose() {
    _snapController.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails d) {
    _snapController.stop();
    _dragStartX = d.localPosition.dx;
    _rotationAtDragStart = _rotationY;
  }

  void _onDragUpdate(DragUpdateDetails d) {
    setState(() {
      _rotationY = _rotationAtDragStart +
          (d.localPosition.dx - _dragStartX) * (pi / 2) / _currentFaceSize;
    });
  }

  void _onDragEnd(DragEndDetails d) {
    final velocity = d.primaryVelocity ?? 0;
    final currentFace = (-_rotationY / (pi / 2)).round();

    final int targetFace;
    if (velocity.abs() > 400) {
      // Fast swipe: advance one face in the swipe direction.
      // Swipe left (velocity < 0) → next face (currentFace + 1)
      // Swipe right (velocity > 0) → prev face (currentFace - 1)
      targetFace = velocity < 0 ? currentFace + 1 : currentFace - 1;
    } else {
      targetFace = currentFace;
    }

    _animateToFace(targetFace);
  }

  void _animateToFace(int faceIndex) {
    final targetRotation = -faceIndex * (pi / 2);
    _snapAnimation = Tween<double>(begin: _rotationY, end: targetRotation).animate(
      CurvedAnimation(parent: _snapController, curve: Curves.easeOutCubic),
    );
    _snapController.forward(from: 0);
  }

  void _next() {
    final currentFace = (-_rotationY / (pi / 2)).round();
    _animateToFace(currentFace + 1);
  }

  void _prev() {
    final currentFace = (-_rotationY / (pi / 2)).round();
    _animateToFace(currentFace - 1);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _currentFaceSize = min(280.0, constraints.maxWidth * 0.78);
        final halfSize = _currentFaceSize / 2;

        return Column(
          children: [
            GestureDetector(
              onHorizontalDragStart: _onDragStart,
              onHorizontalDragUpdate: _onDragUpdate,
              onHorizontalDragEnd: _onDragEnd,
              child: SizedBox(
                width: constraints.maxWidth,
                height: _currentFaceSize,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: _buildSortedFaces(halfSize),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left_rounded),
                  iconSize: 32,
                  onPressed: _prev,
                ),
                const SizedBox(width: 4),
                ..._buildIndicatorDots(),
                const SizedBox(width: 4),
                IconButton(
                  icon: const Icon(Icons.chevron_right_rounded),
                  iconSize: 32,
                  onPressed: _next,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildSortedFaces(double halfSize) {
    // Collect visible (front-facing) faces with their z-depth.
    final visible = <_FaceEntry>[];
    for (var i = 0; i < _numFaces; i++) {
      final faceAngle = _rotationY + i * (pi / 2);
      final cosAngle = cos(faceAngle);
      if (cosAngle > 0.01) {
        visible.add(_FaceEntry(index: i, faceAngle: faceAngle, cosAngle: cosAngle));
      }
    }
    // Sort back-to-front so Stack renders front face last (on top).
    visible.sort((a, b) => a.cosAngle.compareTo(b.cosAngle));

    return visible.map((entry) {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..setEntry(3, 2, 0.001)
          ..rotateY(entry.faceAngle)
          ..translateByDouble(0.0, 0.0, halfSize, 1.0),
        child: _buildFaceContent(entry.index, entry.cosAngle),
      );
    }).toList();
  }

  List<Widget> _buildIndicatorDots() {
    final current = _currentFaceIndex;
    return List.generate(_numFaces, (i) {
      final isActive = i == current;
      return AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.symmetric(horizontal: 4),
        width: isActive ? 12 : 8,
        height: isActive ? 12 : 8,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.outline,
        ),
      );
    });
  }

  Widget _buildFaceContent(int index, double cosAngle) {
    if (index < widget.projects.length) {
      return _buildProjectFace(widget.projects[index], cosAngle);
    }
    return _buildBrandFace();
  }

  Widget _buildProjectFace(ProjectInfo project, double cosAngle) {
    final shadeFactor = ((1.0 - cosAngle) * 0.45).clamp(0.0, 1.0);

    return Container(
      width: _currentFaceSize,
      height: _currentFaceSize,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [project.primaryColor, project.primaryColor.withValues(alpha:0.72)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: project.primaryColor.withValues(alpha:0.45 * cosAngle),
            blurRadius: 28,
            spreadRadius: 2,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          if (shadeFactor > 0.01)
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha:shadeFactor),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    project.imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  project.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(blurRadius: 6, color: Colors.black38)],
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  project.tagline,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha:0.9),
                    fontSize: 13,
                    height: 1.3,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 14),
                Wrap(
                  spacing: 5,
                  runSpacing: 5,
                  alignment: WrapAlignment.center,
                  children: project.platforms.map(_buildPlatformBadge).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlatformBadge(String platform) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha:0.18),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white.withValues(alpha:0.35)),
      ),
      child: Text(
        platform,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.3,
        ),
      ),
    );
  }

  Widget _buildBrandFace() {
    return Container(
      width: _currentFaceSize,
      height: _currentFaceSize,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xff14150f), Color(0xff1e2e10)],
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xffbcd063).withValues(alpha:0.25),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffbcd063).withValues(alpha:0.12),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.rocket_launch_rounded, color: Color(0xffbcd063), size: 52),
          SizedBox(height: 18),
          Text(
            'More coming\nsoon...',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _FaceEntry {
  const _FaceEntry({
    required this.index,
    required this.faceAngle,
    required this.cosAngle,
  });

  final int index;
  final double faceAngle;
  final double cosAngle;
}
