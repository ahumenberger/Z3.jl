project(Z3JL)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(JlCxx REQUIRED)
find_package(Z3 REQUIRED CONFIG)

add_library(z3jl SHARED z3jl.cpp)
target_include_directories(z3jl PRIVATE ${Z3_CXX_INCLUDE_DIRS})
target_link_libraries(z3jl PRIVATE JlCxx::cxxwrap_julia ${Z3_LIBRARIES} ${OPTIONAL_LINK_FLAGS})

install(TARGETS z3jl
    RUNTIME DESTINATION lib
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)