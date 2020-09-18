cmake_minimum_required(VERSION 3.16)

project(Test)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

add_executable(TestCpp test.cpp)
add_executable(TestCpp11 test_cpp11.cpp)
add_executable(TestCpp17_if test_cpp17_if.cpp)
add_executable(TestCpp17_fs test_cpp17_fs.cpp)
add_executable(TestCpp17_opt test_cpp17_optional.cpp)
add_executable(TestCpp20 test_cpp20.cpp)



target_compile_features(TestCpp PUBLIC cxx_std_11)
target_compile_features(TestCpp11 PUBLIC cxx_std_11)
target_compile_features(TestCpp17_if PUBLIC cxx_std_17)
target_compile_features(TestCpp17_fs PUBLIC cxx_std_17)
target_compile_features(TestCpp17_opt PUBLIC cxx_std_17)
target_compile_features(TestCpp20 PUBLIC cxx_std_20)

