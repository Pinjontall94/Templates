cmake_minimum_required(VERSION 3.9)
project(app) 
add_executable(${PROJECT_NAME} src/main.c)

# Libraries to include for linking
target_link_libraries(${PROJECT_NAME} -lconvert)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
