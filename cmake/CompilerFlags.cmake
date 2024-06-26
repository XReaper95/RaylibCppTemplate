function (add_compiler_flags TARGET_NAME)
    message("Add compiler flags")

    # warning and erros (from https://github.com/ShadowMitia/sokoban/blob/master/CMakeLists.txt)
    if (MSVC)
        target_compile_options(${TARGET_NAME} PRIVATE /W4)
    elseif (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        target_compile_options(${TARGET_NAME} PRIVATE
                -Wall
                -Og
                -g
                # reasonable and standard
                -Wextra
                # warn the user if a variable declaration shadows one from a parent context
                -Wshadow
                # warn the user if a class with virtual functions has a non-virtual destructor.
                # This helps catch hard to track down memory errors
                -Wnon-virtual-dtor
                # warn for c-style casts
                -Wold-style-cast
                # warn for potential performance problem casts
                -Wcast-align
                # warn on anything being unused
                -Wunused
                # warn if you overload (not override) a virtual function
                -Woverloaded-virtual
                # warn if non-standard C++ is used
                -Wpedantic
                # warn on type conversions that may lose data
                -Wconversion
                # warn on sign conversions
                -Wsign-conversion
                # warn if indentation implies blocks where blocks do not exist
                -Wmisleading-indentation
                # warn if if / else chain has duplicated conditions
                -Wduplicated-cond
                # warn if if / else branches have duplicated code
                -Wduplicated-branches
                # warn about logical operations being used where bitwise were probably wanted
                -Wlogical-op
                # warn if a null dereference is detected
                -Wnull-dereference
                # warn if you perform a cast to the same type
                -Wuseless-cast
                # warn if float is implicit promoted to double
                -Wdouble-promotion
                # warn on security issues around functions that format output (ie printf)
                -Wformat=2
                )

    endif ()
endfunction()
