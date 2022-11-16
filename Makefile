#CROSS_COMPILE 	=arm-none-linux-gnueabi-
obj = drv_0.so
#CC		= $(CROSS_COMPILE)gcc
CC = gcc
file = $(wildcard *.c)
drv_x.o = $(patsubst %.c, %.o, $(file))

$(obj):$(drv_x.o)
	$(CC) -shared -Wl,-soname -o $@ $^ -lc
$(drv_x.o):$(file)
	$(CC) -fPIC -c $^
	
all:$(obj)
	
copy:
	cp drv_0.so mqTT.so
	
clean:
	rm *.o drv_0.so