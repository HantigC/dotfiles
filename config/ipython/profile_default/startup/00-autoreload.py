from IPython import get_ipython

ip = get_ipython()
if ip:
    ip.run_line_magic("load_ext", "autoreload")
    ip.run_line_magic("autoreload", "2")
