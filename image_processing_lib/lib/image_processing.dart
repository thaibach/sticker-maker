
import 'image_processing_platform_interface.dart';

class ImageProcessing {
  Future<String?> getPlatformVersion() {
    return ImageProcessingPlatform.instance.getPlatformVersion();
  }
}
