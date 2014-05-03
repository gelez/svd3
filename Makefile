
CC= g++
OS = $(shell uname -s)
OBJS = $(SRCS:.cpp=.o)

ifeq ($(OS), Linux) # Some kind of Linux
	CFLAGS= -fPIC 
	LINKS=
	SHARED= -shared
endif
ifeq ($(OS), Darwin) # Mac OSX
	CFLAGS=
endif

default: svd3_cpu

cpu: main_cpu.cpp
	$(CC) $(CFLAGS) main_cpu.cpp -o svd3_cpu

cuda: main_cuda.cpp
	# TODO
	$(CC) $(CFLAGS) main_gpu.cpp -o svd3_cuda

GLM_INCL = /Developer/glm

glm: main_glm.cpp
	$(CC) $(CFLAGS) -I $(GLM_INCL) main_glm.cpp -o svd3_glm
