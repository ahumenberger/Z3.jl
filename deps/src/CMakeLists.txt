project(Z3JL CXX)
cmake_minimum_required(VERSION 3.4)

find_package(JlCxx REQUIRED)
find_package(Z3 REQUIRED CONFIG)

message(${Z3_LIBRARIES})

add_library(z3jl SHARED z3.cpp)
target_include_directories(z3jl PRIVATE ${Z3_CXX_INCLUDE_DIRS})
target_link_libraries(z3jl PRIVATE JlCxx::cxxwrap_julia ${Z3_LIBRARIES} ${OPTIONAL_LINK_FLAGS})

install(TARGETS z3jl
    RUNTIME DESTINATION lib
    ARCHIVE DESTINATION lib
    LIBRARY DESTINATION lib)