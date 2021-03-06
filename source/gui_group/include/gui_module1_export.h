#ifndef _GUI_MODULE1_EXPORT_H_
#define _GUI_MODULE1_EXPORT_H_

#ifdef ZS_PLATFORM_WINDOWS
	#ifdef DLL_GUI_MODULE1_EXPORTS
		#define GUI_MODULE1_EXPORT	__declspec(dllexport) 
	#elif defined STATIC_GUI_MODULE1_EXPORTS
		#define GUI_MODULE1_EXPORT
	#else
		#define GUI_MODULE1_EXPORT __declspec(dllimport)
	#endif
#elif defined ZS_PLATFORM_MAC
	#define GUI_MODULE1_EXPORT
#else
	#define GUI_MODULE1_EXPORT
#endif

#endif //_GUI_MODULE1_EXPORT_H_