set(SOURCES 
	main.cpp
)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

add_executable(tdd_skeleton ${SOURCES})

target_link_libraries(tdd_skeleton Qt5::Core)

