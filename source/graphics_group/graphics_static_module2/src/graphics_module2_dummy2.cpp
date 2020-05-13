#include "graphics_module2_dummy2.h"
#include "graphics_module2_dummy_p.h"

#include "base_module1_dummy1.h"
#include "base_module1_dummy2.h"
#include "base_module2_dummy1.h"
#include "base_module2_dummy2.h"

GraphicsModule2Dummy2::GraphicsModule2Dummy2()
{
	graphics_module2_dummy_p();
}

GraphicsModule2Dummy2::~GraphicsModule2Dummy2()
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