#include "ShaderUtil.hpp"
#include <iostream>

int main(int argc, char** argv) {
	if(argc < 2) {
		std::cerr << "Pleae provide a shader!\n";
		return -1;
	}

//	if(auto oshdr = graphix::ShaderUtil::readShader(argv[1]); oshdr) {
	// 	std::cout << *oshdr << '\n';
	// }

	if(auto oshdr = graphix::ShaderUtil::readShaders(argv[1]); oshdr) {
		std::cout << "VERTEX" << '\n';
		std::cout << oshdr->vertex << '\n';
		std::cout << "FRAGMENT" << '\n';
		std::cout << oshdr->fragment << '\n';
	}
	else {
		std::cerr << "Could not load \n";
	}

	return 0;
}
