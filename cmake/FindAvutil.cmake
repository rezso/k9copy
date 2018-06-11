MACRO (FINDAVUTIL _lib)

FIND_PATH(AVUTIL_INCLUDE_DIR_FF "ffmpeg/avutil.h" PATHS)
IF (AVUTIL_INCLUDE_DIR_FF)
      SET (AVUTIL_INCLUDE_DIR "${AVCODEC_INCLUDE_DIR_FF}/ffmpeg")
ELSE (AVUTIL_INCLUDE_DIR_FF)
      FIND_PATH(AVUTIL_INCLUDE_DIR_LAVC "libavutil/avutil.h" PATHS)
      IF (AVUTIL_INCLUDE_DIR_LAVC)
          SET (AVUTIL_INCLUDE_DIR "${AVUTIL_INCLUDE_DIR_LAVC}/libavutil")
      ELSE (AVUTIL_INCLUDE_DIR_LAVC)
	  FIND_PATH(AVUTIL_INCLUDE_DIR_FF_LAVF "ffmpeg/libavutil/avutil.h" PATHS)
	  IF (AVUTIL_INCLUDE_DIR_FF_LAVF)
	    SET (AVUTIL_INCLUDE_DIR "${AVUTIL_INCLUDE_DIR_FF_LAVF}/ffmpeg/libavutil")
	  ENDIF (AVUTIL_INCLUDE_DIR_FF_LAVF)
      ENDIF (AVUTIL_INCLUDE_DIR_LAVC)
ENDIF (AVUTIL_INCLUDE_DIR_FF)



FIND_LIBRARY(AVUTIL_LIBRARY NAMES ${_lib} PATHS ) 

IF (AVUTIL_INCLUDE_DIR AND AVUTIL_LIBRARY)
   SET(INC_FOUND TRUE)
ELSE (AVUTIL_INCLUDE_DIR AND AVUTIL_LIBRARY)
      SET(INC_FOUND FALSE)
ENDIF (AVUTIL_INCLUDE_DIR AND AVUTIL_LIBRARY)


IF (INC_FOUND)
      MESSAGE(STATUS "Found include avutil.h: ${AVUTIL_INCLUDE_DIR}")
      MESSAGE(STATUS "Found library ${_lib}: ${AVUTIL_LIBRARY}")
ELSE (INC_FOUND)
      MESSAGE(FATAL_ERROR "Could not find ${_lib}")
ENDIF (INC_FOUND)
ENDMACRO (FINDAVUTIL _lib )