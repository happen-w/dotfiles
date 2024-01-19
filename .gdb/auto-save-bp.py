import os
import shutil
import gdb

def save_bp():
  filename = "./.bps.txt"
  source_file = filename
  destination_file = filename + ".bak"
  if os.path.exists(filename):
    shutil.copyfile(source_file, destination_file)
    print("备份断点文件 .bps.txt.bak")
  gdb.execute("save breakpoints " + filename)
  gdb.execute("set confirm off")
