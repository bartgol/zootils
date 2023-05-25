# Utility that dumps all variables in the current scope,
# possibly filtering by a regex pattern
function(dump_cmake_variables)
  set (opts)
  set (args1v REGEX)
  set (argsMv)
  cmake_parse_arguments (dcv "${opts}" "${args1v}" "${argsMv}" ${ARGN})

  get_cmake_property(dcv_var_names VARIABLES)

  foreach (var_name IN LISTS dcv_var_names)
    if (dcv_REGEX)
      string(REGEX MATCH ${dcv_REGEX} MATCHES ${var_name})
      if (MATCHES)
        message(STATUS "${var_name}=${${var_name}}")
      endif()
    else ()
      message(STATUS "${var_name}=${${var_name}}")
    endif ()
  endforeach()
endfunction()
