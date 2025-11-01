import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMarker {
  final String taskId;
  final String title;
  final String description;
  final double latitude;
  final double longitude;
  final String priority;
  final bool completed;
  final String? photoPath;
  final String? locationName;

  const MapMarker({
    required this.taskId,
    required this.title,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.priority,
    required this.completed,
    this.photoPath,
    this.locationName,
  });

  Color get priorityColor {
    switch (priority) {
      case 'urgent':
        return Colors.red;
      case 'high':
        return Colors.orange;
      case 'medium':
        return Colors.amber;
      case 'low':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  BitmapDescriptor get markerIcon {
    // Ícones diferentes baseados na prioridade e status
    String iconAsset = 'assets/markers/';
    
    if (completed) {
      iconAsset += 'completed_';
    }
    
    switch (priority) {
      case 'urgent':
        iconAsset += 'urgent.png';
        break;
      case 'high':
        iconAsset += 'high.png';
        break;
      case 'medium':
        iconAsset += 'medium.png';
        break;
      case 'low':
        iconAsset += 'low.png';
        break;
      default:
        iconAsset += 'default.png';
    }
    
    // Para simplificar, vamos usar cores por enquanto
    // Você pode adicionar ícones personalizados depois
    return BitmapDescriptor.defaultMarkerWithHue(
      _colorToHue(priorityColor),
    );
  }

  double _colorToHue(Color color) {
    if (color == Colors.red) return 0.0;
    if (color == Colors.orange) return 30.0;
    if (color == Colors.amber) return 45.0;
    if (color == Colors.green) return 120.0;
    return 210.0; // Azul padrão
  }
}