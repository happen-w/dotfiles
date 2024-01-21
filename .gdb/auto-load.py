import os
import gdb

def load_bp():
  filename = "./.bps.txt"
  if os.path.exists(filename):
    gdb.execute("source " + filename)
  else:
    print("File not found: " + filename)

def load_types():
  dir = "./types/"
  if os.path.exists(dir):
    for filename in os.listdir(dir):
      if(filename.endswith(".py")):
        gdb.execute("source " + dir + filename)
        print("auto load file " + filename)
  else:
    print("File not found: " + dir)


def symbol_loaded_handler(event):
    
    # 获取当前工作目录的路径
    current_dir = os.getcwd()
    newFile = event.new_objfile.filename
    if newFile.startswith(current_dir):
        load_bp()
        load_types()

# Add the hook
gdb.events.new_objfile.connect(symbol_loaded_handler)



# https://segmentfault.com/a/1190000005718889
# 给gdb添加命令
class ReloadType(gdb.Command):

    """Reload Type
    Usage: reloadType
    Example:
        (gdb) reloadType
    """

    def __init__(self):
        super(self.__class__, self).__init__("reloadType", gdb.COMMAND_USER)

    def invoke(self, args, from_tty):
        load_types()

ReloadType()
