import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'image_processing_method_channel.dart';

abstract class ImageProcessingPlatform extends PlatformInterface {
  /// Constructs a ImageProcessingPlatform.
  ImageProcessingPlatform() : super(token: _token);

  static final Object _token = Object();

  static ImageProcessingPlatform _instance = MethodChannelImageProcessing();

  /// The default instance of [ImageProcessingPlatform] to use.
  ///
  /// Defaults to [MethodChannelImageProcessing].
  static ImageProcessingPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ImageProcessingPlatform] when
  /// they register themselves.
  static set instance(ImageProcessingPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
