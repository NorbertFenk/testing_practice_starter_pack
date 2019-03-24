find_program(CLANG-FORMAT clang-format)
find_program(CLANG-TIDY clang-tidy)

file(GLOB SOURCE_FILES ${CMAKE_SOURCE_DIR}/src/*.cpp)
file(GLOB HEADER_FILES ${CMAKE_SOURCE_DIR}/src/*.h)
file(GLOB TEST_SOURCE_FILES ${CMAKE_SOURCE_DIR}/test/*.cpp)
file(GLOB TEST_HEADER_FILES ${CMAKE_SOURCE_DIR}/test/*.h)

if(CLANG-FORMAT)
	set(CLANG_FORMAT_OPTIONS -i --style=file)
	add_custom_target(style
		${CLANG-FORMAT}
		${CLANG_FORMAT_OPTIONS} ${SOURCE_FILES} ${HEADER_FILES} ${TEST_SOURCE_FILES} ${TEST_HEADER_FILES}
		COMMENT "Reformatting source code with clang-format"
		VERBATIM
	)
endif()

if(CLANG-TIDY)
	set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
	set(CLANG_TIDY_OPTIONS -p ${CMAKE_BINARY_DIR}/compile_commands.json)
	add_custom_target(static
		${CLANG-TIDY}
		${CLANG_TIDY_OPTIONS} ${SOURCE_FILES} ${HEADER_FILES}
		COMMENT "Static analyzing soruce code with clang-tidy"
		VERBATIM
	)
endif()