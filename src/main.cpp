#include <iostream>

#include <QDebug>

#include "example.h"


int main()
{
	std::cout << "Hello world" << std::endl;
	
	// static code analyzer test
	int a[3] = {1, 2, 3};
	std::cout << a[0] << " " << a[2] << std::endl;

	qDebug() << "Hello world with Qt";
	int c = example::sum(1, 3);

	qDebug() << c;

	return 0;
}

