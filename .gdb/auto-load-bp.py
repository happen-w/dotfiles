import os
import gdb

def load_bp():
  filename = "./.bps.txt"
  if os.path.exists(filename):
    gdb.execute("source " + filename)
  else:
    print("File not found: " + filename)

# Define a function to be called after reading symbols
def symbol_loaded_handler(_):
    # Your code here
    load_bp()

# Add the hook
gdb.events.new_objfile.connect(symbol_loaded_handler)
