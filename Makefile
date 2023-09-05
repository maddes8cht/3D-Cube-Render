CXX := g++
CXXFLAGS := -Wall -Wextra -pedantic -std=c++17
LDFLAGS := -lsfml-graphics -lsfml-window -lsfml-system

SRCDIR := src
OBJDIR := obj
BINDIR := bin

SRCS := $(wildcard $(SRCDIR)/*.cpp)
OBJS := $(patsubst $(SRCDIR)/%.cpp,$(OBJDIR)/%.o,$(SRCS))

all: 3dcube

3dcube: $(OBJS)
	$(CXX) $(CXXFLAGS) $^ -o $(BINDIR)/$@ $(LDFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.cpp
	$(CXX) $(CXXFLAGS) -Iinclude -c $< -o $@

clean:
	rm -f $(OBJDIR)/*.o $(BINDIR)/3dcube