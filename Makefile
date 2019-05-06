#############################################
#
# Test SetUID
#  Copyright 2019 konoar
#
#############################################

OBJDIR   := obj/
BINDIR   := bin/
TARGET   := $(BINDIR)testbin
CPPFLAGS :=
LDFLAGS  :=

.PHONY: run

run: clean $(TARGET)
	@echo --------------------------------
	@echo - START
	@echo --------------------------------
	@sudo chown root:root $(TARGET)
	@sudo chmod u+s $(TARGET)
	@sudo rm -f ./data.txt
	@sudo su -c "touch ./data.txt"
	@$(TARGET)
	@cat ./data.txt
	@echo --------------------------------
	@echo - END
	@echo --------------------------------

clean:
	@if [ ! -d $(OBJDIR) ]; then	\
		mkdir $(OBJDIR);			\
	fi
	@if [ ! -d $(BINDIR) ]; then	\
		mkdir $(BINDIR);			\
	fi
	@-rm -f $(TARGET)
	@-rm -f $(OBJDIR)*.o

$(TARGET): $(OBJDIR)Main.o
	gcc -o $(TARGET) $^ $(LDFLAGS)

$(OBJDIR)%.o: %.cpp
	gcc -c $< -o $@ $(CPPFLAGS)

