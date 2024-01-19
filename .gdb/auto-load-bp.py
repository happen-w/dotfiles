import os
import gdb

def load_bp():
  filename = "./.bps.txt"
  if os.path.exists(filename):
    gdb.execute("source " + filename)
  else:
    print("File not found: " + filename)

def symbol_loaded_handler(event):
    
    # 获取当前工作目录的路径
    current_dir = os.getcwd()
    newFile = event.new_objfile.filename
    if newFile.startswith(current_dir):
        load_bp()

# Add the hook
gdb.events.new_objfile.connect(symbol_loaded_handler)

