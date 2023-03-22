#ifndef FPRINTF_H
#define FPRINTF_H

#include <Python.h>

extern PyObject *StringTooShortError;

static PyObject *method_fprintf(PyObject *self, PyObject *args);

#endif
