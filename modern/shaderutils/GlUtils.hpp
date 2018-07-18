#pragma once

#include <iostream>

#include <GL/glew.h>
#include <GLFW/glfw3.h>

namespace graphix
{
void GLClearErrors() {
	while(glGetError() != GL_NO_ERROR);
}

bool GLCheckError(const char* func, const char* file, int line) {
	while(GLenum error = glGetError()) {
		std::cout << "[OpenGL Error] (" << error << " in: " << func << " file: " 
			<< file << " line: " << line << ")\n";
		return false;
	}
	return true;
}

#define GLCall(x) \
	::graphix::GLClearErrors(); \
	x;\
	assert(::graphix::GLCheckError(#x, __FILE__, __LINE__));

} // namespace graphix
