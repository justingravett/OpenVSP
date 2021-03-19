
#Remove?
IF(CMAKE_SYSTEM_PROCESSOR MATCHES "x86_64" OR CMAKE_SYSTEM_PROCESSOR MATCHES "amd64")
	SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fPIC")
	SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC")
ENDIF()

ExternalProject_Add( TRIANGLE
	URL ${CMAKE_CURRENT_SOURCE_DIR}/Triangle-d3d0ccc94789.zip
	SOURCE_SUBDIR "src"
	CMAKE_ARGS -DCMAKE_C_COMPILER=${CMAKE_C_COMPILER}
		-DCMAKE_CXX_COMPILER=${CMAKE_CXX_COMPILER}
		-DCMAKE_CXX_FLAGS=${CMAKE_CXX_FLAGS}
		-DCMAKE_C_FLAGS=${CMAKE_C_FLAGS}
		-DCMAKE_INSTALL_PREFIX:PATH=<INSTALL_DIR>
		-DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
		-DTRIANGLE_ENABLE_ACUTE=OFF
		-DBUILD_SHARED_LIBS=OFF
		-DBUILD_TESTING=OFF
)
ExternalProject_Get_Property( TRIANGLE INSTALL_DIR )
SET( TRIANGLE_INSTALL_DIR ${INSTALL_DIR} )
