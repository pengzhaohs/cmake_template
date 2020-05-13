#ifndef _BASE_MODULE2_EXPORT_H_
#define _BASE_MODULE2_EXPORT_H_

#ifdef ZS_PLATFORM_WINDOWS
	#ifdef DLL_BASE_MODULE2_EXPORTS
		#define BASE_MODULE2_EXPORT	__declspec(dllexport) 
	#elif defined STATIC_BASE_MODULE2_EXPORTS
		#define BASE_MODULE2_EXPORT
	#else
		#define BASE_MODULE2_EXPORT __declspec(dllimport)
	#endif
#elif defined ZS_PLATFORM_MAC
	#define BASE_MODULE2_EXPORT
#else
	#define BASE_MODULE2_EXPORT
#endif

#endif //_BASE_MODULE2_EXPORT_H_