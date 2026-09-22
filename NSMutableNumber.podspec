Pod::Spec.new do |s|

# Common settings
  s.name         = "NSMutableNumber"
  s.version      = "1.3.1"
  s.summary      = "Thread-safe mutable NSNumber, a genuine NSNumber subclass, with NSNumber extensions."
  s.description  = <<-DESC
NSMutableNumber is a full thread-safe mutable NSNumber implementation. It is a genuine
NSNumber subclass: equality with plain NSNumber is symmetric, it bridges to CFNumberRef,
and inherited NSNumber API such as decimalValue works. Ships with NSNumber category
extensions for arithmetic, bit operations, and named constants.
                      DESC
  s.homepage     = "https://github.com/belisoful/NSMutableNumber"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Oleh Kulykov" => "info@resident.name" }
  s.source       = { :git => 'https://github.com/belisoful/NSMutableNumber.git', :tag => s.version.to_s }

# Platforms
  s.ios.deployment_target = "15.0"
  s.osx.deployment_target = "12.0"
  s.tvos.deployment_target = "15.0"
  s.watchos.deployment_target = "9.0"

# Build
  s.source_files = 'Sources/NSMutableNumber/**/*.{h,hpp,mm}'
  s.public_header_files = 'Sources/NSMutableNumber/include/*.h'
  s.requires_arc = true
  s.libraries = 'pthread'
  s.pod_target_xcconfig = {
    'CLANG_CXX_LANGUAGE_STANDARD' => 'gnu++20',
    'CLANG_CXX_LIBRARY'           => 'libc++'
  }
end
