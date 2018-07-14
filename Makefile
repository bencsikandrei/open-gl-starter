## Get from pkgconfig
LIBS=$(shell pkg-config --libs glfw3) -lGL -lm -ldl -lX11 -lXrandr -lXcursor -lXinerama -lXi -lXxf86vm
CXX=g++ 
CXXFLAGS=-Wall -Wextra -Wfatal-errors -std=c++17
LDFLAGS=

FILE_SIMPLE=basics/setupGLFW.cpp
FILE_MODERN=basics/modernOpenGl.cpp
FILE_GLEW=basics/usingGlew.cpp
FILE_SHADERS=basics/vertexPositions.cpp
FILE_SHADERS2=modern/vertexShader.cpp
FILE_SHADERS_SQUARE=modern/vertexShaderSquare.cpp

SIMPLE=build/glfwSetup
MODERN=build/modernOpenGl
GLEW=build/glewUsage
SHADER=build/shaderUsage
SHADER2=build/vertexShader
SHADER_SQUARE=build/vertexShaderSquare

all: prepare simple modern glew shader shader2 shader_sq

prepare:
	mkdir -p build

simple:
	$(CXX) $(LDFLAGS) -o $(SIMPLE) $(FILE_SIMPLE) -pthread $(LIBS)

shader:
	$(CXX) $(LDFLAGS) -o $(SHADER) $(FILE_SHADERS) -pthread $(LIBS) -L/usr/lib64/ -lGLEW -lGLU

modern:
	$(CXX) $(LDFLAGS) -o $(MODERN) $(FILE_MODERN) -pthread $(LIBS) -L/usr/lib64/ -lGLEW -lGLU

glew:
	$(CXX) $(LDFLAGS) -o $(GLEW) $(FILE_MODERN) -pthread $(LIBS) -L/usr/lib64/ -lGLEW -lGLU

shader2:
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(SHADER2) $(FILE_SHADERS2) -pthread $(LIBS) -L/usr/lib64/ -lGLEW -lGLU

shader_sq:
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(SHADER_SQUARE) $(FILE_SHADERS_SQUARE) -pthread $(LIBS) -L/usr/lib64/ -lGLEW -lGLU
## 