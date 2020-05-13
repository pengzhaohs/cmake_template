#include "graphics_module1_dummy1.h"
#include "graphics_module1_dummy_p.h"

#include "base_module1_dummy1.h"
#include "base_module1_dummy2.h"
#include "base_module2_dummy1.h"
#include "base_module2_dummy2.h"

GraphicsModule1Dummy1::GraphicsModule1Dummy1()
{
	graphics_module1_dummy_p();
}

GraphicsModule1Dummy1::~GraphicsModule1Dummy1()
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

}