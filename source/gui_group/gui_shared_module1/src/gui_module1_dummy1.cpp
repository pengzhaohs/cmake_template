#include "gui_module1_dummy1.h"
#include "gui_module1_dummy_p.h"

#include "base_module1_dummy1.h"
#include "base_module1_dummy2.h"
#include "base_module2_dummy1.h"
#include "base_module2_dummy2.h"

#include "graphics_module1_dummy1.h"
#include "graphics_module1_dummy2.h"
#include "graphics_module2_dummy1.h"
#include "graphics_module2_dummy2.h"

GuiModule1Dummy1::GuiModule1Dummy1()
{
	gui_module1_dummy_p();
}

GuiModule1Dummy1::~GuiModule1Dummy1()
{
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
}