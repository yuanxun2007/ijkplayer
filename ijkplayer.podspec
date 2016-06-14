Pod::Spec.new do |s|

  s.name         = "ijkplayer"
  s.version      = "0.0.5"
  s.summary      = "Video player based on FFmpeg n3.0"
  s.homepage     = "http://gitlab.i.mm/huangxin1/ijkplayer-ios.git"

  s.license      = { :type => 'LGPLv2.1+', :file => 'COPYING.LGPLv2.1.txt' }
  s.author       = { "xunlei" => "fuyuanxun@xunlei.com" }

  s.platform     = :ios, '8.0'

  s.source         = { :git => "http://gitlab.i.mm/huangxin1/ijkplayer-ios.git", :tag => s.version.to_s }
  
  s.libraries    = 'z', 'bz2'

  s.frameworks     = 'AudioToolbox', 'AVFoundation', 'CoreAudio', 'CoreGraphics', 'CoreMedia', 'CoreVideo', 'MediaPlayer', 'OpenGLES', 'UIKit', 'QuartzCore', 'VideoToolbox'

  s.subspec 'IJKMediaPlayer' do |ss|
    ss.dependency 'ijkplayer/ijkplayer-ios'
    ss.dependency 'ijkplayer/ijkplayer-ios-mrc'

    ss.source_files         = 'ios/IJKMediaPlayer/IJKMediaPlayer/*.{h,c,m}'
    ss.public_header_files = 'ios/IJKMediaPlayer/IJKMediaPlayer/*.h'
    ss.exclude_files        = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/**/*'
    ss.header_mappings_dir  = 'ios/IJKMediaPlayer'
  end


  s.subspec 'ijkplayer-ios' do |ss|
    ss.dependency 'ijkplayer/ijkplayer'
    ss.dependency 'ijkplayer/ijksdl-ios'
    ss.dependency 'ijkplayer/ijksdl-ios-mrc'

    ss.source_files         = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijkplayer/**/*.{h,c,m}'
    ss.private_header_files = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijkplayer/**/*.h'
    ss.header_mappings_dir  = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia'

    ss.exclude_files        = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijkplayer/ios/ijkplayer_ios.m'
  end

  s.subspec 'ijkplayer-ios-mrc' do |ss|
    ss.dependency 'ijkplayer/ijkplayer'
    ss.dependency 'ijkplayer/ijksdl-ios'
    ss.dependency 'ijkplayer/ijksdl-ios-mrc'

    ss.requires_arc         = false;
    ss.source_files         = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijkplayer/ios/ijkplayer_ios.m'
    ss.private_header_files = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijkplayer/**/*.h'
    ss.header_mappings_dir  = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia'
  end

  s.subspec 'ijksdl-ios' do |ss|
    ss.dependency 'ijkplayer/ijksdl'

    ss.source_files         = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/**/*.{h,c,m}'
    ss.private_header_files = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/**/*.h'
    ss.header_mappings_dir  = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia'

    ss.exclude_files        = ['ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/ios/ijksdl_aout_ios_audiounit.m', 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/ios/ijksdl_vout_ios_gles2.m']
  end

  s.subspec 'ijksdl-ios-mrc' do |ss|
    ss.dependency 'ijkplayer/ijksdl'

    ss.requires_arc         = false;
    ss.source_files         = ['ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/ios/ijksdl_aout_ios_audiounit.m', 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/ios/ijksdl_vout_ios_gles2.m']
    ss.private_header_files = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia/ijksdl/**/*.h'
    ss.header_mappings_dir  = 'ios/IJKMediaPlayer/IJKMediaPlayer/ijkmedia'
  end


  s.subspec 'ijkplayer' do |ss|
    ss.dependency 'ijkplayer/ijksdl'

    ss.source_files         = 'ijkmedia/ijkplayer/**/*.{h,c,m}'
    ss.private_header_files = 'ijkmedia/ijkplayer/**/*.h'
    ss.exclude_files        = 'ijkmedia/ijkplayer/android/**/*'
    ss.header_mappings_dir  = 'ijkmedia'
  end

  s.subspec 'ijksdl' do |ss|

    ss.source_files         = 'ijkmedia/ijksdl/**/*.{h,c,m}'
    ss.private_header_files = 'ijkmedia/ijksdl/**/*.h'
    ss.exclude_files        = 'ijkmedia/ijksdl/android/**/*'
    ss.header_mappings_dir  = 'ijkmedia'
  end

  s.subspec 'ffmpeg' do |ss|
    ss.source_files        = 'ios/ffmpeg/universal/include/**/*.h'
    ss.private_header_files = 'ios/ffmpeg/universal/include/**/*.h'
    ss.header_mappings_dir = 'ios/ffmpeg/universal/include'
    ss.vendored_libraries  = 'ios/ffmpeg/universal/lib/*.a'
    ss.libraries = 'avcodec', 'avfilter', 'avformat', 'avutil', 'swresample', 'swscale'
  end

end