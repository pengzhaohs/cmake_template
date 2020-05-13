#include <iostream>

#include "app_bim_dummy1.h"
#include "app_bim_dummy2.h"
#include "app_bim_dummy_p.h"
 
#include "base_module1_dummy1.h"
#include "base_module1_dummy2.h"

#include "base_module2_dummy1.h"
#include "base_module2_dummy2.h"

#include "graphics_module1_dummy1.h"
#include "graphics_module1_dummy2.h"

#include "graphics_module2_dummy1.h"
#include "graphics_module2_dummy2.h"

#include "gui_module1_dummy1.h"
#include "gui_module1_dummy2.h"

#include "gui_module2_dummy1.h"
#include "gui_module2_dummy2.h"


int main(int argc, char** argv)
{
	std::cout << "Hello world !" << std::endl;

	{
		BaseModule1Dummy1 dummy;
	}
	{
		BaseModule1Dummy2 dummy;
	}
	{
		BaseModule2Dummy1 dummy;
	}
	{
		BaseModule2Dummy2 dummy;
	}

	{
		GraphicsModule1Dummy1 dummy;
	}
	{
		GraphicsModule1Dummy2 dummy;
	}
	{
		GraphicsModule2Dummy1 dummy;
	}
	{
		GraphicsModule2Dummy2 dummy;
	}

	{
		GuiModule1Dummy1 dummy;
	}
	{
		GuiModule1Dummy2 dummy;
	}
	{
		GuiModule2Dummy1 dummy;
	}
	{
		GuiModule2Dummy2 dummy;
	}
	

	return 0;
}