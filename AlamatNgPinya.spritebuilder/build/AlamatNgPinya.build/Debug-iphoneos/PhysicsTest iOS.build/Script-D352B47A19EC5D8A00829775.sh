#!/usr/bin/ruby
# Special thanks to Filip Iliescu at Apple for the help with this.

# Environment variables.
SDK = ENV["PLATFORM_NAME"]
OBJECT_FILE_DIR = ENV["OBJECT_FILE_DIR"]
SRCROOT = ENV["SRCROOT"]
BUILT_PRODUCTS_DIR = ENV["BUILT_PRODUCTS_DIR"]
PRODUCT_NAME = ENV["PRODUCT_NAME"]

# User variables
# Directory with your custom .metal files in it.
SHADER_DIR = "#{SRCROOT}/Source/MetalShaders"
# Location of the cocos2d library directory.
COCOS2D_DIR = "#{SRCROOT}/Source/libs/cocos2d-iphone/cocos2d"

METAL_ARGS = [
	"-arch air64",
	"-emit-llvm",
	"-c",
	"-gline-tables-only",
	"-ffast-math",
	"-std=ios-metal1.0",
    %{-I "#{COCOS2D_DIR}"},
]

def system(cmd)
	puts cmd
    Kernel.system cmd
end

PRODUCTS = "#{OBJECT_FILE_DIR}/CCMetalShaders"
ARCHIVE = "#{PRODUCTS}/default.metal-ar"

def compile_shader(src)
	dst = "#{PRODUCTS}/#{File.basename(src, ".metal")}.air"
	
	# Compile and archive the shader.
	system %{xcrun -sdk #{SDK} metal #{METAL_ARGS.join(" ")} "#{src}" -o "#{dst}"}
	system %{xcrun -sdk #{SDK} ar r "#{ARCHIVE}" "#{dst}"}
end

if SDK == "iphoneos"
	# Cannot use default.metallib to avoid clashing with Xcode build magic.
	# This is part of a workaround due to the iOS simulator not supporting Metal and may go away in the future.
	metal_lib = "#{BUILT_PRODUCTS_DIR}/#{PRODUCT_NAME}.app/CCShaders.metallib"
    
	# Delete the old products dir and metal lib.
	system %{rm -rf "#{PRODUCTS}"}
    system %{rm -f "#{metal_lib}"}
    system %{mkdir -p "#{PRODUCTS}"}
    
    # Compile the builtin shaders.
    compile_shader(%{#{COCOS2D_DIR}/Platforms/iOS/CCShaders.metal})
    
	# Compile/archive all the shaders in the shader directory.
    Dir.glob("#{SHADER_DIR}/*.metal").each{|src| compile_shader(src)}
    
	# Link all shaders into default lib.
	system %{xcrun -sdk #{SDK} metallib -o "#{metal_lib}" "#{ARCHIVE}"}
end

