cmake_minimum_required(VERSION 3.10)

project(justatest VERSION 0.1
        DESCRIPTION "A simple test for github actions"
        LANGUAGES Fortran)
enable_language(Fortran)

# Currently setting the Fortran compiler to use -std=gnu, change this if you
# want a specific standard
set(FVERSION "-std=f95")
set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${FVERSION}")

# Source code
add_subdirectory(src)

install(TARGETS hello DESTINATION "bin")

enable_testing()

# define tests
add_test(
  NAME check_output
  COMMAND bash ${CMAKE_SOURCE_DIR}/tests/check_executable_output.sh $<TARGET_FILE:hello> ${CMAKE_SOURCE_DIR}/tests/reference_file
)
