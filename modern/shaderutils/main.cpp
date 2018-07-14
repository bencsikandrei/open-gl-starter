#include "ShaderUtil.hpp"
#include <iostream>

int main(int argc, char** argv) {
	if(argc < 2) {
		std::cerr << "Pleae provie a shader!\n";
		return -1;
	}

	if(auto oshdr = graphix::ShaderUtil::readShader(argv[1]); oshdr) {
		std::cout << *oshdr << '\n';
	}
	return 0;
}
